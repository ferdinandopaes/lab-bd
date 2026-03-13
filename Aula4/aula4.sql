-- Criar banco se não existir
CREATE DATABASE IF NOT EXISTS empresa;

-- Usar o banco
USE empresa;

-- Criar tabela se não existir
CREATE TABLE IF NOT EXISTS funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    p_nome VARCHAR(50),
    u_nome VARCHAR(50),
    salario_bruto DECIMAL(10,3),
    data_admissao DATE,
    departamento VARCHAR(50)
);

-- Inserir dados
INSERT INTO funcionarios (p_nome, u_nome, salario_bruto, data_admissao, departamento) VALUES
('Ferdinando', 'Paes', 8500.456, '2015-03-10', 'TI'),
('Ana', 'silva', 4200.123, '2022-05-20', 'RH'),
('Carlos', 'Oliveira', 5300.999, '2010-12-01', 'Vendas'),
('Maria', 'Eduarda', 3150.000, '2023-10-15', 'TI');
