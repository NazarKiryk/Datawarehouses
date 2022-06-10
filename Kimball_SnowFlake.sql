Use DWH_OnlineStoreSF
1
---���������� �� ���������������
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
	   OrderID,  
	   Quantity, 
	   TotalPrice, 
	   DimDepartaments.DepID,
	   DepName,
	   EmpFirstName,
	   EmpLastName,
	   EmpPosition
FROM FactOrders
JOIN DimEmployees ON DimEmployees.EmpID = FactOrders.AssignedTo
JOIN DimDepartaments ON DimEmployees.DepID = DimDepartaments.DepID

3
--- ���������� �� ���� ��������
SELECT OrderID,
	   OrderDate, 
	   CustomerID,
	   OrderDate, 
	   ShippingID, 
ROW_NUMBER() OVER(PARTITION BY ShippingID ORDER BY OrderDate DESC) AS [row_number] FROM FactOrders

4
--- ���� ��� ��������� �� ���������
SELECT SUM(TotalPrice) as TotalPrice_Product, 
	   ProdName
FROM FactOrders
JOIN DimProducts ON FactOrders.ProdID = DimProducts.ProdID
GROUP BY ProdName

5
--�-��� ��������� �� �������� ������
SELECT OrderDetailsID, 
	   OrderID,  
	   Quantity, 
	   TotalPrice, 
	   WarehouseLocation
FROM FactOrders
JOIN DimProducts ON Dimproducts.ProdID = FactOrders.ProdID
JOIN DimWarehouses ON Dimproducts.WarehouseID = DimWarehouses.WarehouseID

6
--���������� �� �������
SELECT OrderDetailsID, 
	   OrderID,  
	   Quantity, 
	   TotalPrice, 
	   DiscountValue
FROM FactOrders
JOIN DimDiscounts ON FactOrders.DiscountID = DimDiscounts.DiscountID


7
-- ���������� �� ��������� 
SELECT Max(TotalPrice) As MaxPrice, 
	   ProdName
FROM FactOrders
JOIN DimProducts ON FactOrders.ProdID = DimProducts.ProdID
GROUP BY ProdName

8
--- �������� ����������
SELECT OrderID,
	   OrderDate, 
	   CustomerID,
	   OrderDate, 
	   ShippingID, 
LEAD(OrderDate,1) OVER(PARTITION BY ShippingID ORDER BY OrderDate DESC) as next_order
FROM FactOrders

9
--- ���������� �� ����� ������� ��������
SELECT OrderID,
	   OrderDetailsID,
	   FactOrders.ProdID,
	   TotalPrice,		
	   CategoryName,
DENSE_RANK() OVER(PARTITION BY CategoryName ORDER BY TotalPrice DESC) AS [rank] FROM FactOrders
JOIN DimProducts ON FactOrders.ProdID = DimProducts.ProdID

10
---���������� �� ���� ������
SELECT OrderDetailsID, 
	   OrderID, 
	   DimProducts.ProdID, 
	   Quantity, 
	   TotalPrice, 
	   ProdName,
	   WarrantyPeriod
FROM FactOrders
JOIN DimProducts ON FactOrders.ProdID = DimProducts.ProdID


