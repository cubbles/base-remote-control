#!/bin/sh

# Purpose: Trigger the Base-container to run the demo-services testsuite.
# Note: This requires Base AND DemoServices to be up.

# source the env (created in bin/run.sh) to create a user specific environment
. /mnt/sda1/tmp/cubx.conf

# --------- functions ---------

start(){
    if [ ${CUBX_ENV_BASE_CLUSTER} = "dev" ]; then
        baseImageFolder="$CUBX_ENV_VM_MOUNTPOINT/$CUBX_ENV_BASE_IMAGE_LOCAL_SOURCE_FOLDER"
        docker run --rm -v "$baseImageFolder/base/resources/opt/base:/opt/base" -v "/var/run/docker.sock:/var/run/docker.sock" cubbles/base:$CUBX_ENV_BASE_TAG test-demo-services $CUBX_ENV_BASE_CLUSTER
    else
        docker run --rm -v "/var/run/docker.sock:/var/run/docker.sock" cubbles/base:$CUBX_ENV_BASE_TAG test-demo-services $CUBX_ENV_BASE_CLUSTER
    fi
}

start


