#!/bin/bash

# shellcheck disable=SC1091

set -o errexit
set -o nounset
set -o pipefail
# set -o xtrace # Uncomment this line for debugging purpose

# Load libraries
. /opt/drycc/scripts/liblog.sh
. /opt/drycc/scripts/libkafka.sh

# Load Kafka environment variables
. /opt/drycc/scripts/kafka-env.sh

if [[ "$*" = *"/opt/drycc/scripts/kafka/run.sh"* || "$*" = *"/run.sh"* ]]; then
    info "** Starting Kafka setup **"
    /opt/drycc/scripts/kafka/setup.sh
    info "** Kafka setup finished! **"
fi

echo ""
exec "$@"
