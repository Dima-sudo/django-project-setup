#!/bin/bash

chmod +x ./scripts/colors.sh

# shellcheck disable=SC1091
source ./scripts/colors.sh

echo -e "${A} ${TW}Running Linting... \n${TG}"
ruff . --fix
echo -e "\n"

echo -e "${A} ${TW}Applying Code Formatting... \n${TG}"
black .
echo -e "\n"

echo -e "${A} ${TW}Optimizing Imports... \n${TG}"
isort .
echo -e "\n"

echo -e "${A} ${TW}Code Formatting and Linting Fixes Complete. To review the changes made, run:\n"
echo -e "${TG}make check${R}\n\n"
