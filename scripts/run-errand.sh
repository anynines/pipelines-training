#!/bin/bash

set -o errexit # Exit immediately if a simple command exits with a non-zero status
set -o nounset # Report the usage of uninitialized variables
set -o pipefail
[ "${EXTENDED_LOGS:-false}" = "true" ] &&  set -o xtrace # Print command traces before executing command

cd ${RELEASE_PATH}
bosh run-errand populate-database -d ${DEPLOYMENT_NAME}
