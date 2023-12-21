#!/bin/bash
set -e

## Install specific PROJ
##

## build ARGs
NCPUS=${NCPUS:-"-1"}

PROJ_VERSION=${PROJ_VERSION:-"latest"}

# cmake does not understand "-1" as "all cpus"
CMAKE_CORES=${NCPUS}
if [ "${CMAKE_CORES}" = "-1" ]; then
    CMAKE_CORES=$(nproc --all)
fi

# a function to install apt packages only if they are not installed
function apt_install() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            apt-get update
        fi
        apt-get install -y --no-install-recommends "$@"
    fi
}

# a function to remove apt packages only if they are installed
function apt_remove() {
    if dpkg -s "$@" >/dev/null 2>&1; then
        apt-get remove -y "$@"
    fi
}

function url_latest_gh_released_asset() {
    wget -qO- "https://api.github.com/repos/$1/releases/latest" | grep -oP "(?<=\"browser_download_url\":\s\")https.*\.tar.gz(?=\")" | head -n 1
}

export DEBIAN_FRONTEND=noninteractive

apt_remove  libproj-dev && apt-get autoremove -y

## Derived from osgeo/gdal
apt-get update
apt-get install -y --fix-missing --no-install-recommends \
    ant \
    autoconf \
    automake \
    bash-completion \
    build-essential \
    ca-certificates \
    cmake \
    curl \
    git \
        libcrypto++-dev \
    libcurl4-openssl-dev \
        libsqlite3-dev \
    libssl-dev \
    libtiff5-dev \
        sqlite3

    # libarchive-dev \
    # libarmadillo-dev \
    # libblosc-dev \
    # libboost-dev \
    # libbz2-dev \
    # libcairo2-dev \
    # libclc-15-dev \
    # libcfitsio-dev \

    # libdeflate-dev \
    # libexpat-dev \
    # libfreexl-dev \
    # libfyba-dev \
    # libgif-dev \
    # libheif-dev \
    # libhdf4-alt-dev \
    # libhdf5-serial-dev \
    # libjpeg-dev \
    # libkml-dev \
    # liblcms2-2 \
    # liblerc-dev \
    # liblz4-dev \
    # liblzma-dev \
    # libmysqlclient-dev \
    # libnetcdf-dev \
    # libogdi-dev \
    # libopenexr-dev \
    # libopenjp2-7-dev \
    # libpcre3-dev \
    # libpng-dev \
    # libpq-dev \
    # libpoppler-dev \
    # libpoppler-private-dev \
    # libqhull-dev \

    # libudunits2-dev \
    # libwebp-dev \
    # libxerces-c-dev \
    # libxml2-dev \
    # lsb-release \
    # make \
    # mdbtools-dev \
    # pkg-config \
    # python3-dev \
    # python3-numpy \
    # python3-setuptools \
#    swig \
#    unixodbc-dev \
#    wget \
#    zlib1g-dev

rm -rf /build_local
mkdir /build_local && cd /build_local



## purge existing directories to permit re-run of script with updated versions
rm -rf  proj*

# install proj
# https://download.osgeo.org/proj/
if [ "$PROJ_VERSION" = "latest" ]; then
    PROJ_DL_URL=$(url_latest_gh_released_asset "OSGeo/PROJ")
else
    PROJ_DL_URL="https://download.osgeo.org/proj/proj-${PROJ_VERSION}.tar.gz"
fi

wget "$PROJ_DL_URL" -O proj.tar.gz
tar zxvf proj.tar.gz
rm proj.tar.gz
cd proj-*
mkdir build
cd build
cmake ..
cmake --build . --parallel "$CMAKE_CORES" --target install
ldconfig
cd /build_local

# Clean up
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/downloaded_packages

# Check the geospatial packages

echo -e "Check proj package...\n"
proj --version
echo -e "\nInstall PROJ, done!"
