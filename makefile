# Default docker-compose
DOCKER_COMPOSE = docker-compose -f docker-compose.yml

# Add docker-compose.{environment}.yml to default docker-compose
DOCKER_COMPOSE = -f docker-compose.development.yml

# Add docker-compose.override.yml to default docker-composes
DOCKER_COMPOSE += -f docker-compose.override.yml

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
	@$(DOCKER_COMPOSE) logs --tail=all --follow

sh:
	@$(DOCKER_COMPOSE) exec php-fpm sh
