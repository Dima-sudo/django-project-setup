include ./scripts/self_documentation.make

ENV_NAME ?= app_venv
VENV_PATH ?= ./venv/$(ENV_NAME)

## Creates the projects predefined virtual environment automatically
env_create:
	chmod +x ./scripts/env_create.sh
	./scripts/env_create.sh ${VENV_PATH}

## Install dependencies for production
install:
	python3 -m pip install --upgrade pip
	python3 -m pip install -e .

## Installs additional dev dependencies
install_dev: install
	python3 -m pip install -e ".[dev]"

## Build using pip-tools
build:
	chmod +x ./scripts/build.sh
	./scripts/build.sh

## Delete all temporary files
clean:
	chmod +x ./scripts/clean_temp.sh
	./scripts/clean_temp.sh

## Checks code for linting and formatting issues
check:
	isort .
	black .
	ruff .

## Run a code check with verbose messaging
check_verbose:
	black --check --verbose .
	isort --check --verbose .
	ruff --verbose .

## Run a code fix (Lint, formatting, imports)
format:
	chmod +x ./scripts/format.sh
	./scripts/format.sh

## Test code
test:
	python3 /app/src/manage.py test

## Run a bash instance inside the app container for management commands
app_cli:
	docker-compose run --rm app bash

## Full docker system clean. Removes everything except volumes.
docker_clean:
	chmod +x ./scripts/docker_clean.sh
	./scripts/docker_clean.sh

## Streams logs from all services. Use when working inside a dev container env. Use from project root.
logs_stream:
	docker-compose logs -f

## Start the application
start:
	docker compose up --scale celery=5

## Install pre-commit hooks locally for use outside the containers
pre_commit_install:
	pip install --upgrade pip
	pip install pre-commit gitlint
	pre-commit install
	pre-commit install -t commit-msg

## Run pre-commit hooks. Use before commit to check for errors in your changed files
pre_commit_run:
	pre-commit run --all-files
