USE somativa;
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
    ('2025-01-10', 1, 1), -- Cleber se inscreveu no curso 1 (Java)
    ('2025-01-11', 2, 2), -- Ana Clara se inscreveu no curso 2 (Banco de Dados)
    ('2025-01-12', 3, 3), -- Vinicius se inscreveu no curso 3 (Design Gráfico)
    ('2025-01-13', 4, 4), -- Carla se inscreveu no curso 4 (Marketing Digital)
    ('2025-01-14', 5, 5); -- Wanderley se inscreveu no curso 5 (Filosofia)

INSERT INTO Avaliacoes (nota, comentario, id_inscricao) VALUES
    (8.5, 'Bom curso de Java', 1),  -- Avaliação de Cleber no curso 1
    (9.0, 'Excelente conteúdo de SQL', 2),  -- Avaliação de Ana Clara no curso 2
    (7.5, 'Aulas bem estruturadas', 3);  -- Avaliação de Vinicius no curso 3
