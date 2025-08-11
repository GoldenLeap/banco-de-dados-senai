CREATE DATABASE ProdutosLimpeza;
USE ProdutosLimpeza;

CREATE TABLE Clientes(
	ID_Cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Nome_Cliente VARCHAR(100),
    CPF_Cliente VARCHAR(14),
    Endereco_Cliente VARCHAR(255),
    Celular VARCHAR(18)
);

CREATE TABLE Funcionarios(
	ID_Funcionario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Nome_Funcionario VARCHAR(100),
    Cargo VARCHAR(14),
    Data_Nascimento DATE,
    Salario DECIMAL
);

CREATE TABLE Produtos(
	ID_Produto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Nome_Produto VARCHAR(200),
	Valor_Produto DECIMAL,
    Quantidade_Produto INT,
    Descricao VARCHAR(255)
);

CREATE TABLE Manutencao(
	ID_Servico INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Nome_Servico VARCHAR(100),
    Descricao_Servico VARCHAR(255),
    Valor_Servico DECIMAL,
    Duracao VARCHAR(50)
);
CREATE TABLE Vendas(
	ID_Venda INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Nome_Cliente VARCHAR(100),
    Nome_Venda VARCHAR(255),
    Total DECIMAL,
    Data_Venda DATETIME
);