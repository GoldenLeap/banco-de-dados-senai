CREATE DATABASE ReservaEquipamentos;

USE reservaequipamentos;

CREATE TABLE Equipamentos(
	ID_Equipamento INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome_Equipamento VARCHAR(100) NOT NULL,
    Descricao VARCHAR(255) NOT NULL,
    Quant INT DEFAULT 0,
    Valor_Equipamento DECIMAL(5,2)
);

CREATE TABLE Funcionarios(
	ID_Funcionario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome_Funcionario VARCHAR(200) NOT NULL,
    Cargo VARCHAR(50) NOT NULL,
    Salario DECIMAL(5,2),
    CPF_Funcionario VARCHAR(255)
);

CREATE TABLE Empresas(
	ID_Empresa INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome_Empresa VARCHAR(20) NOT NULL,
    Status_Reserva VARCHAR(20) NOT NULL,
    Data_Reserva DATE,
    Tipo_Empresa VARCHAR(20)
);

CREATE TABLE Fornecedor(
	ID_Fornecedor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome_Fornecedor VARCHAR(100) NOT NULL,
    Celular VARCHAR(18) NOT NULL,
    CNPJ VARCHAR(14) NOT NULL,
    Endereco VARCHAR(255) NOT NULL
);

CREATE TABLE Reservas(
	ID_Reserva INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	Data_Reserva DATETIME,
	Nome_Empresa VARCHAR(20),
    Tempo_Reserva INT,
	Nome_Equipamento VARCHAR(100)
);

CREATE TABLE Precisa(
	ID_Precisa INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	ID_Equipamento INT,
    ID_Empresa INT,
    ID_Reserva INT,
    FOREIGN KEY (ID_Equipamento) REFERENCES Equipamentos (ID_Equipamento),
    FOREIGN KEY (ID_Empresa) REFERENCES Empresas (ID_Empresa),
    FOREIGN KEY (ID_Reserva) REFERENCES Reservas (ID_Reserva)
);

CREATE TABLE Tem(
	ID_Equipamento INT,
    ID_Fornecedor INT,
    ID_Tem INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    FOREIGN KEY (ID_Equipamento) REFERENCES Equipamentos (ID_Equipamento),
	FOREIGN KEY (ID_Fornecedor) REFERENCES Fornecedor(ID_Fornecedor)
);
