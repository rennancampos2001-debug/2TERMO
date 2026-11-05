-- Active: 1788435084630@@127.0.0.1@3306@smartcoffee_index_rennan
CREATE DATABASE smartcoffe_index_rennan;
USE smartcoffe_index_rennan;

-- Parte A — Básico Fundamentos

-- 1. Crie vw_produtos_ativos .

CREATE VIEW vw_produtos_ativos AS
SELECT id_produto, nome, preco, id_categoria
FROM produto
WHERE ATIVO = TRUE;

-- 2. Consulte apenas produtos da view com preço maior que R$ 10,00.

SELECT * FROM vw_produtos_ativos WHERE preco > 10.00;

-- 3. Liste todas as views do banco.

SHOW FULL TABLES WHERE TABLE_TYPE = 'VIEW';

-- 4. Exiba a definição de vw_produtos_ativos .

SHOW CREATE VIEW vw_produtos_ativos;

-- Parte B — Relacionamentos Intermediário

-- 5. Crie vw_produtos_categorias usando INNER JOIN.

CREATE VIEW vw_produtos_categorias AS
SELECT
  P.ID_PRODUTO,
  P.NOME AS PRODUTO,
  P.PRECO,
  C.NOME AS CATEGORIA
FROM PRODUTO AS P
INNER JOIN CATEGORIA AS C ON C.ID_CATEGORIA = P.ID_CATEGORIA;

-- 6. Crie vw_pedidos_clientes .

CREATE VIEW vw_pedidos_clientes AS
SELECT
  P.ID_PEDIDO,
  P.DATA_PEDIDO,
  P.STATUS_PEDIDO,
  C.ID_CLIENTE,
  C.NOME AS CLIENTE,
  C.EMAIL
FROM PEDIDO AS P
INNER JOIN CLIENTE AS C ON C.ID_CLIENTE = P.ID_CLIENTE;

-- 7. Consulte somente pedidos FINALIZADOS pela view.

SELECT *
FROM vw_pedidos_clientes
WHERE
    STATUS_PEDIDO = 'FINALIZADO';

-- 8. Crie uma view com pedido, produto, quantidade, preço unitário e
-- subtotal.

-- Parte C — Relatórios Intermediário/
-- Avançado

-- 9. Crie vw_vendas_por_produto com SUM e GROUP BY.

-- 10. Liste os produtos pelo maior faturamento.

-- 11. Crie uma view que apresente todos os clientes e a quantidade de
-- pedidos, inclusive zero.

-- 12. Descubra, pela view anterior, clientes que nunca compraram.

-- Parte D — Manutenção

-- 13. Use CREATE OR REPLACE para acrescentar id_categoria em uma
-- view.

-- 14. Crie uma view simples e teste uma atualização permitida pelo SGBD.

-- 15. Crie uma view de produtos ativos com WITH CHECK OPTION e
-- analise seu efeito.

-- 16. Remova uma view de teste com DROP VIEW IF EXISTS.
