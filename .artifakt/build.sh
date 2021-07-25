#!/bin/bash

set -e

echo ">>>>>>>>>>>>>> START CUSTOM BUILD SCRIPT <<<<<<<<<<<<<<<<< "

WORKDIR=/var/www/html

RUNTIME_NAME="NodeJs"
RUNTIME_LOGO="nodejs.svg"
REPO_NAME=base-html
REPO_BRANCH=main
ARCHIVE_FILE=$REPO_NAME-$REPO_BRANCH

curl -sSLO https://github.com/artifakt-io/${REPO_NAME}/archive/refs/heads/${REPO_BRANCH}.tar.gz && \
	tar -xzf ${REPO_BRANCH}.tar.gz -C /tmp && \
	mv /tmp/${ARCHIVE_FILE}/* ${WORKDIR}/public && \
	chown -R www-data:www-data ${WORKDIR} && \
	rm ${REPO_BRANCH}.tar.gz

sed -i "s/__RUNTIME_NAME__/${RUNTIME_NAME}/" ${WORKDIR}/public/index.html
sed -i "s/__RUNTIME_LOGO__/${RUNTIME_LOGO}/" ${WORKDIR}/public/index.html

echo ">>>>>>>>>>>>>> END CUSTOM BUILD SCRIPT <<<<<<<<<<<<<<<<< "
