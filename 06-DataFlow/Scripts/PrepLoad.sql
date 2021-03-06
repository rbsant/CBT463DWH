
--AW prep for foreign data
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'temp_CustomerForeignData') AND type in (N'U'))
	DROP TABLE temp_CustomerForeignData 
GO

CREATE TABLE temp_CustomerForeignData 
(
	[Education] [nvarchar] (40) NULL, 
	[EnglishEducation] [nvarchar] (40) NULL, 
	[SpanishEducation] [nvarchar] (40) NULL, 
	[FrenchEducation] [nvarchar] (40) NULL, 
	[Occupation] [nvarchar] (100) NULL, 
	[EnglishOccupation] [nvarchar] (100) NULL, 
	[SpanishOccupation] [nvarchar] (100) NULL, 
	[FrenchOccupation] [nvarchar] (100) NULL 
)
GO


--AWDW prep for schema changes (add historical columns for SCD if they do not exist)
IF COL_LENGTH('DimCustomer','HistoryStartDate') IS NULL
 BEGIN
  ALTER TABLE DimCustomer
	ADD HistoryStartDate datetime null,
		HistoryEndDate datetime null
 END

 
 --AWDW prep for constraints (disable)
IF (OBJECT_ID('dbo.FK_DimCustomer_DimGeography') IS NOT NULL)
BEGIN
 ALTER TABLE DimCustomer
	DROP CONSTRAINT FK_DimCustomer_DimGeography
END
GO