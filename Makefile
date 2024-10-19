COMPOSE = srcs/docker-compose.yml
GREEN = "\033[32m"
RESET = "\033[0m"

test:
	cd srcs && docker compose up


up:
	docker compose -f $(COMPOSE) up --force-recreate

down:
	docker compose -f $(COMPOSE) down

downv:
	docker compose -f $(COMPOSE) down -v


re:
	docker compose -f $(COMPOSE) down
	@docker images -q > IMAGES
	@cat IMAGES | while IFS= read -r line; do \
		docker rmi "$$line"; \
	done
	@rm IMAGES
	@echo ${GREEN}Images deleted${RESET}
	docker compose -f $(COMPOSE) up

clean:
	@docker images -q > IMAGES
	@cat IMAGES | while IFS= read -r line; do \
		docker rmi -f "$$line"; \
	done
	@rm IMAGES
	@echo ${GREEN}Images deleted${RESET}
	@docker builder prune --all --force
	@echo ${GREEN}Cache cleaned${RESET}
	@docker system df

logs:
	docker compose -f $(COMPOSE) logs wordpress
	docker compose -f $(COMPOSE) logs mariadb
	docker compose -f $(COMPOSE) logs nginx

