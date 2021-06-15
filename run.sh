#!/bin/ash
if [ ! -e /var/www/wordpress/wp-admin ]; then
  mkdir -p /var/www/
  tar xvzf latest.tar.gz -C /var/www/
  mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
  sed -i "s/localhost/$WP_DB_HOST/g" /var/www/wordpress/wp-config.php
  sed -i "s/password_here/$WP_DB_PASS/g" /var/www/wordpress/wp-config.php
  sed -i "s/username_here/$WP_DB_USER/g" /var/www/wordpress/wp-config.php
  sed -i "s/database_name_here/$WP_DB_NAME/g" /var/www/wordpress/wp-config.php
  if [ "$WP_TLS" = "true" ]; then
    sed -i "s:/**#@-*/:if ($_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') $_SERVER['HTTPS']='on';:g" /var/www/wordpress/wp-config.php
  fi
  chown -R nginx.nginx /var/www/wordpress
fi

nginx
php-fpm7

while true; do
  sleep 300;
done
