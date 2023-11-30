Investment Portfolio Management System
Overview
The Investment Portfolio Management System is a comprehensive database management system designed to assist users, particularly investors, in effectively managing their investment portfolios. The system offers features for tracking investments, analyzing performance metrics, and generating valuable reports to support decision-making.

Project Details
Name: Investment Portfolio Management System
Author: Sundeep Yalamanchili
ID: 1225760640
Course: IFT 530 Advanced Database Management Systems
Database Structure
Tables
Investors

Contains information about investors, including their unique ID, name, and contact details.
Investments

Stores details about various investments, such as investment type, risk level, and description.
Portfolio

Manages the relationship between investors and their investments, including the quantity of each investment.
PerformanceMetrics

Captures performance metrics for each investment in a portfolio, such as return on investment.
RiskLevels

Defines different risk levels associated with investments.
InvestmentTransactions

Records transactions related to buying or selling investments.
Users

Manages user information, including usernames, passwords, and roles.
AuditTrail

Logs changes made to the database, including insert, update, and delete operations, for auditing purposes.
Queries
Investor Portfolio Summary Query

Retrieves a summary of each investor's portfolio, including details about the investments they hold.
Performance Metrics Query

Retrieves performance metrics for each investment, providing insights into investment performance.
Investment Details with Investor Information Query

Joins the Investments, Portfolio, and Investors tables to provide details about each investment, including the associated investor.
Views
vwInvestorPortfolioSummary

Provides a summary of each investor's portfolio, including details about the investments.
vwPerformanceMetrics

Retrieves performance metrics for each investment, aiding in analyzing investment performance over time.
vwInvestmentTransactions

Offers detailed information about each investment transaction, including investor and investment details.
Triggers
Triggers are implemented to capture changes in specific tables and log them in corresponding audit tables for auditing purposes.
Stored Procedures
InsertRiskLevel

Inserts a new record into the RiskLevels table.
UpdateRiskLevelDescription

Updates the description of a specific risk level in the RiskLevels table.
Cursors
Cursors are used to iterate through result sets, providing a mechanism for handling and processing individual rows of data.