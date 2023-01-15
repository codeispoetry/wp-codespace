#! /bin/bash

# Apache
sed -i '/DocumentRoot/c\\tDocumentRoot $CODESPACE_VSCODE_FOLDER/wordpress' /etc/apache2/sites-available/000-default.conf
a2ensite 000-default.conf
update-rc.d apache2 defaults 
service apache2 start

#WordPress
wp core download --locale=de_DE --path=wordpress

exit; 
echo "Installing depedencies"
npm install 
composer install
yes | npx playwright install-deps  
npx playwright install 
cd htdocs/wp-content/plugins/wp-codespace && npm install
cd ../../../../


echo "Configuring xdebug"
echo xdebug.log_level=0 | sudo tee -a /usr/local/etc/php/conf.d/xdebug.ini

echo "Starting docker"
docker-compose up -d

file="htdocs/wp-config.php"
while test ! -f "$file"
do
  echo "Look for wp-config"
  sleep 10
done

sudo chmod 777 htdocs/ -R 
make update-wp-config 

# retry until database is up and running
while true; do
  echo "try to make wp-install"
  make wp-install
  if [ $? -eq 0 ]; then
      break
  fi
  sleep 15
done

make wp-configure

echo export PATH=\"\$PATH:/$CODESPACE_VSCODE_FOLDER/vendor/bin\" >> ~/.bashrc
echo export PS1=\"$ \" >> ~/.bashrc
source ~/.bashrc
