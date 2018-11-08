# lamp-uni

Remember to use correct credentials for server login on our Interfaces.

## Loading/Editing
mysql -h cs332a20 -p (kyle's? use your own for testing purposes)
NOTICE: createTables.sql does not have proper username usage

Load files into mysql: source <filename.sql>
Drop table: DROP TABLE <table_name>

## .sql files
Status: IP
need to complete records + sections (commented out ATM)

## frontend info
Interfaces have appended html and php if you scroll down, needs an if/else for if currently connected to db output x, else output y.
Our index.html file has a navbar that needs links that post to our php interfaces, may need to use onclick forms.
Interfaces need to use the $query variable to change the query that is run in our php, like buttons that will change the $query value to a different sql statement string.

Student interface currently loads a test table from the query "select * from PROFESSORS;" and displays the one professor in our table.

