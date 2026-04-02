-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: medicamentos
-- ------------------------------------------------------
-- Server version	8.0.36
CREATE DATABASE `medicamentos`;
use `medicamentos`;
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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cpf_cliente` varchar(11) NOT NULL,
  `nome_cliente` varchar(40) NOT NULL,
  `email` varchar(25) DEFAULT NULL,
  `data_de_nascimento` date NOT NULL,
  PRIMARY KEY (`cpf_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('11890023414','Daniel Abrantes','daniel@email.com','1991-04-11'),('12345678901','Euclidis da Cunha','euclidis@email.com','1980-05-15'),('23456789012','Fernando Pessoa','fernando@email.com','1982-02-28'),('29022345222','Cleber Amaral','camaral@email.com','1998-09-23'),('33301034101','Fabio Cortes','fabio@email.com','1989-01-30'),('34567890123','Joana de Almeida','joana@email.com','1985-09-10'),('45678901234','Carlos da Silva','carlos@email.com','2008-12-20'),('56789012345','Bianca Nunes','bianca@email.com','1995-04-05'),('67890123456','Gilberto Pessoa','gilberto@email.com','2000-07-12'),('78901234567','Fabiana de Almeida','fabiana@email.com','1999-11-30'),('89012345678','Ana Pessoa','ana@email.com','2007-03-25');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_endereco`
--

DROP TABLE IF EXISTS `cliente_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_endereco` (
  `cpf_cliente` varchar(11) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `cidade` varchar(20) NOT NULL,
  `bairro` varchar(20) NOT NULL,
  `rua` varchar(30) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `cep` varchar(15) NOT NULL,
  PRIMARY KEY (`cpf_cliente`),
  CONSTRAINT `fk_cliente_endereco_cliente` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`cpf_cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_endereco`
--

LOCK TABLES `cliente_endereco` WRITE;
/*!40000 ALTER TABLE `cliente_endereco` DISABLE KEYS */;
INSERT INTO `cliente_endereco` VALUES ('12345678901','SP','São Paulo','Centro','Rua XV de Novembro','123','01234-567'),('23456789012','RJ','Rio de Janeiro','Copacabana','Avenida Beira Rio','456','04567-890'),('34567890123','MG','Belo Horizonte','Savassi','Avenida Tiradentes','789','05678-901'),('45678901234','RS','Porto Alegre','Moinhos de Vento','Avenida Dom Pedro','801','06789-012'),('56789012345','PR','Curitiba','Batel','Rua Emiliano Costa','202','07890-123'),('67890123456','SP','São Paulo','Vila Madalena','Rua Das Alamedas','303','08901-234'),('78901234567','SP','São Paulo','Ipiranga','Avenida Getulio Vargas','585','09012-345'),('89012345678','SP','São Paulo','Liberdade','Rua Coronel Leonidas','757','09123-456');
/*!40000 ALTER TABLE `cliente_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_telefone`
--

DROP TABLE IF EXISTS `cliente_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_telefone` (
  `cpf_cliente` varchar(15) NOT NULL,
  `telefone_celular` varchar(15) NOT NULL,
  `telefone_residencial` varchar(15) DEFAULT NULL,
  `telefone_comercial` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cpf_cliente`),
  CONSTRAINT `fk_cliente_telefone_cliente` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`cpf_cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_telefone`
--

LOCK TABLES `cliente_telefone` WRITE;
/*!40000 ALTER TABLE `cliente_telefone` DISABLE KEYS */;
INSERT INTO `cliente_telefone` VALUES ('12345678901','1198765421','1123456789','1133334411'),('23456789012','2199998881','2145678901','2112345678'),('34567890123','3198800771','3123456789','3155556600'),('45678901234','5199996662','5123456789','5133334488'),('56789012345','4199811771','4123456789','4144499556'),('67890123456','1199777662','7123456789','1133399441'),('78901234567','1199622555','8123456789','1133300442'),('89012345678','1199711440','6123456789','1133322443');
/*!40000 ALTER TABLE `cliente_telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fabricante`
--

DROP TABLE IF EXISTS `fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fabricante` (
  `codigo` varchar(15) NOT NULL,
  `razao_social` varchar(30) NOT NULL,
  `nome_fantasia` varchar(30) NOT NULL,
  `email` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabricante`
--

LOCK TABLES `fabricante` WRITE;
/*!40000 ALTER TABLE `fabricante` DISABLE KEYS */;
INSERT INTO `fabricante` VALUES ('F001','FarmA','Nossa Farma Farmacêutica','nossafarma@farma.com'),('F002','FarmB','Saúde Farmacêutica','contatosaude@farma.com'),('F003','FarmC','Quimica Boa Farmacêutica','quimicaboa@farma.com'),('F004','FarmD','Melhora Farmacêutica','melhora@farma.com'),('F005','FarmE','CEMAC Farmacêutica','cemac@farma.com'),('F006','FarmF','Quimio Farmacêutica','quimeiofarma@farma.com'),('F007','FarmG','Quimera Farmacêutica','quimerafarma@farma.com'),('F008','FarmH','Cooperativa Farmacêutica','coopfarma@farma.com'),('F009','FarmI','Vitta Farmacêutica','vittafarma@farma.com'),('F010','FarmJ','Vital Medical Farmacêutica','vmedical@farma.com'),('F011','FarmL','SANS Farmacêutica','sansfarma@farma.com');
/*!40000 ALTER TABLE `fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamento` (
  `codigo` varchar(10) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `codigo_fabricante` varchar(10) NOT NULL,
  `data_validade` date NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_medicamento_fabricante` (`codigo_fabricante`),
  CONSTRAINT `fk_medicamento_fabricante` FOREIGN KEY (`codigo_fabricante`) REFERENCES `fabricante` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento`
--

LOCK TABLES `medicamento` WRITE;
/*!40000 ALTER TABLE `medicamento` DISABLE KEYS */;
INSERT INTO `medicamento` VALUES ('M001','Paracetamol','F001','2025-12-31'),('M002','Ibuprofeno','F002','2024-06-30'),('M003','Amoxicilina','F003','2026-09-15'),('M004','Dipirona','F004','2023-12-20'),('M005','Omeprazol','F005','2024-11-30'),('M006','Ranitidina','F006','2026-08-25'),('M007','Losartana','F001','2024-07-10'),('M008','Metformina','F001','2025-11-05');
/*!40000 ALTER TABLE `medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `codigo` varchar(10) NOT NULL,
  `data_venda` date NOT NULL,
  `cpf_cliente` varchar(11) NOT NULL,
  `codigo_medicamento` varchar(10) NOT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_venda_cliente` (`cpf_cliente`),
  KEY `fk_venda_medicamento` (`codigo_medicamento`),
  CONSTRAINT `fk_venda_cliente` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`cpf_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_venda_medicamento` FOREIGN KEY (`codigo_medicamento`) REFERENCES `medicamento` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `venda_chk_1` CHECK ((`quantidade` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES ('V001','2023-01-15','12345678901','M001',2),('V002','2023-02-20','23456789012','M002',3),('V003','2023-02-25','34567890123','M003',3),('V004','2023-04-30','45678901234','M004',3),('V005','2023-02-10','56789012345','M005',4);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'medicamentos'
--

--
-- Dumping routines for database 'medicamentos'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-02 12:15:56
