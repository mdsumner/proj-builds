FROM ubuntu/latest

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later" \
      org.opencontainers.image.source="https://github.com/mdsumner/proj-builds" \
      org.opencontainers.image.vendor="Hypertidy Project" \
      org.opencontainers.image.authors="Michael Sumner <mdsumner@gmail.com>"

ENV PROJ_VERSION=6.3.2

COPY install_dev_osgeo.sh /scripts/install_version_proj.sh

RUN /scripts/install_version_proj.sh
