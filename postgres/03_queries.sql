-- Consultas exemplo (PostgreSQL)

-- Total de clientes
SELECT COUNT(*) AS total_clientes FROM clientes;

-- Clientes com idade >= 30
SELECT nome, idade FROM clientes
WHERE idade >= 30
ORDER BY idade DESC;

-- Clientes por cidade
SELECT * FROM clientes WHERE cidade = 'São Paulo';

-- Atualização de cidade (exemplo)
-- UPDATE clientes SET cidade = 'São Paulo' WHERE nome = 'Ana Souza';

-- Remoção de clientes com idade < 20 (exemplo)
-- DELETE FROM clientes WHERE idade < 20;

