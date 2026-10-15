-- Active: 1788435084630@@127.0.0.1@3306@smartcoffee_dml_rennan
-- TCL - TRANSAÇÕES E INTEGRIDADE
-- SEM TRANSAÇÃO: PARTE DO PROCESSO IRÁ PERMANECER GRAVADO
-- COM TRANSAÇÃO: PODEMOS CONFIRMAR OU DESFAZER O PROCESSO INTEIRO

-- ESTRUTURA DE TRANSAÇÃO
BEGIN TRANSACTION;
-- COMANDOS SQL
COMMIT; --CONFIRMA A TRANSAÇÃO
-- OU
ROLLBACK; --DESFAZ A TRANSAÇÃO

-- PROCESSO INICIAL
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES ('C Ronaldo', 'cronaldo@email.com', '199991231456', 'Funchal', TRUE);

SELECT nome FROM cliente;

-- EX 1: COMMIT
-- CONFIRMA AS ALTERAÇÕES DENTRO DA TRANSAÇÃO
START TRANSACTION;
UPDATE produto
SET preco = 8.50
WHERE id_produto = 1;
COMMIT;

-- EX 2: ROOLLBACK
-- DESFAZ AS ALTRERAÇÕES AINDA NÃO CONFIRMADAS
START TRANSACTION;
UPDATE produto
SET preco = 9.50
WHERE id_produto = 5000;
SELECT * FROM produto WHERE id_produto = 1;
ROLLBACK;

-- EX 3: SAVEPOINT
-- CRIAR UM PONTO DENTRO DE UMA TRANSAÇÃO
START TRANSACTION;
UPDATE produto
SET preco = preco * 1.50
WHERE id_categoria = 1;

SAVEPOINT reajuste_cafes;

UPDATE produto
SET preco = preco * 2
WHERE id_categoria = 4

ROLLBACK TO SAVEPOINT reajuste_cafes;
COMMIT;

-- EX 4: RELEASE SAVEPOINT
-- REMOVE O SAVEPOINT DA TRANSAÇÃO
RELEASE SAVEPOINT reajuste_cafes;

-- EX 5; AUTOCOMMIT
SELECT @autocommit;
-- ATIVO POR PADRÃO NO MY SQL
START TRANSACTION;
-- DMLS RELACIONADAS
COMMIT;

-- EX 6: TRANSAÇÕES NÃO SUBSTITUI CONSTRAINT
-- 1. Tabela cliente (sem restrições de pedidos, que pertencem à tabela pedido)
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    telefone VARCHAR(15),
    cidade VARCHAR(60),
    ativo BOOLEAN DEFAULT TRUE
);

-- 2. Tabela estoque (duplicação de PRIMARY KEY removida e restrições organizadas)
CREATE TABLE estoque (
    id_estoque INT AUTO_INCREMENT,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 0,
    CONSTRAINT pk_estoque PRIMARY KEY (id_estoque),
    CONSTRAINT uq_estoque UNIQUE (id_produto),
    CONSTRAINT ck_estoque_quantidade CHECK (quantidade >= 0),
    CONSTRAINT fk_estoque_produto FOREIGN KEY (id_produto) REFERENCES produto (id_produto) ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Inserção de dados de teste
INSERT INTO
    estoque (id_produto, quantidade)
VALUES (1, 50),
    (2, 40),
    (3, 30);

SELECT * FROM estoque;

-- Exclusão física e lógica
DELETE FROM produto WHERE id_produto = 5;

UPDATE produto SET ativo = FALSE WHERE id_produto = 10;

-- Transação para atualização de preço
SELECT * FROM produto WHERE id_produto = 3;

START TRANSACTION;

UPDATE produto SET preco = 15.50 WHERE id_produto = 3;

SELECT * FROM produto WHERE id_produto = 3;

COMMIT;

-- Transação de pedido completo
START TRANSACTION;

INSERT INTO
    pedido (
        data_pedido,
        status_pedido,
        valor_total,
        id_cliente
    )
VALUES (NOW(), 'ABERTO', 0.00, 130);

SET @pedido = LAST_INSERT_ID();

INSERT INTO
    item_pedido (
        id_pedido,
        id_produto,
        quantidade,
        preco_unitario
    )
VALUES (@pedido, 1, 2, 7.50),
    (@pedido, 1, 2, 8.50);

INSERT INTO
    pagamento (
        id_pedido,
        valor,
        id_forma_pagamento
    )
VALUES (@pedido, 23.00, 2);

COMMIT;
