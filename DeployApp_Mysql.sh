#!/bin/bash


##### Prerequisites for running this script #####

#1.	Script only runs on CentOS [RPM based systems].
#2.	Mysql-Server should already be installed and running.

##### Declare variables ##### 

ROOTPW=
DBNAME=sonar
DBUSER=sonar
DBPASS=sonar
IPADDRESS=`ip route get 8.8.8.8 | awk '{ print $NF; exit }'`
SONAR_VERSION=$3
MACHINE_TYPE=`getconf LONG_BIT`
db="show databases";
##### Script to install SonarQube and Sonar-Runner and Configure them (On RPM based systems only) #####
   echo "MySQL is installed."
   sleep 3
   printf "\n\n"
   if [ $# -eq 0 ]; then
     echo "MySQL Password not supplied... Using default MySQL Password..."
     sleep 3
     printf "\n\n"  
     /etc/init.d/mysqld start
 
     echo "**********************************************************************"
     echo "Opening mysql command prompt..."
     echo "**********************************************************************"
     sleep 3
     printf "\n\n"
     mysql -u root -p$ROOTPW -e $db
	
   else
	 echo "MySQL Password Supplied... Using Supplied MySQL Password to create database..." 
     service mysqld start
	 echo "**********************************************************************"
     echo "Creating Sonar Database..."
     echo "**********************************************************************"
     sleep 3
     printf "\n\n"
	echo $2
echo "$2 is"
     mysql -u root -p$2 -e $db
   fi 




