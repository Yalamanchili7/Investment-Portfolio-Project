--Populate these tables 10 rows for dimension tables and 20 rows for transactional tables--
--dimension tables (Investors, Investments, RiskLevels, Users)
--transactional tables (InvestmentTransactions, Portfolio, PerformanceMetrics)
-- Populate Investors Table
INSERT INTO Investors (InvestorID, Name, ContactDetails)
VALUES
    (1, 'John Doe', 'john@example.com'),
    (2, 'Alice Smith', 'alice@example.com'),
    (3, 'Bob Johnson', 'bob@example.com'),
    (4, 'Emma White', 'emma@example.com'),
    (5, 'Michael Brown', 'michael@example.com'),
    (6, 'Olivia Davis', 'olivia@example.com'),
    (7, 'William Taylor', 'william@example.com'),
    (8, 'Sophia Miller', 'sophia@example.com'),
    (9, 'Liam Anderson', 'liam@example.com'),
    (10, 'Ava Martinez', 'ava@example.com');
SELECT * FROM Investors
-- Populate Investments Table
INSERT INTO Investments (InvestmentID, Name, Type, RiskLevel, Description)
VALUES
    (1, 'Tech Stock', 'Stock', 'High', 'Technology sector stock'),
    (2, 'Government Bond', 'Bond', 'Low', 'Government-issued bond'),
    (3, 'Real Estate Fund', 'Fund', 'Medium', 'Diversified real estate portfolio'),
    (4, 'Gold ETF', 'ETF', 'Medium', 'Exchange-traded fund backed by gold assets'),
    (5, 'Blue Chip Stocks', 'Stock', 'Medium', 'Stable and established companies'),
    (6, 'Cryptocurrency', 'Crypto', 'High', 'Digital currency investment'),
    (7, 'Energy Sector Bonds', 'Bond', 'Medium', 'Bonds from energy sector companies'),
    (8, 'Healthcare Stocks', 'Stock', 'Medium', 'Stocks in the healthcare industry'),
    (9, 'International Mutual Fund', 'Mutual Fund', 'Medium', 'Diversified international mutual fund'),
    (10, 'Sustainable ETF', 'ETF', 'Low', 'Environmentally sustainable exchange-traded fund');
SELECT * FROM Investments

-- Populate Portfolio Table with corresponding rows
INSERT INTO Portfolio (PortfolioID, InvestorID, InvestmentID, Quantity)
VALUES
    (1, 1, 3, 15),
    (2, 2, 6, 8),
    (3, 3, 1, 10),
    (4, 4, 2, 12),
    (5, 5, 8, 5),
    (6, 6, 4, 18),
    (7, 7, 10, 25),
    (8, 8, 7, 15),
    (9, 9, 3, 22),
    (10, 10, 9, 10),
    (11, 1, 5, 30),
    (12, 2, 1, 8),
    (13, 3, 6, 15),
    (14, 4, 10, 12),
    (15, 5, 4, 7),
    (16, 6, 8, 20),
    (17, 7, 2, 18),
    (18, 8, 9, 10),
    (19, 9, 5, 15),
    (20, 10, 1, 8);
SELECT * FROM Portfolio


--Populate PerformanceMetrics Table with corresponding rows
INSERT INTO PerformanceMetrics (MetricID, InvestmentID, PortfolioID, MetricType, Value, MetricDate)
VALUES
    (1, 3, 1, 'Return', 5.25, '2023-01-20'),
    (2, 6, 2, 'Return', -2.50, '2023-02-15'),
    (3, 1, 3, 'Return', 8.75, '2023-03-10'),
    (4, 2, 4, 'Return', 3.75, '2023-04-10'),
    (5, 8, 5, 'Return', -4.50, '2023-04-20'),
    (6, 4, 6, 'Return', 8.20, '2023-05-05'),
    (7, 10, 7, 'Return', 10.30, '2023-05-18'),
    (8, 7, 8, 'Return', -5.20, '2023-06-05'),
    (9, 3, 9, 'Return', 6.50, '2023-06-22'),
    (10, 9, 10, 'Return', -2.75, '2023-07-08'),
    (11, 5, 11, 'Return', 15.50, '2023-07-22'),
    (12, 1, 12, 'Return', -3.75, '2023-08-05'),
    (13, 6, 13, 'Return', 12.80, '2023-08-18'),
    (14, 10, 14, 'Return', 5.25, '2023-09-02'),
    (15, 4, 15, 'Return', -2.20, '2023-09-15'),
    (16, 8, 16, 'Return', 7.50, '2023-10-01'),
    (17, 2, 17, 'Return', 9.30, '2023-10-15'),
    (18, 9, 18, 'Return', -8.20, '2023-11-05'),
    (19, 5, 19, 'Return', 4.75, '2023-11-22'),
    (20, 1, 20, 'Return', -6.50, '2023-12-08');
SELECT * FROM PerformanceMetrics

-- Populate RiskLevels Table
INSERT INTO RiskLevels (RiskLevelID, LevelName, Description)
VALUES
    (1, 'Low', 'Low risk'),
    (2, 'Medium', 'Medium risk'),
    (3, 'High', 'High risk');
SELECT * FROM RiskLevels

-- Populate InvestmentTransactions Table with 20 rows 
INSERT INTO InvestmentTransactions (TransactionID, InvestorID, InvestmentID, TransactionType, Quantity, Price, Fees, TransactionDate)
VALUES
    (1, 1, 3, 'Buy', 15, 120.50, 2.50, '2023-01-15'),
    (2, 2, 6, 'Sell', 8, 150.75, 1.25, '2023-02-10'),
    (3, 3, 1, 'Buy', 10, 90.25, 2.00, '2023-03-05'),
    (4, 4, 2, 'Buy', 12, 80.25, 1.75, '2023-04-02'),
    (5, 5, 8, 'Sell', 5, 110.50, 2.00, '2023-04-15'),
    (6, 6, 4, 'Buy', 18, 95.75, 1.50, '2023-05-01'),
    (7, 7, 10, 'Buy', 25, 45.30, 3.20, '2023-05-12'),
    (8, 8, 7, 'Sell', 15, 130.00, 1.80, '2023-06-03'),
    (9, 9, 3, 'Buy', 22, 75.20, 2.50, '2023-06-20'),
    (10, 10, 9, 'Sell', 10, 60.50, 1.25, '2023-07-05'),
    (11, 1, 5, 'Buy', 30, 105.75, 2.00, '2023-07-18'),
    (12, 2, 1, 'Sell', 8, 115.30, 1.50, '2023-08-01'),
    (13, 3, 6, 'Buy', 15, 70.50, 2.20, '2023-08-15'),
    (14, 4, 10, 'Buy', 12, 50.25, 1.75, '2023-09-02'),
    (15, 5, 4, 'Sell', 7, 90.50, 2.00, '2023-09-15'),
    (16, 6, 8, 'Buy', 20, 120.75, 1.50, '2023-10-01'),
    (17, 7, 2, 'Buy', 18, 40.30, 3.20, '2023-10-12'),
    (18, 8, 9, 'Sell', 10, 125.00, 1.80, '2023-11-03'),
    (19, 9, 5, 'Buy', 15, 85.20, 2.50, '2023-11-20'),
    (20, 10, 1, 'Sell', 8, 95.50, 1.25, '2023-12-05');
SELECT * FROM InvestmentTransactions

-- Populate Users Table
INSERT INTO Users (UserID, Username, Password, Role)
VALUES
    (1, 'admin', 'admin123', 'Admin'),
    (2, 'user1', 'userpass', 'User'),
    (3, 'analyst1', 'analystpass', 'Analyst'),
    (4, 'manager1', 'managerpass', 'Manager'),
    (5, 'user2', 'userpass2', 'User'),
    (6, 'analyst2', 'analystpass2', 'Analyst'),
    (7, 'manager2', 'managerpass2', 'Manager'),
    (8, 'user3', 'userpass3', 'User'),
    (9, 'analyst3', 'analystpass3', 'Analyst'),
    (10, 'manager3', 'managerpass3', 'Manager');
SELECT * FROM Users




