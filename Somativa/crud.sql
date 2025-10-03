USE somativa;

-- Inserts 
INSERT INTO Alunos(nome, email, data_nascimento) VALUES
	("Cleber da Silva", "clebinsilvana@teste.com", "2005-02-12"),
    ("Ana Clara de Souza", "anaclara@teste.com", "2004-05-31"),
    ("Vinicius da Silva", "vini.silva@teste.com", "1990-06-24"),
    ("Carla Soares", "carla.soares@teste.com", "1995-05-10"),
    ("Wanderley da Silva", "wandeba.silva@teste.com", "2000-05-10");

INSERT INTO Cursos (descricao, carga_horaria, titulo, status) VALUES
    ('Curso de Programação Java', 60, 'Java Básico', 1),    
    ('Curso de Banco de Dados', 50, 'SQL Avançado', 1),      
    ('Curso de Design Gráfico', 40, 'Photoshop para Iniciantes', 1),
    ('Curso de Marketing Digital', 45, 'SEO e Google Ads', 1), 
    ('Curso de Filosofia', 30, 'Introdução à Filosofia', 0);  

INSERT INTO Inscricoes (data_inscricao, id_curso, id_aluno) VALUES
    ('2025-01-10', 1, 1), 
    ('2025-01-11', 2, 2), 
    ('2025-01-12', 3, 3), 
    ('2025-01-13', 4, 4), 
    ('2025-01-14', 5, 5); 

INSERT INTO Avaliacoes (nota, comentario, id_inscricao) VALUES
    (8.5, 'Bom curso de Java', 1), 
    (9.0, 'Excelente conteúdo de SQL', 2), 
    (7.5, 'Aulas bem estruturadas', 3);  

-- Update
-- Alterar email de um aluno
UPDATE Alunos 
SET email="cleber.silva@teste.com"
WHERE id_aluno =1;

-- Alterar carga horaria de curso
UPDATE Cursos 
SET carga_horaria=55
WHERE id_curso=2;

-- Corrigir nome de aluno
UPDATE Alunos 
SET nome = 'Vinicius Soares da Silva'
WHERE id_aluno=3;

SELECT * FROM Alunos;
-- Mudar status de um curso
UPDATE Cursos
SET status = 0
WHERE id=4;

SELECT * FROM Cursos;

-- Alterar nota de uma avaliação 

UPDATE Avaliacoes
SET nota=10.0
WHERE id_avaliacao=2;

SELECT * FROM avaliacoes;

-- Exclusão de dados
select * from inscricoes;


-- Excluir inscrição
DELETE FROM Avaliacoes WHERE id_inscricao=2;
DELETE FROM Inscricoes 
WHERE id_inscricao = 2 AND id_aluno=2;

-- Excluir um curso
DELETE FROM Cursos WHERE id_curso=2;

-- Excluir uma avaliação ofensiva
INSERT INTO Avaliacoes(nota, comentario, id_inscricao) VALUES
	(0.0, "Um completo lixo.", 5);
DELETE FROM Avaliacoes WHERE id_inscricao=5;
    
-- Excluir um aluno 
SELECT * FROM Alunos;
DELETE FROM Alunos WHERE id_aluno=2;

-- Excluir todas as inscricoes de um curso encerrado
SELECT * FROM Inscricoes;
DELETE FROM Inscricoes WHERE id_curso IN (SELECT id_curso FROM Cursos WHERE status=0);

-- Consultar com criterios e agrupamentos

-- Listar todos os alunos cadastrados
SELECT COUNT(*) AS Total_Alunos
FROM Alunos;

-- Exibir apenas os nomes e e-mails dos alunos
SELECT nome, email FROM Alunos;

-- Listar cursos com carga horaria maior que 30 hroas

SELECT * FROM Cursos WHERE carga_horaria > 30.0;

-- Exibir cursos que estão inativos
SELECT * FROM Cursos WHERE status=0;

-- Buscar alunos nascidos após 1995
SELECT * FROM Alunos WHERE data_nascimento > "1994-12-31";

-- Exibir avaliacoes com nota maior que 9

INSERT INTO Avaliacoes(nota, comentario, id_inscricao) VALUES
	(10.0, "Muito bom", 4);
SELECT * FROM Avaliacoes WHERE Nota > 9.0;
-- Contar quantos cursos estão cadastrados
SELECT COUNT(*) AS Cursos_cadastrados
FROM Cursos; 
-- Listar os 3 cursos com maior carga horaria
SELECT * FROM Cursos ORDER BY Carga_horaria ASC LIMIT 3;   

-- Criar indice para busca rapida por email do aluno
CREATE UNIQUE INDEX idx_alunos_email ON Alunos(email);