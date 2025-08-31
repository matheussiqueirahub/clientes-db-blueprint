-- SQL Server DDL - Tabela dbo.Clientes
IF OBJECT_ID('dbo.Clientes', 'U') IS NOT NULL
  DROP TABLE dbo.Clientes;

CREATE TABLE dbo.Clientes (
  ID INT IDENTITY(1,1) CONSTRAINT PK_Clientes PRIMARY KEY,
  Nome NVARCHAR(100) NOT NULL,
  Idade INT NULL,
  Cidade NVARCHAR(100) NULL,
  CONSTRAINT CK_Clientes_Idade CHECK (Idade IS NULL OR Idade >= 0)
);

