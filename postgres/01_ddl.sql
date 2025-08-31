-- PostgreSQL DDL - Tabela clientes
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  idade INT,
  cidade VARCHAR(100),
  CONSTRAINT chk_idade CHECK (idade IS NULL OR idade >= 0)
);

