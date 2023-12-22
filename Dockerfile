FROM ghcr.io/mdsumner/proj-builds:devel

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later" \
      org.opencontainers.image.source="https://github.com/mdsumner/proj-builds" \
      org.opencontainers.image.vendor="Hypertidy Project" \
      org.opencontainers.image.description="A container with a build of PROJ and install of R for use on ubuntu" \
      org.opencontainers.image.authors="Michael Sumner <mdsumner@gmail.com>"


ENV R_VERSION=devel
ENV R_HOME=/usr/local/lib/R
ENV TZ=Etc/UTC

COPY install_R_source.sh /scripts/install_R_source.sh

RUN /scripts/install_R_source.sh

RUN apt-get install git wget
ENV CRAN=https://cloud.r-project.org
ENV LANG=en_US.UTF-8

COPY setup_R.sh /scripts/setup_r.sh

RUN /scripts/setup_R.sh

RUN git clone https://github.com/anthonynorth/PROJ.git


#CMD ["R"]
