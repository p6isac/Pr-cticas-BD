-- MySQL dump 10.13  Distrib 5.7.17, for Win32 (AMD64)
--
-- Host: localhost    Database: escuela
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumnos` (
  `No_cuenta` varchar(9) NOT NULL,
  `Nombre` varchar(25) DEFAULT NULL,
  `ApPat` varchar(50) DEFAULT NULL,
  `ApMat` varchar(50) DEFAULT NULL,
  `Direccion` varchar(60) DEFAULT NULL,
  `Fechnac` varchar(30) DEFAULT NULL,
  `CP` varchar(5) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`No_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aniocurso`
--

DROP TABLE IF EXISTS `aniocurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aniocurso` (
  `IDanio` varchar(2) NOT NULL,
  `mateimpar` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`IDanio`),
  KEY `mateimpar` (`mateimpar`),
  CONSTRAINT `aniocurso_ibfk_1` FOREIGN KEY (`mateimpar`) REFERENCES `asignatura` (`IDmateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aniocurso`
--

LOCK TABLES `aniocurso` WRITE;
/*!40000 ALTER TABLE `aniocurso` DISABLE KEYS */;
/*!40000 ALTER TABLE `aniocurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignatura`
--

DROP TABLE IF EXISTS `asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignatura` (
  `IDmateria` varchar(5) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `profesor` varchar(40) DEFAULT NULL,
  `H_impartidas` varchar(3) DEFAULT NULL,
  `salon` varchar(10) DEFAULT NULL,
  `grupo` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`IDmateria`),
  KEY `profesor` (`profesor`),
  KEY `salon` (`salon`),
  KEY `grupo` (`grupo`),
  CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`profesor`) REFERENCES `maestros` (`No_trabajador`),
  CONSTRAINT `asignatura_ibfk_2` FOREIGN KEY (`salon`) REFERENCES `salones` (`codigoS`),
  CONSTRAINT `asignatura_ibfk_3` FOREIGN KEY (`grupo`) REFERENCES `grupos` (`IDgrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignatura`
--

LOCK TABLES `asignatura` WRITE;
/*!40000 ALTER TABLE `asignatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupos` (
  `IDgrupo` varchar(3) NOT NULL,
  `tutor` varchar(20) DEFAULT NULL,
  `anio_grupos` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`IDgrupo`),
  KEY `tutor` (`tutor`),
  KEY `anio_grupos` (`anio_grupos`),
  CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`tutor`) REFERENCES `maestros` (`No_trabajador`),
  CONSTRAINT `grupos_ibfk_2` FOREIGN KEY (`anio_grupos`) REFERENCES `aniocurso` (`IDanio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maestros`
--

DROP TABLE IF EXISTS `maestros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maestros` (
  `No_trabajador` varchar(10) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `ApPat` varchar(40) DEFAULT NULL,
  `ApMat` varchar(40) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `fechnac` varchar(5) DEFAULT NULL,
  `CP` varchar(5) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`No_trabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maestros`
--

LOCK TABLES `maestros` WRITE;
/*!40000 ALTER TABLE `maestros` DISABLE KEYS */;
/*!40000 ALTER TABLE `maestros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registroclases`
--

DROP TABLE IF EXISTS `registroclases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registroclases` (
  `alumno` varchar(80) DEFAULT NULL,
  `calificacion` varchar(2) DEFAULT NULL,
  `reportes` varchar(100) DEFAULT NULL,
  `anio` varchar(2) DEFAULT NULL,
  KEY `alumno` (`alumno`),
  KEY `anio` (`anio`),
  CONSTRAINT `registroclases_ibfk_1` FOREIGN KEY (`alumno`) REFERENCES `alumnos` (`No_cuenta`),
  CONSTRAINT `registroclases_ibfk_2` FOREIGN KEY (`anio`) REFERENCES `aniocurso` (`IDanio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registroclases`
--

LOCK TABLES `registroclases` WRITE;
/*!40000 ALTER TABLE `registroclases` DISABLE KEYS */;
/*!40000 ALTER TABLE `registroclases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salones`
--

DROP TABLE IF EXISTS `salones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salones` (
  `codigoS` varchar(3) NOT NULL,
  `edificio` varchar(5) DEFAULT NULL,
  `No_bancas` varchar(5) DEFAULT NULL,
  `m_impartidas` varchar(80) DEFAULT NULL,
  `dia` varchar(10) DEFAULT NULL,
  `hora` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`codigoS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salones`
--

LOCK TABLES `salones` WRITE;
/*!40000 ALTER TABLE `salones` DISABLE KEYS */;
/*!40000 ALTER TABLE `salones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-09 11:58:38
