# lamp-uni

Remember to use correct credentials for server login on our Interfaces.

Use "source createTables.sql; source insertData.sql;" in mariadb console to create db and fill with data.
If need to reset db, use "drop table x;" where x is the current table you want to drop, createTables.sql does not drop in the correct order due to FK restraints.

Interfaces have appended html and php if you scroll down, needs an if/else for if currently connected to db output x, else output y.
Our index.html file has a navbar that needs links that post to our php interfaces, may need to use onclick forms.
Interfaces need to use the $query variable to change the query that is run in our php, like buttons that will change the $query value to a different sql statement string.

insertData.sql has invalid insert statements, run in mariadb console to try and fix this.
Need more data in insertData.sql

Student interface currently loads a test table from the query "select * from PROFESSORS;" and displays the one professor in our table.

