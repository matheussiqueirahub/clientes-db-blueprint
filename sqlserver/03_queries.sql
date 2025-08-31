-- Consultas exemplo (SQL Server)

-- Total de clientes
SELECT COUNT(*) AS total_clientes FROM dbo.Clientes;

-- Clientes com idade >= 30
SELECT Nome, Idade FROM dbo.Clientes
WHERE Idade >= 30
ORDER BY Idade DESC;

-- Clientes por cidade
SELECT * FROM dbo.Clientes WHERE Cidade = N'São Paulo';

-- Atualização de cidade (exemplo)
-- UPDATE dbo.Clientes SET Cidade = N'São Paulo' WHERE Nome = N'Ana Souza';

-- Remoção de clientes com idade < 20 (exemplo)
-- DELETE FROM dbo.Clientes WHERE Idade < 20;

