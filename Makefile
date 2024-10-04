COMPOSE = srcs/docker-compose.yml

test:
	cd srcs && docker compose up


up:
	docker compose -f $(COMPOSE) up

down:
	docker compose -f $(COMPOSE) down

re:
	docker compose -f $(COMPOSE) down
	docker compose -f $(COMPOSE) up

clean:
	@docker images -q > IMAGES
	@cat IMAGES | while IFS= read -r line; do \
		docker rmi "$$line"; \
	done
	@rm IMAGES
	@echo "\033[32mImages deleted\033[0m"
