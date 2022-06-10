--Inmon
1
---���������� �� ��������������
Use OnlineStore

SELECT OrderDetailsID, 
	   OrderID, 
	   Products.ProdID, 
	   Quantity, 
	   TotalPrice, 
	   ProdName, 
	   Suppliers.SupplierID, 
	   SupplierName, 
	   SupplierProne, 
	   SupplierEmail 
FROM OrderDetails
JOIN Products ON OrderDetails.ProdID = Products.ProdID
JOIN Suppliers ON Products.Supplier = Suppliers.SupplierID

2
---���������� �� �������������
SELECT OrderDetailsID, 
	   Orders.OrderID,  
	   Quantity, 
	   TotalPrice, 
	   Departaments.DepID,
	   DepName,
	   EmpFirstName,
	   EmpLastName,
	   EmpPosition
FROM OrderDetails
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Employees ON Employees.EmpID = Orders.AssignedTo
JOIN Departaments ON Employees.DepID = Departaments.DepID

3
--- ���������� �� ���� ��������
SELECT OrderID,
	   OrderDate, 
	   CustomerID,
	   OrderDate, 
	   ShippingID, 
ROW_NUMBER() OVER(PARTITION BY ShippingID ORDER BY OrderDate DESC) AS [row_number] FROM Orders

4
--- ���� ��� ��������� �� ���������
SELECT SUM(TotalPrice) as TotalPrice_Product, 
	   ProdName
FROM OrderDetails
JOIN Products ON OrderDetails.ProdID = Products.ProdID
GROUP BY ProdName

5
--�-��� ��������� �� �������� ������
SELECT OrderDetailsID, 
	   Orders.OrderID,  
	   Quantity, 
	   TotalPrice, 
	   WarehouseLocation,
	   EmpFirstName,
	   EmpLastName,
	   EmpPosition
FROM OrderDetails
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Employees ON Employees.EmpID = Orders.AssignedTo
JOIN Warehouses ON Employees.EmpID = Warehouses.WarehouseID

6
--���������� �� �������
SELECT OrderDetailsID, 
	   OrderID,  
	   Quantity, 
	   TotalPrice, 
	   DiscountValue
FROM OrderDetails
JOIN Discounts ON OrderDetails.DiscountID = Discounts.DiscountID


7
-- ���������� �� ��������� 
SELECT Max(TotalPrice) As MaxPrice, 
	   ProdName
FROM OrderDetails
JOIN Products ON OrderDetails.ProdID = Products.ProdID
GROUP BY ProdName

8
--- �������� ����������
SELECT OrderID,
	   OrderDate, 
	   CustomerID,
	   OrderDate, 
	   ShippingID, 
LEAD(OrderDate,1) OVER(PARTITION BY ShippingID ORDER BY OrderDate DESC) as next_order
FROM Orders

9
--- ���������� �� ����� ������� ��������
SELECT OrderID,
	   OrderDetailsID,
	   OrderDetails.ProdID,
	   TotalPrice,		
	   ProdCategory,
DENSE_RANK() OVER(PARTITION BY ProdCategory ORDER BY TotalPrice DESC) AS [rank] FROM OrderDetails
JOIN Products ON OrderDetails.ProdID = Products.ProdID

10
---���������� �� ���� ������
SELECT OrderDetailsID, 
	   OrderID, 
	   Products.ProdID, 
	   Quantity, 
	   TotalPrice, 
	   ProdName,
	   WarrantyPeriod
FROM OrderDetails
JOIN Products ON OrderDetails.ProdID = Products.ProdID
JOIN ProductWarranties ON ProductWarranties.WarrantyID = Products.WarrantyID
