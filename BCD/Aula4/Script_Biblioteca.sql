-- comando para criar banco de dados
create database academia_projeto;
create database academia_projeto2;

-- comando para apagar banco de dados
drop database academia_projeto2;

-- comando para ativar banco de dados
use academia_projeto;

-- comando para criar tabelas

create table funcionarios (
id_funcionarios int auto_increment primary key,
cpf varchar(15) not null,
nome varchar(60) not null,
turno varchar (8) not null,
area varchar (20) not null,
salario decimal (5,2) not null
);

create table equipamentos (
id_equipamentos int auto_increment primary key,
tempo_Uso int,
marca varchar(20) not null,
quantidade int not null,
estado varchar(10),
data_Aquisicao date not null
);

create table clientes (
id_clientes int auto_increment primary key,
nome varchar(50) not null,
cpf varchar(15) not null unique,
email varchar(250),
data_Cadastro timestamp default current_timestamp,
tipo_Treino varchar(25) not null
);

create table plano (
id_plano int auto_increment primary key,
valor decimal(4,2) not null,
tipo_Plano varchar(20) not null,
nome_Plano varchar(20),
duracao int not null,
status_Pagamento varchar (15) not null default "Ativo"
);

create table pagamento (
id_pagamento int auto_increment primary key,
forma_Pagamento varchar(10) not null default "Debito",
data_Vencimento date not null,
valor_Total decimal(4,2) not null,
status_Pagamento varchar(20) not null,
comprovante int
);