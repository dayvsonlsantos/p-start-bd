-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: localhost    Database: ilumiant
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `ilumi_avali`
--

DROP TABLE IF EXISTS `ilumi_avali`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ilumi_avali` (
  `n_iduser` int NOT NULL,
  `n_idservforn` int NOT NULL,
  `n_pontavali` float(2,1) NOT NULL,
  `c_comentavali` varchar(255) DEFAULT NULL,
  KEY `fk_ilumi_avali_ilumi_user1_idx` (`n_iduser`),
  KEY `fk_ilumi_avali_ilumi_servforn1_idx` (`n_idservforn`),
  CONSTRAINT `fk_ilumi_avali_ilumi_servforn1` FOREIGN KEY (`n_idservforn`) REFERENCES `ilumi_servforn` (`n_idservforn`),
  CONSTRAINT `fk_ilumi_avali_ilumi_user1` FOREIGN KEY (`n_iduser`) REFERENCES `ilumi_user` (`n_iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ilumi_avali`
--

LOCK TABLES `ilumi_avali` WRITE;
/*!40000 ALTER TABLE `ilumi_avali` DISABLE KEYS */;
INSERT INTO `ilumi_avali` VALUES (1,1,4.0,'Serviço muito bom!');
/*!40000 ALTER TABLE `ilumi_avali` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ilumi_cadastro`
--

DROP TABLE IF EXISTS `ilumi_cadastro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ilumi_cadastro` (
  `n_idcad` int NOT NULL AUTO_INCREMENT,
  `c_cpfcad` varchar(11) NOT NULL,
  `c_nomecad` varchar(50) NOT NULL,
  `c_emailcad` varchar(45) NOT NULL,
  `c_senhacad` varchar(16) NOT NULL,
  `c_telefonecad` varchar(12) NOT NULL,
  PRIMARY KEY (`n_idcad`),
  UNIQUE KEY `c_emailcad_UNIQUE` (`c_emailcad`),
  UNIQUE KEY `c_telefonecad_UNIQUE` (`c_telefonecad`),
  UNIQUE KEY `c_cpfcad_UNIQUE` (`c_cpfcad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ilumi_cadastro`
--

LOCK TABLES `ilumi_cadastro` WRITE;
/*!40000 ALTER TABLE `ilumi_cadastro` DISABLE KEYS */;
INSERT INTO `ilumi_cadastro` VALUES (1,'42196423297','Antônio Lacerda de Nobrega','toninholacerda@gmail.com','tonho3297','081994423232'),(2,'43851498957','Marcos Aurelio Santana de Souza','marcos.santana@gmail.com','mar22946738','081984325202');
/*!40000 ALTER TABLE `ilumi_cadastro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ilumi_servforn`
--

DROP TABLE IF EXISTS `ilumi_servforn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ilumi_servforn` (
  `n_idservforn` int NOT NULL AUTO_INCREMENT,
  `n_iduser` int NOT NULL,
  `n_idservi` int NOT NULL,
  `n_cnpjcad` varchar(14) DEFAULT NULL,
  `c_descservi` varchar(300) DEFAULT NULL,
  `c_formaservi` varchar(12) NOT NULL,
  `c_estadoservi` varchar(2) DEFAULT NULL,
  `c_cidadeservi` varchar(30) DEFAULT NULL,
  `c_imgservia` varchar(250) DEFAULT NULL,
  `c_imgservib` varchar(250) DEFAULT NULL,
  `c_imgservic` varchar(250) DEFAULT NULL,
  `c_imgservid` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`n_idservforn`),
  KEY `fk_ilumi_servforn_ilumi_serviços1_idx` (`n_idservi`),
  KEY `fk_ilumi_servforn_ilumi_user1_idx` (`n_iduser`),
  CONSTRAINT `fk_ilumi_servforn_ilumi_serviços1` FOREIGN KEY (`n_idservi`) REFERENCES `ilumi_servicos` (`n_idservi`),
  CONSTRAINT `fk_ilumi_servforn_ilumi_user1` FOREIGN KEY (`n_iduser`) REFERENCES `ilumi_user` (`n_iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ilumi_servforn`
--

LOCK TABLES `ilumi_servforn` WRITE;
/*!40000 ALTER TABLE `ilumi_servforn` DISABLE KEYS */;
INSERT INTO `ilumi_servforn` VALUES (1,2,1,'','Planejo o espaço interno de sua residência ou estabelecimento, com o intuito de prover um ambiente mais agradável para todos.','Presencial','PE','Recife','https://www.facebook.com/FotosAleatoriasDeGenteAleatoria','https://www.facebook.com/FotosAleatoriasDeGenteAleatoria','https://www.facebook.com/FotosAleatoriasDeGenteAleatoria','https://www.facebook.com/FotosAleatoriasDeGenteAleatoria');
/*!40000 ALTER TABLE `ilumi_servforn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ilumi_servicos`
--

DROP TABLE IF EXISTS `ilumi_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ilumi_servicos` (
  `n_idservi` int NOT NULL AUTO_INCREMENT,
  `c_nomeservi` varchar(40) NOT NULL,
  `c_descservi` varchar(100) NOT NULL,
  PRIMARY KEY (`n_idservi`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ilumi_servicos`
--

LOCK TABLES `ilumi_servicos` WRITE;
/*!40000 ALTER TABLE `ilumi_servicos` DISABLE KEYS */;
INSERT INTO `ilumi_servicos` VALUES (1,'Designer de Interiores','Planeja e projeta os mais diferentes espaços internos residenciais, comerciais e institucionais.');
/*!40000 ALTER TABLE `ilumi_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ilumi_user`
--

DROP TABLE IF EXISTS `ilumi_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ilumi_user` (
  `n_iduser` int NOT NULL AUTO_INCREMENT,
  `n_idcad` int NOT NULL,
  `c_enderecouser` varchar(150) NOT NULL,
  `d_nasciuser` date NOT NULL,
  `c_estadouser` varchar(2) NOT NULL,
  `c_cidadeuser` varchar(30) NOT NULL,
  `c_imguser` varchar(250) NOT NULL,
  `c_prestserv` tinyint(1) NOT NULL,
  PRIMARY KEY (`n_iduser`),
  KEY `fk_ilumi_user_ilumi_cadastro1_idx` (`n_idcad`),
  CONSTRAINT `fk_ilumi_user_ilumi_cadastro1` FOREIGN KEY (`n_idcad`) REFERENCES `ilumi_cadastro` (`n_idcad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ilumi_user`
--

LOCK TABLES `ilumi_user` WRITE;
/*!40000 ALTER TABLE `ilumi_user` DISABLE KEYS */;
INSERT INTO `ilumi_user` VALUES (1,1,'Rua das Palmeiras Numero 333','2001-09-21','PE','Abreu e Lima','https://www.facebook.com/FotosAleatoriasDeGenteAleatoria',0),(2,2,'Rua rose e silva, numero 53','1995-10-05','PE','Recife','https://www.facebook.com/FotosAleatoriasDeGenteAleatoria',1);
/*!40000 ALTER TABLE `ilumi_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-29 13:26:03
