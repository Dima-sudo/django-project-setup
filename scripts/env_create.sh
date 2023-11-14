#!/bin/bash

chmod +x ./scripts/colors.sh

# shellcheck disable=SC1091
source ./scripts/colors.sh

if [ -n "$1" ]; then
  # Check if venv already exists
  if [ -d "$1" ]; then
    env_name=$(basename "$1")

    echo -e "\n${A} ${TY}Virtual environment $env_name already exists at path $1. Aborting environmment creation. \n\n"
    echo -e "${A} To activate the virtual environment run: \n"
    echo -e "${TG}source ${1}/bin/activate ${TR} \n\n"

    exit 1
  fi

  # Check if the parent directory exists
  parent_directory=$(dirname "$1")
  if [ ! -d "$parent_directory" ]; then
    echo "${A} Parent directory $parent_directory does not exist. Creating virtual environment directory."
    mkdir -p "$parent_directory"
  fi

  echo -e "\n >> Creating a virtual environment $env_name at path $1 \n\n"
  python3 -m venv "$1"
  echo -e ">> To activate the virtual environment run: \n"
  echo -e "${TG}source ${1}/bin/activate ${TR} \n\n"

else
  echo "${A} ${TR}Please provide a path for the virtual environment."
  exit 1
fi
