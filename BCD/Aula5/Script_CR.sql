-- Active: 1788435084630@@127.0.0.1@3306@sesi_cr_tb
CREATE DATABASE SESI_CR_TB;
USE SESI_CR_TB;

--CRIACAO DE TABELAS
CREATE TABLE CLIENTE (
  ID_CLIENTE INT AUTO_INCREMENT PRIMARY KEY,
  NOME_CLIENTE VARCHAR(60) NOT NULL
);

CREATE TABLE PEDIDO(
  ID_PEDIDO INT AUTO_INCREMENT PRIMARY KEY,
  DATA_PEDIDO DATETIME NOT NULL,
  ID_CLIENTE INT NOT NULL,
  FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (ID_CLIENTE)
);

CREATE TABLE FORNECEDOR (
  ID_FORNECEDOR INT AUTO_INCREMENT PRIMARY KEY,
  RAZAO_SOCIAL VARCHAR(60) NOT NULL
)

CREATE TABLE PRODUTO(
  ID_PRODUTO INT AUTO_INCREMENT PRIMARY KEY,
  NOME_PRODUTO VARCHAR(60) NOT NULL,
  ID_FORNECEDOR INT NOT NULL,
  FOREIGN KEY (ID_FORNECEDOR) REFERENCES FORNECEDOR (ID_FORNECEDOR)
)

--DESAFIOS
-- 1 - QUESTAO
--Para cada situação, identifique a cardinalidade e justifique.

--1. Uma categoria pode possuir vários produtos. Cada produto pertence a apenas uma categoria
--1,n e 1,1

--2. Um funcionário pode registrar vários pedidos. Cada pedido é registrado por um funcionário.
--1,n e 1,1

--3. Um fornecedor comercializa vários produtos, e o mesmo produto pode ser comprado de vários fornecedores.
--1,n e 1,n

--4. Uma mesa pode existir sem nenhuma reserva futura. Uma reserva deve estar vinculada a uma mesa.
-- 0,n e 1,1

--5. Um pedido possui vários itens. Um item de pedido pertence a um único pedido.
--1,n e 1,1

--CONSULTA DE TABELAS
SELECT * FROM CLIENTE;
SELECT * FROM PEDIDO;

--INSERINDO DADOS NA TABELA
INSERT INTO CLIENTE (`NOME_CLIENTE`) VALUES
('BRUNO'),
('MARIA'),
('jOSÉ');
