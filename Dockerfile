FROM python:3.11

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY . .

ARG DEV=false

RUN apt-get update \
    && apt-get install -y make bash \
    && chmod +rwx /app/scripts \
    && make env_create \
    && . ./venv/app_venv/bin/activate \
    && make build \
    && if [ "$DEV" = "true" ] ; then make install_dev ; else make install ; fi \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user and set permissions
RUN useradd -ms /bin/bash -U app_user && \
    passwd -d app_user && \
    chown -R app_user:app_user /app

USER app_user

# Append venv activation to .bashrc startup, so that doesn't need to be ran manually
RUN echo ". /app/venv/app_venv/bin/activate" >> /home/app_user/.bashrc

EXPOSE 8000

# Add metadata to the image
LABEL org.opencontainers.image.title="app"
LABEL org.opencontainers.image.description="app description"
LABEL org.opencontainers.image.authors="Dima Borodin"
LABEL org.opencontainers.image.maintainer="Dima Borodin"
LABEL org.opencontainers.image.version="1.0"
LABEL org.opencontainers.image.vendor=""
LABEL org.opencontainers.image.url="https://localhost:8000"
LABEL org.opencontainers.image.documentation="TBD"

# Placeholder for licensing information
LABEL org.opencontainers.image.licenses="TBD - Refer to the software documentation"
