#!/bin/bash

chmod +x ./scripts/colors.sh

# shellcheck disable=SC1091
source ./scripts/colors.sh

# Display the warning
echo -e "${A} ${TY}WARNING: This script will wipe out everything in your Docker system."
echo -e "${A} ${TY}Aside from volumes, All images, containers, and other Docker resources will be removed. \n\n"
echo -e "${A} Are you sure you want to proceed? [Y/N]: \n\n"
read -rep "" response

# Convert the response to uppercase using tr to make the comparison case-insensitive
response=$(echo "$response" | tr '[:lower:]' '[:upper:]')

if [ "$response" == "Y" ]; then
    docker compose down
    docker builder prune -f
    docker image prune --all -f
    docker container prune -f
    docker network prune -f
    docker system prune -f

    echo -e "\n\n${A} ${TG}Operation completed successfully."
else
    echo "${A} Operation aborted."
    exit 0
fi
