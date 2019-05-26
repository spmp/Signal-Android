#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${DIR}"

SIGNAL_LOG_FILE="${SIGNAL_LOG_FILE:-/tmp/build_signal.log}"

./gradlew clean assembleWebsiteDebug 2>&1 > "${SIGNAL_LOG_FILE}"

if [[ $? -eq 0 ]]
then
        echo "BUILD SUCCESSFUL!"
        exit 0
else
        echo "FAIL"
        exit 1
fi
