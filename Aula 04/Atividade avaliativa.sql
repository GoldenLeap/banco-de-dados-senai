CREATE DATABASE atividadeavaliativa1;

USE atividadeavaliativa1; -- SELECT DATABASE();

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
-- Mostrar tabelas no banco de dados selecionado
SHOW TABLES;


-- EX 2
SHOW CREATE TABLE projeto;

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


-- drop foreign key projeto_ibfk_!
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

SHOW INDEX FROM projeto;
SHOW INDEX FROM fornecimento;

/*
ALTER TABLE fornecedor
	ADD COLUMN fone BIGINT NOT NULL;
    
ALTER TABLE fornecedor
	ADD CONSRAINT fk_ccod_fornecedor
    FOREIGN KEY (ccod)REFERENCES cidade(ccod);

SHOW CREATE TABLE fornecedor
*/

-- Cidade
INSERT INTO cidade VALUE (11, "Limeira", "SP");
INSERT INTO cidade VALUES
    (12, "Xique-Xique", "BA"),
    (13, "Rio de Janeiro", "RJ");

SELECT * FROM cidade;


-- Fornecedor

INSERT INTO fornecedor VALUES
	(null, 'Kalunga', 'Ativo', 'São Paulo'),
    (null,'LLC Logistica', 'Ativo' , 'Curitiba'),
    (null, 'Bees', 'Ativo', 'São José do Rio Preto'),
    (null, 'Hayamax', 'Ativo', 'Ibiporã')
;
UPDATE fornecedor SET sstatus = "Ativo" WHERE fcod = 2;
SELECT * FROM fornecedor;


INSERT INTO peca VALUES
	(null, "Vermelho", 1.5, "Capacitor Eletrolítico", 13)
;
    
SELECT * FROM peca;
