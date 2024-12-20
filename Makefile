
MPATH=srcs/
COMPOSE_FILE	:= srcs/docker-compose.yml
#COMPOSE_FILE	:= $(MPATH)docker-compose.yml

all: build up

build:
	@grep -q "127.0.0.1 brandebr.42.fr" /etc/hosts || echo "127.0.0.1 brandebr.42.fr" | sudo tee -a /etc/hosts > /dev/null
	@mkdir -p /home/brandebr/data/ db
	@mkdir -p /home/brandebr/data/ wp
	@docker-compose -f $(COMPOSE_FILE) build

up:
	@echo "Docker Command: $(shell which docker)"
	@docker-compose -f $(COMPOSE_FILE) up -d

pasta:
	docker-compose -f srcs/docker-compose.yml up -d --build

sauce:
	docker-compose -f srcs/docker-compose.yml down

down:
	@echo "Docker Command: $(shell which docker)"
	@docker-compose -f $(MPATH)/docker-compose.yml down

clean:
	@docker-compose -f $(COMPOSE_FILE) down --volumes --remove-orphans

fclean: clean
	@sudo rm -rf /home/brandebr/data/db
	@sudo rm -rf /home/brandebr/data/wp

re: fclean build up

.PHONY: all down clean re
