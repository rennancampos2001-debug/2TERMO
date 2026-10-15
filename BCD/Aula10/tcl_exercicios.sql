-- Active: 1788435084630@@127.0.0.1@3306@smartcoffee_dml_rennan
-- ATIVIDADE PRATICA - AULA 10
-- Aluno(a): Rennan Campos Vieira
-- Regra: valide sempre antes de COMMIT.

-- 01. Consulte produto 2 e seu preço.

SELECT * FROM produto WHERE id_produto = 2;

-- 02. START TRANSACTION e aumente produto 2 em R$3,00.

START TRANSACTION;

UPDATE produto
SET preco = preco + 3.00
WHERE id_produto = 2


-- 03. Consulte dentro da transação.

SELECT id_produto, preco FROM produto WHERE id_produto = 2; --FUNCIONOU E AUMENTOU OS 3 REAIS

-- 04. ROLLBACK.

ROLLBACK;

-- 05. Consulte e comprove retorno.

SELECT id_produto, preco FROM produto WHERE id_produto = 2; --VOLTOU O VALOR ANTERIOR

-- 06. Repita a alteração e finalize com COMMIT.

START TRANSACTION;

UPDATE produto
SET preco = preco + 3.00
WHERE id_produto = 2

COMMIT

-- 07. START TRANSACTION e aumente produto 3 em 10%.

START TRANSACTION;

UPDATE produto
SET preco = preco * 1.1
WHERE id_produto = 3

-- 08. SAVEPOINT ajuste_produto3.

SAVEPOINT ajuste_produto3;

-- 09. Aumente produto 4 em 50%.

START TRANSACTION;

UPDATE produto
SET preco = preco * 1.5
WHERE id_produto = 4

-- 10. Consulte os dois.

SELECT id_produto, preco, nome FROM produto WHERE id_produto = 3;
SELECT id_produto, preco, nome FROM produto WHERE id_produto = 4;

-- 11. ROLLBACK TO SAVEPOINT ajuste_produto3.

ROLLBACK TO SAVEPOINT ajuste_produto3

-- 12. COMMIT e explique em comentário qual alteração permaneceu.

COMMIT;

-- EXPLICAÇÃO DO QUE PERMANECEU:
-- 1. A alteração no PRODUTO 2 (aumento de R$ 3,00) PERMANECEU gravada, pois foi executada ANTES do SAVEPOINT.
-- 2. A alteração no PRODUTO 3 FOI DESFEITA quando se executou o 'ROLLBACK TO SAVEPOINT ajuste_produto3',
--    portanto NÃO foi confirmada pelo COMMIT final.

-- 13. START TRANSACTION.

START TRANSACTION;

-- 14. Crie pedido para cliente 1 e salve o id em @novo_pedido.

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES (NOW(), 'ABERTO', 20.00, 1);

SET @novo_pedido = LAST_INSERT_ID();

-- 15. Insira dois itens válidos.

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario ) VALUES (@novo_pedido, 1, 2, 7.50), (@novo_pedido, 2, 2, 8.50);

-- 16. Registre pagamento válido.

INSERT INTO pagamento (id_pedido, valor, id_forma_pagamento) VALUES (@novo_pedido, 50.00, 7);

-- 17. Consulte pedido, itens e pagamento.

SELECT * FROM pedido;
SELECT * FROM item_pedido;
SELECT * FROM pagamento;

-- 18. COMMIT.

COMMIT;

-- 19. START TRANSACTION e crie pedido para cliente 2.

START TRANSACTION;

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES (NOW(), 'ABERTO', 50.00, 2);

-- 20. Salve o id em @pedido_com_erro.

SET @pedido_com_erro = LAST_INSERT_ID();

-- 21. Tente inserir item com id_produto inexistente.

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES (@novo_pedido, 1, 2, 7.50), (@novo_pedido, 2, 2, 8.50);

-- 22. Após observar a FK, ROLLBACK.

-- 23. Consulte @pedido_com_erro e comprove que não permaneceu.

-- 24. Tente excluir uma categoria que possui produtos.
-- Explique em comentário por que foi bloqueado.

-- 25. Crie em uma transação um pedido temporário com dois itens,
-- exclua o pedido e observe ON DELETE CASCADE.
-- Finalize com ROLLBACK para preservar a base.

-- DESAFIO EXTRA - CAIXA DO SMARTCOFFEE
-- Em UMA transação:
-- a) pedido; b) 3 itens; c) baixa de estoque;
-- d) SAVEPOINT; e) pagamento; f) status FINALIZADO;
-- g) consultas; h) COMMIT.
