IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'temp_ProductCategoryNames') AND type in (N'U'))
	DROP TABLE temp_ProductCategoryNames
GO

CREATE TABLE temp_ProductCategoryNames
(
    EnglishProductCategoryName nvarchar(50) NOT NULL, 
    SpanishProductCategoryName nvarchar(50) NULL,
    FrenchProductCategoryName nvarchar(50) NULL
)
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'temp_ProductSubcategoryNames') AND type in (N'U'))
	DROP TABLE temp_ProductSubcategoryNames
GO

CREATE TABLE temp_ProductSubcategoryNames
(
    EnglishProductSubcategoryName nvarchar(50) NOT NULL, 
    SpanishProductSubcategoryName nvarchar(50) NULL, 
    FrenchProductSubcategoryName nvarchar(50) NULL 
)
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'temp_ProductNames') AND type in (N'U'))
	DROP TABLE temp_ProductNames
GO

CREATE TABLE temp_ProductNames
(
    EnglishProductName nvarchar(50) NOT NULL, 
    SpanishProductName nvarchar(50) NULL, 
    FrenchProductName nvarchar(50) NULL 
)
GO