CREATE DATABASE E_Commerce;

USE E_Commerce;

CREATE TABLE Customers 
	(CustomerID INT NOT NULL,
    First_Name VARCHAR (25),
    Last_Name VARCHAR (25),
    Middle_Initial CHAR(1),
    Street_Address VARCHAR(50), 
    City VARCHAR(25), 
    State VARCHAR(25), 
    Zip_Code VARCHAR(25),
    CONSTRAINT Customer_PK PRIMARY KEY (CustomerID));
    
CREATE TABLE Orders
	(OrderNum INT NOT NULL, 
	CustomerID INT , 
	Order_Date DATE, 
	CONSTRAINT Order_PK PRIMARY KEY (OrderNum),
	CONSTRAINT Order_FK FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)); 
    
CREATE TABLE Manufacturer 
	(ManufacturerID INT NOT NULL, 
    Manufacturer_Name VARCHAR(25), 
    M_StreetAddress VARCHAR(50),
    M_City VARCHAR(25), 
    M_state VARCHAR(25), 
    M_Zip VARCHAR(25),
    CONSTRAINT Manufacturer PRIMARY KEY (ManufacturerID));
    
CREATE TABLE Products 
	(ProductID INT NOT NULL, 
	ProductPrice DECIMAL(10, 2), 
	Product_type VARCHAR(25), 
	ManufacturerID INT,
	CONSTRAINT Product_PK PRIMARY KEY (ProductID),
	CONSTRAINT Product_FK FOREIGN KEY (ManufacturerID) REFERENCES Manufacturer(ManufacturerID));


CREATE TABLE Inventory
	(InventoryID INT NOT NULL, 
    ProductID INT,
    Quantity Int,
    CONSTRAINT Inventory_PK PRIMARY KEY (InventoryID),
	CONSTRAINT Inventory_FK FOREIGN KEY (ProductID) REFERENCES Products(ProductID)); 


CREATE TABLE Orderline 
	(OrderlineID INT NOT NULL,
    OrderNum INT, 
    ProductID INT, 
    InventoryID INT, 
    CONSTRAINT Orderline_PK PRIMARY KEY (OrderlineID),
	CONSTRAINT Orderline_FK1 FOREIGN KEY (Ordernum) REFERENCES Orders(OrderNum),
	CONSTRAINT Orderline_FK2 FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
	CONSTRAINT Orderline_FK3 FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID));
 
INSERT INTO Customers  (CustomerID, First_Name, Last_Name, Middle_Initial, Street_Address, City, State, Zip_Code)
VALUES  (1, 'Tom', 'Brown', 'M', '34 Oak Drive', 'Cleveland', 'Ohio', '65727');
INSERT INTO Customers  (CustomerID, First_Name, Last_Name, Middle_Initial, Street_Address, City, State, Zip_Code)
VALUES  (2, 'Jennifer', 'Greene', 'L', '57 Collier Street', 'Lexington', 'Kentucky', '57462');
INSERT INTO Customers  (CustomerID, First_Name, Last_Name, Middle_Initial, Street_Address, City, State, Zip_Code)
VALUES  (3, 'Mark', 'Andrews', 'J', '101 Maple Avenue', 'Jackson', 'Mississippi', '22379');
INSERT INTO Customers  (CustomerID, First_Name, Last_Name, Middle_Initial, Street_Address, City, State, Zip_Code)
VALUES  (4, 'Angelica', 'Liu', 'V', '69 Suydam Street', 'Brooklyn', 'New York', '12876');
INSERT INTO Customers  (CustomerID, First_Name, Last_Name, Middle_Initial, Street_Address, City, State, Zip_Code)
VALUES  (5, 'Bill', 'Singh', 'R', '63 Grassy Knoll', 'Dallas', 'Texas', '56372');

INSERT INTO Orders  (OrderNum, CustomerID, Order_Date)
VALUES  (87, 1, '2024-02-12');
INSERT INTO Orders  (OrderNum, CustomerID, Order_Date)
VALUES  (91, 2, '2024-04-21');
INSERT INTO Orders  (OrderNum, CustomerID, Order_Date)
VALUES  (94, 3, '2024-06-01');
INSERT INTO Orders  (OrderNum, CustomerID, Order_Date)
VALUES  (101, 4, '2024-10-28');
INSERT INTO Orders  (OrderNum, CustomerID, Order_Date)
VALUES  (113, 5, '2024-12-13');
    
INSERT INTO Manufacturer  (ManufacturerID, Manufacturer_Name, M_StreetAddress, M_City, M_state, M_Zip)
VALUES  (11, 'Toshiba', '182 Corporate Drive', 'Boston', 'Massachusetts', '20982');
INSERT INTO Manufacturer  (ManufacturerID, Manufacturer_Name, M_StreetAddress, M_City, M_state, M_Zip)
VALUES  (12, 'HP', '28 Technology Boulevard', 'New York', 'New York', '10223');
INSERT INTO Manufacturer  (ManufacturerID, Manufacturer_Name, M_StreetAddress, M_City, M_state, M_Zip)
VALUES  (13, 'Dell', '91 Silicon Valley', 'San Francisco', 'California', '90610');
INSERT INTO Manufacturer  (ManufacturerID, Manufacturer_Name, M_StreetAddress, M_City, M_state, M_Zip)
VALUES  (14, 'Gateway', '467 Mountain Road', 'Seattle', 'Washington', '89720');
INSERT INTO Manufacturer  (ManufacturerID, Manufacturer_Name, M_StreetAddress, M_City, M_state, M_Zip)
VALUES  (15, 'Lenovo', '712 Peachtree Street', 'Atlanta', 'Georgia', '30303');

INSERT INTO Products  (ProductID, ProductPrice, Product_type, ManufacturerID)
VALUES  (101, 299.99, 'Computer Monitor', 11);    
INSERT INTO Products  (ProductID, ProductPrice, Product_type, ManufacturerID)
VALUES  (102, 199.99, 'Computer Monitor', 12);    
INSERT INTO Products  (ProductID, ProductPrice, Product_type, ManufacturerID)
VALUES  (103, 899.99, 'Laptop', 13);    
INSERT INTO Products  (ProductID, ProductPrice, Product_type, ManufacturerID)
VALUES  (104, 999.99, 'Computer Tower', 14);    
INSERT INTO Products  (ProductID, ProductPrice, Product_type, ManufacturerID)
VALUES  (105, 699.99, 'Laptop', 15);    
    
INSERT INTO Inventory (InventoryID, ProductID, Quantity)
VALUES (1001, 101, 21);
INSERT INTO Inventory (InventoryID, ProductID, Quantity)
VALUES (1002, 102, 7);
INSERT INTO Inventory (InventoryID, ProductID, Quantity)
VALUES (1003, 103, 13);
INSERT INTO Inventory (InventoryID, ProductID, Quantity)
VALUES (1004, 104, 9);
INSERT INTO Inventory (InventoryID, ProductID, Quantity)
VALUES (1005, 105, 25);

INSERT INTO Orderline (OrderlineID, OrderNum, ProductID, InventoryID)
VALUES (51, 87, 101, 1001);
INSERT INTO Orderline (OrderlineID, OrderNum, ProductID, InventoryID)
VALUES (52, 87, 104, 1004);
INSERT INTO Orderline (OrderlineID, OrderNum, ProductID, InventoryID)
VALUES (57, 91, 102, 1002);
INSERT INTO Orderline (OrderlineID, OrderNum, ProductID, InventoryID)
VALUES (63, 94, 103, 1003);
INSERT INTO Orderline (OrderlineID, OrderNum, ProductID, InventoryID)
VALUES (72, 101, 104, 1004);
INSERT INTO Orderline (OrderlineID, OrderNum, ProductID, InventoryID)
VALUES (89, 113, 105, 1005);
INSERT INTO Orderline (OrderlineID, OrderNum, ProductID, InventoryID)
VALUES (90, 113, 102, 1002);
INSERT INTO Orderline (OrderlineID, OrderNum, ProductID, InventoryID)
VALUES (91, 113, 103, 1003);