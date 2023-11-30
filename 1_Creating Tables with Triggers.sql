/* Project: Investment Portfolio Management System
   Name: Sundeep Yalamanchili
   ID:   1225760640
   Course:IFT 530 Advanced Database Management Systems
   Summary: The project aims to develop an Investment Portfolio Management System to empower users, 
   typically investors, in efficiently managing their investment portfolios. 
   The system will facilitate tracking investments, analyzing performance, and generating insightful 
   reports to aid in decision-making.
*/

CREATE DATABASE SUNDE640 -- Created Database using 5 letters of First name and last 3 digits of ID number
-- Use the SUNDEP640 database
USE SUNDE640;

-- Creating Tables with respective fields
-- Investors Table
CREATE TABLE Investors (
    InvestorID INT PRIMARY KEY,
    Name NVARCHAR(255),
    ContactDetails NVARCHAR(255)
);
SELECT * FROM Investors

-- Investments Table
CREATE TABLE Investments (
    InvestmentID INT PRIMARY KEY,
    Name NVARCHAR(255),
    Type NVARCHAR(50),
    RiskLevel NVARCHAR(50),
    Description NVARCHAR(MAX)
);
SELECT * FROM Investments


-- Portfolio Table
CREATE TABLE Portfolio (
    PortfolioID INT PRIMARY KEY,
    InvestorID INT FOREIGN KEY REFERENCES Investors(InvestorID),
    InvestmentID INT FOREIGN KEY REFERENCES Investments(InvestmentID),
    Quantity INT
);
SELECT * FROM Portfolio

-- PerformanceMetrics Table
CREATE TABLE PerformanceMetrics (
    MetricID INT PRIMARY KEY,
    InvestmentID INT FOREIGN KEY REFERENCES Investments(InvestmentID),
    PortfolioID INT FOREIGN KEY REFERENCES Portfolio(PortfolioID),
    MetricType NVARCHAR(50),
    Value DECIMAL(18, 2),
    MetricDate DATETIME
);
SELECT * FROM PerformanceMetrics

-- RiskLevels Table
CREATE TABLE RiskLevels (
    RiskLevelID INT IDENTITY(1,1) PRIMARY KEY,
    LevelName NVARCHAR(50),
    Description NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE()
);

SELECT * FROM RiskLevels


-- InvestmentTransactions Table
CREATE TABLE InvestmentTransactions (
    TransactionID INT PRIMARY KEY,
    InvestorID INT FOREIGN KEY REFERENCES Investors(InvestorID),
    InvestmentID INT FOREIGN KEY REFERENCES Investments(InvestmentID),
    TransactionType NVARCHAR(10),
    Quantity INT,
    Price DECIMAL(18, 2),
    Fees DECIMAL(18, 2),
    TransactionDate DATETIME
);
SELECT * FROM InvestmentTransactions

-- Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username NVARCHAR(50),
    Password NVARCHAR(255),
    Role NVARCHAR(50),
    InvestorID INT FOREIGN KEY REFERENCES Investors(InvestorID),
    InvestmentID INT FOREIGN KEY REFERENCES Investments(InvestmentID),
    TransactionID INT FOREIGN KEY REFERENCES InvestmentTransactions(TransactionID),
    PortfolioID INT FOREIGN KEY REFERENCES Portfolio(PortfolioID),
    RiskLevelID INT FOREIGN KEY REFERENCES RiskLevels(RiskLevelID),
    MetricID INT FOREIGN KEY REFERENCES PerformanceMetrics(MetricID)
);
SELECT * FROM Users
/*AuditTrail Table This structure provides a high-level overview of changes made to data in the audited tables. 
When an operation occurs (Insert, Update, Delete) on the audited table, a corresponding record is added to the AuditTrail table, 
capturing relevant details about the change.*/
-- AuditTrail Table
-- AuditTrail Table
CREATE TABLE AuditTrail (
    AuditID INT PRIMARY KEY,
    TableName NVARCHAR(50),
    OperationType NVARCHAR(10),
    OldValue NVARCHAR(MAX),
    NewValue NVARCHAR(MAX),
    ChangeDateTime DATETIME,
    InvestorID INT FOREIGN KEY REFERENCES Investors(InvestorID),
    InvestmentID INT FOREIGN KEY REFERENCES Investments(InvestmentID),
    PortfolioID INT FOREIGN KEY REFERENCES Portfolio(PortfolioID),
    RiskLevelID INT FOREIGN KEY REFERENCES RiskLevels(RiskLevelID),
    MetricID INT FOREIGN KEY REFERENCES PerformanceMetrics(MetricID),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    TransactionID INT FOREIGN KEY REFERENCES InvestmentTransactions(TransactionID)
);
SELECT * FROM AuditTrail


-- Show all tables in the current database
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';


