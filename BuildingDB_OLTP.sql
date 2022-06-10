USE OnlineStore

DROP TABLE Employees

CREATE TABLE Products(
	ProdID int PRIMARY KEY NOT NULL,
	ProdName nvarchar(50) NOT NULL,
	ProdCategory int NOT NULL, 
	Supplier int NOT NULL, 
	Warehouse int NOT NULL, 
	QttinStock int NOT NULL,
	CostUnit NUMERIC(19, 2) NOT NULL,
	PriceUnit NUMERIC(19, 2) NOT NULL,
	WarrantyID int NOT NULL,
	CONSTRAINT FK_Products_To_ProductCategories FOREIGN KEY (ProdCategory) REFERENCES ProductCategories (CategoryID),
	CONSTRAINT FK_Products_To_Suppliers FOREIGN KEY (Supplier) REFERENCES Suppliers (SupplierID),
	CONSTRAINT FK_Products_To_Warehouse FOREIGN KEY (Warehouse) REFERENCES Warehouses (WarehouseID),
	CONSTRAINT FK_Products_To_ProductWarranties FOREIGN KEY (WarrantyID) REFERENCES ProductWarranties (WarrantyID)
)	

SELECT * FROM OrderDetails

CREATE TABLE ProductCategories(
	CategoryID int PRIMARY KEY NOT NULL,
	CategoryName nvarchar(50) NOT NULL
)	

CREATE TABLE Suppliers(
	SupplierID int PRIMARY KEY NOT NULL,
	SupplierName nvarchar(50) NOT NULL,
	SupplierProne nvarchar(50) NOT NULL,
	SupplierEmail nvarchar(50) NOT NULL
)	

CREATE TABLE Warehouses(
	WarehouseID int PRIMARY KEY NOT NULL,
	WarehouseName nvarchar(50) NOT NULL,
	WarehouseLocation nvarchar(50) NOT NULL,
	WarehouseManager int NOT NULL
)

ALTER TABLE Warehouses
ALTER COLUMN WarehouseManager int

ALTER TABLE Warehouses
ADD CONSTRAINT FK_Warehouses_To_Employees FOREIGN KEY (WarehouseManager) REFERENCES Employees (EmpID)

CREATE TABLE ProductWarranties(
	WarrantyID int PRIMARY KEY NOT NULL,
	WarrantyPeriod nvarchar(50) NOT NULL
)	



CREATE TABLE OrderDetails(
	OrderDetailsID int NOT NULL, 
	OrderID int NOT NULL, 
	ProdID int NOT NULL, 
	Quantity int NOT NULL,
	DiscountID int NOT NULL,
	VAT NUMERIC(19, 2) NOT NULL,
	TotalPrice NUMERIC(19, 2) NOT NULL
	PRIMARY KEY(OrderDetailsID, OrderID),
	CONSTRAINT FK_OrderDetails_To_Products FOREIGN KEY (ProdID) REFERENCES Products (ProdID),
	CONSTRAINT FK_OrderDetails_To_Discounts FOREIGN KEY (DiscountID) REFERENCES Discounts (DiscountID),
	CONSTRAINT FK_OrderDetails_To_Orders FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
)	

CREATE TABLE Discounts(
	DiscountID int PRIMARY KEY NOT NULL,
	DiscountValue nvarchar(50) NOT NULL
)	


CREATE TABLE Orders(
	OrderID int PRIMARY KEY NOT NULL, 
	OrderDate date NOT NULL, 
	AssignedTo int NOT NULL, 
	CustomerID int NOT NULL,
	ShippingAddress nvarchar(50) NOT NULL,
	ShippingID int NOT NULL,
	PaymentID int NOT NULL,
	ShippingDate date NOT NULL,
	WarrantyStartDate date NOT NULL,
	WarrantyExpDate date NOT NULL
	CONSTRAINT FK_Orders_To_ShippingMethods FOREIGN KEY (ShippingID) REFERENCES ShippingMethods (ShippingID),
	CONSTRAINT FK_Orders_To_PaymentMethods FOREIGN KEY (PaymentID) REFERENCES PaymentMethods (PaymentID),
	CONSTRAINT FK_Orders_To_Customers FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
	CONSTRAINT FK_Orders_To_Employees FOREIGN KEY (AssignedTo) REFERENCES Employees (EmpID)
)	

CREATE TABLE ShippingMethods(
	ShippingID int PRIMARY KEY NOT NULL, 
	ShippingMethod nvarchar(50) NOT NULL,
	ShippingPrice int NOT NULL,
	ShippingDuration int NOT NULL
)	

CREATE TABLE PaymentMethods(
	PaymentID int PRIMARY KEY NOT NULL, 
	PaymentMethod nvarchar(50) NOT NULL,
)	

CREATE TABLE Customers(
	CustomerID int PRIMARY KEY NOT NULL, 
	CustomerFirstName nvarchar(50) NOT NULL,
	CustomerLastName nvarchar(50) NOT NULL,
	CustomerEmail nvarchar(50) NOT NULL,
	CustomerPhone nvarchar(15) NOT NULL,
	ZipCode nvarchar(50) NOT NULL,
	CusomerAddress nvarchar(50) NOT NULL,
)	



CREATE TABLE Employees(
	EmpID int PRIMARY KEY NOT NULL, 
	EmpFirstName nvarchar(50) NOT NULL,
	EmpLastName nvarchar(50) NOT NULL,
	DepID int NOT NULL, 
	EmpPosition nvarchar(50) NOT NULL,
	EmpEmail nvarchar(50) NOT NULL,
	EmprPhone nvarchar(15) NOT NULL,
	HireDate date NOT NULL,
	DismissalDate date NOT NULL,
	ManagerID int NOT NULL,
	DateOfBirth date NOT NULL
	CONSTRAINT FK_Employees_To_Departaments FOREIGN KEY (DepID) REFERENCES Departaments (DepID)
)	

CREATE TABLE Departaments(
	DepID int PRIMARY KEY NOT NULL, 
	DepName nvarchar(50) NOT NULL
)