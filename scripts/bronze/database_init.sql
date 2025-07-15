/* 
Script Purpose : 
This script creates a new Database names 'DataWarehouse' after checking if it already exists.
Then the three scchemas 'bronze' , 'silver' and 'gold' are created.
If you are using a tool like DBeaver, make sure to execute each bit of code (delimited by comments)
seperatly and in the right place.

Warning :
If you already have a database named 'DataWarehouse', this script will drop it and it will be permanently deleted.
Proceed with caution and ensure you have backups before running this script.
*/

-- Creating the database

DROP DATABASE IF EXISTS "DataWarehouse";

create DATABASE DataWarehouse;

-- connecte to the data base using :

\c DataWarehouse

-- Create the schemas
create schema bronze;

create schema silver;

create schema gold;
