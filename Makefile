all:
		@if [ ! -f srcs/.env ]; then \
		echo "❌ The neccessary .env file is not in srcs as expected/"; \
	fi
		@if [ -d /home/hkhater/data/mariadb ]; then \
    	echo "✅ The mariadb directory in data already exists"; \
    else \
    	sudo mkdir -p /home/hkhater/data/mariadb; \
		echo "✅ The mariadb directory in data has just been created"; \
    fi
	@if [ -d /home/hkhater/data/wordpress ]; then \
    	echo "✅ The wordpress directory in data already exists"; \
    else \
    	sudo mkdir -p /home/hkhater/data/wordpress; \
		echo "✅ The wordpress directory in data has just been created"; \
    fi
	@if [ -d /home/hkhater/data/kuma ]; then \
    	echo "✅ The kuma directory in data already exists"; \
    else \
    	sudo mkdir -p /home/hkhater/data/kuma; \
		echo "✅ The kuma directory in data has just been created"; \
    fi
	sudo docker compose -f ./srcs/docker-compose.yml up --build #-d

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
