CREATE DATABASE atividadeavaliativa1;

USE atividadeavaliativa1;

CREATE TABLE fornecedor(
	fcodigo INT AUTO_INCREMENT PRIMARY KEY,
    fnome VARCHAR(100),
	sstatus VARCHAR(11),
    cidade VARCHAR(100)
);

CREATE TABLE peca(
	pcodigo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	cor VARCHAR(20) NOT NULL,
    peso DECIMAL(2,2) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    pnome VARCHAR(100) NOT NULL
);

CREATE TABLE instituicao(
	icodigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE projeto(
	prcod INT PRIMARY KEY AUTO_INCREMENT,
    cidade VARCHAR(100),
    prnome VARCHAR(100),
    icodigo INT,
    FOREIGN KEY (icodigo) REFERENCES instituicao(icodigo)
);

CREATE TABLE Fornecimento(
	idfornecimento INT PRIMARY KEY AUTO_INCREMENT,
    prcod INT,
    fcodigo INT,
    pcodigo INT,
    FOREIGN KEY (prcod) REFERENCES projeto(prcod),
    FOREIGN KEY (fcodigo) REFERENCES fornecedor(fcodigo),
    FOREIGN KEY (pcodigo) REFERENCES peca(pcodigo)
);
-- EX 2
ALTER TABLE `atividadeavaliativa1`.`fornecedor` 
CHANGE COLUMN `fcodigo` `fcod` INT NOT NULL AUTO_INCREMENT ;

ALTER TABLE Instituicao RENAME cidade;

ALTER TABLE cidade CHANGE COLUMN
`icodigo` `ccod` INT NOT NULL AUTO_INCREMENT,
CHANGE nome cnome VARCHAR(100),
ADD uf VARCHAR(2);

ALTER TABLE `atividadeavaliativa1`.`peca` 
CHANGE COLUMN `pcodigo` `pcod` INT NOT NULL AUTO_INCREMENT,
CHANGE pnome pnome VARCHAR(100), 
ADD ccod INT, 
ADD FOREIGN KEY (ccod) REFERENCES cidade(ccod);

ALTER TABLE Projeto
drop cidade,
RENAME COLUMN `icodigo` TO `ccod`;

ALTER TABLE fornecimento
RENAME COLUMN `fcodigo` TO `fcod`,
RENAME COLUMN `pcodigo`TO `pcod`,
ADD COLUMN `Quantidade` int;

CREATE UNIQUE INDEX idx_pcod ON peca(pcod);
CREATE UNIQUE INDEX idx_ccod ON cidade(ccod);
CREATE UNIQUE INDEX idx_fornecimento_idforn ON fornecimento(idfornecimento);


