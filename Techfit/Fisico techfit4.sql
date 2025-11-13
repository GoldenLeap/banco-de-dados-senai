
CREATE DATABASE Techfit CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE Techfit;

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    tipo ENUM('aluno', 'funcionario') NOT NULL,
    avatar VARCHAR(255) DEFAULT  'https://placehold.co/600x400',
    senha_hash VARCHAR(255) NOT NULL
);

CREATE TABLE Alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome_aluno VARCHAR(100) NOT NULL,
    genero VARCHAR(8) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco TEXT NOT NULL,
    telefone VARCHAR(19) NOT NULL,
    codigo_acesso VARCHAR(100) UNIQUE,
    id_usuario INT NOT NULL,
    FOREIGN KEY(id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario VARCHAR(100) NOT NULL,
    salario DECIMAL(8,2) NOT NULL,
    carga_horaria INT NOT NULL,
    cpf_funcionario VARCHAR(16) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY(id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Modalidades (
    id_modalidade INT AUTO_INCREMENT PRIMARY KEY,
    nome_modalidade VARCHAR(100) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE Filiais (
    id_filial INT AUTO_INCREMENT PRIMARY KEY,
    nome_filial VARCHAR(100) NOT NULL,
    endereco TEXT NOT NULL,
    telefone VARCHAR(16) NOT NULL
);

CREATE TABLE Aulas (
    id_aula INT AUTO_INCREMENT PRIMARY KEY,
    dia_aula DATE NOT NULL,
    quantidade_pessoas INT NOT NULL,
    id_funcionario INT NOT NULL,
    id_modalidade INT NOT NULL,
    id_filial INT NOT NULL,
    vagas INT NOT NULL,
    descricao VARCHAR(255) NOT NULL, 
    FOREIGN KEY(id_funcionario) REFERENCES Funcionarios(id_funcionario),
    FOREIGN KEY(id_modalidade) REFERENCES Modalidades(id_modalidade),
    FOREIGN KEY(id_filial) REFERENCES Filiais(id_filial)
);
SELECT * FROM MODALIDADES;






CREATE TABLE Aulas_Aluno (
    id_aula INT NOT NULL,
    id_aluno INT NOT NULL,
    PRIMARY KEY(id_aula, id_aluno),
    FOREIGN KEY(id_aula) REFERENCES Aulas(id_aula),
    FOREIGN KEY(id_aluno) REFERENCES Alunos(id_aluno)
);
SELECT 
		M.nome_modalidade,
		A.id_modalidade,
		AA.id_aula
		FROM 
			Aulas_Aluno AS AA
		INNER JOIN Aulas AS A ON AA.id_aula = A.id_aula
		INNER JOIN Modalidades AS M ON A.id_modalidade = M.id_modalidade
		WHERE 
			AA.id_aluno = 1;
CREATE TABLE Treinos (
    id_treino INT AUTO_INCREMENT PRIMARY KEY,
    nome_treino VARCHAR(50) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    dia_treino DATE NOT NULL
);

CREATE TABLE Avaliacoes (
    id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    comentarios VARCHAR(255) NOT NULL,
    nota DECIMAL(4,2) NOT NULL,
    id_aluno INT NOT NULL,
    id_funcionario INT NOT NULL,
    FOREIGN KEY(id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY(id_funcionario) REFERENCES Funcionarios(id_funcionario)
);

CREATE TABLE Suporte (
    ticket VARCHAR(255) PRIMARY KEY,
    status VARCHAR(20) NOT NULL,
    categoria_suporte VARCHAR(50) NOT NULL,
    descricao_suporte VARCHAR(255) NOT NULL,
    id_aluno INT NOT NULL,
    FOREIGN KEY(id_aluno) REFERENCES Alunos(id_aluno)
);

CREATE TABLE Avisos (
    id_alerta INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    tipo ENUM('Comunicado', 'Promocao', 'Evento', 'Manutencao', 'MudancaHorario', 'Novidade', 'DicaSaude', 'AvisoSeguranca') NOT NULL,
    conteudo TEXT NOT NULL,
    expira DATE NOT NULL,
    data_criacao DATE NOT NULL,
    id_funcionario INT NOT NULL,
    FOREIGN KEY(id_funcionario) REFERENCES Funcionarios(id_funcionario)
);

CREATE TABLE Pagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(12) NOT NULL,
    data_pagamento DATETIME NOT NULL,
    valor DECIMAL(9,2) NOT NULL,
    metodo_pagamento VARCHAR(100) NOT NULL,
    id_aluno INT NOT NULL,
    FOREIGN KEY(id_aluno) REFERENCES Alunos(id_aluno)
);

CREATE TABLE Mensagens (
    id_mensagem INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    corpo TEXT NOT NULL,
    data_envio DATETIME NOT NULL,
    data_exclusao DATE,
    apagado BOOLEAN DEFAULT false,
    id_destinatario INT NOT NULL,
    id_remetente INT NOT NULL,
    FOREIGN KEY(id_destinatario) REFERENCES Alunos(id_aluno),
    FOREIGN KEY(id_remetente) REFERENCES Funcionarios(id_funcionario)
);

CREATE TABLE Estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT,
    tipo_produto VARCHAR(100) NOT NULL
);

CREATE TABLE Planos (
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    nome_plano VARCHAR(100) NOT NULL,
    descricao_plano VARCHAR(255) NOT NULL,
    preco DECIMAL(9,2) NOT NULL,
    duracao INT NOT NULL
);

CREATE TABLE Planos_Aluno (
    id_aluno INT NOT NULL,
    id_plano INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    status ENUM('ativo', 'suspenso', 'cancelado') NOT NULL DEFAULT 'ativo',
    PRIMARY KEY(id_aluno, id_plano),
    FOREIGN KEY(id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY(id_plano) REFERENCES Planos(id_plano)
);

CREATE TABLE Checkin (
    id_checkin INT AUTO_INCREMENT PRIMARY KEY,
    data_checkin DATETIME NOT NULL,
    id_filial INT NOT NULL,
    id_aluno INT NOT NULL,
    FOREIGN KEY(id_filial) REFERENCES Filiais(id_filial),
    FOREIGN KEY(id_aluno) REFERENCES Alunos(id_aluno)
);

CREATE TABLE Agendamento (
    id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
    data_agendamento DATE NOT NULL,
    status ENUM('agendado', 'cancelado', 'espera'),
    id_aula INT NOT NULL,
    id_aluno INT NOT NULL,
    FOREIGN KEY(id_aula) REFERENCES Aulas(id_aula),
    FOREIGN KEY(id_aluno) REFERENCES Alunos(id_aluno)
);

-- Indexes para o agendamento
CREATE INDEX idx_agendamento_aluno ON Agendamento(id_aluno);
CREATE INDEX idx_agendamento_aula ON Agendamento(id_aula);
CREATE INDEX idx_agendamento_status ON Agendamento(status);

-- Indexes para a tabela Planos_Alunos
CREATE INDEX idx_planos_aluno_aluno ON Planos_Aluno(id_aluno);
CREATE INDEX idx_planos_aluno_plano ON Planos_Aluno(id_plano);
CREATE INDEX idx_planos_aluno_status ON Planos_Aluno(status);

-- index para o usuario
CREATE UNIQUE INDEX idx_usuarios_email ON Usuarios(email);

-- index para alunos
CREATE INDEX idx_alunos_usuario ON Alunos(id_usuario);
CREATE INDEX idx_alunos_codigo_acesso ON Alunos(codigo_acesso);

-- index para funcionarios
CREATE INDEX idx_funcionarios_usuario ON Funcionarios(id_usuario);
CREATE INDEX idx_funcionarios_cpf ON Funcionarios(cpf_funcionario);

-- index modalidades
CREATE UNIQUE INDEX idx_modalidades_nome ON Modalidades(nome_modalidade);

-- index filiais
CREATE UNIQUE INDEX idx_filiais_nome ON Filiais(nome_filial);

-- index aulas
CREATE INDEX idx_aulas_funcionario ON Aulas(id_funcionario);
CREATE INDEX idx_aulas_modalidade ON Aulas(id_modalidade);
CREATE INDEX idx_aulas_filial ON Aulas(id_filial);
CREATE INDEX idx_aulas_dia ON Aulas(dia_aula);

-- index aulas_aluno( relação entre o aluno e a aula que esta participando)
CREATE INDEX idx_aulas_aluno_aluno ON Aulas_Aluno(id_aluno);

-- index para os treinos
CREATE INDEX idx_treinos_dia ON Treinos(dia_treino);

-- indexes para as avaliações
CREATE INDEX idx_avaliacoes_aluno ON Avaliacoes(id_aluno);
CREATE INDEX idx_avaliacoes_funcionario ON Avaliacoes(id_funcionario);
-- indexes para suporte
CREATE INDEX idx_suporte_aluno ON Suporte(id_aluno);
CREATE INDEX idx_suporte_status ON Suporte(status);
CREATE INDEX idx_suporte_ticket on Suporte(ticket);


-- indexes para avisos
CREATE INDEX idx_avisos_funcionario ON Avisos(id_funcionario);
CREATE INDEX idx_avisos_tipo ON Avisos(tipo);
CREATE INDEX idx_avisos_expira ON Avisos(expira);

-- Indexes para pagamentos
CREATE INDEX idx_pagamentos_aluno ON Pagamentos(id_aluno);
CREATE INDEX idx_pagamentos_status ON Pagamentos(status);
CREATE INDEX idx_pagamentos_data ON Pagamentos(data_pagamento);

-- Indexes para mensagens
CREATE INDEX idx_mensagens_destinatario ON Mensagens(id_destinatario);
CREATE INDEX idx_mensagens_remetente ON Mensagens(id_remetente);
CREATE INDEX idx_mensagens_data_envio ON Mensagens(data_envio);

-- Index para Estoque
CREATE INDEX idx_estoque_tipo_produto ON Estoque(tipo_produto);

-- Index para Planos
CREATE UNIQUE INDEX idx_planos_nome ON Planos(nome_plano);

-- Indexes para Checkin
CREATE INDEX idx_checkin_filial ON Checkin(id_filial);
CREATE INDEX idx_checkin_aluno ON Checkin(id_aluno);
CREATE INDEX idx_checkin_data ON Checkin(data_checkin);


