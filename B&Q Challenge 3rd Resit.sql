-- STUDENT ID: 103585238 NAME: HUYNH QUI DANG 

-- CREATE GITHUB REPOSITORY FOR BUILD AND QUERY CHALLENGE. 

-- CONNECT TO DATABASE. 
-- USE SEM2DB; 

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
    ServesPerUnit INT,
    UnitPrice MONEY
);

CREATE TABLE ORDERLINE (
    ItemID INT, 
    ClientID INT, 
    OrderDate DATE,
    Qty INT
);

INSERT INTO Organisation (OrgID, OrganisationName)
VALUES 
    ('DODG', 'Dod & Gy Widget Imporers'),
    ('SWUT', 'Swinburne University of Technology')


INSERT INTO Client (ClientID, Names, Phone, OrgID)
VALUES 
    (12, 'James Hallinan', 0355551234, 'SWUT'),
    (15, 'Anh Nguyen', 0355552345, 'DODG'),
    (18, 'Karen Mok', 0355553456, 'SWUT'),
    (21, 'Tim Baird', 0355554567, 'DODG'),
    (11, 'Qui Dang', 0481140124, 'SWUT')


INSERT INTO Orders (ClientID, OrderDate, DeliveryAddress)
VALUES 
    (12,	'2021-09-20',	'Room TB225 - SUT - 1 John Street, Hawthorn, 3122'),
    (21,	'2021-09-14',	'Room ATC009 - SUT - 1 John Street, Hawthorn, 3122'),
    (21,	'2021-09-27',	'Room TB225 - SUT - 1 John Street, Hawthorn, 3122')

INSERT INTO MenuItem (ItemID, Descriptions, ServesPerUnit, UnitPrice)
VALUES 
    (3214, 'Tropical Pizza - Large',	    2,	 $16.00),
    (3216, 'Tropical Pizza - Small',	    1,	 $12.00),
    (3218, 'Tropical Pizza - Family',    4,	 $23.00),
    (4325, 'Can - Coke Zero',	        1,	 $2.50),
    (4326, 'Can - Lemonade',	            1,	 $2.50), 
    (4327, 'Can - Harden Up',	        1,	 $7.50)

INSERT INTO Orderline (ItemID, ClientID, OrderDate, Qty)
VALUES
    (3216,	12,	'2021-09-20',	2),
    (4326,	12,	'2021-09-20',	1),
    (3218,	21,	'2021-09-14',	1),
    (3214,	21,	'2021-09-14',	1),
    (4325,	21,	'2021-09-14',	4),
    (4327,	21,	'2021-09-14',	2),
    (3216,	21,	'2021-09-27',	1),
    (4327,	21,	'2021-09-27',	1),
    (3218,	21,	'2021-09-27',	2),
    (3216,	15,	'2021-09-20',	2),
    (4326,	15,	'2021-09-20',	1),
    (3216,	18,	'2021-09-30',	1),
    (4327,	18,	'2021-09-30',	1)

SELECT * FROM ORGANISATION 
SELECT * FROM CLIENT
SELECT * FROM ORDERS
SELECT * FROM MENUITEM
SELECT * FROM ORDERLINE 

