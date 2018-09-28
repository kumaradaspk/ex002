#/bin/bash
mysql_install_db
chown mysql.mysql /var/lib/mysql -R
/usr/bin/mysqld_safe &
sleep 20

mysqladmin -u root password mariadbPassword -h 127.0.0.1
mysql -uroot -pmariadbPassword -e "CREATE DATABASE tododb;"
mysql -uroot -pmariadbPassword -e "GRANT ALL PRIVILEGES ON tododb.* TO 'tododb'@'%' IDENTIFIED BY 'password'; FLUSH PRIVILEGES;"
sleep 10
