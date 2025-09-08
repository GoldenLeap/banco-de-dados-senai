CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Livros(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    preco DECIMAL(5,2) NOT NULL
);


CREATE TABLE Clientes(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade int NOT NULL,
    cpf VARCHAR(14) NOT NULL
);

INSERT INTO Livros(nome, descricao, preco) VALUES
	("O Pequeno Primcipi", "Um piloto cai com seu avião no deserto e ali encontra uma criança loura e frágil.", 37.12),
	("Harry Potter e a Pedra Filosofal", "Harry Potter é um garoto cujos pais, feiticeiros, foram assassinados por um poderosíssimo bruxo quando ele ainda era um bebê.", 43.22),
	("Alice no Pão das Padarias", "Uma menina, um coelho e uma história capazes de fazer qualquer um de nós voltar a sonhar. Alice é despertada de um leve sono ao pé de uma árvore por um coelho peculiar.", 46.46)
;

INSERT INTO Clientes(nome, idade, cpf) VALUES
	("Cleiton", 19, "123.456.789-01"),
	("Krebin", 11239, "123.456.789-01"),
	("Jessica", 29, "133.416.789-01"),
	("Andre", 10, "523.156.739-51");
    
SELECT * FROM Livros, Clientes;
ALTER TABLE Livros
ADD Autor varchar(100);

UPDATE Livros 
SET nome="Alice no País das Maravilhas" WHERE id = 3;

UPDATE Livros 
SET nome="O Pequeno Principe" 
WHERE id = 1;

UPDATE Livros
SET Autor= "Antoine de Saint-Exupéry" 
WHERE id=1;

UPDATE Livros 
SET Autor= "J. K. Rowling" 
WHERE id=2;

UPDATE Livros
SET Autor= "Lewis Carroll"
WHERE id=3; 

SELECT * FROM Livros;



UPDATE Clientes
SET cpf="123.456.789-01" WHERE cpf != "123.456.789-01";

UPDATE Clientes
SET idade=11 WHERE id=2;

SELECT * FROM Clientes;

DELETE FROM Clientes;
DELETE FROM Livros;

TRUNCATE TABLE Livros;
TRUNCATE TABLE Clientes;