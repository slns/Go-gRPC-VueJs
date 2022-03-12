-- Create a new table called 'TableName' in schema 'SchemaName'
-- Create the table in the specified schema
CREATE TABLE users
(
    id INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL , -- primary key column
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(150) NOT NULL,
    visivel BOOLEAN NOT NULL DEFAULT 0,
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP 
    -- specify more columns here
);
