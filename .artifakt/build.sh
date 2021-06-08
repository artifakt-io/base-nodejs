#!/bin/bash

set -e

echo ">>>>>>>>>>>>>> START CUSTOM BUILD SCRIPT <<<<<<<<<<<<<<<<< "
echo "------------------------------------------------------------"
echo "The following build args are available:"
env
echo "------------------------------------------------------------"

RUNTIME_NAME="NodeJs"
RUNTIME_LOGO="nodejs.svg"
ARCHIVE_FILE=main
WORKDIR=/var/www/html/public

env

curl -sSLO https://github.com/artifakt-io/base-html/archive/refs/heads/${ARCHIVE_FILE}.tar.gz && \
  tar -xzf ${ARCHIVE_FILE}.tar.gz -C /tmp && \
  mv /tmp/${ARCHIVE_FILE}/* ${WORKDIR} && \
  chown -R www-data:www-data ${WORKDIR} && \
  rm ${ARCHIVE_FILE}.tar.gz

sed -i "s/__RUNTIME_NAME__/${RUNTIME_NAME}/" ${WORKDIR}/index.html
sed -i "s/__RUNTIME_LOGO__/${RUNTIME_LOGO}/" ${WORKDIR}/index.html

echo ">>>>>>>>>>>>>> END CUSTOM BUILD SCRIPT <<<<<<<<<<<<<<<<< "
