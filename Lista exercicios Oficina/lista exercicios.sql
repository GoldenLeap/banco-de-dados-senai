# Selecionar todos os veiculos da marca "ford"
SELECT * FROM Veiculos WHERE marca = "Ford";

# Mostrar as ordens de serviço dos ultimos 6 meses
SELECT * FROM Clientes as cli INNER JOIN ordens_servico AS os ON cli.ID_Cliente = os.ID_Cliente
WHERE os.Data_ordem >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

# Mecanicos com especialidade em injeção eletronica
SELECT * FROM mecanicos WHERE Especialidade="Injeção Eletrônica";

# Ordens de serviço com o status 	"Aguardando Peça"
SELECT * FROM ordens_servico WHERE status = "Aguardando Peça";

# Listar peças que estão com o estoque abaixo de 5
SELECT * FROM Pecas as pc INNER JOIN Estoque as stq ON pc.ID_peca = stq.ID_peca 
WHERE stq.quantidade < 5;

# Encontrar veiculos que ja tiveram mais de uma ordem de serviço
SELECT Placa_veiculo, COUNT(Placa_veiculo) FROM ordens_servico GROUP BY Placa_veiculo HAVING COUNT(Placa_veiculo) > 1;

# Ordens realizadas por um mecanico especifico
SELECT * FROM os_mecanicos INNER JOIN ordens_servico AS os WHERE ID_Mecanico=3;

# listar nome e preco_venda de pecas aonde o preco_custo é maior que 200
SELECT nome_peca, preco_venda FROM pecas WHERE preco_custo > 200;

# Update 
# adicionar 5% de aumento no preco_venda das pecas da fabricante Bosch
UPDATE Pecas
 mecanica
SET preco_venda=preco_venda * 1.05
WHERE fabricante="Bosch";

# Modificar o status da ordem de serviço de id 3 (não tenho a 105) para "Concluida"
UPDATE ordens_servico SET status="Concluida" WHERE id_ordem=3;

# Atualizar a data_conclusao de todas as ordens de serviço que ainda estão em execução e foram abertas há mais de 30 dias
UPDATE ordens_servico SET data_conclusao="2025-12-30" WHERE status="Em Execução" AND data_ordem >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

# Dobrar a quantidade do estoque da peça de id 3 (não tenho a 20)
UPDATE estoque set quantidade=quantidade*2 WHERE id_peca=3;

# ALTER TABLE

# adicionar coluna email na tabela clientes
ALTER TABLE Clientes 
ADD email varchar(150);

# modificar o tipo da coluna especialidade para varchar(150)
ALTER TABLE mecanicos MODIFY COLUMN Especialidade VARCHAR(150);
# Remover uma coluna da tabela ordens servico
ALTER TABLE ordens_servico ADD teste VARCHAR(1);
ALTER TABLE ordens_servico DROP COLUMN teste;

# Adicionar restrição check
ALTER TABLE pecas ADD CONSTRAINT CHK_preco_custo CHECK (preco_venda > preco_custo);

# JOIN

# Listar todas as ordens de serviço incluindo o nome do cliente, placa do veiculo e data de abertura 
SELECT 
    cli.Nome_cliente,
    v.Placa_veiculo,
    os.data_ordem
FROM ordens_servico AS os
JOIN veiculos AS v 
    ON os.Placa_veiculo = v.Placa_veiculo
JOIN Clientes AS cli
    ON os.id_cliente = cli.id_cliente;
    
# Mostrar todas as peças usadas no OS de id 3 (não tenho 50), incluindo nome da peça e quantidade usada
SELECT  p.Nome_peca, 
ps.qnt_usada FROM ordens_servico AS os
JOIN peca_servicos AS ps ON ps.ID_Servico = os.ID_Ordem
JOIN pecas AS p ON ps.ID_Peca = p.ID_Peca
WHERE os.ID_Ordem = 3;

# exibir os nomes dos mecanicos que trabalharam na OS 3(não tenho 75) 
SELECT m.nome_mecanico FROM ordens_servico AS os
JOIN os_mecanicos AS osm ON osm.ID_Ordem = os.ID_Ordem 
JOIN mecanicos as m ON osm.ID_Mecanico = m.ID_Mecanico WHERE os.ID_Ordem=3;

# Listar todos os veiculos e nome do proprietario
SELECT Veiculos.Placa_veiculo, Veiculos.modelo, cli.Nome_cliente FROM Veiculos JOIN Clientes as cli ON cli.ID_Cliente = Veiculos.ID_Cliente;

# INNER JOIN

# Listar a placa e o modelo de veiculos que estão em uma os "em execução"
SELECT Veiculos.Placa_veiculo, Veiculos.modelo FROM Veiculos INNER JOIN ordens_servico AS os ON os.Placa_veiculo=veiculos.Placa_veiculo WHERE os.status="Em Execução";

# Mostrar nome de clientes que possuem um veiculo da marca Volkswagen
SELECT Clientes.nome_cliente FROM clientes INNER JOIN veiculos ON veiculos.ID_Cliente=Clientes.ID_Cliente WHERE Veiculos.marca="Volkswagen";

# Exibir o nome dos mecanicos que já trabalharam em pelo menos uma ordem de serviço 
SELECT DISTINCT Mecanicos.nome_mecanico FROM Mecanicos INNER JOIN os_mecanicos as osm ON osm.ID_Mecanico = Mecanicos.id_mecanico;

# Listar apenas os nomes dos serviços que aparecem no OS_Servicos
SELECT DISTINCT servicos.Nome_Servico FROM servicos INNER JOIN os_servicos as oss ON oss.ID_Servico=servicos.ID_Servico;

# Left JOIN
# listar todos os clientes cadastrados e aqueles com OS mostrar o id da os
SELECT clientes.Nome_cliente, os.ID_Ordem from clientes LEFT JOIN ordens_servico as os ON os.ID_Cliente=clientes.ID_Cliente ;

# Mostrar todos os mecanicos e a quantidade de OS de cada um
SELECT 
    mecanicos.Nome_mecanico, 
    COUNT(os_mecanicos.ID_Mecanico) AS qtd_os
FROM mecanicos
LEFT JOIN os_mecanicos 
    ON os_mecanicos.ID_Mecanico = mecanicos.ID_Mecanico
GROUP BY mecanicos.ID_Mecanico, mecanicos.Nome_mecanico;

# Exibir todas as peças cadastradas e se houver a quantidade total vendida de cada um 
SELECT 
    p.Nome_peca,
    COALESCE(SUM(ps.qnt_usada), 0) AS total_quantidade_vendida,
    COALESCE(SUM(ps.qnt_usada) * p.preco_venda, 0) AS total_venda
FROM pecas p
LEFT JOIN PECA_SERVICOS ps 
    ON ps.id_peca = p.id_peca
GROUP BY 
    p.id_peca, 
    p.Nome_peca,
    p.preco_venda;

# Exibir veiculos e a data da ultima OS aberta
SELECT v.Placa_veiculo, v.Modelo, os.Data_ordem FROM veiculos as v LEFT JOIN ordens_servico as os ON os.Placa_veiculo=v.Placa_veiculo;

# RIGHT JOIN 
# Listar ordens de servico e cliente correspondente
SELECT  os.ID_Ordem,clientes.Nome_cliente from clientes RIGHT JOIN ordens_servico as os ON os.ID_Cliente=clientes.ID_Cliente ;
# Mostre todos os serviços e os IDs das OS onde eles foram usados
SELECT 
    s.ID_Servico,
    s.Nome_Servico,
    oss.ID_Ordem
FROM os_servicos AS oss
RIGHT JOIN servicos AS s
    ON s.ID_Servico = oss.ID_Servico;

# Exiba todos os itens da tabela OS_Mecanicos e traga o nome completo do Mecânico da tabela Mecanicos
SELECT 
    osm.ID_Ordem,
    osm.ID_Mecanico,
    m.Nome_mecanico
FROM os_mecanicos AS osm
RIGHT JOIN mecanicos AS m
    ON m.ID_Mecanico = osm.ID_Mecanico;
# Liste todos os veículos e as OS associadas 
 
SELECT *
FROM Veiculos v
LEFT JOIN ordens_servico os ON os.Placa_veiculo = v.Placa_veiculo;

# Subqueries
# encontrar cliente que já abriu mais de 3 ordens de serviço
SELECT  c.Nome_cliente, COUNT(o.ID_Cliente) AS total_ordens FROM Clientes as c
JOIN 
    Ordens_Servico as o
    ON c.ID_Cliente = o.ID_Cliente
GROUP BY 
    c.ID_Cliente, c.Nome_cliente
HAVING 
    COUNT(o.ID_Cliente) > 3;
# identificar peças que foram usadas na mesma ordem de serviço do mecanico com id 3
SELECT DISTINCT p.Nome_Peca
FROM pecas p
JOIN peca_servicos ps ON ps.ID_Peca = p.ID_Peca
WHERE ps.ID_Servico IN (
    SELECT os_serv.ID_Servico
    FROM os_mecanicos osm
    JOIN os_servicos os_serv ON os_serv.ID_Ordem = osm.ID_Ordem
    WHERE osm.ID_Mecanico = 3
);
# Listar os veiculos que nunca tiveram uma ordem de serviço
SELECT Placa_veiculo, Modelo
FROM Veiculos
WHERE Placa_veiculo NOT IN (
    SELECT Placa_veiculo
    FROM ordens_servico
);

# Encontrar serviços cujo valor é maior que o preço medio de todos os serviços
SELECT Nome_Servico, valor
FROM servicos
WHERE valor > (
    SELECT AVG(valor)
    FROM servicos
);

