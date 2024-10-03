COMPOSE = srcs/docker-compose.yml


up:
	docker compose -f $(COMPOSE) up -d

down:
	docker compose -f $(COMPOSE) down