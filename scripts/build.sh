#!/bin/bash

chmod +x ./scripts/colors.sh

# shellcheck disable=SC1091
source ./scripts/colors.sh

echo -e "\n${A} ${TG}Updating pip to the latest version...\n${TW}"
python3 -m pip install --upgrade pip

echo -e "\n${A} ${TG}Installing pip-tools...\n${TW}"
python3 -m pip install pip-tools

echo -e "\n${A} ${TG}Generating project requirements...\n${TW}"
pip-compile --resolver=backtracking --output-file=requirements.txt pyproject.toml
pip-compile --resolver=backtracking --output-file=requirements-dev.txt pyproject.toml

echo -e "\n\n${A} ${TW}Successfully generated project requirements. To install the necessary dependencies, run: \n"
echo -e "${TG}make install_dev \n\n"
