#! /bin/bash
echo "Installing depedencies"
npm install 
composer install
yes | npx playwright install-deps  
npx playwright install 
cd htdocs/wp-content/plugins/wp-codespace && npm install

echo "Configuring xdebug"
echo xdebug.log_level=0 | sudo tee -a /usr/local/etc/php/conf.d/xdebug.ini

echo "Starting docker"
docker-compose up -d

file="htdocs/wp-config.php"
while test ! -f "$file"
do
  sleep 1
done

sudo chmod 777 htdocs/ -R 
make update-wp-config 

# retry until database is up and running
while true; do
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