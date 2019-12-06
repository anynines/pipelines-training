#!/bin/bash

set -o errexit # Exit immediately if a simple command exits with a non-zero status
set -o nounset # Report the usage of uninitialized variables
set -o pipefail
[ "${EXTENDED_LOGS:-false}" = "true" ] &&  set -o xtrace # Print command traces before executing command

cd ${RELEASE_PATH}
if [ "${1-}" = "populate-database" ]; then
  bosh --non-interactive deploy templates/postgres.yml \
    -o templates/operations/set_properties.yml \
    -o templates/operations/populate-database.yml \
    -o templates/operations/overwrite-deployment-name.yml \
    -v deployment-name=${DEPLOYMENT_NAME} \
    -d ${DEPLOYMENT_NAME}
else
  bosh --non-interactive deploy templates/postgres.yml \
    -o templates/operations/set_properties.yml \
    -o templates/operations/overwrite-deployment-name.yml \
    -v deployment-name=${DEPLOYMENT_NAME} \
    -d ${DEPLOYMENT_NAME}
fi
