#!/usr/bin/env bash
# shellcheck disable=SC1090
#
# Generate build and oragnize images based on revisions
#
# Copyright (c) 2019 Ganesh Velu. Released under the MIT License.

set -e

if [[ -f "${coltable}" ]]; then
    source ${coltable}
else
    COL_NC='\e[0m' # No Color
    COL_MAG='\e[1;35m'
    COL_CYAN='\e[1;36m'
    COL_BLUE='\e[1;34m'
    COL_LBLUE='\e[1;94m'
    COL_LIGHT_RED='\e[1;31m'
    COL_YELLOW='\e[1;33m'
    COL_LYELLOW='\e[1;93m'
fi

if [[ ! "$EUID" -ne 0 ]]; then
    echo "${COL_LIGHT_RED}Sorry, you cannot run this as root!${COL_NC}"
    exit
fi

OPENWRT_PATH="/home/openwrt/workdir/openwrt"
OUTPUT_DIR="/home/openwrt/public/snapshots"
WORKING_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

if [[ -f "$OPENWRT_PATH/scripts/feeds" ]]; then
    # OpenWRT directory validated, pull the latest branch and update/install feeds.
    echo -e "\n${COL_MAG}Updating repository...${COL_NC}"
    git pull
    echo -e "\n${COL_MAG}Applying patches...${COL_NC}"
    ./scripts/feeds update -a
    ./scripts/feeds install -a
    echo -e "${COL_MAG}Base files up-to date.${COL_NC}"
else
    echo "${COL_LIGHT_RED}Run this script from OpenWRT git repository directory.${COL_NC}"
    exit
fi

SNAPSHOT_VER=$("$WORKING_PATH/scripts/getver.sh")
echo -e "\n${COL_CYAN}Current Version${COL_NC}: ${COL_YELLOW}$SNAPSHOT_VER${COL_NC}"

echo -e "\n${COL_BLUE}Building OpenWRT...${COL_NC}"

echo -e "\n${COL_LBLUE}Entering Directory $OPENWRT_PATH ${COL_NC}" && cd "$OPENWRT_PATH"

function runWhileChecking {
    "$@"
    local status=$?
    if [ $status -ne 0 ]; then
        # echo "error with $1" >&2
        echo -e "\n${COL_LIGHT_RED}Could not complete build!${COL_NC}" >&2
        cd "$WORKING_PATH"
        exit
    fi
    # return $status
}

# Build the images while checking their status
runWhileChecking make download
runWhileChecking make -j2

echo -e "\n${COL_LBLUE}Leaving Directory $OPENWRT_PATH ${COL_NC}" && cd "$WORKING_PATH"

if [[ ! -d "$OUTPUT_DIR" ]]; then
    mkdir "$OUTPUT_DIR"
fi

if [[ ! -d "$OUTPUT_DIR/$SNAPSHOT_VER" ]]; then
    mkdir "$OUTPUT_DIR/$SNAPSHOT_VER"
else
    rm -rf "$OUTPUT_DIR/$SNAPSHOT_VER"
fi

mv "$OPENWRT_PATH/bin/*" "$OUTPUT_DIR/$SNAPSHOT_VER"

echo -e "\n${COL_BLUE}Target successfully built!\n${COL_NC}"

