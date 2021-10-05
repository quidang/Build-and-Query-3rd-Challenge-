-- STUDENT ID: 103585238 NAME: HUYNH QUI DANG 

-- CREATE GITHUB REPOSITORY FOR BUILD AND QUERY CHALLENGE. 

-- CONNECT TO DATABASE. 
USE SEM2DB;

-- TASK 1. Convert ERD to Relational Schema. 
-- TASK 2. Write and Execute the DDL to create your DB.  
    -- Successfully create tables from the DD provided.
    -- Confirm that tables were created via Select * From (Table Names).
-- TASK 3. Adding Test Data to Tables. 
-- TASK 4. Write and run queries to meet each of the following requirements. 
    -- 
                
-- TASK 5. 
-- SQL EXAMPLES: 
-- CREATE TABLE table_name (       
--     column1 datatype,
--     column2 datatype,
--     column3 datatype,
--    ....
-- );
-- CREATE TABLE Persons (
--     PersonID int,
--     LastName varchar(255),
--     FirstName varchar(255),
--     Address varchar(255),
--     City varchar(255)
-- );
-- SYNTAX: 
-- CREATE TABLE new_table_name AS
--     SELECT column1, column2,...
--     FROM existing_table_name
--     WHERE ....;

-- TASK 1: Converting the provided ERD to a Relational Schema 
-- ORGANISATION (OrgId, OrganisationName) PRIMARY KEY (LecId)
-- CLIENT (ClientID, Name, Phone) PRIMARY KEY (ClientId)
-- ORDER (DateTimePlaced, DeliveryAddress) PRIMARY KEY (DateTimePlaced)
-- ORDERLINE (Qty) FOREIGN KEY (DateTimePlaced, ItemId)
-- MENUITEM (ItemId, Description, ServesPerUnit, UnitPrice) PRIMARY KEY (ItemId)

-- TASK 2: Writing SQL query's to verify all tables have been successfully created. 
CREATE TABLE ORGANISATION (
    OrgID NVARCHAR(4),
    OrganisationName NVARCHAR(200)
);

CREATE TABLE CLIENT (
    ClientID INT, 
    Names NVARCHAR(100), 
    Phone NVARCHAR(15),
    OrgID NVARCHAR(4)
);

CREATE TABLE ORDERS (
    ClientID INT, 
    OrderDate DATE, 
    DeliveryAddress NVARCHAR(MAX)
)

CREATE TABLE MENUITEM (
    ItemID INT, 
    Descriptions NVARCHAR(100),
    ServersPerUnit INT,
    UnitPrice MONEY
);

CREATE TABLE ORDERLINE (
    ItemID INT, 
    ClientID INT, 
    OrderDate DATE,
    Qty INT
);

SELECT * FROM ORGANISATION 
SELECT * FROM CLIENT
SELECT * FROM ORDERS
SELECT * FROM MENUITEM
SELECT * FROM ORDERLINE 

