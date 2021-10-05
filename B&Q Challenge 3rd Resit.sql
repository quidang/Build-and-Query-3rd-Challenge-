-- STUDENT ID: 103585238 NAME: HUYNH QUI DANG 

-- CREATE GITHUB REPOSITORY FOR BUILD AND QUERY CHALLENGE. 
-- CONNECT TO DATABASE. 
-- USE SEM2DB; 

-- TASK 1: Converting the provided ERD to a Relational Schema 

-- ORGANISATION (OrgId, OrganisationName) 
-- PRIMARY KEY (OrgId)

-- CLIENT (ClientID, Name, Phone) 
-- PRIMARY KEY (ClientId) FOREIGN KEY (OrgID) REFERENCES ORGANISATION

-- ORDER (ClientID, DateTimePlaced, DeliveryAddress) 
-- PRIMARY KEY (DateTimePlaced
-- FOREIGN KEY (ClientID) REFERENCES Client 

-- ORDERLINE (ClientID, OrderDate, DeliveryAddress)
-- PRIMARY KEY (ClientID, OrderDate)
-- FORIEGN KEY (ClientID) REFERENCES Client 
-- FOREIGN KEY (ItemID) REFERNCES MenuItem

-- MENUITEM (ItemId, Description, ServesPerUnit, UnitPrice) 
-- PRIMARY KEY (ItemId)

-- TASK 2: Writing SQL query's to verify all tables have been successfully created. 

DROP TABLE ORGANISATION
CREATE TABLE ORGANISATION (
    OrgID NVARCHAR(4),
    OrganisationName NVARCHAR(200) UNIQUE NOT NULL,
    PRIMARY KEY (OrgId)
);

DROP TABLE CLIENT
CREATE TABLE CLIENT (
    ClientID INT PRIMARY KEY, 
    Names NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(15) NOT NULL UNIQUE, 
    OrgID NVARCHAR(4),
    FOREIGN KEY (OrgId) REFERENCES Organisation
);

DROP TABLE ORDERS
CREATE TABLE ORDERS (
    ClientID INT,
    OrderDate DATE, 
    DeliveryAddress NVARCHAR(MAX) NOT NULL, 
    PRIMARY KEY (ClientId, OrderDate),
    FOREIGN KEY (ClientId) REFERENCES Client
);

DROP TABLE MENUITEM
CREATE TABLE MENUITEM (
    ItemID INT, 
    Descriptions NVARCHAR(100) NOT NULL UNIQUE,
    ServesPerUnit INT NOT NULL, 
    UnitPrice MONEY NOT NULL, 
    PRIMARY KEY (ItemID)
);

DROP TABLE ORDERLINE
CREATE TABLE ORDERLINE (
    ItemID INT, 
    ClientID INT, 
    OrderDate DATE,
    Qty INT NOT NULL, 
    PRIMARY KEY (ItemId, ClientID, OrderDate),
    FOREIGN KEY (ItemId) REFERENCES MenuItem
);

INSERT INTO Organisation (OrgID, OrganisationName)
VALUES 
    ('DODG', 'Dod & Gy Widget Importers'),
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
    (21,	'2021-09-27',	'Room TB225 - SUT - 1 John Street, Hawthorn, 3122'),
    (15,    '2021-09-20',   'The George - 1 John Street, Hawthorn, 3122'),
    (18,    '2021-09-30',    'Room TB225 - SUT - 1 John Street, Hawthorn, 3122')

INSERT INTO MenuItem (ItemID, Descriptions, ServesPerUnit, UnitPrice)
VALUES 
    (3214, 'Tropical Pizza - Large',	    2,	 $16.00),
    (3216, 'Tropical Pizza - Small',	    1,	 $12.00),
    (3218, 'Tropical Pizza - Family',       4,	 $23.00),
    (4325, 'Can - Coke Zero',	            1,	 $2.50),
    (4326, 'Can - Lemonade',	            1,	 $2.50), 
    (4327, 'Can - Harden Up',	            1,	 $7.50)

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

-- TASK 4: Write and run queries to meet each of the following requirements. 
-- Query 1: Write a query that shows the following columns for each orderline. 

SELECT ORGANISATIONNAME FROM ORGANISATION
SELECT NAMES FROM CLIENT 
SELECT ORDERDATE, DELIVERYADDRESS FROM ORDERS 
SELECT QTY FROM ORDERLINE 


-- Query 2: Write a query which shows the total (sum) quantity ordered of menu item by each organisation
SELECT OG.OrgID, M.Description, SUM(QTY) AS 'Total quantity ordered'
FROM MenuItem M
INNER JOIN OrderLine OL ON OL.ITEMID = M.ItemID
INNER JOIN Client C ON OL.ClientID = C.ClientID
INNER JOIN Organisation OG ON C.OrgID = OG.OrgID
GROUP BY OG.OrgID, M.Description
ORDER BY OrgId ASC


-- Query 3: Write a query which lists all OrderLines for the Menu item which has the highest price.
SELECT ItemID, UnitPrice, Descriptions, ServesPerUnit
FROM MenuItem
GROUP BY ItemID, UnitPrice, Descriptions, SErvesPerUnit
ORDER BY UnitPrice DESC
GO;

-- Task 5: Create a View Based on Query 1 from Task 4. 
CREATE VIEW [Caterers Orders] AS
SELECT OrganisationName, Names, Orders.OrderDate, DeliveryAddress, Descriptions, Qty
FROM Organisation, Client, Orders, MenuItem, OrderLine
GO;

SELECT * FROM [Caterers Orders];

-- Task 6: Write and test the queries in Task 4. 
-- For Task 4 Query 1: Asks to select the proper columns from the table that was created. 
SELECT * FROM Organisation, Client, Orders, MenuItem, Orderline
-- Task 4 Query 2: Shows the order of prices from high to low. Proving that the column returns proper values.
SELECT UnitPrice
FROM MenuItem 
ORDER BY UnitPrice DESC 
--Task 4 Query 3: Returns the SUM of QTY of MenuItems
SELECT Descriptions 
FROM MenuItem 
IF @@ROWCOUNT = 6
PRINT 'There are 6 Menu Items to pick from.'


