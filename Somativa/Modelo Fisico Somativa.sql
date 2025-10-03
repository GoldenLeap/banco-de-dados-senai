-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.
CREATE DATABASE Somativa;
USE Somativa;

CREATE TABLE Avaliacoes (
nota DECIMAL(4,2) NOT NULL ,
comentario VARCHAR(255) NOT NULL,
id_avaliacao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_inscricao INT
);

CREATE TABLE Cursos (
id_curso INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
descricao VARCHAR(255) NOT NULL,
carga_horaria INT NOT NULL,
titulo VARCHAR(100) NOT NULL,
status TINYINT NOT NULL
);

CREATE TABLE Alunos (
nome VARCHAR(200) NOT NULL,
email VARCHAR(50) NOT NULL,
data_nascimento DATE NOT NULL,
id_aluno INT PRIMARY KEY NOT NULL AUTO_INCREMENT
);

CREATE TABLE Inscricoes (
id_inscricao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
data_inscricao DATE NOT NULL,
id_curso INT NOT NULL,
id_aluno INT NOT NULL,
FOREIGN KEY(id_curso) REFERENCES Cursos (id_curso),
FOREIGN KEY(id_aluno) REFERENCES Alunos (id_aluno)
);

ALTER TABLE Avaliacoes ADD FOREIGN KEY(id_inscricao) REFERENCES Inscricoes (id_inscricao);

