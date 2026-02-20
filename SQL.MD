# 📥 Importação do Banco de Dados de Aulas (Arquivo SQL)

Este arquivo `.sql` contém a estrutura e os dados do banco de dados utilizados nas aulas.

Ele permite que qualquer aluno recrie rapidamente o ambiente completo, com tabelas e dados já populados.

Arquivo:

```bash
aula.sql
```

---

# 📦 O que este arquivo contém

Este arquivo é um **dump do MySQL**, ou seja, um backup completo contendo:

* criação da tabela
* estrutura das colunas
* configuração da tabela
* dados inseridos

---

# 🔎 Explicação detalhada do arquivo SQL

---

## 1. Cabeçalho do dump

```sql
-- MySQL dump 10.13
-- Host: 127.0.0.1    Database: aula
-- Server version 8.0.44
```

Indica que:

* foi gerado a partir do MySQL 8.0
* banco: `aula`
* é compatível com MySQL 8+

---

## 2. Configurações temporárias

Exemplo:

```sql
SET FOREIGN_KEY_CHECKS=0;
SET UNIQUE_CHECKS=0;
```

Objetivo:

* evitar erros durante importação
* acelerar o processo

Depois tudo é restaurado ao normal.

---

## 3. Remoção da tabela antiga (se existir)

```sql
DROP TABLE IF EXISTS fornecedores;
```

Significa:

Se a tabela já existir, ela será apagada antes de recriar.

Isso evita erro:

```
Table already exists
```

---

## 4. Criação da tabela fornecedores

```sql
CREATE TABLE fornecedores (
  id int NOT NULL AUTO_INCREMENT,
  nome_social varchar(150) NOT NULL,
  cnpj varchar(18) NOT NULL,
  telefone varchar(20) DEFAULT NULL,
  PRIMARY KEY (id)
);
```

Explicação campo por campo:

| Campo       | Tipo               | Descrição           |
| ----------- | ------------------ | ------------------- |
| id          | int AUTO_INCREMENT | identificador único |
| nome_social | varchar(150)       | nome da empresa     |
| cnpj        | varchar(18)        | CNPJ da empresa     |
| telefone    | varchar(20)        | telefone            |

AUTO_INCREMENT significa que o MySQL gera automaticamente:

```
1, 2, 3, 4...
```

---

## 5. Inserção de dados

```sql
INSERT INTO fornecedores VALUES 
(1,'MINHA EMPRESA','67898000190','14-990908877'),
(2,'PETROBRAS','67890989870','14-998808877');
```

Isso adiciona 2 registros:

| id | nome_social   | cnpj        | telefone     |
| -- | ------------- | ----------- | ------------ |
| 1  | MINHA EMPRESA | 67898000190 | 14-990908877 |
| 2  | PETROBRAS     | 67890989870 | 14-998808877 |

---

# 🎯 Resultado após importação

Você terá:

Banco:

```
aula
```

Tabela:

```
fornecedores
```

Com dados já inseridos.

---

# 🚀 Método 1 — Importar usando MySQL Workbench (RECOMENDADO PARA ALUNOS)

## Passo 1

Abra o MySQL Workbench

---

## Passo 2

Conecte ao servidor

Host:

```
localhost
```

Usuário:

```
ferdinando
```

Senha:

```
admin123
```

Banco:

```
aula
```

---

## Passo 3

Clique em:

```
Server → Data Import
```

---

## Passo 4

Selecione:

```
Import from Self-Contained File
```

Escolha o arquivo:

```
aula.sql
```

---

## Passo 5

Em:

```
Default Target Schema
```

Selecione:

```
aula
```

---

## Passo 6

Clique:

```
Start Import
```

---

## Passo 7

Pronto.

Teste:

```sql
SELECT * FROM fornecedores;
```

---

# 🚀 Método 2 — Importar via terminal (Shell)

Este método é mais rápido e recomendado para quem usa Docker.

---

## Opção A — Importar do host

Execute:

```bash
mysql -u ferdinando -p aula < aula.sql
```

Digite a senha:

```
admin123
```

---

## Opção B — Importar diretamente no container Docker

Se estiver usando o docker-compose das aulas:

```bash
docker exec -i mysql_container mysql -u ferdinando -padmin123 aula < aula.sql
```

Importação será feita instantaneamente.

---

# 🚀 Método 3 — Importar manualmente dentro do MySQL

Entre no MySQL:

```bash
docker exec -it mysql_container mysql -u ferdinando -p
```

Digite:

```
admin123
```

Depois execute:

```sql
USE aula;
SOURCE /caminho/aula.sql;
```

Exemplo:

```sql
SOURCE /home/aluno/aula.sql;
```

---

# ✅ Verificar se funcionou

Execute:

```sql
USE aula;

SHOW TABLES;
```

Resultado esperado:

```
fornecedores
```

Depois:

```sql
SELECT * FROM fornecedores;
```

Resultado:

```
1  MINHA EMPRESA
2  PETROBRAS
```

---

# 🧪 Exercícios sugeridos para alunos

Testar:

```sql
SELECT * FROM fornecedores;
```

Inserir novo fornecedor:

```sql
INSERT INTO fornecedores (nome_social, cnpj, telefone)
VALUES ('GOOGLE', '123456789', '11-999999999');
```

Consultar:

```sql
SELECT * FROM fornecedores;
```

---

# 🧹 Resetar e importar novamente

Se precisar limpar e reimportar:

```bash
docker compose down -v
docker compose up -d

docker exec -i mysql_container mysql -u ferdinando -padmin123 aula < aula.sql
```

---

# 🎯 Resultado final

Ambiente completo com:

* MySQL rodando
* Banco criado
* Tabela criada
* Dados inseridos

Tudo pronto para as aulas.

Tempo total: menos de 2 minutos.

---

# 💡 Fluxo ideal para alunos

Passo 1
Subir o docker:

```bash
docker compose up -d
```

Passo 2
Importar:

```bash
docker exec -i mysql_container mysql -u ferdinando -padmin123 aula < aula.sql
```

Passo 3
Abrir MySQL Workbench

Passo 4
Executar:

```sql
SELECT * FROM fornecedores;
```

---

Ambiente pronto. Bora praticar SQL.
