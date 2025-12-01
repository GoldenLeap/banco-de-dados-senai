-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: mecanica
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pecas`
--

DROP TABLE IF EXISTS `pecas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pecas` (
  `ID_Peca` int NOT NULL AUTO_INCREMENT,
  `Tipo_peca` varchar(20) NOT NULL,
  `Nome_peca` varchar(100) NOT NULL,
  `Descricao` text NOT NULL,
  `preco_venda` decimal(9,2) DEFAULT NULL,
  `preco_custo` decimal(9,2) DEFAULT NULL,
  `Fabricante` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_Peca`),
  CONSTRAINT `CHK_preco_custo` CHECK ((`preco_venda` > `preco_custo`))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecas`
--

LOCK TABLES `pecas` WRITE;
/*!40000 ALTER TABLE `pecas` DISABLE KEYS */;
INSERT INTO `pecas` (`ID_Peca`, `Tipo_peca`, `Nome_peca`, `Descricao`, `preco_venda`, `preco_custo`, `Fabricante`) VALUES (1,'Motor','Filtro de Óleo','Filtro de óleo para motor 1.0/1.6',23.10,10.00,'Bosch'),(2,'Suspensão','Amortecedor','Amortecedor dianteiro',429.66,210.00,'Bosch'),(3,'Elétrica','Bateria 60Ah','Bateria automotiva 60 amperes',403.10,200.00,'Bosch'),(4,'eletrônica','Sensor de Temperatura','Sensor NTC 10k para controle térmico',29.90,15.00,'TecnoParts'),(5,'mecânica','Rolamento 6203','Rolamento blindado 6203 para motores e eixos',18.50,8.20,'SKF'),(6,'hidráulica','Válvula de Pressão','Válvula reguladora de pressão até 150 PSI',85.00,52.00,'HydroMax'),(7,'eletrônica','Placa Controladora','Controladora PWM para motores DC',120.00,78.50,'ControlTech'),(8,'acessório','Correia 5mm','Correia de transmissão 5mm para equipamentos diversos',12.00,4.80,'FlexBelt');
/*!40000 ALTER TABLE `pecas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-01 16:54:29
