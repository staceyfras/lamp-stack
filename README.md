# lamp-uni
*NOTICE: This project no longer works due to denied access to the server + database*

A web-based application which allows for students + professors to access and view relevant data according to project requirements. A LAMP stack implementation

Database(official project):
ssh cs332a20@shell.ecs.fullerton.edu
mysql -h mariadb -u csxxxxx -p
password: xxxxxxx

## How To
"use cs332aXX". Use "source createTables.sql; source insertData.sql;" in mariadb console to create db and fill with data.
If need to reset db, use "drop table x;" where x is the current table you want to drop, createTables.sql does not drop in the correct order due to FK restraints. You can also drop the whole database and recreate it: "drop database x" and "create database x"
