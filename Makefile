COMPOSE = srcs/docker-compose.yml


up:
	docker compose -f $(COMPOSE) up

down:
	docker compose -f $(COMPOSE) down

clean:
	docker rmi $(docker images -q)
