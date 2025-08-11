CREATE DATABASE transportadora;
USE transportadora;

CREATE TABLE Clientes(
	ID_Cliente INT,
    Nome_Cliente VARCHAR(100),
    Endereco_Cliente VARCHAR(255),
	CPF_Cliente VARCHAR(14),
    Telefone VARCHAR(18)
);

CREATE TABLE Entregas(
	ID_Entrega INT,
    Nome_Cliente VARCHAR(100),
    Nome_Entrega VARCHAR(100),
    Data_Entrega DATETIME,
    Endereco_Entrega VARCHAR(255)
);

CREATE TABLE Produtos(
	ID_Produto INT,
    Nome_Produto VARCHAR(100),
	Valor_Produto DECIMAL,
    Frete DECIMAL,
    Tipo_Produto VARCHAR(20)
);
CREATE TABLE Funcionarios(
	ID_Funcionarios INT,
    Nome_Funcionario VARCHAR(100),
	CPF_Funcionario VARCHAR(14),
    Cargo VARCHAR(100),
    Salario DECIMAL
);

CREATE TABLE Veiculos(
	ID_Veiculo INT,
    Nome_Motorista VARCHAR(100),
    Tipo_Veiculo VARCHAR(50),
    Placa_Veiculo VARCHAR(19),
    Marca_Veiculo VARCHAR(100)
);
