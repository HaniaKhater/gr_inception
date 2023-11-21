#!/bin/bash

service mysql start

# Create a MySQL database if it doesn't already exist
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS \`$SQL_DATABASE\`;"

# Create a MySQL user if it doesn't already exist, identified by the provided password
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS \`$SQL_USER\`@'localhost' IDENTIFIED BY '$SQL_PWD';"

# Grant all privileges on the specified database to the user, both locally and from any host
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON \`$SQL_DATABASE\`.* TO \`$SQL_USER\`@'%' IDENTIFIED BY '$SQL_PWD';"

# Change the password for the root user
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_PWD';"

# Flush the MySQL privileges to ensure they are updated
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

echo "MariaDB initialization completed successfully."

# Shutdown the MySQL server gracefully using mysqladmin
mysqladmin -u root -p"$SQL_ROOT_PASSWORD" shutdown

# Start MySQL server in safe mode
exec mysqld_safe
