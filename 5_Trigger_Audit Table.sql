/* Create an audit table for one of the lookup tables and demonstrate data saved to that audit
table when data in the original table is inserted, modified, or deleted. Include an
additional column in the audit table that will have a datetime field when the data was
changed in the original table. Include the script to test all the operations */
-- create an audit table for the RiskLevels lookup table, here's the script to create the audit table and the 
--trigger to capture changes:
-- Created an audit table for RiskLevels lookup table in previous script while creating tables.
-- Create Audit Table for RiskLevels
USE SUNDE640;
CREATE TABLE RiskLevelsAudit (
    AuditID INT PRIMARY KEY IDENTITY(1,1),
    RiskLevelID INT,
    LevelName NVARCHAR(50),
    Description NVARCHAR(MAX),
	 CreatedAt DATETIME,
    OperationType NVARCHAR(10),  -- Add the missing column
    ChangeDateTime DATETIME
	
);
--SELECT * FROM RiskLevelsAudit
--DROP Table RiskLevelsAudit;


--- Now Implementing the concept of triggers---
/*Triggers in SQL Server can be used to automatically perform actions, such as logging changes or updating data, 
when certain events (e.g., INSERT, UPDATE, DELETE) occur on a table. Below,  
We'll create an audit table called InvestmentTransactionsAudit to track changes in the original table.*/
-- Create Trigger for INSERT
-- Create Trigger for INSERT on RiskLevels
CREATE TRIGGER tr_RiskLevels_Insert
ON RiskLevels
AFTER INSERT
AS
BEGIN
    INSERT INTO RiskLevelsAudit (RiskLevelID, LevelName, Description, CreatedAt, OperationType, ChangeDateTime)
    SELECT
        i.RiskLevelID,
        i.LevelName,
        i.Description,
		i.CreatedAt,
        'INSERT',
        GETDATE()
    FROM inserted i;
END;
GO

-- Create Trigger for UPDATE on RiskLevels
CREATE TRIGGER tr_RiskLevels_Update
ON RiskLevels
AFTER UPDATE
AS
BEGIN
    INSERT INTO RiskLevelsAudit (RiskLevelID, LevelName, Description, CreatedAt, OperationType, ChangeDateTime)
    SELECT
        i.RiskLevelID,
        i.LevelName,
        i.Description,
		i.CreatedAt,
        'UPDATE',
        GETDATE()
    FROM inserted i;
END;
GO

-- Create Trigger for DELETE on RiskLevels
CREATE TRIGGER tr_RiskLevels_Delete
ON RiskLevels
AFTER DELETE
AS
BEGIN
    INSERT INTO RiskLevelsAudit (RiskLevelID, LevelName, Description, CreatedAt, OperationType, ChangeDateTime)
    SELECT
        d.RiskLevelID,
        d.LevelName,
        d.Description,
		d.CreatedAt,
        'DELETE',
        GETDATE()
    FROM deleted d;
END;
GO
------------------------------------------------------------------------------------------

-- Create a trigger to capture changes in the RiskLevels table
-- Drop the existing trigger if it exists
IF OBJECT_ID('tr_RiskLevels_Audit', 'TR') IS NOT NULL
    DROP TRIGGER tr_RiskLevels_Audit;

-- Create a trigger to capture changes in the RiskLevels table
CREATE TRIGGER tr_RiskLevels_Audit
ON RiskLevels
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ChangeType NVARCHAR(10);

    IF EXISTS (SELECT * FROM INSERTED)
    BEGIN
        IF EXISTS (SELECT * FROM DELETED)
            SET @ChangeType = 'Update';
        ELSE
            SET @ChangeType = 'Insert';

        INSERT INTO RiskLevelsAudit (RiskLevelID, LevelName, Description, OperationType, ChangeDateTime)
        SELECT
            I.RiskLevelID,
            I.LevelName,
            I.Description,
            @ChangeType,
            GETDATE()
        FROM INSERTED I;
    END
    ELSE IF EXISTS (SELECT * FROM DELETED)
    BEGIN
        SET @ChangeType = 'Delete';

        INSERT INTO RiskLevelsAudit (RiskLevelID, LevelName, Description, OperationType, ChangeDateTime)
        SELECT
            D.RiskLevelID,
            D.LevelName,
            D.Description,
            @ChangeType,
            GETDATE()
        FROM DELETED D;
    END
END;

/*This script recreates the trigger for the RiskLevels table. After executing these scripts, you should
be able to perform operations on the RiskLevels table and see the changes captured in the RiskLevelsAudit table*/

SELECT * FROM RiskLevelsAudit -- Before Updating the audit table

-- Begin a transaction
BEGIN TRY
    BEGIN TRAN;

    -- Insert a new record into RiskLevels without specifying RiskLevelID
    INSERT INTO RiskLevels (LevelName, Description) VALUES ('Medium', 'Medium Risk');

    -- Force an error to simulate a unique key violation
    INSERT INTO RiskLevels (LevelName, Description) VALUES ('Medium', 'Duplicate Risk'); -- This will cause a unique key violation

    -- Commit the transaction if successful
    COMMIT;
END TRY
BEGIN CATCH
    -- Rollback the transaction if an error occurs
    ROLLBACK;
    PRINT ERROR_MESSAGE();
END CATCH;

-- Check the RiskLevels table
SELECT * FROM RiskLevels;

-- Check the RiskLevelsAudit table
SELECT * FROM RiskLevelsAudit;


-- Similar to the insert query, this update query uses a transaction for atomicity and includes error handling.
BEGIN TRY
    BEGIN TRAN;

    -- Update a record in RiskLevels
    UPDATE RiskLevels SET Description = 'Moderate Risk' WHERE LevelName = 'Medium';

    -- Commit the transaction if successful
    COMMIT;
END TRY
BEGIN CATCH
    -- Rollback the transaction if an error occurs
    ROLLBACK;
    PRINT ERROR_MESSAGE();
END CATCH;
SELECT * FROM RiskLevels 
--Carrying out the operation after every run to see how the data is being modified in tables
SELECT * FROM RiskLevelsAudit

--Delete
BEGIN TRY
    BEGIN TRAN;

    -- Delete a record from RiskLevels
    DELETE FROM RiskLevels WHERE LevelName = 'Medium';

    -- Commit the transaction if successful
    COMMIT;
END TRY
BEGIN CATCH
    -- Rollback the transaction if an error occurs
    ROLLBACK;
    PRINT ERROR_MESSAGE();
END CATCH;
SELECT * FROM RiskLevels 
--Carrying out the operation after every run to see how the data is being modified in tables
SELECT * FROM RiskLevelsAudit