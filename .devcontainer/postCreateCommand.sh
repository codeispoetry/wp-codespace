#! /bin/bash

# Apache
sudo chmod 777 /etc/apache2/sites-available/000-default.conf
sudo sed "s@.*DocumentRoot.*@\tDocumentRoot $PWD/wordpress@" .devcontainer/000-default.conf > /etc/apache2/sites-available/000-default.conf

update-rc.d apache2 defaults 
service apache2 start

# WordPress
wp core download --locale=de_DE --path=wordpress
cd wordpress
wp config create --dbname=wordpress --dbuser=wordpress --dbpass=wordpress --dbhost=db

LINE_NUMBER=`grep -n -o 'stop editing!' wp-config.php | cut -d ':' -f 1`
sed -i "${LINE_NUMBER}r ../.devcontainer/wp-config-addendum.txt" wp-config.php && sed -i -e "s/CODESPACE_NAME/$CODESPACE_NAME/g"  wp-config.php

wp core install --url=https://$(CODESPACE_NAME) --title=WordPress --admin_user=admin --admin_password=admin --admin_email=mail@example.com --locale=de_DE
wp language core install de_DE --activate
wp plugin delete akismet
wp plugin install show-current-template --activate
cd ..

#Xdebug
echo xdebug.log_level=0 | sudo tee -a /usr/local/etc/php/conf.d/xdebug.ini

# Setup bash
echo export PATH=\"\$PATH:/$CODESPACE_VSCODE_FOLDER/vendor/bin\" >> ~/.bashrc
#echo export PS1=\"$ \" >> ~/.bashrc
echo "cd $CODESPACE_VSCODE_FOLDER/wordpress" >> ~/.bashrc
source ~/.bashrc

exit

# install dependencies
npm install 
composer install
yes | npx playwright install-deps  
npx playwright install 

# Setup local plugin
exit
cd wordpress/wp-content/plugins/wp-codespace && npm install
