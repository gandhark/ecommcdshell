#!/bin/bash


unzip   -do  /opt/rh/httpd24/root/var/www/html/ecomm_project ecomm_project.zip  
cd /opt/rh/httpd24/root/var/www/html/
chmod -R 777 ecomm_project
 echo  "127.0.0.1 ecomm_project">> /etc/hosts
echo "Creating VHOST file "
 echo '<VirtualHost *:80>
    <Directory "/opt/rh/httpd24/root/var/www/html/ecomm_project">
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
    DocumentRoot "/opt/rh/httpd24/root/var/www/html/ecomm_project"
    ServerName ecomm_project
</VirtualHost>' >>/opt/rh/httpd24/root/etc/httpd/conf.d/ecomm_project.conf


 /etc/init.d/httpd24-httpd restart

 #firefox -new-window ecomm_project
echo "Hurrah! Got success"
#cd /opt/rh/httpd24/root/etc/httpd/conf.d/
#rm -rf ecomm_project.conf

