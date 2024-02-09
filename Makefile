all:
	sudo mkdir -p /home/hania/data/mariadb
	sudo mkdir -p /home/hania/data/wordpress
	sudo docker compose -f ./srcs/docker-compose.yml up #-d

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v
	sudo docker system prune -af

fclean: clean
	@if [ -d "/home/hania/data/wordpress" ]; then \
	sudo rm -rf /home/hania/data/wordpress/*; \
	fi;

	@if [ -d "/home/hania/data/mariadb" ]; then \
	sudo rm -rf /home/hania/data/mariadb/*; \
	fi;

re: fclean all

.PHONY: all, clean, fclean, re
