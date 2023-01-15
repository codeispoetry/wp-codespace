up:
	docker-compose up -d

shell:
	docker-compose exec --user www-data wordpress bash

stop:
	docker-compose stop

LINE_NUMBER=$(shell grep -n -o 'stop editing!' wordpress/wp-config.php | cut -d ':' -f 1)
update-wp-config:
	sed -i '$(LINE_NUMBER)r .devcontainer/wp-config-addendum.txt' wordpress/wp-config.php && sed -i -e "s/CODESPACE_NAME/$(CODESPACE_NAME)/g"  wordpress/wp-config.php

wp-install:
	docker-compose exec --user www-data wordpress wp core install --url=https://$(CODESPACE_NAME) --title=WordPress --admin_user=admin --admin_password=admin --admin_email=mail@example.com --locale=de_DE

wp-configure:
	docker-compose exec --user www-data wordpress wp language core install de_DE --activate
	docker-compose exec --user www-data wordpress wp plugin delete akismet
	docker-compose exec --user www-data wordpress wp plugin install show-current-template --activate
