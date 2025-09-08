CREATE DATABASE remoterc;
USE remoterc;
SELECT DATABASE();

CREATE TABLE produto(
	codigo INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    unidade CHAR(3) NOT NULL,
    descricao VARCHAR(30) NOT NULL,
    valor_unit DECIMAL(7,2) NOT NULL
);

CREATE TABLE vendedor (
	codigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    salario DECIMAL(7,2) NOT NULL,
    fsalarial CHAR(1) NOT NULL
);

INSERT INTO produto VALUES
	(null, "kg", "Teclado Semi-Mecânico Gamer", 350.50),
	(null, "kg", "Intel Core i5-10400F", 649.99),
	(null, "kg", "Headset Gamer", 94.99),
	(null, "kg", "AMD Ryzen 7 7800X3D", 2499.99);	
    
INSERT INTO produto(unidade, descricao, valor_unit) VALUES
	("kg", "Monitor Gamer", 1200.40);

-- Atualização de valores
UPDATE produto 
	SET valor_unit=4000.00 
	WHERE descricao="Monitor Gamer";

UPDATE produto
	SET valor_unit=1090.00,
    descricao = 'Intel Core I7-9700K'
    WHERE codigo = 14;

UPDATE produto
	SET valor_unit = valor_unit + (valor_unit *.10)
    WHERE codigo=14;

-- Apaga todos os valores
DELETE FROM produto;
SELECT * FROM produto;

SELECT * FROM vendedor;

INSERT INTO vendedor(nome, salario, fsalarial) VALUES
	("Cleiton", 1300, '1'),
	("Cleber", 1500, '1'),
	("Douglas", 5700, '3'),
	("Victor", 5300, '3'),
	("Andre", 2300, '2');


-- Altere o salario dos vendedores da faixa salarial 1 para 3150
UPDATE vendedor 
SET salario=3150 WHERE fsalarial=1;

--  De 10% de aumento para os funcionários da faixa salarial 2
UPDATE vendedor
SET salario=salario+(salario*.10) WHERE fsalarial=2;

-- Altere o salario dos vendedores da faixa salarial 3 para 3500
UPDATE vendedor
SET salario=3500 WHERE fsalarial=3;


DELETE FROM vendedor
WHERE salario < 2600;


-- Registro unico
DELETE FROM produos WHERE codigo= PCOD = '01';

-- Registro multiplo
DELETE FROM vendedor WHERE FSALARIAL =2;

-- Intervalo (Operador AND)
DELETE FROM vendedor WHERE fsalarial >=1 AND CODIGO <=2;


SELECT * FROM vendedor;

-- Esvaziando a Tabela
DELETE FROM clientes;

TRUNCATE TABLE produto;