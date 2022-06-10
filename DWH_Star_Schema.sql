Use OnlineStore

SELECT * FROM ShippingMethods

SELECT * FROM Discounts

SELECT * FROM OrderDetails

SELECT * FROM Orders



Use DWH_OnlineStore

SELECT * FROM FactOrders

CREATE TABLE FactOrders(
	OrderID int NOT NULL,
	OrderDetailsID int NOT NULL, 
	OrderDate date NOT NULL,
	ShippingDate date NOT NULL,
	CustomerID int NOT NULL,
	ProdID int NOT NULL, 
	Quantity int NOT NULL,
	VAT NUMERIC(19, 2) NOT NULL,
	TotalPrice NUMERIC(19, 2) NOT NULL,  
	ShippingAddress nvarchar(50) NOT NULL,
	ShippingID int NOT NULL,
	DiscountID int NOT NULL,
	PaymentMethod int NOT NULL,
	WarrantyStartDate date NOT NULL,
	WarrantyExpDate date NOT NULL,
	AssignedTo int NOT NULL,
	PRIMARY KEY(OrderDetailsID, OrderID),
	CONSTRAINT FK_Orders_To_DimShippingMethods FOREIGN KEY (ShippingID) REFERENCES DimShippingMethods (ShippingID),
	CONSTRAINT FK_Orders_To_DimDiscounts FOREIGN KEY (DiscountID) REFERENCES DimDiscounts (DiscountID),
	CONSTRAINT FK_Orders_To_DimCustomers FOREIGN KEY (CustomerID) REFERENCES DimCustomers (CustomerID),
	CONSTRAINT FK_Orders_To_DimProducts FOREIGN KEY (ProdID) REFERENCES DimProducts (ProdID),
	CONSTRAINT FK_Orders_To_DimEmployees FOREIGN KEY (AssignedTo) REFERENCES DimEmployees (EmpID)
)

CREATE TABLE DimCustomers(
	CustomerID int PRIMARY KEY NOT NULL, 
	CustomerFirstName nvarchar(50) NOT NULL,
	CustomerLastName nvarchar(50) NOT NULL,
	CustomerEmail nvarchar(50) NOT NULL,
	CustomerPhone nvarchar(15) NOT NULL,
	ZipCode nvarchar(50) NOT NULL,
	CusomerAddress nvarchar(50) NOT NULL,
)

CREATE TABLE DimShippingMethods(
	ShippingID int PRIMARY KEY NOT NULL, 
	ShippingMethod nvarchar(50) NOT NULL,
	ShippingPrice int NOT NULL,
	ShippingDuration int NOT NULL
)

Create TABLE DimDiscounts(
	DiscountID int PRIMARY KEY NOT NULL,
	DiscountValue nvarchar(50) NOT NULL	
)


CREATE TABLE DimProducts(
	ProdID int PRIMARY KEY NOT NULL,
	ProdName nvarchar(50) NOT NULL,
	QttinStock int NOT NULL,
	CostUnit NUMERIC(19, 2) NOT NULL,
	PriceUnit NUMERIC(19, 2) NOT NULL,
	CategoryName nvarchar(50) NOT NULL,
	WarrantyID int NOT NULL,
	WarrantyPeriod nvarchar(50) NOT NULL,
	SupplierName nvarchar(50) NOT NULL,
	SupplierProne nvarchar(50) NOT NULL,
	SupplierEmail nvarchar(50) NOT NULL,
	WarehouseName nvarchar(50) NOT NULL,
	WarehouseLocation nvarchar(50) NOT NULL,
	WarehouseManager int NOT NULL
)

CREATE TABLE DimEmployees(
	EmpID int PRIMARY KEY NOT NULL, 
	EmpFirstName nvarchar(50) NOT NULL,
	EmpLastName nvarchar(50) NOT NULL,
	EmpPosition nvarchar(50) NOT NULL,
	EmpEmail nvarchar(50) NOT NULL,
	EmprPhone nvarchar(15) NOT NULL,
	HireDate date NOT NULL,
	DismissalDate date NOT NULL,
	ManagerID int NOT NULL,
	DateOfBirth date NOT NULL,
	DepID int NOT NULL,
	DepName nvarchar(50) NOT NULL
)



