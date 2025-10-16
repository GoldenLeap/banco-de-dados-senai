-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: techfit
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `techfit`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `techfit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `techfit`;

--
-- Table structure for table `agendamento`
--

DROP TABLE IF EXISTS `agendamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamento` (
  `id_agendamento` int NOT NULL AUTO_INCREMENT,
  `data_agendamento` date NOT NULL,
  `status` enum('agendado','cancelado','espera') DEFAULT NULL,
  `id_aula` int NOT NULL,
  `id_aluno` int NOT NULL,
  PRIMARY KEY (`id_agendamento`),
  KEY `idx_agendamento_aluno` (`id_aluno`),
  KEY `idx_agendamento_aula` (`id_aula`),
  KEY `idx_agendamento_status` (`status`),
  CONSTRAINT `agendamento_ibfk_1` FOREIGN KEY (`id_aula`) REFERENCES `aulas` (`id_aula`),
  CONSTRAINT `agendamento_ibfk_2` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamento`
--

LOCK TABLES `agendamento` WRITE;
/*!40000 ALTER TABLE `agendamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `agendamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alunos` (
  `id_aluno` int NOT NULL AUTO_INCREMENT,
  `nome_aluno` varchar(100) NOT NULL,
  `genero` varchar(8) NOT NULL,
  `data_agendamento` date NOT NULL,
  `data_nascimento` date NOT NULL,
  `endereco` text NOT NULL,
  `telefone` varchar(19) NOT NULL,
  `codigo_acesso` varchar(100) DEFAULT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_aluno`),
  UNIQUE KEY `codigo_acesso` (`codigo_acesso`),
  KEY `idx_alunos_usuario` (`id_usuario`),
  KEY `idx_alunos_codigo_acesso` (`codigo_acesso`),
  CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aulas`
--

DROP TABLE IF EXISTS `aulas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aulas` (
  `id_aula` int NOT NULL AUTO_INCREMENT,
  `dia_aula` date NOT NULL,
  `quantidade_pessoas` int NOT NULL,
  `id_funcionario` int NOT NULL,
  `id_modalidade` int NOT NULL,
  `id_filial` int NOT NULL,
  PRIMARY KEY (`id_aula`),
  KEY `idx_aulas_funcionario` (`id_funcionario`),
  KEY `idx_aulas_modalidade` (`id_modalidade`),
  KEY `idx_aulas_filial` (`id_filial`),
  KEY `idx_aulas_dia` (`dia_aula`),
  CONSTRAINT `aulas_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`),
  CONSTRAINT `aulas_ibfk_2` FOREIGN KEY (`id_modalidade`) REFERENCES `modalidades` (`id_modalidade`),
  CONSTRAINT `aulas_ibfk_3` FOREIGN KEY (`id_filial`) REFERENCES `filiais` (`id_filial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aulas`
--

LOCK TABLES `aulas` WRITE;
/*!40000 ALTER TABLE `aulas` DISABLE KEYS */;
/*!40000 ALTER TABLE `aulas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aulas_aluno`
--

DROP TABLE IF EXISTS `aulas_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aulas_aluno` (
  `id_aula` int NOT NULL,
  `id_aluno` int NOT NULL,
  PRIMARY KEY (`id_aula`,`id_aluno`),
  KEY `idx_aulas_aluno_aluno` (`id_aluno`),
  CONSTRAINT `aulas_aluno_ibfk_1` FOREIGN KEY (`id_aula`) REFERENCES `aulas` (`id_aula`),
  CONSTRAINT `aulas_aluno_ibfk_2` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aulas_aluno`
--

LOCK TABLES `aulas_aluno` WRITE;
/*!40000 ALTER TABLE `aulas_aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `aulas_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacoes`
--

DROP TABLE IF EXISTS `avaliacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacoes` (
  `id_avaliacao` int NOT NULL AUTO_INCREMENT,
  `comentarios` varchar(255) NOT NULL,
  `nota` decimal(4,2) NOT NULL,
  `id_aluno` int NOT NULL,
  `id_funcionario` int NOT NULL,
  PRIMARY KEY (`id_avaliacao`),
  KEY `idx_avaliacoes_aluno` (`id_aluno`),
  KEY `idx_avaliacoes_funcionario` (`id_funcionario`),
  CONSTRAINT `avaliacoes_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`),
  CONSTRAINT `avaliacoes_ibfk_2` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacoes`
--

LOCK TABLES `avaliacoes` WRITE;
/*!40000 ALTER TABLE `avaliacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avisos`
--

DROP TABLE IF EXISTS `avisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avisos` (
  `id_alerta` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `tipo` enum('Comunicado','Promocao','Evento','Manutencao','MudancaHorario','Novidade','DicaSaude','AvisoSeguranca') NOT NULL,
  `conteudo` text NOT NULL,
  `expira` date NOT NULL,
  `data_criacao` date NOT NULL,
  `id_funcionario` int NOT NULL,
  PRIMARY KEY (`id_alerta`),
  KEY `idx_avisos_funcionario` (`id_funcionario`),
  KEY `idx_avisos_tipo` (`tipo`),
  KEY `idx_avisos_expira` (`expira`),
  CONSTRAINT `avisos_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avisos`
--

LOCK TABLES `avisos` WRITE;
/*!40000 ALTER TABLE `avisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `avisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkin`
--

DROP TABLE IF EXISTS `checkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkin` (
  `id_checkin` int NOT NULL AUTO_INCREMENT,
  `data_checkin` datetime NOT NULL,
  `id_filial` int NOT NULL,
  `id_aluno` int NOT NULL,
  PRIMARY KEY (`id_checkin`),
  KEY `idx_checkin_filial` (`id_filial`),
  KEY `idx_checkin_aluno` (`id_aluno`),
  KEY `idx_checkin_data` (`data_checkin`),
  CONSTRAINT `checkin_ibfk_1` FOREIGN KEY (`id_filial`) REFERENCES `filiais` (`id_filial`),
  CONSTRAINT `checkin_ibfk_2` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkin`
--

LOCK TABLES `checkin` WRITE;
/*!40000 ALTER TABLE `checkin` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `id_estoque` int NOT NULL AUTO_INCREMENT,
  `quantidade` int DEFAULT NULL,
  `tipo_produto` varchar(100) NOT NULL,
  PRIMARY KEY (`id_estoque`),
  KEY `idx_estoque_tipo_produto` (`tipo_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filiais`
--

DROP TABLE IF EXISTS `filiais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filiais` (
  `id_filial` int NOT NULL AUTO_INCREMENT,
  `nome_filial` varchar(100) NOT NULL,
  `endereco` text NOT NULL,
  `telefone` varchar(16) NOT NULL,
  PRIMARY KEY (`id_filial`),
  UNIQUE KEY `idx_filiais_nome` (`nome_filial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filiais`
--

LOCK TABLES `filiais` WRITE;
/*!40000 ALTER TABLE `filiais` DISABLE KEYS */;
/*!40000 ALTER TABLE `filiais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id_funcionario` int NOT NULL AUTO_INCREMENT,
  `nome_funcionario` varchar(100) NOT NULL,
  `salario` decimal(8,2) NOT NULL,
  `carga_horaria` int NOT NULL,
  `cpf_funcionario` varchar(16) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_funcionario`),
  KEY `idx_funcionarios_usuario` (`id_usuario`),
  KEY `idx_funcionarios_cpf` (`cpf_funcionario`),
  CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Cleitinho',1.50,10000,'123.456.789-01','admin',1);
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensagens`
--

DROP TABLE IF EXISTS `mensagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensagens` (
  `id_mensagem` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `corpo` text NOT NULL,
  `data_envio` datetime NOT NULL,
  `data_exclusao` date DEFAULT NULL,
  `apagado` tinyint(1) DEFAULT '0',
  `id_destinatario` int NOT NULL,
  `id_remetente` int NOT NULL,
  PRIMARY KEY (`id_mensagem`),
  KEY `idx_mensagens_destinatario` (`id_destinatario`),
  KEY `idx_mensagens_remetente` (`id_remetente`),
  KEY `idx_mensagens_data_envio` (`data_envio`),
  CONSTRAINT `mensagens_ibfk_1` FOREIGN KEY (`id_destinatario`) REFERENCES `alunos` (`id_aluno`),
  CONSTRAINT `mensagens_ibfk_2` FOREIGN KEY (`id_remetente`) REFERENCES `funcionarios` (`id_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensagens`
--

LOCK TABLES `mensagens` WRITE;
/*!40000 ALTER TABLE `mensagens` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalidades`
--

DROP TABLE IF EXISTS `modalidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modalidades` (
  `id_modalidade` int NOT NULL AUTO_INCREMENT,
  `nome_modalidade` varchar(100) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id_modalidade`),
  UNIQUE KEY `idx_modalidades_nome` (`nome_modalidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidades`
--

LOCK TABLES `modalidades` WRITE;
/*!40000 ALTER TABLE `modalidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `modalidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamentos`
--

DROP TABLE IF EXISTS `pagamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamentos` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `status` varchar(12) NOT NULL,
  `data_pagamento` datetime NOT NULL,
  `valor` decimal(9,2) NOT NULL,
  `metodo_pagamento` varchar(100) NOT NULL,
  `id_aluno` int NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `idx_pagamentos_aluno` (`id_aluno`),
  KEY `idx_pagamentos_status` (`status`),
  KEY `idx_pagamentos_data` (`data_pagamento`),
  CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamentos`
--

LOCK TABLES `pagamentos` WRITE;
/*!40000 ALTER TABLE `pagamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planos`
--

DROP TABLE IF EXISTS `planos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planos` (
  `id_plano` int NOT NULL AUTO_INCREMENT,
  `nome_plano` varchar(100) NOT NULL,
  `descricao_plano` varchar(255) NOT NULL,
  `preco` decimal(5,2) NOT NULL,
  `duracao` int NOT NULL,
  PRIMARY KEY (`id_plano`),
  UNIQUE KEY `idx_planos_nome` (`nome_plano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planos`
--

LOCK TABLES `planos` WRITE;
/*!40000 ALTER TABLE `planos` DISABLE KEYS */;
/*!40000 ALTER TABLE `planos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planos_aluno`
--

DROP TABLE IF EXISTS `planos_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planos_aluno` (
  `id_aluno` int NOT NULL,
  `id_plano` int NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `status` enum('ativo','suspenso','cancelado') NOT NULL DEFAULT 'ativo',
  PRIMARY KEY (`id_aluno`,`id_plano`),
  KEY `idx_planos_aluno_aluno` (`id_aluno`),
  KEY `idx_planos_aluno_plano` (`id_plano`),
  KEY `idx_planos_aluno_status` (`status`),
  CONSTRAINT `planos_aluno_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`),
  CONSTRAINT `planos_aluno_ibfk_2` FOREIGN KEY (`id_plano`) REFERENCES `planos` (`id_plano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planos_aluno`
--

LOCK TABLES `planos_aluno` WRITE;
/*!40000 ALTER TABLE `planos_aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `planos_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suporte`
--

DROP TABLE IF EXISTS `suporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suporte` (
  `ticket` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `categoria_suporte` varchar(50) NOT NULL,
  `descricao_suporte` varchar(255) NOT NULL,
  `id_aluno` int NOT NULL,
  PRIMARY KEY (`ticket`),
  KEY `idx_suporte_aluno` (`id_aluno`),
  KEY `idx_suporte_status` (`status`),
  KEY `idx_suporte_ticket` (`ticket`),
  CONSTRAINT `suporte_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suporte`
--

LOCK TABLES `suporte` WRITE;
/*!40000 ALTER TABLE `suporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `suporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treinos`
--

DROP TABLE IF EXISTS `treinos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treinos` (
  `id_treino` int NOT NULL AUTO_INCREMENT,
  `nome_treino` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `dia_treino` date NOT NULL,
  PRIMARY KEY (`id_treino`),
  KEY `idx_treinos_dia` (`dia_treino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treinos`
--

LOCK TABLES `treinos` WRITE;
/*!40000 ALTER TABLE `treinos` DISABLE KEYS */;
/*!40000 ALTER TABLE `treinos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `tipo` enum('usuario','funcionario') NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `idx_usuarios_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'teste@teste.com','funcionario','80177534a0c99a7e3645b52f2027a48b');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-16 13:31:29
