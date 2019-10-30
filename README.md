# lamp-uni

Remember to use correct credentials for server login on our Interfaces.
ssh cs332a18@shell.ecs.fullerton.edu

Database(official project):
mysql -h mariadb -u cs332*** -p
password: ------
"use cs332aXX". Use "source createTables.sql; source insertData.sql;" in mariadb console to create db and fill with data.
If need to reset db, use "drop table x;" where x is the current table you want to drop, createTables.sql does not drop in the correct order due to FK restraints. You can also drop the whole database and recreate it: "drop database x" and "create database x"

student + professor portal + query are completed.

all .sql files are successful.

TODO:
insertData.sql needs to be populated with data corresponding to project requirements.

drop table if exists implementation?

delete table .sql?

#4 - #6 on project requirements



