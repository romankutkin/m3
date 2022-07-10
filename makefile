DOCKER_COMPOSE = docker-compose

# Default dotenv file
DOCKER_COMPOSE_DOTENV = --env-file ./.env

ifneq ("$(wildcard .env.local)", "")
	DOCKER_COMPOSE_DOTENV = --env-file ./.env.local
endif

DOCKER_COMPOSE += $(DOCKER_COMPOSE_DOTENV)

init:
	@cp -n .env .env.local || echo "File .env.local already exists."

build:
	@$(DOCKER_COMPOSE) build --pull --no-cache

up:
	@$(DOCKER_COMPOSE) up --detach

down:
	@$(DOCKER_COMPOSE) down --remove-orphans

start:
	@$(DOCKER_COMPOSE) up --build --detach

restart: down start

logs:
	@$(DOCKER_COMPOSE) logs --tail=0 --follow

sh:
	@$(DOCKER_COMPOSE) exec php-fpm sh
