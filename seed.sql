CREATE DATABASE pizzaria


-- Tabela de usuários
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(50) NOT NULL,
    tipo VARCHAR(20) DEFAULT 'comum'
);

-- Tabela de pizzas
CREATE TABLE pizzas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INTEGER DEFAULT 0
);

-- Tabela de vendas
CREATE TABLE vendas (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER REFERENCES usuarios(id),
    pizza_id INTEGER REFERENCES pizzas(id),
    quantidade INTEGER NOT NULL,
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuarios (nome, email, senha, tipo) VALUES 
('Ademir', 'adimin@pizzaria.com.br', 'admin123', 'admin'),
('Seu Ze', 'funcionario1@pizzaria.com.br', '123456', 'coumum'),

INSERT INTO PIZZAS (nome, preco, estoque) VALUES
('Marguerita', 10.50, 0),
('Pepperoni', 12.50, 0),
('Barbecue', 15.50, 0),

INSERT INTO VENDAS (usuario_id, pizza_id, quantidade) VALUES
(1, 1, 1),
(1, 2, 1),

UPDATE PIZZAS
SET ESTOQUE = ESTOQUE - (
    SELECT SUM(QUANTIDADE)
    FROM VENDAS
    WHERE VENDAS.PIZZA_ID = PIZZAS.ID,
)









-- Relacionamentos
-- 1 usuário ----> N vendas
-- 1 pizza  ----> N vendas