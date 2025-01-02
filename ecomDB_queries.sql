SELECT customers.CustomerID, customers.First_Name, customers.Last_Name, orders.OrderNum, orders.Order_Date 
FROM customers LEFT JOIN orders ON customers.CustomerID = orders.CustomerID;

SELECT * FROM customers;

SELECT Products.ProductID, Inventory.InventoryID, Products.Product_type, Inventory.Quantity
FROM Products JOIN Inventory ON Products.ProductID = Inventory.ProductID;

UPDATE products
SET ProductPrice = 279.99 WHERE ProductID = 101;

SELECT * FROM products;

UPDATE manufacturer 
SET Manufacturer_Name = 'EVOO' WHERE ManufacturerID = 14;

SELECT Manufacturer_Name FROM manufacturer;


SELECT * FROM products;

DELETE FROM orderline WHERE ProductID = 105;

DELETE FROM inventory WHERE ProductID = 105;

DELETE FROM products WHERE ProductID = 105;





