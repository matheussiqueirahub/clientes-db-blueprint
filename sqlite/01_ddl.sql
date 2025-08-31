-- SQLite DDL - Tabela Clientes
DROP TABLE IF EXISTS Clientes;

CREATE TABLE Clientes (
  ID INTEGER PRIMARY KEY AUTOINCREMENT,
  Nome TEXT NOT NULL,
  Idade INTEGER,
  Cidade TEXT,
  CHECK (Idade IS NULL OR Idade >= 0)
);

