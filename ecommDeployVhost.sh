#!/bin/bash

 echo  "127.0.0.1 ecommercecd">>sudo /etc/hosts
echo "Creating VHOST file "
 echo '<VirtualHost *:80>
    <Directory "/opt/rh/httpd24/root/var/www/html/ecommercecd">
        Options Indexes FollowSymLinks Includes ExecCGI
        Order allow,deny
        Allow from all
    </Directory>
    <IfModule mod_php5.c>
        php_admin_flag safe_mode Off
        php_admin_value register_globals 0
        php_value magic_quotes_gpc 0
        php_value magic_quotes_runtime 0
        php_value allow_call_time_pass_reference 0
    </IfModule>
    DirectoryIndex index.php
    DocumentRoot "/opt/rh/httpd24/root/var/www/html/ecommercecd"
    ServerName ecommercecd
</VirtualHost>' >>/opt/rh/httpd24/root/etc/httpd/conf.d/ecommercecd.conf


 /etc/init.d/httpd24-httpd restart

 firefox -new-window ecommercecd
echo "Hurrah! Got success"
cd /opt/rh/httpd24/root/etc/httpd/conf.d/
rm -rf ecommerce-cd.conf

