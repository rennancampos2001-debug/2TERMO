CREATE DATABASE if not EXISTS SmartCoffee_Rennan;
USE SmartCoffee_Rennan;

CREATE TABLE Categoria (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Data_Cadastro DATETIME NOT NULL,
    Validade DATE NOT NULL,
    Descricao VARCHAR(60),
    Codigo INT NOT NULL UNIQUE,
    Preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE Fornecedor (
    ID_Fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    Telefone VARCHAR(17) NOT NULL UNIQUE,
    Produto_Fornecido VARCHAR(30) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Endereco VARCHAR(100) NOT NULL UNIQUE,
    CNPJ VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE Estoque (
    ID_insumo INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Insumo VARCHAR(50) NOT NULL,
    Quantidade_Atual INT NOT NULL,
    Quantidade_Minima INT,
    Unidade_Medida CHAR(2)
);

CREATE TABLE Funcionarios (
    ID_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    CPF VARCHAR(15) NOT NULL UNIQUE,
    Nome VARCHAR(50) NOT NULL,
    Cargo VARCHAR(30) NOT NULL,
    Data_Admissao DATETIME NOT NULL,
    Salario DECIMAL(10,2) NOT NULL,
    Telefone VARCHAR(17) NOT NULL UNIQUE
);

CREATE TABLE Programa_Fidelidade (
    ID_finalidade INT AUTO_INCREMENT PRIMARY KEY,
    Data_Ultima_Atualizacao DATE NOT NULL,
    Nome_Programa VARCHAR(50) NOT NULL,
    Validade_Pontos DATE NOT NULL,
    Saldo_Pontos INT NOT NULL,
    Status CHAR(2)

);

CREATE TABLE Cliente (
    ID_cliente INT AUTO_INCREMENT PRIMARY KEY,
    Telefone_Cliente VARCHAR(17) NOT NULL UNIQUE,
    Email VARCHAR(250) NOT NULL UNIQUE,
    CPF_Clientes VARCHAR(15) NOT NULL UNIQUE,
    Data_cadastro DATETIME NOT NULL,
    Nome_Cliente VARCHAR(50) NOT NULL,
    Pontos_Fidelidade INT,
    ID_finalidade INT NOT NULL UNIQUE,

    FOREIGN KEY (ID_finalidade)
        REFERENCES Programa_Fidelidade(ID_finalidade)
);

CREATE TABLE Delivery (
    ID_delivery INT AUTO_INCREMENT PRIMARY KEY,
    Taxa_Entrega DECIMAL(5,2) NOT NULL,
    Status_Entrega VARCHAR(30) NOT NULL,
    Nome_Entregador VARCHAR(50) NOT NULL,
    Endereco_Entrega VARCHAR(100) NOT NULL UNIQUE,
    Data_Hora_Saida DATETIME NOT NULL,
    ID_funcionario INT,

    FOREIGN KEY (ID_funcionario)
        REFERENCES Funcionarios(ID_funcionario)
);

CREATE TABLE Produto (
    ID_produto INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Produto VARCHAR(50) NOT NULL,
    Preco_Unitario DECIMAL(10,2) NOT NULL,
    Tamanho VARCHAR(20) NOT NULL,
    Peso VARCHAR(10) NOT NULL,
    ID_Categoria INT NOT NULL,
    ID_Fornecedor INT NOT NULL,

    FOREIGN KEY (ID_Categoria)
        REFERENCES Categoria(ID_Categoria),

    FOREIGN KEY (ID_Fornecedor)
        REFERENCES Fornecedor(ID_Fornecedor)
);

CREATE TABLE Pedidos (
    ID_pedido INT AUTO_INCREMENT PRIMARY KEY,
    Hora_pedido TIME NOT NULL,
    Valor_total DECIMAL(10,2) NOT NULL,
    Data_Hora DATETIME NOT NULL,
    Status VARCHAR(20) NOT NULL,
    Tipo_Pedido VARCHAR(15) NOT NULL,
    ID_delivery INT,
    ID_cliente INT NOT NULL,
    ID_funcionario INT,

    FOREIGN KEY (ID_delivery)
        REFERENCES Delivery(ID_delivery),

    FOREIGN KEY (ID_cliente)
        REFERENCES Cliente(ID_cliente),

    FOREIGN KEY (ID_funcionario)
        REFERENCES Funcionarios(ID_funcionario),

    CHECK (Tipo_Pedido IN ('Presencial', 'Delivery'))
);

CREATE TABLE Pagamento (
    ID_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    ID_pedido INT NOT NULL UNIQUE,
    Forma_Pagamento VARCHAR(10) NOT NULL,
    Valor_Pago DECIMAL(10,2) NOT NULL,
    Data_Hora_Pagamento DATETIME NOT NULL,
    Status_Pagamento VARCHAR(40) NOT NULL,

    FOREIGN KEY (ID_pedido)
        REFERENCES Pedidos(ID_pedido)
);

CREATE TABLE Consome (
    ID_produto INT NOT NULL,
    ID_insumo INT NOT NULL,
    Quantidade_Gasta INT NOT NULL,

    PRIMARY KEY (ID_produto, ID_insumo),

    FOREIGN KEY (ID_produto)
        REFERENCES Produto(ID_produto),

    FOREIGN KEY (ID_insumo)
        REFERENCES Estoque(ID_insumo)
);

CREATE TABLE Contem (
    ID_pedido INT NOT NULL,
    ID_produto INT NOT NULL,
    Quantidade INT NOT NULL,
    Preco_Historico DECIMAL(10,2) NOT NULL,

    PRIMARY KEY (ID_pedido, ID_produto),

    FOREIGN KEY (ID_pedido)
        REFERENCES Pedidos(ID_pedido),

    FOREIGN KEY (ID_produto)
        REFERENCES Produto(ID_produto)
);
