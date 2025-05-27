
# ENV_FILE from .env or .env-local if it exists
ifeq ($(wildcard .env-local),)
ENV_FILE := .env
else
ENV_FILE := .env-local
endif
export ENV_FILE
DC = docker compose --env-file ${ENV_FILE}

include .env
-include .env-local

build:
	$(DC) build

freeze: down
	$(DC) build --build-arg REQUIREMENTS=requirements.txt web
	$(DC) run --rm web pip freeze | sort > requirements-freeze.txt

up:
	$(DC) up -d

down:
	$(DC) down

down-volumes:
	$(DC) down -v

logs:
	$(DC) logs -f

web-shell:
	$(DC) exec web /bin/bash

db-shell:
	$(DC) exec db psql -U ${POSTGRES_USER} -d ${POSTGRES_DB}

restart:
	$(DC) restart

db-init:
	$(DC) exec manage flask db init

db-migrate:
	$(DC) exec manage flask db migrate -m "Update schema"

db-upgrade:
	$(DC) exec manage flask db upgrade

db-downgrade:
	$(DC) exec manage flask db downgrade

db-schema-status:
	$(DC) exec manage flask db current

help:
	@echo "Makefile commands:"
	@echo "  build                Build the Docker images"
	@echo "  up                   Start the Docker containers"
	@echo "  down                 Stop the Docker containers"
	@echo "  down-volumes         Stop and remove containers, networks, images, and volumes"
	@echo "  logs                 View the logs of the Docker containers"
	@echo "  web-shell            Open a shell in the web container"
	@echo "  db-shell             Open a shell in the database container"
	@echo "  restart              Restart the Docker containers"
	@echo "  db-init              Initialize the database migrations"
	@echo "  db-migrate           Create a new database migration"
	@echo "  db-upgrade           Apply the latest database migrations"
	@echo "  db-downgrade         Revert the last database migration"
	@echo "  db-schema-status     Show the current database schema version"
	@echo "  help                 Show this help message"

.PHONY: build up down down-volumes logs web-shell db-shell restart \
	db-migrate-init db-migrate db-upgrade db-downgrade db-migrate-status help
.DEFAULT_GOAL := help
