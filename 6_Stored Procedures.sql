-- Create stored procedure for inserting a new record into RiskLevels
CREATE PROCEDURE InsertRiskLevel
    @LevelName NVARCHAR(50),
    @Description NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO RiskLevels (LevelName, Description)
    VALUES (@LevelName, @Description);
END;

-- Create stored procedure for updating the description of a RiskLevel
CREATE PROCEDURE UpdateRiskLevelDescription
    @LevelName NVARCHAR(50),
    @NewDescription NVARCHAR(MAX)
AS
BEGIN
    UPDATE RiskLevels
    SET Description = @NewDescription
    WHERE LevelName = @LevelName;
END;

-- Execute InsertRiskLevel stored procedure
EXEC InsertRiskLevel
    @LevelName = 'High',
    @Description = 'High Risk';

-- Execute UpdateRiskLevelDescription stored procedure
EXEC UpdateRiskLevelDescription
    @LevelName = 'High',
    @NewDescription = 'Very High Risk';

-- Drop stored procedure InsertRiskLevel if it exists
IF OBJECT_ID('InsertRiskLevel', 'P') IS NOT NULL
    DROP PROCEDURE InsertRiskLevel;

-- Drop stored procedure UpdateRiskLevelDescription if it exists
IF OBJECT_ID('UpdateRiskLevelDescription', 'P') IS NOT NULL
    DROP PROCEDURE UpdateRiskLevelDescription;
