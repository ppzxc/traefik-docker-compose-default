COMPOSE_PATH=./docker-compose.yml
ENV_FILE_NAME=env.traefik

up: start log

restart: down start log

log:
	docker-compose --env-file ./$(ENV_FILE_NAME) -f $(COMPOSE_PATH) logs -f
down:
	docker-compose --env-file ./$(ENV_FILE_NAME) -f $(COMPOSE_PATH) down -v
start:
	docker-compose --env-file ./$(ENV_FILE_NAME) -f $(COMPOSE_PATH) up --build -d
config:
	docker-compose --env-file ./$(ENV_FILE_NAME) config
vim:
	vim $(COMPOSE_PATH)
