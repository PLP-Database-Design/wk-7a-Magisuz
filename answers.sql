-- 1. Write an SQL query** to transform this table into **1NF**, ensuring that each row represents a single product for an order
-- CREATE DATABASE NormalForm;
-- USE NormalForm;
-- Transform the Table into 1NF
-- Create the Table
CREATE TABLE ProductDetail(
OrderId INT,
CustomerName VARCHAR (100),
Products VARCHAR (100)
);

-- Insert the Data
INSERT INTO ProductDetail(OrderId, CustomerName, Products)
VALUES(101,"John Doe", "Laptop"),
(101,"John Doe","Mouse"),
(102,"Jane Smith", "Tablet"),
(102,"Jane Smith", "Keyboard"),
(102,"Jane Smith", "Mouse"),
(103,"Emily Clark", "Phone");

-- 2. Write an SQL query to transform this table into **2NF** by removing partial dependencies. 
-- Ensure that each non-key column fully depends on the entire primary key.

-- CREATE DATABASE NormalForm;
-- USE NormalForm;

-- Create the Table
CREATE TABLE OrderDetails(
OrderId INT PRIMARY KEY,
CustomerName VARCHAR (100),
Product VARCHAR (100),
Quantity INT
);

-- Insert the Data
INSERT INTO OrderDetails(OrderId, CustomerName,Product, Quantity)
VALUES (101, "John Doe", "Laptop", 2),
(101, "John Doe", "Mouse", 1),
(102, "Jane Smith", "Tablet", 3),
(102, "Jane Smith", "Keyboard", 1),
(102, "Jane Smith", "Mouse", 2),
(103, "Emily Clark", "Phone", 1);

-- Normalize the Table into 2NF
-- Create the Tables
CREATE TABLE CustomerDetails(
CustomerId INT PRIMARY KEY,
CustomerName VARCHAR (100)
);

CREATE TABLE Product(
OrderId INT,
Product VARCHAR (100),
Quantity INT,
PRIMARY KEY (OrderId,Product),
FOREIGN KEY (OrderId) REFERENCES CustomerDetails(OrderId)
);

-- Insert the Data
INSERT INTO CustomerDetails(CustomerId, CustomerName)
VALUES (101, "John Doe"),
(102, "Jane Smith"),
(103, "Emily Clark");

INSERT INTO Product(OrderId, Product, Quantity)
VALUES (101, "Laptop", 2),
(101, "Mouse", 1),
(102, "Tablet", 3),
(102, "Keyboard", 1),
(102, "Mouse", 2),
(103, "Phone", 1);

