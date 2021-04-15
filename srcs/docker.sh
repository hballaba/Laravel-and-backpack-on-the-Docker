#mysql
service mysql start
echo "CREATE DATABASE books;" | mysql -u root --skip-password
echo "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON * . * TO 'admin'@'localhost';" |mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password


service mysql restart
chown -R www-data /var/www/*
chmod -R 755 /var/www/*


# apache

/etc/init.d/apache2 start


# copy .env
rm ./project/.env
mv .env ./project/.env
cd project


#backpack
composer require backpack/crud:"4.1.*"
composer require backpack/generators --dev
composer require laracasts/generators --dev
composer install 
php artisan key:generate 
php artisan migrate 
php artisan db:seed




php artisan serve --host=0.0.0.0 --port=8000

# service php7.3-fpm start


bash
