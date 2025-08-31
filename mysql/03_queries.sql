-- Consultas exemplo (MySQL)

-- Total de clientes
SELECT COUNT(*) AS total_clientes FROM Clientes;

-- Clientes com idade >= 30
SELECT Nome, Idade FROM Clientes
WHERE Idade >= 30
ORDER BY Idade DESC;

-- Clientes por cidade
SELECT * FROM Clientes WHERE Cidade = 'São Paulo';

-- Atualização de cidade (exemplo)
-- UPDATE Clientes SET Cidade = 'São Paulo' WHERE Nome = 'Ana Souza';

-- Remoção de clientes com idade < 20 (exemplo)
-- DELETE FROM Clientes WHERE Idade < 20;

