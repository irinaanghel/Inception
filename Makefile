NAME = inception

$(NAME): run

run:
	@mkdir -p /home/aanghel/data/mysql
	@mkdir -p /home/aanghel/data/wordpress
	@docker compose -f ./scrs/docker-compose.yml up -d --build

down:
	@docker compose -f ./scrs/docker-compose.yml down

vclean:
	docker volume rm -f srcs_wordpress_data
	docker volume rm -f srcs_mariadb_data

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	vclean
	docker network rm $(docker network -ls -q) 2>/dev/null:\

fclean: down clean

re: fclean run
