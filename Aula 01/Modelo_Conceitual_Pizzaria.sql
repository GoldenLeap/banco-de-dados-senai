-- Criar DB da Pizzaria
CREATE DATABASE pizzaria;

-- Usar o DB
USE pizzaria;

-- Criar Tabela de Cliente
CREATE TABLE Cliente(
	ID_Cliente INT PRIMARY KEY,
    CPF_Cliente VARCHAR(255),
    Nome_Cliente VARCHAR(255),
    Endereco_Cliente VARCHAR(255)
);

-- Criar Tabela de Funcionarios
CREATE TABLE Funcionario(
	ID_Funcionario INT PRIMARY KEY,
    Nome_Funcionario VARCHAR(255),
    Cargo VARCHAR(255),
    Data_Nascimento DATE
);

-- Criar Tabela de Cardapio
CREATE TABLE Cardapio(
	ID_Pizza INT PRIMARY KEY,
    Nome_Pizza VARCHAR(255),
	Preco_Pizza INT,
    Ingredientes VARCHAR(255)
);

-- Criar Tabela de Pedidos
CREATE TABLE Pedidos(
	ID_Pedido INT PRIMARY KEY,
    Data_Pedido DATE,
    Nome_Cliente VARCHAR(255),
    Valor_Total INT
);

SELECT * FROM cardapio;