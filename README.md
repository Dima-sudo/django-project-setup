# Django Project Setup

Backend for the app.

## Installation

1. Install host dependencies for version control
```bash

make env_create

source ./venv/app_venv/bin/activate

# Check that env is active, should print the venv dir
echo ${VIRTUAL_ENV}

make pre_commit_install

```

For help:

```bash

# Makefile help
make

# Or
make help

```

2. To run the app, all you have to do is run:

```bash

make start

```

3. For running commands on the django app (i.e migrations, management, tests etc.) run:

```bash

make app_cli

```
which will open a terminal inside the django app container. You can run this
simultaneously with a running docker compose.

4. This project also supports attaching into dev containers and turning them into your development environment.
To do this, install the 'Dev Containers' and 'Reload' extensions from your marketplace. Once you reload vscode
it will prompt you to attach to it and docker compose will be ran in the background. Use that or the previous command at your own convenience.

5. Useful references:

localhost:xxxx/admin
localhost:xxxx/api-docs

<!-- RabbitMQ Monitoring -->
localhost:15672
Username: guest
Password: guest


## License

[TBD] Refer to the software documentation.
