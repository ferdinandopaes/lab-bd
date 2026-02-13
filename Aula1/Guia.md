# 📌 1. Identificação da Aula

Número da aula: 01

Unidade: Fatec Garça

Tema: Revisão de Linguagem SQL - Comandos DDL (CREATE, ALTER, DROP) e Comandos DML (INSERT, UPDATE, DELETE, SELECT)

Duração estimada: 02 horas

Professor: Ferdinando Paes

# 🎯 2. Objetivos de Aprendizagem

Ao final desta aula, o aluno será capaz de:

Compreender a natureza declarativa da linguagem SQL.

Diferenciar a linguagem SQL (padrão) do SGBD MySQL (software).

Estruturar esquemas de dados utilizando comandos de definição (DDL).

Manipular e extrair informações de tabelas utilizando comandos de manipulação (DML).

Identificar o comportamento e os impactos de cada comando na integridade dos dados.

# 📚 3. Fundamentação Teórica

#### O que é SQL?

A SQL (Structured Query Language) não é uma linguagem de programação procedural (como Java ou C), mas sim uma linguagem declarativa. Segundo Elmasri & Navathe, em uma linguagem declarativa, o usuário especifica o que deseja obter, e o SGBD decide como obter (através do Otimizador de Consultas).

**SQL vs. MySQL**

É um erro comum confundir os dois.

**SQL:** É o padrão de linguagem definido pela ANSI/ISO.

**MySQL:** É um Sistema Gerenciador de Banco de Dados Relacional (SGBDR) que utiliza a linguagem SQL para interação. Cada SGBD (Oracle, SQL Server, MySQL) possui suas particularidades e extensões ao padrão.

Comandos de Definição de Dados (DDL - Data Definition Language)

Os comandos DDL atuam sobre a estrutura (o esquema) do banco de dados.

**CREATE TABLE:** Define o nome da tabela, suas colunas, tipos de dados e restrições (Primary Keys, Foreign Keys).

**ALTER TABLE:** Modifica uma estrutura existente (adiciona colunas, muda tipos).

**DROP TABLE:** Remove a estrutura e todos os dados permanentemente.

Comandos de Manipulação de Dados (DML - Data Manipulation Language)

Os comandos DML atuam sobre as instâncias (linhas/registros).

**INSERT:** Adiciona novas linhas.

**SELECT:** Recupera dados (o "coração" do SQL).

**UPDATE:** Modifica valores em linhas existentes.

**DELETE:** Remove linhas específicas.

#### ⚠️ Erros Comuns e Boas Práticas

```
O Esquecimento do WHERE: Executar UPDATE ou DELETE sem a cláusula WHERE afetará todas as linhas da tabela. Em ambiente de produção, isso é catastrófico.

Nomes de Objetos: Evite espaços e caracteres especiais em nomes de tabelas ou colunas. Use snake_case (ex: data_nascimento).

Tipagem Correta: Usar VARCHAR para tudo é um erro de performance. Use DATE para datas e DECIMAL para valores monetários (nunca FLOAT para dinheiro).
```

# 🛠 4. Parte Prática – Laboratório

Cenário Aplicado: Sistema de Gestão de E-commerce "TechStore"

Vamos criar o núcleo de um sistema de vendas. Utilizaremos o MySQL Workbench para os scripts e o Notepad++ para rascunhar nossos blocos lógicos antes da execução.

#### Passo 1: Criação do Banco e Tabelas (DDL)

```
-- Criando o Schema
CREATE DATABASE IF NOT EXISTS tech_store;
USE tech_store;

-- Criando a tabela de Clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    email VARCHAR(50),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Criando a tabela de Produtos
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT DEFAULT 0
);

-- Alterando a tabela para adicionar uma coluna de categoria
ALTER TABLE produtos ADD COLUMN categoria VARCHAR(30);
```

#### Passo 2: Manipulação de Dados (DML)

```
-- Inserindo dados de teste
INSERT INTO clientes (nome, cpf, email) VALUES 
('Ana Souza', '12345678901', 'ana@email.com'),
('Carlos Lima', '98765432100', 'carlos@email.com');

INSERT INTO produtos (nome_produto, preco, estoque, categoria) VALUES
('Teclado Mecânico', 250.00, 50, 'Periféricos'),
('Mouse Gamer', 180.00, 30, 'Periféricos'),
('Monitor 24"', 950.00, 10, 'Monitores');

-- Atualizando o preço com aumento de 10% para Periféricos
UPDATE produtos 
SET preco = preco * 1.10 
WHERE categoria = 'Periféricos';

-- Consultando Clientes que usam Gmail (exemplo de filtro)
SELECT nome, email 
FROM clientes 
WHERE email LIKE '%@email.com%';

-- Removendo um produto específico
DELETE FROM produtos WHERE id_produto = 2;
```

# 🧠 5. Exercícios de Fixação

#### Nível Básico

Crie uma tabela chamada fornecedores com ID, Nome Social e CNPJ.

Adicione uma coluna telefone na tabela clientes usando ALTER TABLE.

Insira 3 novos produtos na tabela produtos.

Selecione todos os campos da tabela produtos onde o estoque seja maior que 20.

Exclua a tabela fornecedores do banco de dados.

#### Nível Intermediário

Escreva um comando que altere o nome do produto 'Teclado Mecânico' para 'Teclado RGB' e aumente seu estoque em 5 unidades em um único UPDATE.

Selecione apenas o nome e o preco dos produtos que custam entre R$ 100,00 e R$ 500,00.

Tente inserir um cliente com um CPF que já existe. Observe o erro do MySQL e explique por que isso acontece (Dica: Restrição UNIQUE).

Atualize o e-mail de todos os clientes para 'contato@empresa.com.br' que não possuem e-mail cadastrado (IS NULL).

Delete todos os produtos da categoria 'Monitores' que possuem estoque zero.

#### Nível Desafiador

Otimização de Estrutura: Crie uma tabela pedidos que relacione id_cliente e id_produto. Aplique as restrições de integridade referencial (FOREIGN KEY) de modo que não seja possível deletar um cliente que possua pedidos.

Consulta Complexa: Elabore um SELECT que retorne o nome do produto e o valor total em estoque (preço * estoque) apenas para produtos cujo valor total em estoque ultrapasse R$ 5.000,00.

# 🚀 6. Desafio Extra (Nível Projeto)

**Contexto:** A TechStore cresceu e agora precisa controlar as unidades físicas.
**Tarefa:** Crie uma nova tabela chamada unidades_loja (id, cidade, gerente). Depois, altere a tabela produtos para incluir uma chave estrangeira que indique em qual unidade aquele lote de produto está armazenado. Popule os dados e crie um script que transfira todos os produtos de uma "Loja A" para uma "Loja B" em caso de fechamento de unidade.

# 🧾 7. Checklist de Aprendizado

[ ] Consigo criar um banco de dados e tabelas do zero?

[ ] Entendo a diferença entre DROP (apaga estrutura) e DELETE (apaga dados)?

[ ] Sei utilizar o WHERE corretamente para evitar desastres em UPDATE e DELETE?

[ ] Compreendo a importância das restrições NOT NULL, UNIQUE e PRIMARY KEY?

[ ] Consigo realizar consultas filtradas e cálculos simples no SELECT?

# 📖 8. Conexão com Bibliografia

Esta aula fundamenta-se nos seguintes conceitos:

Modelo Relacional e Integridade: Baseado em C.J. Date, focando na garantia de que os dados inseridos respeitem as regras de negócio (chaves e tipos).

Ciclo de Vida de Banco de Dados: Baseado em Heuser, focando no projeto lógico e implementação física.

Álgebra Relacional no SQL: Baseado em Silberschatz, Korth & Sudarshan, onde o SELECT é visto como uma operação de Projeção e Seleção.