CREATE DATABASE SalesManagementDB;
USE SalesManagementDB;

-- ============================
-- TABLE: Categories
-- ============================
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE,
    Description VARCHAR(255)
);

-- ============================
-- TABLE: Suppliers
-- ============================
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    ContactPerson VARCHAR(100),
    Phone VARCHAR(15) UNIQUE,
    Email VARCHAR(100) UNIQUE,
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50)
);

-- ============================
-- TABLE: Customers
-- ============================
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Gender ENUM('Male','Female','Other'),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15) UNIQUE,
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    CustomerType ENUM('Regular','Premium') DEFAULT 'Regular',
    RegistrationDate DATE NOT NULL
);

-- ============================
-- TABLE: Departments
-- ============================
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

-- ============================
-- TABLE: SubCategories
-- ============================
CREATE TABLE SubCategories (
    SubCategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryID INT NOT NULL,
    SubCategoryName VARCHAR(100) NOT NULL,

    CONSTRAINT FK_SubCategory_Category
        FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ============================
-- TABLE: Products
-- ============================
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(150) NOT NULL,
    CategoryID INT NOT NULL,
    SubCategoryID INT NOT NULL,
    SupplierID INT NOT NULL,
    Brand VARCHAR(100),
    CostPrice DECIMAL(10,2) NOT NULL CHECK (CostPrice >= 0),
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice > 0),
    UnitInStock INT DEFAULT 0 CHECK (UnitInStock >= 0),
    ReorderLevel INT DEFAULT 20,
    Status ENUM('Active','Inactive') DEFAULT 'Active',

    CONSTRAINT FK_Product_Category
        FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT FK_Product_SubCategory
        FOREIGN KEY (SubCategoryID)
        REFERENCES SubCategories(SubCategoryID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT FK_Product_Supplier
        FOREIGN KEY (SupplierID)
        REFERENCES Suppliers(SupplierID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
