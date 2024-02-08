all:
	sudo mkdir -p /home/hkhater/data/mariadb
	sudo mkdir -p /home/hkhater/data/wordpress
	sudo docker compose -f ./srcs/docker-compose.yml up #-d

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v
	sudo docker system prune -af

fclean: clean
	@if [ -d "/home/hkhater/data/wordpress" ]; then \
	sudo rm -rf /home/hkhater/data/wordpress/*; \
	fi;

	@if [ -d "/home/hkhater/data/mariadb" ]; then \
	sudo rm -rf /home/hkhater/data/mariadb/*; \
	fi;

re: fclean all

.PHONY: all, clean, fclean, re
