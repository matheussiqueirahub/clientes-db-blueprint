-- MySQL DDL - Tabela Clientes
DROP TABLE IF EXISTS Clientes;

CREATE TABLE Clientes (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(100) NOT NULL,
  Idade INT,
  Cidade VARCHAR(100),
  CONSTRAINT chk_idade CHECK (Idade IS NULL OR Idade >= 0)
);

