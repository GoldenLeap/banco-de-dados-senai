-- Usar o banco
USE Mecanica;

-- ======================
-- CLIENTES
-- ======================
INSERT INTO Clientes (CPF, Telefone, Nome_cliente)
VALUES
('123.456.789-00', '(11) 99999-1111', 'João Silva'),
('987.654.321-00', '(11) 98888-2222', 'Maria Oliveira'),
('456.789.123-00', '(11) 97777-3333', 'Carlos Pereira'),
('321.654.987-00', '(11) 96666-4444', 'Ana Souza'),
('654.321.987-00', '(11) 95555-5555', 'Fernanda Costa');

-- ======================
-- VEÍCULOS
-- ======================
INSERT INTO Veiculos (Placa_veiculo, Modelo, Marca, ID_Cliente)
VALUES
('ABC1A23', 'Civic', 'Honda', 1),
('XYZ9B88', 'Corolla', 'Toyota', 2),
('JKL3C45', 'Fiesta', 'Ford', 3),
('MNO7D22', 'Onix', 'Chevrolet', 4),
('PQR5E55', 'Golf', 'Volkswagen', 5);

-- ======================
-- MECÂNICOS
-- ======================
INSERT INTO Mecanicos (Nome_Mecanico, CPF, Especialidade, Salario)
VALUES
('Pedro Lima', '111.222.333-44', 'Motor', 3500.00),
('Ricardo Alves', '222.333.444-55', 'Freios', 3200.00),
('Lucas Santos', '333.444.555-66', 'Suspensão', 3000.00),
('Marcos Vinícius', '444.555.666-77', 'Elétrica', 3700.00),
('Tiago Costa', '555.666.777-88', 'Pintura', 3100.00);

-- ======================
-- SERVIÇOS
-- ======================
INSERT INTO Servicos (ID_Servico, Valor, Nome_Servico, Descricao)
VALUES
(1, 250.00, 'Troca de óleo', 'Substituição do óleo do motor e filtro'),
(2, 800.00, 'Troca de embreagem', 'Substituição completa do kit de embreagem'),
(3, 450.00, 'Revisão de freios', 'Troca das pastilhas e verificação do sistema'),
(4, 600.00, 'Alinhamento e balanceamento', 'Serviço completo de alinhamento e balanceamento das rodas'),
(5, 1200.00, 'Pintura completa', 'Pintura total do veículo com polimento');

-- ======================
-- PEÇAS
-- ======================
INSERT INTO Pecas (Tipo_peca, Nome_peca, Descricao)
VALUES
('Motor', 'Filtro de óleo', 'Filtro de óleo sintético para motor 1.6'),
('Freios', 'Pastilha de freio', 'Jogo de pastilhas dianteiras'),
('Suspensão', 'Amortecedor dianteiro', 'Amortecedor dianteiro original'),
('Elétrica', 'Bateria 60Ah', 'Bateria selada 60 amperes'),
('Pintura', 'Tinta automotiva preta', 'Tinta preta sólida para pintura automotiva');

-- ======================
-- ESTOQUE
-- ======================
INSERT INTO Estoque (Quantidade, ID_Peca)
VALUES
(20, 1),
(15, 2),
(10, 3),
(8, 4),
(5, 5);

-- ======================
-- ORDENS DE SERVIÇO
-- ======================
INSERT INTO Ordens_Servico (Data_ordem, Total, Placa_veiculo, ID_Cliente)
VALUES
('2025-10-01 10:00:00', 250.00, 'ABC1A23', 1),
('2025-10-02 14:30:00', 1250.00, 'XYZ9B88', 2),
('2025-10-05 09:15:00', 450.00, 'JKL3C45', 3),
('2025-10-07 13:45:00', 600.00, 'MNO7D22', 4),
('2025-10-09 16:00:00', 1200.00, 'PQR5E55', 5);

-- ======================
-- OS_MECANICOS (quem trabalhou em qual ordem)
-- ======================
INSERT INTO OS_Mecanicos (ID_Ordem, ID_Mecanico)
VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 2),
(4, 3),
(5, 5);

-- ======================
-- OS_SERVICOS (serviços feitos em cada ordem)
-- ======================
INSERT INTO OS_Servicos (ID_Ordem, ID_Servico)
VALUES
(1, 1),  -- Troca de óleo
(2, 2),  -- Troca de embreagem
(3, 3),  -- Revisão de freios
(4, 4),  -- Alinhamento e balanceamento
(5, 5);  -- Pintura completa

-- ======================
-- PECA_SERVICOS (quais peças são usadas em quais serviços)
-- ======================
INSERT INTO Peca_Servicos (ID_Peca, ID_Servico)
VALUES
(1, 1),  -- Filtro de óleo -> Troca de óleo
(2, 3),  -- Pastilha de freio -> Revisão de freios
(3, 4),  -- Amortecedor -> Alinhamento e balanceamento
(5, 5);  -- Tinta preta -> Pintura completa
