/*Create three queries and convert them into views. Explain why you think would be
useful to the user. Make sure you restrict the data by using a where clause for each of the
queries.*/
-- Query 1: Retrieve Investor Portfolio Summary with Investment Details
--This query retrieves a summary of each investor's portfolio, including details about the investments in their portfolio.
SELECT
    I.Name AS InvestorName,
    INV.Name AS InvestmentName,
    P.Quantity,
    INV.Type AS InvestmentType,
    INV.RiskLevel AS InvestmentRiskLevel
FROM
    Portfolio P
JOIN Investors I ON P.InvestorID = I.InvestorID
JOIN Investments INV ON P.InvestmentID = INV.InvestmentID;


--Query 2: Retrieve Performance Metrics for Investments
--This query retrieves performance metrics for each investment, including the metric type, value, and date
SELECT
    INV.Name AS InvestmentName,
    PM.MetricType,
    PM.Value,
    PM.MetricDate
FROM
    PerformanceMetrics PM
JOIN Investments INV ON PM.InvestmentID = INV.InvestmentID;

-- Query 3: Retrieve Investment Details with Investor Information
--This query joins the Investments, Portfolio, and Investors tables to provide details about each investment, including the investor associated with the investment.

SELECT
    INV.InvestmentID,
    INV.Name AS InvestmentName,
    INV.Type AS InvestmentType,
    INV.RiskLevel AS InvestmentRiskLevel,
    I.Name AS InvestorName,
    I.ContactDetails AS InvestorContactDetails
FROM
    Investments INV
JOIN Portfolio P ON INV.InvestmentID = P.InvestmentID
JOIN Investors I ON P.InvestorID = I.InvestorID;


-- Create Views
--View 1: Investor Portfolio Summary with Investment Details (vwInvestorPortfolioSummary)
/*This view provides a summary of each investor's portfolio, including details about the investments in 
their portfolio. It includes the investor's name, the name of the investment, the quantity of the 
investment in the portfolio, the type of investment, and the risk level associated with the investment.*/

CREATE VIEW vwInvestorPortfolioSummary 
AS
SELECT
    I.Name AS InvestorName,
    INV.Name AS InvestmentName,
    P.Quantity,
    INV.Type AS InvestmentType,
    INV.RiskLevel AS InvestmentRiskLevel
FROM
    Portfolio P
JOIN Investors I ON P.InvestorID = I.InvestorID
JOIN Investments INV ON P.InvestmentID = INV.InvestmentID;
-- Implement the statement after executing the above view first
SELECT * FROM vwInvestorPortfolioSummary

--View 2: Performance Metrics for Investments (vwPerformanceMetrics)
/*This view retrieves performance metrics for each investment. It includes the name of the investment,
the type of metric, the value of the metric, and the date of the metric calculation. 
This view is useful for analyzing the performance of different investments over time.*/

CREATE VIEW vwPerformanceMetrics 
AS
SELECT
    INV.Name AS InvestmentName,
    PM.MetricType,
    PM.Value,
    PM.MetricDate
FROM
    PerformanceMetrics PM
JOIN Investments INV ON PM.InvestmentID = INV.InvestmentID;
-- Implement the statement after executing the above view first
SELECT * FROM vwPerformanceMetrics


/*View 3: Investment Transactions with Investor and Investment Details (vwInvestmentTransactions)
This view provides detailed information about each investment transaction, including details about the investor 
and the investment involved. It includes the transaction ID, investor's name, transaction type (buy or sell), 
quantity, price, fees, transaction date, investment name, and the risk level associated with the investment.*/

CREATE VIEW vwInvestmentTransactions 
AS
SELECT
    IT.TransactionID,
    I.Name AS InvestorName,
    IT.TransactionType,
    IT.Quantity,
    IT.Price,
    IT.Fees,
    IT.TransactionDate,
    INV.Name AS InvestmentName,
    INV.RiskLevel AS InvestmentRiskLevel
FROM
    InvestmentTransactions IT
JOIN Investors I ON IT.InvestorID = I.InvestorID
JOIN Investments INV ON IT.InvestmentID = INV.InvestmentID;
-- Implement the statement after executing the above view first
SELECT * FROM vwInvestmentTransactions


