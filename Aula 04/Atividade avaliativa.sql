CREATE DATABASE atividadeavaliativa1;

USE atividadeavaliativa1;

CREATE TABLE fornecedor(
	f_codigo INT AUTO_INCREMENT PRIMARY KEY,
    f_nome VARCHAR(100),
	f_status VARCHAR(11),
    cidade VARCHAR(100)
);

CREATE TABLE peca(
	p_codigo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	cor VARCHAR(20) NOT NULL,
    peso DECIMAL(2,2) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    p_nome VARCHAR(100) NOT NULL
);

CREATE TABLE instituicao(
	i_codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE projeto(
	pr_codigo INT PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(100),
    i_codigo INT,
    FOREIGN KEY (i_codigo) REFERENCES instituicao(i_codigo)
);

CREATE TABLE Fornecimento(
	id_fornecimento INT PRIMARY KEY AUTO_INCREMENT,
    pr_codigo INT,
    f_codigo INT,
    p_codigo INT,
    FOREIGN KEY (pr_codigo) REFERENCES projeto(pr_codigo),
    FOREIGN KEY (f_codigo) REFERENCES fornecedor(f_codigo),
    FOREIGN KEY (p_codigo) REFERENCES peca(p_codigo)
);
-- EX 2
ALTER TABLE fornecedor
CHANGE f_codigo f_cod INT;

ALTER TABLE Instituicao RENAME cidade;
ALTER TABLE cidade CHANGE
i_codigo ccod INT,
CHANGE nome cnome VARCHAR(100),
ADD uf VARCHAR(2);
