up:
	docker-compose up -d

shell:
	docker-compose exec --user www-data wordpress bash

stop:
	docker-compose stop

LINE_NUMBER=$(shell grep -n -o 'stop editing!' htdocs/wp-config.php | cut -d ':' -f 1)
update-wp-config:
	sed -i '$(LINE_NUMBER)r scripts/wp-config-addendum.txt' htdocs/wp-config.php && sed -i -e "s/CODESPACE_NAME/$(CODESPACE_NAME)/g"  htdocs/wp-config.php

wp-install:
	docker-compose exec --user www-data wordpress wp core install --url=https://$(CODESPACE_NAME) --title=WordPress --admin_user=admin --admin_password=admin --admin_email=mail@example.com --locale=de_DE

wp-configure:
	docker-compose exec --user www-data wordpress wp language core install de_DE --activate
	docker-compose exec --user www-data wordpress wp plugin delete akismet
	docker-compose exec --user www-data wordpress wp plugin install show-current-template --activate

cli:
	docker run -it --rm \
    --volumes-from wp6-training \
    --network container:wp6-training \
    -e WORDPRESS_DB_USER=wordpress \
    -e WORDPRESS_DB_PASSWORD=wordpress \
    -e WORDPRESS_DB_HOST=db \
    wordpress:cli bash

node:
	docker run -it --rm \
    --volumes-from wp6-training \
    --network container:wp6-training \
    --workdir /var/www/html/wp-content/plugins/rosegarden \
    node:19 bash
