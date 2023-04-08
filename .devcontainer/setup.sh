#! /bin/bash
REPO_FOLDER="/workspaces/$RepositoryName"

# Apache
sudo chmod 777 /etc/apache2/sites-available/000-default.conf
sudo sed "s@.*DocumentRoot.*@\tDocumentRoot $PWD/wordpress@" .devcontainer/000-default.conf > /etc/apache2/sites-available/000-default.conf
update-rc.d apache2 defaults 
service apache2 start

LOCALE="de_DE"

# WordPress Core install
echo "Installing WordPress..."
wp core download --locale=$LOCALE --path=wordpress
cd wordpress
wp config create --dbname=wordpress --dbuser=wordpress --dbpass=wordpress --dbhost=db
LINE_NUMBER=`grep -n -o 'stop editing!' wp-config.php | cut -d ':' -f 1`
sed -i "${LINE_NUMBER}r ../.devcontainer/wp-config-addendum.txt" wp-config.php && sed -i -e "s/CODESPACE_NAME/$CODESPACE_NAME/g"  wp-config.php
wp core install \
  --url=https://$(CODESPACE_NAME) \
  --title=WordPress \
  --admin_user=admin \
  --admin_password=admin \
  --admin_email=mail@example.com \
  --skip-email

# Selected plugins
echo "Installing WordPress Plugins, Themes..."
wp plugin delete akismet
wp plugin delete hello
wp plugin install query-monitor --activate
wp plugin install transients-manager --activate
wp plugin install loco-translate --activate
# wp plugin install show-current-template --activate
wp plugin activate wp-codespace

# Demo content for WordPress
echo "Installing WordPress Theme Test Data..."
wp plugin install wordpress-importer --activate
curl https://raw.githubusercontent.com/WPTT/theme-unit-test/master/themeunittestdata.wordpress.xml > demo-content.xml
wp import demo-content.xml --authors=create
rm demo-content.xml

#Xdebug
echo xdebug.log_level=0 | sudo tee -a /usr/local/etc/php/conf.d/xdebug.ini

# install dependencies
echo "Installing dependencies..."
cd $REPO_FOLDER
npm install 
composer install

# Setup local plugin
cd $REPO_FOLDER/wordpress/wp-content/plugins/wp-codespace && npm install && npx playwright install && npm run compile:css
code -r wp-codespace.php

# Setup bash
echo export PATH=\"\$PATH:$REPO_FOLDER/vendor/bin:$REPO_FOLDER/node_modules/.bin/\" >> ~/.bashrc
echo "cd $REPO_FOLDER/wordpress" >> ~/.bashrc
source ~/.bashrc
