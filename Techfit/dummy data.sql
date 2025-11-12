-- Garante que estamos usando o banco de dados correto
USE Techfit;

-- 1. Usuarios (Base para Alunos e Funcionarios)
-- (Nota: 'senha_hash' é simulada. Use hashes reais em produção, ex: bcrypt)
INSERT INTO Usuarios (email, tipo, senha_hash, avatar)
VALUES
('ana.silva@email.com', 'aluno', '202cb962ac59075b964b07152d234b70', DEFAULT),
('bruno.costa@techfit.com', 'funcionario', '202cb962ac59075b964b07152d234b70', DEFAULT),
('carla.dias@email.com', 'aluno', '202cb962ac59075b964b07152d234b70', DEFAULT),
('daniel.moreira@techfit.com', 'funcionario', '202cb962ac59075b964b07152d234b70', DEFAULT);

-- 2. Modalidades (Independente)
INSERT INTO Modalidades (nome_modalidade, descricao)
VALUES
('Musculação', 'Treinamento de força com pesos livres e máquinas.'),
('Yoga', 'Prática de posturas, respiração e meditação para equilíbrio.'),
('Crossfit', 'Treinamento funcional de alta intensidade.');

-- 3. Filiais (Independente)
INSERT INTO Filiais (nome_filial, endereco, telefone)
VALUES
('Techfit Centro', 'Rua Principal, 123, Centro', '(11) 98765-4321'),
('Techfit Bairro Norte', 'Avenida Norte, 456, Bairro Norte', '(11) 91234-5678');

-- 4. Planos (Independente)
INSERT INTO Planos (nome_plano, descricao_plano, preco, duracao)
VALUES
('Plano Básico Mensal', 'Acesso a todas as áreas de musculação.', 99.90, 30),
('Plano Premium Anual', 'Acesso total, incluindo todas as aulas.', 1199.00, 365),
('Plano Aulas', 'Acesso apenas às aulas de Yoga e Crossfit.', 79.90, 30);

-- 5. Estoque (Independente)
INSERT INTO Estoque (quantidade, tipo_produto)
VALUES
(150, 'Whey Protein 1kg'),
(300, 'Barra de Cereal'),
(50, 'Camiseta Techfit M');

-- 6. Alunos (Depende de Usuarios)
-- (id_usuario = 1 -> Ana)
INSERT INTO Alunos (nome_aluno, genero, data_nascimento, endereco, telefone, codigo_acesso, id_usuario)
VALUES
('Ana Silva', 'Feminino', '1995-03-15', 'Rua das Flores, 10', '(11) 98888-1111', 'ANA2025', 1);
-- (id_usuario = 3 -> Carla)
INSERT INTO Alunos (nome_aluno, genero, data_nascimento, endereco, telefone, codigo_acesso, id_usuario)
VALUES
('Carla Dias', 'Feminino', '2000-11-20', 'Avenida da Paz, 20', '(11) 97777-2222', 'CARLA2025', 3);

-- 7. Funcionarios (Depende de Usuarios)
-- (id_usuario = 2 -> Bruno)
INSERT INTO Funcionarios (nome_funcionario, salario, carga_horaria, cpf_funcionario, cargo, id_usuario)
VALUES
('Bruno Costa', 3500.00, 40, '111.222.333-44', 'Instrutor', 2);
-- (id_usuario = 4 -> Daniel)
INSERT INTO Funcionarios (nome_funcionario, salario, carga_horaria, cpf_funcionario, cargo, id_usuario)
VALUES
('Daniel Moreira', 6000.00, 44, '555.666.777-88', 'Gerente', 4);

-- 8. Aulas (Depende de Funcionarios, Modalidades, Filiais)
-- (Bruno=1, Yoga=2, Centro=1)
INSERT INTO Aulas (dia_aula, quantidade_pessoas, id_funcionario, id_modalidade, id_filial)
VALUES
('2025-11-15', 20, 1, 2, 1); -- Aula de Yoga c/ Bruno na Filial Centro
-- (Bruno=1, Crossfit=3, Norte=2)
INSERT INTO Aulas (dia_aula, quantidade_pessoas, id_funcionario, id_modalidade, id_filial)
VALUES
('2025-11-16', 15, 1, 3, 2); -- Aula de Crossfit c/ Bruno na Filial Norte

-- 9. Aulas_Aluno (Junction: Aulas, Alunos)
-- (Ana=1 na Aula de Yoga=1)
INSERT INTO Aulas_Aluno (id_aula, id_aluno)
VALUES
(1, 1);
-- (Carla=2 na Aula de Yoga=1)
INSERT INTO Aulas_Aluno (id_aula, id_aluno)
VALUES
(1, 2);
-- (Ana=1 na Aula de Crossfit=2)
INSERT INTO Aulas_Aluno (id_aula, id_aluno)
VALUES
(2, 1);

-- 10. Treinos (Depende de Alunos, Funcionarios)
-- (Treino para Ana=1, criado por Bruno=1)
INSERT INTO Treinos (nome_treino, descricao, dia_treino, id_aluno, id_funcionario)
VALUES
('Treino A - Foco em Pernas', 'Agachamento, Leg Press, Extensora.', '2025-11-12', 1, 1);
-- (Treino para Carla=2, criado por Bruno=1)
INSERT INTO Treinos (nome_treino, descricao, dia_treino, id_aluno, id_funcionario)
VALUES
('Treino B - Foco em Superiores', 'Supino, Puxada, Rosca Direta.', '2025-11-13', 2, 1);

-- 11. Avaliacoes (Depende de Alunos, Funcionarios)
-- (Ana=1 avalia Bruno=1)
INSERT INTO Avaliacoes (comentarios, nota, id_aluno, id_funcionario)
VALUES
('O Bruno é um ótimo instrutor, muito atencioso!', 9.5, 1, 1);
-- (Carla=2 avalia Bruno=1)
INSERT INTO Avaliacoes (comentarios, nota, id_aluno, id_funcionario)
VALUES
('A aula de Crossfit foi incrível, mas muito pesada.', 8.0, 2, 1);

-- 12. Suporte (Depende de Alunos)
-- (Ticket de Ana=1)
INSERT INTO Suporte (ticket, status, categoria_suporte, descricao_suporte, id_aluno)
VALUES
('TKT-2025-001', 'Aberto', 'Equipamento', 'A máquina de leg press da filial Centro está fazendo barulho.', 1);

-- 13. Avisos (Depende de Funcionarios)
-- (Aviso do Gerente Daniel=2)
INSERT INTO Avisos (titulo, tipo, conteudo, expira, data_criacao, id_funcionario)
VALUES
('Manutenção Piscina', 'Manutencao', 'A piscina da Filial Centro estará fechada para manutenção dia 20/11.', '2025-11-21', '2025-11-12', 2);
-- (Aviso de Promoção - Daniel=2)
INSERT INTO Avisos (titulo, tipo, conteudo, expira, data_criacao, id_funcionario)
VALUES
('Black Friday Techfit!', 'Promocao', 'Descontos de 50% na anuidade do Plano Premium!', '2025-11-30', '2025-11-10', 2);

-- 14. Pagamentos (Depende de Alunos)
-- (Pagamento da Ana=1)
INSERT INTO Pagamentos (status, data_pagamento, valor, metodo_pagamento, id_aluno)
VALUES
('Aprovado', '2025-11-05 10:00:00', 1199.00, 'Cartão de Crédito', 1);
-- (Pagamento da Carla=2)
INSERT INTO Pagamentos (status, data_pagamento, valor, metodo_pagamento, id_aluno)
VALUES
('Pendente', '2025-11-10 00:00:00', 99.90, 'Boleto', 2);

-- 15. Mensagens (Depende de Usuarios)
-- (Bruno [user 2] envia para Ana [user 1])
INSERT INTO Mensagens (titulo, corpo, data_envio, id_destinatario, id_remetente)
VALUES
('Seu novo treino', 'Oi Ana, já lancei seu novo treino (Treino A) no sistema!', '2025-11-12 11:00:00', 1, 2);
-- (Ana [user 1] envia para Bruno [user 2])
INSERT INTO Mensagens (titulo, corpo, data_envio, id_destinatario, id_remetente)
VALUES
('Re: Seu novo treino', 'Obrigada, Bruno! Vou começar hoje mesmo.', '2025-11-12 11:05:00', 2, 1);

-- 16. Planos_Aluno (Junction: Alunos, Planos)
-- (Ana=1 tem o Plano Premium=2)
INSERT INTO Planos_Aluno (id_aluno, id_plano, data_inicio, data_fim, status)
VALUES
(1, 2, '2025-11-05', '2026-11-05', 'ativo');
-- (Carla=2 tem o Plano Básico=1)
INSERT INTO Planos_Aluno (id_aluno, id_plano, data_inicio, data_fim, status)
VALUES
(2, 1, '2025-11-10', '2025-12-10', 'ativo');

-- 17. Checkin (Depende de Filiais, Alunos)
-- (Ana=1 na Filial Centro=1)
INSERT INTO Checkin (data_checkin, id_filial, id_aluno)
VALUES
('2025-11-12 09:00:00', 1, 1);
-- (Carla=2 na Filial Norte=2)
INSERT INTO Checkin (data_checkin, id_filial, id_aluno)
VALUES
('2025-11-12 15:00:00', 2, 2);

-- 18. Agendamento (Depende de Aulas, Alunos)
-- (Ana=1 agenda Aula de Yoga=1)
INSERT INTO Agendamento (data_agendamento, status, id_aula, id_aluno)
VALUES
('2025-11-12', 'agendado', 1, 1);
-- (Carla=2 agenda Aula de Crossfit=2)
INSERT INTO Agendamento (data_agendamento, status, id_aula, id_aluno)
VALUES
('2025-11-12', 'agendado', 2, 2);