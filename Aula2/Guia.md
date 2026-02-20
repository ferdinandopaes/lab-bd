# 📌 1. Identificação da Aula

Número da aula: 02

Unidade: Fatec Garça

Tema: Unidade 1 – Revisão de Comandos SQL (Projeto de Banco IBM) – Criação Física e Manipulação de Dados (DDL e DML).

Duração estimada: 02 horas

Professor: Ferdinando Paes

Ferramentas: MySQL Workbench, Notepad++ (para rascunho de scripts).

# 🎯 2. Objetivos de Aprendizagem

Ao final desta aula, você será capaz de:

Consolidar o conceito de SQL: Entender a linguagem como interface universal para dados relacionais.

Distinguir SQL de SGBD: Identificar as responsabilidades do padrão (ANSI) e da ferramenta (MySQL).

Dominar a Criação Física: Traduzir requisitos de negócio em tabelas com restrições de integridade.

Executar Manipulação Precisa: Realizar operações de DML com foco em filtros (WHERE) e consistência.

# 📚 3. Fundamentação Teórica

A Essência do SQL (Structured Query Language)

SQL é uma linguagem baseada em conjuntos e de natureza declarativa. Como bem define Silberschatz, você não programa um loop para buscar dados; você declara o critério de busca e o motor do banco realiza a busca otimizada.

SQL vs. MySQL: A Interface e o Motor

Pense no SQL como as regras de trânsito (o padrão) e no MySQL como o motor de um carro específico. Embora todos os motores sigam as regras, cada fabricante (Oracle, Postgres, MariaDB) possui "cavalos de potência" e recursos extras específicos (dialetos).

DDL: A Arquitetura (Esqueleto)

Os comandos DDL (Data Definition Language) lidam com o catálogo do banco.

CREATE: Aloca espaço e define metadados.

ALTER: Gerencia a evolução do esquema sem perda de dados (quando possível).

DROP: Remove a definição do dicionário de dados.

DML: O Conteúdo (Músculos)

Os comandos DML (Data Manipulation Language) alteram o estado dos dados.

A tríade do perigo: INSERT, UPDATE e DELETE.

O poder do SELECT: A projeção e seleção de dados para geração de informação.

⚠️ Erros de Laboratório e Boas Práticas

Chaves Primárias Fracas: Nunca use nomes como chave primária. Use IDs numéricos ou códigos únicos (UUID/CPF).

Scripts sem Rascunho: Alunos que escrevem direto no Workbench tendem a cometer erros de sintaxe. Use o Notepad++ para estruturar seu raciocínio antes de "dar o play".

Restrições de Integridade: Ignorar o NOT NULL ou UNIQUE gera um banco "sujo" que aceita dados duplicados ou incompletos.

# 🛠 4. Parte Prática – Laboratório

Cenário: Estrutura Organizacional IBM (Simplificada)

Vamos simular a criação de um módulo de RH e Departamentos baseado em modelos corporativos clássicos da IBM.

#### Passo 1: Preparação no Notepad++

Abra o Notepad++ e rascunhe o script. Salve como .sql.

#### Passo 2: Execução no MySQL Workbench (DDL)

-- 1. Criação do Ambiente
CREATE DATABASE IF NOT EXISTS projeto_ibm;
USE projeto_ibm;

-- 2. Tabela de Departamentos
CREATE TABLE departamentos (
    id_depto INT PRIMARY KEY,
    nome_depto VARCHAR(50) NOT NULL,
    localizacao VARCHAR(50)
);

-- 3. Tabela de Funcionários (Relacionada)
CREATE TABLE funcionarios (
    id_func INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10, 2),
    data_admissao DATE,
    id_depto INT,
    CONSTRAINT fk_depto FOREIGN KEY (id_depto) REFERENCES departamentos(id_depto)
);

-- 4. Evolução do Esquema (DML)
ALTER TABLE funcionarios ADD COLUMN email VARCHAR(100) UNIQUE;


#### Passo 3: Inserção e Manipulação (DML)

-- Inserindo Departamentos
INSERT INTO departamentos (id_depto, nome_depto, localizacao) VALUES
(10, 'Sistemas', 'São Paulo'),
(20, 'Hardware', 'Hortolândia'),
(30, 'Vendas', 'Rio de Janeiro');

-- Inserindo Funcionários
INSERT INTO funcionarios (id_func, nome, cargo, salario, data_admissao, id_depto, email) VALUES
(101, 'Marcos Silva', 'Analista', 5500.00, '2022-01-15', 10, 'marcos@ibm.com'),
(102, 'Beatriz Souza', 'Engenheira', 7200.00, '2021-03-10', 20, 'beatriz@ibm.com'),
(103, 'Ricardo Lima', 'Vendedor', 4000.00, '2023-05-20', 30, 'ricardo@ibm.com');

-- Atualização Estratégica
UPDATE funcionarios 
SET salario = salario * 1.05 
WHERE id_depto = 10; -- Aumento de 5% para o pessoal de Sistemas

-- Deleção com Cuidado
-- Tentativa de deletar depto com funcionários (Gera erro de FK)
-- DELETE FROM departamentos WHERE id_depto = 10; 


# 🧠 5. Exercícios de Fixação

Nível Básico

Crie uma tabela projetos com id_projeto, nome_projeto e orcamento.

Insira 2 departamentos extras no banco projeto_ibm.

Altere a tabela projetos para adicionar uma data de início.

Selecione todos os funcionários que ganham mais de R$ 5.000,00.

Remova a coluna localizacao da tabela departamentos.

Nível Intermediário

A IBM decidiu fechar a unidade de 'Vendas'. Transfira o funcionário 'Ricardo Lima' para o departamento 10 (Sistemas) e depois delete o departamento 30.

Aumente em 15% o salário de todos os funcionários admitidos antes de 2022.

Selecione o nome e o cargo dos funcionários do departamento 20, ordenados por nome.

Adicione uma restrição à tabela funcionarios para que o salário nunca seja menor que R$ 1.412,00 (Dica: Pesquise sobre CHECK constraint ou trate via lógica de INSERT).

Liste todos os departamentos e suas localizações onde o nome do departamento comece com a letra 'S'.

Nível Desafiador

Integridade de Dados: Tente inserir um funcionário vinculado a um id_depto que não existe (ex: 99). Descreva o erro retornado pelo MySQL e explique a importância da FOREIGN KEY.

Relatório de Custo: Escreva uma consulta que retorne o nome do funcionário e o custo anual dele para a empresa (salário * 13.3), apenas para quem trabalha em 'Hortolândia'.

# 🚀 6. Desafio Extra (Nível Projeto)

Cenário: A IBM precisa monitorar a alocação de horas em projetos.
Tarefa:

Crie uma tabela intermediária chamada alocacao_projetos.

Ela deve relacionar id_func e id_projeto.

Adicione uma coluna horas_semanais.

Garanta que um funcionário não possa ser alocado no mesmo projeto duas vezes (Dica: Chave Primária Composta).

Crie um script que mostre quais funcionários estão alocados em projetos com orçamento superior a R$ 100.000,00.

# 🧾 7. Checklist de Aprendizado

[ ] Consigo explicar a diferença prática entre DDL e DML?

[ ] Sei utilizar o Notepad++ para organizar meus blocos de código?

[ ] Entendo por que o MySQL bloqueia a exclusão de um departamento que possui funcionários vinculados?

[ ] Sou capaz de realizar um UPDATE filtrado sem afetar toda a tabela?

[ ] Consigo modelar uma relação 1:N entre tabelas?

# 📖 8. Conexão com Bibliografia

Elmasri & Navathe (Sistemas de Banco de Dados): Fundamenta a teoria das restrições de integridade (PK e FK).

C.J. Date (Introdução a Sistemas de Bancos de Dados): Define a base do modelo relacional e a manipulação através da Álgebra Relacional (Seleção e Projeção).

Heuser (Projeto de Banco de Dados): Alinha a criação física com o projeto lógico, justificando o uso de tipos de dados adequados como DECIMAL para valores financeiros.