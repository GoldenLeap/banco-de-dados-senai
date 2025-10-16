CREATE TABLE Usuarios (
    id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    tipo ENUM('aluno', 'funcionario') NOT NULL
);

CREATE TABLE Alunos (
    id_aluno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_aluno VARCHAR(100) NOT NULL,
    genero VARCHAR(8) NOT NULL,
    data_agendamento DATE NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco TEXT NOT NULL,
    telefone VARCHAR(19) NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Funcionarios (
    id_funcionario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    cpf_funcionario VARCHAR(16) NOT NULL,
    salario DECIMAL(8,2) NOT NULL,
    carga_horaria INT NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Aulas (
    id_aula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dia_aula DATE NOT NULL,
    quantidade_pessoas INT NOT NULL,
    id_funcionario INT NOT NULL,
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario)
);

CREATE TABLE Agendamento (
    id_agendamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    status TINYINT NOT NULL DEFAULT 1,
    data_agendamento DATE NOT NULL,
    id_aula INT NOT NULL,
    id_aluno INT NOT NULL,
    FOREIGN KEY (id_aula) REFERENCES Aulas(id_aula),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)
);

CREATE TABLE Aulas_Aluno (
    id_aula INT NOT NULL,
    id_aluno INT NOT NULL,
    PRIMARY KEY (id_aula, id_aluno),
    FOREIGN KEY (id_aula) REFERENCES Aulas(id_aula),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)
);

CREATE TABLE Checkin (
    id_checkin INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_checkin DATETIME NOT NULL,
    id_aluno INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)
);

CREATE TABLE Pagamentos (
    id_pagamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(12) NOT NULL,
    data_pagamento DATETIME NOT NULL,
    valor DECIMAL(9, 2) NOT NULL,
    metodo_pagamento VARCHAR(100) NOT NULL,
    id_aluno INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)
);

CREATE TABLE Treinos (
    id_treino INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_treino VARCHAR(50) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    dia_treino DATE NOT NULL
);

CREATE TABLE Avaliacoes (
    id_avaliacao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    comentarios VARCHAR(255) NOT NULL,
    nota DECIMAL(4, 2) NOT NULL,
    id_aluno INT NOT NULL,
    id_funcionario INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario)
);

CREATE TABLE Suporte (
    ticket VARCHAR(255) NOT NULL PRIMARY KEY,
    status VARCHAR(20) NOT NULL,
    categoria_suporte VARCHAR(50) NOT NULL,
    descricao_suporte VARCHAR(255) NOT NULL,
    id_aluno INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)
);

CREATE TABLE Avisos (
    id_aviso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    conteudo TEXT NOT NULL,
    expira DATE NOT NULL,
    data_criacao DATE NOT NULL,
    id_funcionario INT NOT NULL,
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario)
);

CREATE TABLE Planos (
    id_plano INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_plano VARCHAR(100) NOT NULL,
    descricao_plano VARCHAR(255) NOT NULL,
    preco DECIMAL(5,2) NOT NULL,
    duracao INT NOT NULL
);
