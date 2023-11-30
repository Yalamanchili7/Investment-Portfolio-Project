/*Demonstrate the use of two cursors for your database. Create and drop script for two
cursors.*/
-- Declare variables for InvestorsCursor
/* InvestorsCursor:

Purpose: Used to traverse and process rows from the Investors table.
Variables: @InvestorID, @Name, @ContactDetails.
Actions: Each row's information was printed using the PRINT statement.
*/
USE SUNDE640; 
DECLARE @InvestorID INT, @Name NVARCHAR(100), @ContactDetails NVARCHAR(255);
-- Create Cursor for Investors table
DECLARE InvestorsCursor CURSOR FOR
SELECT InvestorID, Name, ContactDetails
FROM Investors;
-- Open the cursor
OPEN InvestorsCursor;
-- Fetch the first row
FETCH NEXT FROM InvestorsCursor INTO @InvestorID, @Name, @ContactDetails;
-- Loop through the cursor
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Process the current row (replace this with your logic)
    PRINT 'InvestorID: ' + CONVERT(NVARCHAR(10), @InvestorID) +
          ', Name: ' + @Name +
          ', ContactDetails: ' + @ContactDetails;

    -- Fetch the next row
    FETCH NEXT FROM InvestorsCursor INTO @InvestorID, @Name, @ContactDetails;
END;
-- Close and deallocate the cursor
CLOSE InvestorsCursor;
DEALLOCATE InvestorsCursor;

/*InvestmentsCursor:

Purpose: Used to traverse and process rows from the Investments table.
Variables: @InvestmentID, @Name, @Type, @RiskLevel, @Description.
Actions: Each row's information was printed using the PRINT statement.*/

-- Declare variables for InvestmentsCursor
DECLARE @InvestmentID INT, @Name NVARCHAR(100), @Type NVARCHAR(50), @RiskLevel NVARCHAR(50), @Description NVARCHAR(MAX);

-- Create Cursor for Investments table
DECLARE InvestmentsCursor CURSOR FOR
SELECT InvestmentID, Name, Type, RiskLevel, Description
FROM Investments;

-- Open the cursor
OPEN InvestmentsCursor;

-- Fetch the rows and process each one
FETCH NEXT FROM InvestmentsCursor INTO @InvestmentID, @Name, @Type, @RiskLevel, @Description;
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Process the current row (replace this with your logic)
    PRINT 'InvestmentID: ' + CONVERT(NVARCHAR(10), @InvestmentID) +
          ', Name: ' + @Name +
          ', Type: ' + @Type +
          ', RiskLevel: ' + @RiskLevel +
          ', Description: ' + @Description;

    -- Fetch the next row
    FETCH NEXT FROM InvestmentsCursor INTO @InvestmentID, @Name, @Type, @RiskLevel, @Description;
END;

-- Close and deallocate the cursor
CLOSE InvestmentsCursor;
DEALLOCATE InvestmentsCursor;


-- Declare variables for InvestmentsCursor
DECLARE @InvestmentID INT, @Name NVARCHAR(100), @Type NVARCHAR(50), @RiskLevel NVARCHAR(50), @Description NVARCHAR(MAX);

/*Use of Temporary Table:
To mitigate potential issues, a temporary table (#InvestmentsTemp) was created to store cursor data.
The cursor operated on this temporary table, fetching rows and processing them.*/

-- Create a temporary table to store cursor data
CREATE TABLE #InvestmentsTemp (
    InvestmentID INT,
    Name NVARCHAR(100),
    Type NVARCHAR(50),
    RiskLevel NVARCHAR(50),
    Description NVARCHAR(MAX)
);

-- Insert data from Investments table into the temporary table
INSERT INTO #InvestmentsTemp (InvestmentID, Name, Type, RiskLevel, Description)
SELECT InvestmentID, Name, Type, RiskLevel, Description
FROM Investments;

-- Open the cursor on the temporary table
DECLARE InvestmentsCursor CURSOR FOR
SELECT InvestmentID, Name, Type, RiskLevel, Description
FROM #InvestmentsTemp;

-- Open the cursor
OPEN InvestmentsCursor;

-- Fetch the rows and process each one
FETCH NEXT FROM InvestmentsCursor INTO @InvestmentID, @Name, @Type, @RiskLevel, @Description;
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Process the current row (replace this with your logic)
    PRINT 'InvestmentID: ' + CONVERT(NVARCHAR(10), @InvestmentID) +
          ', Name: ' + @Name +
          ', Type: ' + @Type +
          ', RiskLevel: ' + @RiskLevel +
          ', Description: ' + @Description;

    -- Fetch the next row
    FETCH NEXT FROM InvestmentsCursor INTO @InvestmentID, @Name, @Type, @RiskLevel, @Description;
END;

-- Close and deallocate the cursor
CLOSE InvestmentsCursor;
DEALLOCATE InvestmentsCursor;

-- Drop the temporary table
DROP TABLE #InvestmentsTemp;

---- Dropping the tables from the Database---

DECLARE @tableName NVARCHAR(255)

-- Disable foreign key constraints
EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'

DECLARE tableCursor CURSOR FOR
SELECT table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'

OPEN tableCursor

FETCH NEXT FROM tableCursor INTO @tableName

WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE @sql NVARCHAR(MAX)
    SET @sql = 'DROP TABLE ' + @tableName
    EXEC sp_executesql @sql

    FETCH NEXT FROM tableCursor INTO @tableName
END

CLOSE tableCursor
DEALLOCATE tableCursor

-- Enable foreign key constraints
EXEC sp_MSforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL'




USE master;
ALTER DATABASE SUNDE640 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
USE master;
DROP DATABASE SUNDE640;

