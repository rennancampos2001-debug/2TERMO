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
