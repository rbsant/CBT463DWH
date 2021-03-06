
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
IF (OBJECT_ID('FK_DimCustomer_DimGeography') IS NOT NULL)
BEGIN
 ALTER TABLE dbo.DimCustomer
	DROP CONSTRAINT FK_DimCustomer_DimGeography
END
GO

IF (OBJECT_ID('FK_FactInternetSales_DimCustomer') IS NOT NULL)
BEGIN
	ALTER TABLE dbo.FactInternetSales 
		DROP CONSTRAINT FK_FactInternetSales_DimCustomer
END
GO

IF (OBJECT_ID('FK_FactSurveyResponse_CustomerKey') IS NOT NULL)
BEGIN
ALTER TABLE dbo.FactSurveyResponse
	DROP CONSTRAINT FK_FactSurveyResponse_CustomerKey
END
GO


--Modify addresses to show SCD functionality
UPDATE Person.Address SET AddressLine1 = '123 Test Lane' WHERE AddressID = 20971
UPDATE Person.Address SET AddressLine1 = '456 Testing Ave.' WHERE AddressID = 12909