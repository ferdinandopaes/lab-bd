# 📌 1. Identificação da Aula

**Número da aula**: 04

**Unidade**: Fatec Garça

**Tema**: Unidade 1 – Revisão de Comandos SQL (Projeto SoftHouse) • Expansão de Esquema, Relacionamentos e Consultas de Verificação.

**Foco**: Evolução de tabelas existentes, criação de tabelas relacionadas (N:1 e N:M) e comandos de consulta (DML).

**Duração estimada**: 02 horas

**Professor**: Ferdinando Paes

**Ferramentas**: MySQL Workbench e Notepad++.

# 🎯 2. Objetivos de Aprendizagem

Ao final desta aula, você será capaz de:

Entender o SQL como Linguagem Evolutiva: Usar o DDL para adaptar bancos de dados a novos requisitos de negócio.

Modelar Relacionamentos: Compreender a dependência entre Funcionários, Departamentos e a alocação em Projetos.

Dominar a Manipulação de Chaves: Implementar Chaves Estrangeiras (FK) para garantir que a relação entre tabelas seja sólida.

Praticar a Extração de Dados: Executar consultas SELECT focadas em validar a integridade da inserção.

# 📚 3. Fundamentação Teórica

## A Evolução do Banco de Dados

No mundo real, um banco de dados raramente nasce "perfeito". Requisitos mudam: uma empresa que só registrava funcionários pode passar a precisar gerenciar projetos e alocação de horas. O comando ALTER TABLE é o nosso principal aliado nesta manutenção evolutiva.

Chaves Estrangeiras (Foreign Keys) e Integridade

Conforme Korth, a integridade referencial garante que um valor que aparece em uma tabela para uma determinada lista de atributos também apareça em outra tabela.

Exemplo: Não faz sentido um funcionário estar alocado no "Projeto Marte" se o "Projeto Marte" não existe na tabela de projetos.

Erros Comuns de Alunos

Tipos de Dados Divergentes: Tentar criar uma FK entre um campo INT e um campo VARCHAR. Os tipos devem ser idênticos.

Esquecer do NOT NULL: Ao criar chaves primárias ou campos obrigatórios de contato, a ausência dessa restrição gera dados inconsistentes.

Consultas sem Filtro: No laboratório, usar SELECT * é comum, mas em produção devemos selecionar apenas as colunas necessárias para performance.

## Boas Práticas

Nomeclatura Padronizada: Use prefixos como fk_ para restrições e id_ para chaves.

Documentação no Script: Comente seus scripts no Notepad++ explicando por que aquela alteração foi feita.

# 🛠 4. Parte Prática – Laboratório

## 🏢 Cenário: Reestruturação do Cadastro SoftHouse

Recebemos uma tabela legada de funcionários com dados básicos (nome_social, cnpj, telefone). Precisamos profissionalizar essa estrutura criando os departamentos e os projetos em que eles trabalham.

### Passo 1: Criação da Tabela Legada e Ajustes (DDL)

-- Preparando o ambiente
CREATE DATABASE IF NOT EXISTS lab_SoftHouse_04;
USE lab_SoftHouse_04;

-- Criando a tabela base (Cenário Inicial)
CREATE TABLE funcionarios (
    id INT PRIMARY KEY,
    nome_social VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18), -- Algumas empresas registram funcionários como PJ
    telefone VARCHAR(15)
);

-- Ampliando a tabela: Adicionando novos campos necessários
ALTER TABLE funcionarios ADD COLUMN data_nascimento DATE;
ALTER TABLE funcionarios ADD COLUMN email VARCHAR(100);


### Passo 2: Criação de Tabelas Relacionadas (DDL)

-- Criando Departamentos
CREATE TABLE departamentos (
    id_depto INT PRIMARY KEY,
    nome_depto VARCHAR(50) NOT NULL
);

-- Criando Projetos
CREATE TABLE projetos (
    id_projeto INT PRIMARY KEY,
    nome_projeto VARCHAR(100) NOT NULL,
    orcamento DECIMAL(15,2)
);

-- Relacionando Funcionário com Departamento (Alteração de Tabela)
ALTER TABLE funcionarios ADD COLUMN id_depto INT;
ALTER TABLE funcionarios ADD CONSTRAINT fk_func_depto 
FOREIGN KEY (id_depto) REFERENCES departamentos(id_depto);


### Passo 3: População e Verificação (DML)

-- 1. Inserindo Departamentos
INSERT INTO departamentos (id_depto, nome_depto) VALUES 
(1, 'TI - Infraestrutura'),
(2, 'Desenvolvimento');

-- 2. Inserindo Projetos
INSERT INTO projetos (id_projeto, nome_projeto, orcamento) VALUES 
(501, 'Migração AWS', 250000.00),
(502, 'App Mobile Watson', 120000.00);

-- 3. Inserindo Funcionários com os novos campos
INSERT INTO funcionarios (id, nome_social, cnpj, telefone, id_depto, email) VALUES 
(10, 'Alice Silva', '00.000.000/0001-91', '(14) 9999-8888', 2, 'alice@SoftHouse.com'),
(20, 'Bruno Souza', '00.000.000/0001-92', '(11) 7777-6666', 1, 'bruno@SoftHouse.com');

-- 4. Verificação de Dados
SELECT * FROM departamentos;
SELECT * FROM projetos;
SELECT nome_social, email, id_depto FROM funcionarios;


# 🧠 5. Exercícios de Fixação

### Nível Básico

Insira um novo departamento chamado "Recursos Humanos".

Adicione um campo site na tabela projetos usando ALTER TABLE.

Atualize o cnpj do funcionário Alice Silva para um valor de sua escolha.

Exclua o projeto 501 (Dica: Verifique se há dependências antes).

Selecione apenas o nome_social e o telefone de todos os funcionários.

### Nível Intermediário

Crie uma tabela chamada alocacao que ligue funcionarios a projetos (Relacionamento N:M). Ela deve conter id_func, id_projeto e horas_alocadas.

Altere a tabela funcionarios para que o campo email seja único (UNIQUE).

Selecione todos os projetos que possuem orçamento acima de R$ 150.000,00.

Mude o funcionário Bruno Souza para o departamento de "Recursos Humanos" criado no exercício 1.

Tente inserir um funcionário em um departamento que não existe (id_depto = 999) e explique o erro gerado pelo Workbench.

### Nível Desafiador

Análise de Dados: Escreva uma consulta que retorne o nome do funcionário e o nome do departamento onde ele trabalha (Dica: Estude o conceito inicial de JOIN ou use subconsultas no WHERE).

Restrição de Negócio: Aplique uma alteração na tabela projetos para garantir que o orcamento nunca seja negativo.

# 🚀 6. Desafio Extra (Nível Projeto)

**Cenário Real**: A SoftHouse notou que alguns funcionários informaram o cnpj de forma errada (faltando pontos ou traços).
**Tarefa**: Crie um script que:

Selecione todos os funcionários cujo cnpj não tenha exatamente 18 caracteres.

Proponha uma alteração na estrutura da tabela (DDL) para separar o ddd do telefone em colunas distintas, visando melhor extração de relatórios por região.

## 🧾 7. Checklist de Aprendizado

[ ] Consigo usar o ALTER TABLE para expandir uma tabela já populada?

[ ] Entendo a diferença prática entre uma PK (Primary Key) e uma FK (Foreign Key)?

[ ] Sei como consultar dados de tabelas diferentes para validar as relações?

[ ] Consigo interpretar erros de integridade referencial no MySQL Workbench?

## 📖 8. Connection with Bibliography

Elmasri & Navathe: Fundamenta a expansão de esquemas e o conceito de modificação de catálogos (DDL).

Silberschatz: Explica a importância das restrições de integridade em esquemas relacionais complexos.

Heuser: Detalha a transformação do modelo conceitual (Relacionamentos) para a implementação física em SQL.