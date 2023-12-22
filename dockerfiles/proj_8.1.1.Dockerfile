FROM ubuntu:latest

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later" \
      org.opencontainers.image.source="https://github.com/mdsumner/proj-builds" \
      org.opencontainers.image.vendor="Hypertidy Project" \
      org.opencontainers.image.description="A build of PROJ 8.1.1 for use on ubuntu" \
      org.opencontainers.image.authors="Michael Sumner <mdsumner@gmail.com>"

ENV PROJ_VERSION=8.1.1

COPY install_cmake_version_proj.sh /scripts/install_cmake_version_proj.sh

RUN /scripts/install_cmake_version_proj.sh

