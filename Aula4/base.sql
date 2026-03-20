CREATE DATABASE laboratorio;
USE laboratorio;

-- Tabela de ativos
CREATE TABLE ativos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    valor DECIMAL(10,2),
    codigo_patrimonio INT,
    data_compra DATE,
    gerente_nome VARCHAR(100),
    gerente_id INT
);

INSERT INTO ativos (nome, valor, codigo_patrimonio, data_compra, gerente_nome, gerente_id) VALUES
('Servidor Dell', 50000, 123, '2023-01-10', 'Carlos Silva', 10),
('Storage HP', 80000, 45, '2022-05-20', 'Ana Souza', 11);


-- Tabela ecommerce
CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    preco DECIMAL(10,2)
);

INSERT INTO produtos (nome, preco) VALUES
('Fone de Ouvido', 199.90),
('Mouse Gamer', 350.50);


CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    data_prometida DATE,
    data_entrega DATE,
    cartao VARCHAR(20),
    data_primeira_compra DATE
);

INSERT INTO pedidos (data_prometida, data_entrega, cartao, data_primeira_compra) VALUES
('2025-03-01', '2025-03-05', '1234567812345678', '2022-07-10');


-- Tabela fretes
CREATE TABLE fretes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cidade_origem VARCHAR(100),
    valor_carga DECIMAL(10,2),
    data_saida DATE,
    peso DECIMAL(10,2),
    observacao VARCHAR(255),
    data_fabricacao DATE,
    valor_frete DECIMAL(10,2),
    telefone VARCHAR(20),
    destinatario VARCHAR(100),
    cep VARCHAR(8)
);

INSERT INTO fretes (
    cidade_origem, valor_carga, data_saida, peso, observacao,
    data_fabricacao, valor_frete, telefone, destinatario, cep
) VALUES
(' sao paulo ', 10000, '2025-01-31', 150.567, 'Entrega Urgente',
 '2018-06-10', 1200, '(11) 98765-4321', 'João Silva', '12345678');