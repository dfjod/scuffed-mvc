# Docker permissions (for Linux and Windows)
export DOCKER_UID=$(shell id -u)
export DOCKER_GID=$(shell id -g)
export DOCKER_USER=$(DOCKER_UID):$(DOCKER_GID)

.PHONY: build
build: ## build containers
	docker-compose --file docker-compose.yml \
	  build --pull

.PHONY: up
up: ## launch the docker-compose setup (background)
	docker-compose --file docker-compose.yml \
	  up --remove-orphans --detach

.PHONY: down
down: ## terminate the docker-compose setup
	-docker-compose --file docker-compose.yml \
	  down --remove-orphans

.PHONY: cli
cli: ## spawn shell in running php container
	docker-compose \
	  exec --user $(DOCKER_USER) php sh

.PHONY: composer
composer:
	docker-compose \
	  run --rm --user $(DOCKER_USER) composer \
	    composer $(COMMAND) --no-interaction

.PHONY: mysql
mysql-cli:
	docker-compose \
	  exec mysql mysql -uroot -psecret