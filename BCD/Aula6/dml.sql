-- BANCO DE DADOS - SMARTCOFFEE - DML
-- RECURSO DE RESET DE BANCO DE DADOS

DROP DATABASE IF NOT EXISTS SMARTCOFFEE_DML_RENNAN;
CREATE DATABASE IF NOT EXISTS SMARTCOFFEE_DML_RENNAN;
USE SMARTCOFFEE_DML_RENNAN;

CREATE TABLE cliente (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(120) UNIQUE,
  telefone VARCHAR(15),
  cidade VARCHAR(60) NOT NULL,
  ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE categoria (
  id_categoria INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE produto (
  id_produto INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  ativo BOOLEAN NOT NULL DEFAULT TRUE,
  id_categoria INT NOT NULL,
  CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);

CREATE TABLE pedido (
  id_pedido int PRIMARY KEY AUTO_INCREMENT,
  data_pedido DATETIME NOT NULL,
  status_pedido ENUM('ABERTO','PREPARANDO','FINALIZADO','CANCELADO') NOT NULL,
  valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  id_cliente INT NOT NULL,
  CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE item_pedido (
  id_item INT PRIMARY KEY AUTO_INCREMENT,
  id_pedido INT NOT NULL,
  id_produto INT NOT NULL,
  quantidade INT NOT NULL,
  preco_unitario DECIMAL(10,2) NOT NULL,
  observacao VARCHAR(150),
  CONSTRAINT fk_item_pedido FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
  CONSTRAINT fk_item_pedido_produto FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
)

CREATE TABLE forma_pagamento (
  id_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
  descricao VARCHAR(40) NOT NULL UNIQUE
)

CREATE TABLE pagamento (
  id_pagamebto INT PRIMARY KEY AUTO_INCREMENT,
  id_pedido INT NOT NULL,
  id_forma_pagamento INT NOT NULL,
  valor DECIMAL (10,2) NOT NULL,
  data_pagameto DATETIME,
  CONSTRAINT fk_pagamento_forma_pedido FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento (id_forma_pagamento)
)

-- INSERINDO DADOS NO BD

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Luis Felipe', 'luis@email.com','1999999901','Limeira',TRUE),
('Maria Eduarda','maria@email.com','1999999902','Limeira',TRUE),
('Mateus Silva','mateus@email.com','1999999903','Limeira',TRUE),
('Matheus Silva','matheus@email.com','1999999904','Limeira',TRUE),
('Nicolas Filipe','nicolas@email.com','1999999905','Limeira',TRUE),
('Otavio Correia','otavio@email.com','1999999906','Limeira',TRUE),
('Pedro Mirando','pedro@email.com','1999999907','Limeira',TRUE),
('Rafael Vieira','rafael@email.com','1999999908','Limeira',TRUE),
('Rebecca Hernandes','rebecca@emai.com',NULL, 'Limeira',TRUE),
('Rennan Campos','rennan@email.com','1999999909','Americana',TRUE),
('Samira Dalosto','samira@email.com',NULL,'Ourinhos',FALSE),
('Sophia Carolina','sophia@email.com','1999999911','Taubaté',TRUE),
('Stefany Santana','stefany@email.com',NULL,'Campinas',FALSE),
('Vinicius Henrique','vinicius@email.com','1999999913','Limeira',TRUE),
('Vinicius Oliveira','viniciuso@email.com','1999999914','Limeira',TRUE),
('Vanessa Queiroz','vanessa@email.com','1999999912','Limeira',TRUE);

INSERT INTO categoria (nome) VALUES
('Café'),('Bebidas'),('Bebidas Quentes'),('Doces'),('Salgados'),('Combo');

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Café Tradicional',6.90, TRUE, 1),
('Coca-Cola', 6.00, TRUE, 2),
('Café Expresso', 8.00, FALSE, 1),
('Chocolate Quente', 10.00, TRUE, 3),
('Fini', 3.50, TRUE, 4);

INSERT INTO pedido (data_pedido, valor_total, id_cliente, status_pedido) VALUES
(NOW(), 50.50, 1, 'PREPARANDO'),
(NOW(), 35.50, 5, 'ABERTO'),
(NOW(), 40.00, 10, 'FINALIZADO'),
(NOW(), 3.50, 7, 'CANCELADO'),
(NOW(), 20.50, 14, 'FINALIZADO')

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(1, 1, 3, 15.5, 'Foi rapido e eficaz'),
(2, 4, 2, 10.00, 'Devagar mas perfeito'),
(5, 2, 3, 20.50, 'Normal'),
(4,3, 1, 3.50, ''),
(3, 5, 2, 20.00, 'Meio parado o movimento durante')

INSERT INTO forma_pagamento (descricao) VALUES
('Credito'),
('Debito'),
('PIX')

INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagameto) VALUES
(1, 6, 50.50, NOW()),
(2, 7, 35.50, NOW()),
(3, 8, 40.00, NOW()),
(4, 8, 3.50, NOW()),
(5, 6, 20.50, NOW())

-----------------------------------------------------------
EXEMPLO NOVO DE INSERÇÃO DE DADOS PORÉM COM RECUPERAÇÃO DO ULTIMO IDENTIFIED

INSERT INTO pedido (data_pedido, valor total, id_cliente, status_pedido) VALUES (NOW(), 'Aberto', '0.00',1);
SET @pedido = LAST_INSERT_ID();
SELECT @pedido;

----------------------------------------------------------

--ATUALIZAÇÕES E MODIFICAÇÕES DE DADOS
UPDATE cliente
SET telefone = '1999888802'
WHERE id_cliente = 9

--EX 2
UPDATE produto
SET preco = 1.00
-- NUNCA REALIZAR UM UPDATE SEM ---- WHERE

-- EX 3
UPDATE cliente
SET telefone = '1997777701',
    cidade = 'Valinhos'
WHERE id_cliente = 11;

-- EX 4
UPDATE produto
SET preco = preco * 1.05
WHERE id_categoria = 1

-- EX 5
UPDATE produto
SET preco = CASE
    WHEN preco < 20 THEN preco * 1.20
    ELSE preco * 1.05
END
WHERE ativo = TRUE

------------------------------------------------
-- APAGAR DADOS DO BD

DELETE FROM cliente
WHERE id_cliente = 11

------------------------------------------------
-- TRANSAÇÕES - SEGURANÇA PARA DML

START TRANSACTION

UPDATE produto
SET preco = preco * 2.00
WHERE id_categoria = 1

SELECT id_produto, nome, preco
FROM produto
WHERE id_categoria = 1

-- DESFAZ O QUE FIZEMOS DE ERRADO OU VOLTA UMA TRANSIÇÃO
ROLLBACK

-- VALIDA O PROCEDIMENTO DE TRANSAÇÃO
COMMIT

SELECT * FROM pedido

START TRANSACTION;
UPDATE cliente SET cidade = 'Santos' WHERE id_cliente = 19;
COMMIT;
ROLLBACK;

-- PROCEDIMENTO DE UMA COMPRA
--PASSO 1:
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES ('Carlos Silva', 'carlos.silva@email.com', '1999999999', 'Santos',TRUE);
SET @cliente_compra = LAST_INSERT_ID();

-- PASSO 2:
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 0.00, @cliente_compra);
SET @pedido_compra = LAST_INSERT_ID();

-- PASSO 3:
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@pedido_compra,4,1,13.00), (@pedido_compra,9,1,9.00);

-- PASSO 4:
UPDATE pedido
SET valor_total = 22.00,
    status_pedido = 'PREPARANDO'
WHERE id_pedido = @pedido_compra;

-- PASSO 5 - REGISTRAR PAGAMENTO

INSERT INTO
    pagamento (
    id_pedido,id_forma_pagamento,valor,data_pagameto
)
VALUES (
  @pedido_compra,2,22.00,NOW()
);

-- PASSO 6 - CONSULTA PEDIDO E RESULTADO
SELECT p.id_pedido,
    c.nome AS cliente,
    p.status_pedido,
    p.valor_total
FROM pedido p
JOIN cliente c ON c.id_cliente = p.id_cliente
WHERE p.id_pedido = @pedido_compra

-- PASSO 7 - RELATORIO
SELECT nome FROM cliente WHERE nome = @cliente_compra

SELECT @pedido_compra;


