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
-- Table structure for table `ordens_servico`
--

DROP TABLE IF EXISTS `ordens_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordens_servico` (
  `ID_Ordem` int NOT NULL AUTO_INCREMENT,
  `Data_ordem` datetime NOT NULL,
  `Total` decimal(32,2) NOT NULL,
  `Placa_veiculo` varchar(10) NOT NULL,
  `ID_Cliente` int NOT NULL,
  `status` varchar(200) DEFAULT NULL,
  `Data_conclusao` date DEFAULT NULL,
  PRIMARY KEY (`ID_Ordem`),
  KEY `Placa_veiculo` (`Placa_veiculo`),
  KEY `ID_Cliente` (`ID_Cliente`),
  CONSTRAINT `ordens_servico_ibfk_1` FOREIGN KEY (`Placa_veiculo`) REFERENCES `veiculos` (`Placa_veiculo`),
  CONSTRAINT `ordens_servico_ibfk_2` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordens_servico`
--

LOCK TABLES `ordens_servico` WRITE;
/*!40000 ALTER TABLE `ordens_servico` DISABLE KEYS */;
INSERT INTO `ordens_servico` (`ID_Ordem`, `Data_ordem`, `Total`, `Placa_veiculo`, `ID_Cliente`, `status`, `Data_conclusao`) VALUES (1,'2025-12-01 10:00:00',150.00,'ABC1A23',1,'Em Execução','2025-12-30'),(2,'2025-01-11 14:30:00',400.00,'XYZ9B88',2,'Em Execução','2025-02-20'),(3,'2025-01-12 09:15:00',750.00,'HJK3E22',3,'Concluida','2025-03-20'),(4,'2025-11-01 10:20:00',200.00,'ABC1A23',1,'Concluida','2025-11-20');
/*!40000 ALTER TABLE `ordens_servico` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-01 16:54:30
