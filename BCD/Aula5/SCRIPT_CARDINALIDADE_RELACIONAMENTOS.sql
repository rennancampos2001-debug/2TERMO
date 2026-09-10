-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Cliente (
Id_Cliente int auto_increment primary key PRIMARY KEY,
Nome_Cliente varchar(90) not null
)

CREATE TABLE Pedido (
Id_Pedido int auto_increment primary key PRIMARY KEY,
Data_Pedido datetime not null,
Id_Cliente int not null/*falha: chave estrangeira*/
)

CREATE TABLE Produto+Etoque (
Id_Produto int auto_increment primary key,
Nome_Produto varchar(60) not null,
Id_Estoque int auto_increment primary key,
Quantidade int not null,
PRIMARY KEY(Id_Produto,Id_Estoque)
)

CREATE TABLE Fornecedor (
Id_Fornecedor int auto_increment primary key PRIMARY KEY,
Razao_Social Varchar (100) not null
)

CREATE TABLE Produto (
Id_Produto int auto_increment primary key PRIMARY KEY,
Nome_Produto Varchar(100) not null
)

CREATE TABLE Relação_2+Item_Produto (
Id_Produto int not null,
Id_Fornecedor int not null,
Id_Item int auto_increment primary key PRIMARY KEY,
Valor Decimal(10,2)/*falha: chave estrangeira*//*falha: chave estrangeira*/
)

