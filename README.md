# lamp-uni

A web-based application which allows for students + professors to access and view relevant data according to project requirements. A LAMP stack implementation

Database(official project):
ssh cs332a20@shell.ecs.fullerton.edu
mysql -h mariadb -u cs332a20 -p
password: hievoosi

## How To
"use cs332aXX". Use "source createTables.sql; source insertData.sql;" in mariadb console to create db and fill with data.
If need to reset db, use "drop table x;" where x is the current table you want to drop, createTables.sql does not drop in the correct order due to FK restraints. You can also drop the whole database and recreate it: "drop database x" and "create database x"

student + professor portal + query are completed.

all .sql files are successful.

## To Do
insertData.sql needs to be populated with data corresponding to project requirements.
drop table if exists implementation?
delete table .sql?

COMPLETE: #4 - #6 on project requirements
https://docs.google.com/document/d/1bDSYHmkxgwYZHG5TzZ-9n1Al_Nv0awZV2ps4rnKf-gY/edit?usp=sharing


