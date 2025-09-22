-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

CREATE DATABASE livraria;
USE livraria;
SELECT DATABASE();

CREATE TABLE Autores (
ID_Autor INT NOT NULL AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
Nacionalidade VARCHAR(50) NOT NULL,
Nome_Autor VARCHAR(100) NOT NULL,
Data_Nascimento DATE NOT NULL
);

CREATE TABLE Editoras (
Nome_Editora VARCHAR(100) NOT NULL,
Contato VARCHAR(255) NOT NULL,
Telefone VARCHAR(18) NOT NULL,
Endereco VARCHAR(255) NOT NULL,
Cidade VARCHAR(100) NOT NULL,
CNPJ VARCHAR(18) NOT NULL PRIMARY KEY PRIMARY KEY
);

CREATE TABLE Clientes (
Nome_Cliente VARCHAR(100) NOT NULL,
CPF VARCHAR(18) NOT NULL PRIMARY KEY PRIMARY KEY,
Email VARCHAR(255) NOT NULL,
Telefone VARCHAR(19) NOT NULL,
Data_Nascimento DATE NOT NULL
);
# Create
CREATE TABLE Livros (
Nome_Livro VARCHAR(200) NOT NULL,
Editora VARCHAR(100) NOT NULL,
Autor VARCHAR(100) NOT NULL,
ID_Livro INT NOT NULL AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
Genero VARCHAR(50) NOT NULL,
Quantidade INT NOT NULL,
Preco DECIMAL(7,2) NOT NULL
);

CREATE TABLE Vendas (
ID_Vendas INT NOT NULL AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
Quantidade INT NOT NULL,
Valor_Total DEC(8,2) NOT NULL,
Data_Venda DATETIME NOT NULL,
CPF VARCHAR(18),
ID_Livro INT,
FOREIGN KEY(CPF) REFERENCES Clientes (CPF),
FOREIGN KEY(ID_Livro) REFERENCES Livros (ID_Livro)
);

/*
Relação entre autor e livro
CREATE TABLE Escreve (
ID_Autor INT,
ID_Livro INT,
FOREIGN KEY(ID_Autor) REFERENCES Autores (ID_Autor),
FOREIGN KEY(ID_Livro) REFERENCES Livros (ID_Livro)
);*/

/*
Relação entre livro e editora
CREATE TABLE Possui (
ID_Livro INT,
CNPJ VARCHAR(18),
FOREIGN KEY(ID_Livro) REFERENCES Livros (ID_Livro),
FOREIGN KEY(CNPJ) REFERENCES Editoras (CNPJ)
);
*/


/*
Relação entre Autor e editoras

CREATE TABLE Tem (
ID_Autor INT,
CNPJ VARCHAR(18),
FOREIGN KEY(ID_Autor) REFERENCES Autores (ID_Autor),
FOREIGN KEY(CNPJ) REFERENCES Editoras(CNPJ)
);

*/

INSERT INTO Autores (Nacionalidade, Nome_Autor, Data_Nascimento) VALUES
('Brasileiro', 'José de Alencar', '1829-05-01'),
('Brasileiro', 'Clarice Lispector', '1920-12-10'),
('Português', 'José Saramago', '1922-11-16'),
('EUA', 'Ernest Hemingway', '1899-07-21'),
('Japonês', 'Haruki Murakami', '1949-01-12');
SELECT * FROM Autores;

INSERT INTO Editoras (Nome_Editora, Contato, Telefone, Endereco, Cidade, CNPJ) VALUES
('Editora Globo', 'contato@editoraglobo.com.br', '(11) 99999-9999', 'Av. Paulista, 1000', 'São Paulo', '12.345.678/0001-90'),
('Companhia das Letras', 'atendimento@companiadasletras.com.br', '(11) 98888-8888', 'Rua dos Três Irmãos, 200', 'São Paulo', '23.456.789/0001-01'),
('Penguin Random House', 'suporte@penguin.com', '(21) 97777-7777', 'Rua Fictícia, 300', 'Rio de Janeiro', '34.567.890/0001-12'),
('Editora Record', 'atendimento@editorarecord.com.br', '(21) 95555-5555', 'Av. Rio Branco, 400', 'Rio de Janeiro', '45.678.901/0001-23'),
('HarperCollins', 'contato@harpercollins.com.br', '(51) 94444-4444', 'Rua dos Livros, 500', 'Porto Alegre', '56.789.012/0001-34');
SELECT * FROM Editoras;

INSERT INTO Clientes (Nome_Cliente, CPF, Email, Telefone, Data_Nascimento) VALUES
('Ana Silva', '123.456.789-00', 'ana.silva@email.com', '(11) 99999-1234', '1985-05-15'),
('Carlos Souza', '987.654.321-00', 'carlos.souza@email.com', '(21) 98888-5678', '1992-11-23'),
('Julia Martins', '111.222.333-44', 'julia.martins@email.com', '(31) 97777-4321', '1980-07-10'),
('Pedro Almeida', '444.555.666-77', 'pedro.almeida@email.com', '(41) 96666-3456', '1995-03-25'),
('Laura Oliveira', '888.999.000-11', 'laura.oliveira@email.com', '(51) 95555-6789', '1990-09-18');
SELECT * FROM Clientes;

INSERT INTO Livros (Nome_Livro, Editora, Autor, Genero, Quantidade, Preco) VALUES
('Iracema', 'Editora Globo', 'José de Alencar', 'Romance', 20, 39.90),
('A Hora da Estrela', 'Companhia das Letras', 'Clarice Lispector', 'Ficção', 15, 49.90),
('Ensaio Sobre a Cegueira', 'Penguin Random House', 'José Saramago', 'Drama', 10, 59.90),
('O Velho e o Mar', 'Editora Record', 'Ernest Hemingway', 'Aventura', 25, 29.90),
('Kafka à Beira-Mar', 'HarperCollins', 'Haruki Murakami', 'Ficção', 30, 69.90);
SELECT * FROM Livros;
# Simulando restoque de um livro
# Update
UPDATE Livros
SET Quantidade = 40 WHERE Nome_Livro='O Velho e o Mar';


INSERT INTO Vendas (Quantidade, Valor_Total, Data_Venda, CPF, ID_Livro) VALUES
(2, 79.80, '2025-09-20 10:15:00', '123.456.789-00', 1),
(1, 49.90, '2025-09-21 14:20:00', '987.654.321-00', 2),
(3, 179.70, '2025-09-21 16:00:00', '111.222.333-44', 3),
(1, 29.90, '2025-09-21 17:30:00', '444.555.666-77', 4),
(5, 349.50, '2025-09-22 09:00:00', '888.999.000-11', 5);
# Read
SELECT * FROM Vendas;

# Delete
DELETE FROM Vendas WHERE ID_Livro = 4;
DELETE FROM Livros WHERE ID_Livro = 4;





