create database if not exists Oficina_Rennan;

use Oficina_Rennan;

create table Funcionarios (
id_Funcionario int auto_increment primary key,
Nome varchar(50) not null,
CPF varchar(15) not null,
cargo varchar(30) not null,
Turno enum ('Diurno', 'Noturno') default 'Diurno' not null,
salario decimal (5,2) not null
);

alter table Funcionarios add Adicionar_Funcionarios text;

alter table Funcionarios drop column Adicionar_Funcionarios;

create table Clientes(
Id_Clienteint int auto_increment primary key,
nome varchar(50) not null,
CPF varchar (15) not null,
telefone varchar(17) not null,
email varchar (250) not null,
data_cadastro datetime not null
);

alter table Clientes add Adicionar_Clientes text;

create table Servicos(
Id_Servicos int auto_increment primary key,
Nome varchar(50) not null,
tipo enum ('Manutencao', 'Pintura') default 'Manutencao' not null,
Area_Necessaria varchar(30) not null,
observacoes text,
Diagnostico text not null
);

alter table Servicos add Adicionar_Servicos text;

create table Ordem_de_Servico(
Id_Ordem_Servico int auto_increment primary key,
prioridade enum ('Sim', 'Nao') default 'Nao' not null,
valor decimal(5,2) not null default 000.00,
Funcionario_Responsavel varchar(50) not null,
Area_Requisitada varchar(50) not null,
Tempo_Necessario datetime not null
);

alter table Ordem_de_Servico add Adicionar_Ordem_de_Servico text;

create table Pagamentos(
Id_Pagamento int auto_increment primary key,
valor_Total decimal(5,2) not null default 000.00,
forma_Pagamento enum ('Debito','Credito','PIX') default 'debito',
data_Vencimento date not null,
status_Pagamento varchar(30) not null,
comprovante int
);

alter table Pagamentos add Adicionar_Pagamentos text;

create table Veiculos(
Id_Veiculo int auto_increment primary key,
tipo enum ('Carro', 'Moto') default 'Carro' not null,
Tempo_Uso varchar(35) not null,
Data_Chegada datetime not null,
Data_Saida datetime not null,
observacoes text
);

alter table Veiculos add Adicionar_Veiculos text;

create table Marcas(
Id_Marca int auto_increment primary key,
Nome varchar(50) not null,
Telefone varchar(17) not null,
CNPJ varchar(30) not null,
Data_Cadastro date not null,
Parceria enum ('Sim', 'Nao') default 'Nao' not null
);

alter table Marcas add Adicionar_Marcas text;

create table Modelos(
Id_Modelo int auto_increment primary key,
Nome varchar(40) not null,
Ano_Lancamento date not null,
Problemas_Conhecidos text,
Classificacao enum ('Combustao', 'Eletrico') default 'combustao' not null,
Observacoes text
);

alter table Modelos add Adicionar_Modelos text;

rename table Modelos to Modelos_fab;

create table Pecas(
Id_Peca int auto_increment primary key,
Nome varchar (50) not null,
Tamanho varchar (20) not null,
Peso varchar (20) not null,
Data_Adquirido date not null,
Custo decimal(5,2) not null default 000.00
);

alter table Pecas add Adicionar_Pecas text;

create table Fornecedores(
Id_Fornecedor int auto_increment primary key,
Nome varchar (50) not null,
Telefone varchar(17) not null,
Peca_Fornecida varchar(50) not null,
Endereco varchar (60) not null,
CNPJ varchar (30) not null
);

alter table Fornecedores add Adicionar_Fornecedores text;

