# clientes-db-blueprint

Blueprint de esquema “Clientes” multi‑SGBD (MySQL, PostgreSQL, SQL Server, SQLite) com DDL, dados de exemplo e consultas para validação. Focado em clareza, portabilidade e boas práticas de modelagem simples.

## O que contém
- Criação da tabela `Clientes`/`clientes` com `ID` auto‑incrementável e chave primária.
- Scripts organizados por SGBD: DDL (`01_ddl.sql`), seeds (`02_seed.sql`) e consultas (`03_queries.sql`).
- Constraints essenciais (ex.: `CHECK` para validar `Idade >= 0`).
- Consultas de exemplo para checagem rápida.

## Estrutura
```
.
├── mysql/
│   ├── 01_ddl.sql
│   ├── 02_seed.sql
│   └── 03_queries.sql
├── postgres/
│   ├── 01_ddl.sql
│   ├── 02_seed.sql
│   └── 03_queries.sql
├── sqlserver/
│   ├── 01_ddl.sql
│   ├── 02_seed.sql
│   └── 03_queries.sql
├── sqlite/
│   ├── 01_ddl.sql
│   ├── 02_seed.sql
│   └── 03_queries.sql
└── .gitignore
```

## Como executar
Escolha seu SGBD e siga os passos. Os scripts criam apenas a tabela (não criam banco/esquema). Use/Crie um banco antes de executar quando necessário.

### Com Docker Compose (recomendado)
Suba Postgres e MySQL com um comando e execute os scripts dentro dos containers.

1) Opcional: copie o arquivo de exemplo de variáveis e ajuste se quiser
```
cp .env.example .env
```

2) Suba os serviços
```
docker compose up -d
```

3) Aplique os scripts

- PostgreSQL
```
# DDL
docker compose exec postgres sh -lc 'psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /scripts/postgres/01_ddl.sql'
# Seeds
docker compose exec postgres sh -lc 'psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /scripts/postgres/02_seed.sql'
# Consultas exemplo (opcional)
docker compose exec postgres sh -lc 'psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f /scripts/postgres/03_queries.sql'
```

- MySQL
```
# DDL
docker compose exec mysql sh -lc 'mysql -uroot -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE" -e "SOURCE /scripts/mysql/01_ddl.sql"'
# Seeds
docker compose exec mysql sh -lc 'mysql -uroot -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE" -e "SOURCE /scripts/mysql/02_seed.sql"'
# Consultas exemplo (opcional)
docker compose exec mysql sh -lc 'mysql -uroot -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE" -e "SOURCE /scripts/mysql/03_queries.sql"'
```

4) Encerrar e limpar (opcional)
```
docker compose down -v
```

### MySQL/MariaDB
Pré‑requisitos: cliente `mysql` disponível e um usuário com permissão para criar tabelas.

```bash
# 1) Criar (se necessário) o banco de trabalho
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS clientes_db;"

# 2) Criar a tabela
mysql -u root -p clientes_db < mysql/01_ddl.sql

# 3) Popular com dados de exemplo
mysql -u root -p clientes_db < mysql/02_seed.sql

# 4) Rodar consultas de validação (opcional)
mysql -u root -p clientes_db < mysql/03_queries.sql
```

### PostgreSQL
Pré‑requisitos: `psql` e um usuário com permissão no banco.

```bash
# 1) Criar o banco (se necessário)
createdb -U postgres clientes_db
# Alternativa:
# psql -U postgres -c "CREATE DATABASE clientes_db;"

# 2) Criar a tabela
psql -U postgres -d clientes_db -f postgres/01_ddl.sql

# 3) Popular com dados de exemplo
psql -U postgres -d clientes_db -f postgres/02_seed.sql

# 4) Rodar consultas de validação (opcional)
psql -U postgres -d clientes_db -f postgres/03_queries.sql
```

### SQL Server
Pré‑requisitos: `sqlcmd` e acesso a uma instância (local ou remota).

```bash
# 1) Criar o banco (se necessário)
sqlcmd -S localhost -U sa -P <SUA_SENHA> -Q "IF DB_ID('clientes_db') IS NULL CREATE DATABASE clientes_db;"

# 2) Criar a tabela
sqlcmd -S localhost -U sa -P <SUA_SENHA> -d clientes_db -i sqlserver/01_ddl.sql

# 3) Popular com dados de exemplo
sqlcmd -S localhost -U sa -P <SUA_SENHA> -d clientes_db -i sqlserver/02_seed.sql

# 4) Rodar consultas de validação (opcional)
sqlcmd -S localhost -U sa -P <SUA_SENHA> -d clientes_db -i sqlserver/03_queries.sql
```

### SQLite
Pré‑requisitos: `sqlite3` instalado.

```bash
# 1) Criar/abrir o arquivo de banco e criar a tabela
sqlite3 clientes.db ".read sqlite/01_ddl.sql"

# 2) Popular com dados de exemplo
sqlite3 clientes.db ".read sqlite/02_seed.sql"

# 3) Rodar consultas de validação (opcional)
sqlite3 clientes.db ".read sqlite/03_queries.sql"
```

## Notas de modelagem
- Auto‑incremento por SGBD:
  - MySQL/MariaDB: `ID INT AUTO_INCREMENT PRIMARY KEY`.
  - PostgreSQL: `ID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY` (ou `SERIAL`).
  - SQL Server: `ID INT IDENTITY(1,1) PRIMARY KEY`.
  - SQLite: `ID INTEGER PRIMARY KEY AUTOINCREMENT`.
- `CHECK (Idade IS NULL OR Idade >= 0)`: ajuda a manter consistência; em MySQL é plenamente suportado a partir da versão 8.0.16.
- SQLite: na maior parte dos casos `INTEGER PRIMARY KEY` já auto‑incrementa de forma suficiente; `AUTOINCREMENT` é incluído aqui por clareza (usa `sqlite_sequence`).

## Próximos passos (ideias)
- Adicionar Adminer/pgAdmin para visualização rápida.
- Incluir exemplos de índices e consultas parametrizadas.
- Testes simples com scripts de verificação automática.

Contribuições são bem‑vindas via issues e PRs.
