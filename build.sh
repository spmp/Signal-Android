#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${DIR}"

SIGNAL_LOG_FILE="${SIGNAL_LOG_FILE:-/tmp/build_signal.log}"

./gradlew --stop
./gradlew --no-daemon clean assembleWebsiteDebug &> "${SIGNAL_LOG_FILE}"

if [[ $? -eq 0 ]]
then
        ./gradlew --stop
        echo "BUILD SUCCESSFUL!"
        exit 0
else
        ./gradlew --stop
        echo "BUILD FAIL"
        exit 1
fi
