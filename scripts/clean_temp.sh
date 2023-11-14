#!/bin/bash

chmod +x ./scripts/colors.sh

# shellcheck disable=SC1091
source ./scripts/colors.sh

echo -e "${A} ${TW}Removing all temporary files...\n"

rm -rf build
rm -rf dist
rm -rf htmlcov
rm -rf .coverage
rm -rf .mypy_cache
find . -name __pycache__ -type d -exec rm -rf {} +
find . -name .pytest_cache -type d -exec rm -rf {} +
find . -name .ipynb_checkpoints -type d -exec rm -rf {} +

echo -e "${A} ${TG}Temporary files removed.\n\n"
