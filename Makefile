# -f: --file
# -q: --quiet
# -a: --all
# $$: escape $ for shell

MY_PATH = /home/dayan/data

all:
	@mkdir -p $(MY_PATH)/wordpress
	@mkdir -p $(MY_PATH)/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@docker-compose -f srcs/docker-compose.yml up --build

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	rm -rf $(MY_PATH)/wordpress
	rm -rf $(MY_PATH)/mariadb

.PHONY: all re down clean
