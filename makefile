COMPOSE = docker-compose --env-file ./.env.local

init:
	@cp -n .env .env.local || echo "File .env.local already exists."

build:
	@$(COMPOSE) build --pull --no-cache

up:
	@$(COMPOSE) up --detach

down:
	@$(COMPOSE) down --remove-orphans

start:
	@$(COMPOSE) up --build --detach

restart: down start

logs:
	@$(COMPOSE) logs --tail=0 --follow

sh:
	@$(COMPOSE) exec php-fpm sh
