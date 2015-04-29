-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: localhost    Database: amicarcotizante2
-- ------------------------------------------------------
-- Server version	5.6.24-log

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
-- Table structure for table `body`
--

DROP TABLE IF EXISTS `body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `body` (
  `idBody` int(11) NOT NULL,
  `bodyNombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idBody`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `body`
--

LOCK TABLES `body` WRITE;
/*!40000 ALTER TABLE `body` DISABLE KEYS */;
/*!40000 ALTER TABLE `body` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientealgoritmo`
--

DROP TABLE IF EXISTS `clientealgoritmo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientealgoritmo` (
  `idClienteAlgoritmo` int(11) NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idBody` int(11) DEFAULT NULL,
  PRIMARY KEY (`idClienteAlgoritmo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientealgoritmo`
--

LOCK TABLES `clientealgoritmo` WRITE;
/*!40000 ALTER TABLE `clientealgoritmo` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientealgoritmo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `rutCliente` varchar(12) DEFAULT NULL,
  `emailCliente` varchar(100) DEFAULT NULL,
  `nombreLocal` varchar(100) DEFAULT NULL,
  `nombreVendedor` varchar(100) DEFAULT NULL,
  `rutVendedor` varchar(12) DEFAULT NULL,
  `rutEjecutivoAdjudica` varchar(12) DEFAULT NULL,
  `nombreEjecutivoAdjudica` varchar(100) DEFAULT NULL,
  `nombreCliente` varchar(100) DEFAULT NULL,
  `fonoCelular` varchar(15) DEFAULT NULL,
  `fonoComercial` varchar(15) DEFAULT NULL,
  `fonoParticular` varchar(15) DEFAULT NULL,
  `marcaVehiculo` varchar(100) DEFAULT NULL,
  `modeloVehiculo` varchar(100) DEFAULT NULL,
  `valorVehiculo` varchar(45) DEFAULT NULL,
  `idGrupo` int(11) DEFAULT NULL,
  `idBody` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `nombreJrn` varchar(100) DEFAULT NULL,
  `desinscrito` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientesdiario`
--

DROP TABLE IF EXISTS `clientesdiario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientesdiario` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `rutCliente` varchar(12) DEFAULT NULL,
  `emailCliente` varchar(100) DEFAULT NULL,
  `nombreLocal` varchar(100) DEFAULT NULL,
  `nombreVendedor` varchar(100) DEFAULT NULL,
  `rutVendedor` varchar(12) DEFAULT NULL,
  `rutEjecutivoAdjudica` varchar(12) DEFAULT NULL,
  `nombreEjecutivoAdjudica` varchar(100) DEFAULT NULL,
  `nombreCliente` varchar(100) DEFAULT NULL,
  `fonoCelular` varchar(15) DEFAULT NULL,
  `fonoComercial` varchar(15) DEFAULT NULL,
  `fonoParticular` varchar(15) DEFAULT NULL,
  `marcaVehiculo` varchar(100) DEFAULT NULL,
  `modeloVehiculo` varchar(100) DEFAULT NULL,
  `valorVehiculo` varchar(45) DEFAULT NULL,
  `idGrupo` int(11) DEFAULT NULL,
  `idBody` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `nombreJrn` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientesdiario`
--

LOCK TABLES `clientesdiario` WRITE;
/*!40000 ALTER TABLE `clientesdiario` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientesdiario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientessemanal`
--

DROP TABLE IF EXISTS `clientessemanal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientessemanal` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `rutCliente` varchar(12) DEFAULT NULL,
  `emailCliente` varchar(100) DEFAULT NULL,
  `nombreLocal` varchar(100) DEFAULT NULL,
  `nombreVendedor` varchar(100) DEFAULT NULL,
  `rutVendedor` varchar(12) DEFAULT NULL,
  `rutEjecutivoAdjudica` varchar(12) DEFAULT NULL,
  `nombreEjecutivoAdjudica` varchar(100) DEFAULT NULL,
  `nombreCliente` varchar(100) DEFAULT NULL,
  `fonoCelular` varchar(15) DEFAULT NULL,
  `fonoComercial` varchar(15) DEFAULT NULL,
  `fonoParticular` varchar(15) DEFAULT NULL,
  `marcaVehiculo` varchar(100) DEFAULT NULL,
  `modeloVehiculo` varchar(100) DEFAULT NULL,
  `valorVehiculo` varchar(45) DEFAULT NULL,
  `idGrupo` int(11) DEFAULT NULL,
  `idBody` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `nombreJrn` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientessemanal`
--

LOCK TABLES `clientessemanal` WRITE;
/*!40000 ALTER TABLE `clientessemanal` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientessemanal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correoserrorformato`
--

DROP TABLE IF EXISTS `correoserrorformato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correoserrorformato` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `rutCliente` varchar(12) DEFAULT NULL,
  `emailCliente` varchar(100) DEFAULT NULL,
  `nombreLocal` varchar(100) DEFAULT NULL,
  `nombreVendedor` varchar(100) DEFAULT NULL,
  `rutVendedor` varchar(12) DEFAULT NULL,
  `rutEjecutivoAdjudica` varchar(12) DEFAULT NULL,
  `nombreEjecutivoAdjudica` varchar(100) DEFAULT NULL,
  `nombreCliente` varchar(100) DEFAULT NULL,
  `fonoCelular` varchar(15) DEFAULT NULL,
  `fonoComercial` varchar(15) DEFAULT NULL,
  `fonoParticular` varchar(15) DEFAULT NULL,
  `marcaVehiculo` varchar(100) DEFAULT NULL,
  `modeloVehiculo` varchar(100) DEFAULT NULL,
  `valorVehiculo` varchar(45) DEFAULT NULL,
  `idGrupo` int(11) DEFAULT NULL,
  `idBody` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `nombreJrn` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correoserrorformato`
--

LOCK TABLES `correoserrorformato` WRITE;
/*!40000 ALTER TABLE `correoserrorformato` DISABLE KEYS */;
/*!40000 ALTER TABLE `correoserrorformato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejecutivos`
--

DROP TABLE IF EXISTS `ejecutivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ejecutivos` (
  `idEjecutivo` int(11) NOT NULL AUTO_INCREMENT,
  `rutEjecutivo` varchar(12) DEFAULT NULL,
  `nombreEjecutivo` varchar(100) DEFAULT NULL,
  `correoEjecutivo` varchar(45) DEFAULT NULL,
  `locales_idLocal1` int(11) NOT NULL,
  `fechaIngreso` timestamp NULL DEFAULT NULL,
  `fechaModificacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEjecutivo`),
  KEY `fk_ejecutivos_locales1_idx` (`locales_idLocal1`),
  CONSTRAINT `fk_ejecutivos_locales1` FOREIGN KEY (`locales_idLocal1`) REFERENCES `locales` (`idLocal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1776 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejecutivos`
--

LOCK TABLES `ejecutivos` WRITE;
/*!40000 ALTER TABLE `ejecutivos` DISABLE KEYS */;
INSERT INTO `ejecutivos` VALUES (1607,'89148693','HENRIQUEZ BUGUEÑO CHRISTIAN','christian.henriquez@amicar.cl\\',1899,'2015-04-23 05:37:29',NULL),(1608,'97855315','ROJAS QUINTEROS CLAUDIO','claudio.rojas@amicar.cl\\',1900,'2015-04-23 05:39:36',NULL),(1609,'98992693','GUTIERREZ MARDONES ELADIO','Eladio.gutierrez@amicar.cl\\',1901,'2015-04-23 05:39:39',NULL),(1610,'100397390','DOMINGUEZ MORIS CAROLINA','carolina.dominguez@amicar.cl\\',1902,'2015-04-23 05:39:41',NULL),(1611,'101282775','CONTRERAS AEDO GUILLERMO','guillermo.contreras@amicar.cl\\',1903,'2015-04-23 05:39:43',NULL),(1612,'103575621','LAPORTA RODRIGO','rodrigo.laporta@amicar.cl\\',1904,'2015-04-23 05:39:45',NULL),(1613,'103990874','BASTÍAS ARANCIBIA IVOR','ivor.bastias@amicar.cl\\',1905,'2015-04-23 05:39:47',NULL),(1614,'104015506','SEPULVEDA LOPEZ CESAR','cesar.sepulveda@amicar.cl\\',1906,'2015-04-23 05:40:09',NULL),(1615,'105287739','HORMAZABAL PADILLA CARLOS ESTEBAN','carlos.hormazabal@amicar.cl\\',1907,'2015-04-23 05:40:11',NULL),(1616,'106014817','ALGUERNO MUÑOZ CLAUDIA P.','claudia.alguerno@amicar.cl\\',1908,'2015-04-23 05:40:12',NULL),(1617,'106472777','SILVA PEÑA YASNA','yasna.silva@amicar.cl\\',1909,'2015-04-23 05:40:23',NULL),(1618,'107690859','TOLEDO GONZALEZ CARLOS','carlos.toledo@amicar.cl\\',1910,'2015-04-23 05:40:23',NULL),(1619,'115491512','ALEGRÍA MEDINA CLAUDIA','claudia.alegria@amicar.cl\\',1911,'2015-04-23 05:40:24',NULL),(1620,'116354632','DOMINGUEZ GOMEZ MIGUEL','miguel.dominguez@amicar.cl\\',1912,'2015-04-23 05:40:24',NULL),(1621,'118813049','VENTURELLI GONZALEZ CARLOS','carlos.venturelli@amicar.cl\\',1913,'2015-04-23 05:40:24',NULL),(1622,'119763223','SILVA PEREZ OSVALDO','osvaldo.silva@amicar.cl\\',1914,'2015-04-23 05:40:24',NULL),(1623,'120131184','ACEVEDO GUTIERREZ EDILMA','edilma.acevedo@amicar.cl\\',1915,'2015-04-23 05:40:24',NULL),(1624,'120223666','ABARCA LATORRE GLADYS','gladys.abarca@amicar.cl\\',1916,'2015-04-23 05:40:24',NULL),(1625,'121811359','VARELA MONTERO EDUARDO','eduardo.varela@amicar.cl\\',1917,'2015-04-23 05:40:24',NULL),(1626,'123366565','HUAIQUIMILLA CALFIL LUIS','luis.huaiquimilla@amicar.cl\\',1918,'2015-04-23 05:40:24',NULL),(1627,'123640330','ALVAREZ ARAVENA GONZALO CLAUDIO','gonzalo.alvarez@amicar.cl\\',1919,'2015-04-23 05:40:24',NULL),(1628,'124699770','GUTIERREZ ARMIJO CRISTIAN ALBERTO','cristian.gutierrez@amicar.cl\\',1919,'2015-04-23 05:40:24',NULL),(1629,'124944139','HERRERA VILLARROEL JORGE','jorge.herrera@amicar,cl\\',1920,'2015-04-23 05:40:24',NULL),(1630,'125151663','MERINO FUENTES JORGE','jmerino@vegaartus.cl\\',1921,'2015-04-23 05:40:24',NULL),(1631,'125205461','INOSTROZA OCAMPO PAULA','paula.inostroza@amicar.cl\\',1922,'2015-04-23 05:40:24',NULL),(1632,'125892450','TEJOS LETELIER ANA MARIA','ana.tejos@amicar.cl\\',1923,'2015-04-23 05:40:24',NULL),(1633,'126510659','RIQUELME RIQUELME ALEJANDRO','alejandro.riquelme@amicar.cl\\',1924,'2015-04-23 05:40:24',NULL),(1634,'127034117','MUÑOZ NEIRA MACARENA','macarena.munoz@amicar.cl\\',1925,'2015-04-23 05:40:24',NULL),(1635,'128773096','BRAVO CANCEC EDUARDO','eduardo.bravo@amicar.cl\\',1926,'2015-04-23 05:40:24',NULL),(1636,'129533579','LOPEZ SALAS MYRIAM BENECIA','myriam.lopez@amicar.cl\\',1902,'2015-04-23 05:40:24',NULL),(1637,'130261469','ACUÑA BARROS PEDRO','pedro.acuña@amicar.cl\\',1906,'2015-04-23 05:40:24',NULL),(1638,'131867735','SAN MARTIN CASTRO ALEJANDRA','alejandra.sanmartin@amicar.cl\\',1927,'2015-04-23 05:40:24',NULL),(1639,'132165440','ITE VEGA FRANCISCO JAVIER','francisco.ite@amicar.cl\\',1928,'2015-04-23 05:40:24',NULL),(1640,'132450153','MARCHANT QUEZADA CAROL','carol.marchant@amicar.cl\\',1929,'2015-04-23 05:40:24',NULL),(1641,'132489017','URQUEJO VEAS ALEJANDRA','alejandra.urquejo@amicar.cl\\',1930,'2015-04-23 05:40:24',NULL),(1642,'132566801','FLORES RENCORET DANIELA ANDREA','daniela.flores@amicar.cl\\',1931,'2015-04-23 05:40:24',NULL),(1643,'133624678','OSORIO BAÑADOS CLAUDIA','claudia.osorio@amicar.cl\\',1932,'2015-04-23 05:40:24',NULL),(1644,'134133236','ANDRADE VERA ELIZABETH ANDREA','elizabeth.andrade@amicar.cl\\',1933,'2015-04-23 05:40:24',NULL),(1645,'134271280','FERNANDEZ DAMELE ANNELOREN','anneloren.fernandez@amicar.cl\\',1934,'2015-04-23 05:40:24',NULL),(1646,'134734450','RAMIREZ RAMIREZ GABRIEL','gabriel.ramirez@amicar.cl\\',1906,'2015-04-23 05:40:24',NULL),(1647,'135249637','FUENTES SOTO ANDREA','andrea.fuentes@amicar.cl\\',1935,'2015-04-23 05:40:24',NULL),(1648,'136006606','YAÑEZ SEGURA HECTOR EDUARDO','hector.yanez@amicar.cl\\',1936,'2015-04-23 05:40:24',NULL),(1649,'136092537','FIERRO MARDONES GLORIA','gloria.fierro@amicar.cl\\',1937,'2015-04-23 05:40:24',NULL),(1650,'136258478','DELGADO NEIRA LESLIE','leslie.delgado@amicar.cl\\',1938,'2015-04-23 05:40:24',NULL),(1651,'137383373','DODDS MUÑOZ ALEJANDRA','alejandra.dodds@amicar.cl\\',1939,'2015-04-23 05:40:24',NULL),(1652,'137803399','ASTORGA LIZANA CRISTIAN ANDRES','cristian.astorga@amicar.cl\\',1940,'2015-04-23 05:40:25',NULL),(1653,'137823322','VERGARA MIRANDA ANDREA ELVIRA','andrea.vergara@amicar.cl\\',1941,'2015-04-23 05:40:25',NULL),(1654,'138178536','KLEIN QUEZADA ALEXIS','alexis.klein@amicar.cl\\',1942,'2015-04-23 05:40:25',NULL),(1655,'139183495','BRAVO OTAROLA GUSTAVO','gustavo.bravo@amicar.cl\\',1902,'2015-04-23 05:40:25',NULL),(1656,'139498550','MENDEZ MONTECINOS JOSE','jose.mendez@amicar.cl\\',1943,'2015-04-23 05:40:25',NULL),(1657,'139515692','COA MUÑOZ JOHANNA','johana.coa@amicar.cl\\',1944,'2015-04-23 05:40:25',NULL),(1658,'139530446','LUNA ESPINOZA CAROLINA ESTELA','carolina.luna@amicar.cl\\',1902,'2015-04-23 05:40:25',NULL),(1659,'139533909','BLAMEY PEREZ MÓNICA','monica.blamey@amicar.cl\\',1945,'2015-04-23 05:40:25',NULL),(1660,'139564200','TAPIA CISTERNAS OLGA','olga.tapia@amicar.cl\\',1946,'2015-04-23 05:40:25',NULL),(1661,'139803302','PULIDO SILVA PATRICIA','patricia.pulido@amicar.cl\\',1947,'2015-04-23 05:40:25',NULL),(1662,'140119938','SOTO NAVARRO FABIAM','fabiam.soto@amicar.cl\\',1948,'2015-04-23 05:40:25',NULL),(1663,'140302899','CUEVAS MORA RENATO JAVIER','renato.cuevas@amicar.cl\\',1949,'2015-04-23 05:40:25',NULL),(1664,'140866741','SOTO CASTRO KARIN','karin.soto@amicar.cl\\',1950,'2015-04-23 05:40:25',NULL),(1665,'141203746','LEON CARRASCO ANA CECILIA','ana.leon@amicar.cl\\',1951,'2015-04-23 05:40:25',NULL),(1666,'141236121','SALAS PARADA MONICA','monica.salas@amicar.cl\\',1952,'2015-04-23 05:40:25',NULL),(1667,'141372572','PRADENAS OLAVE PEDRO','pedro.pradenas@amicar.cl\\',1953,'2015-04-23 05:40:25',NULL),(1668,'141399292','URZUA VIÑALES PATRICIO','patricio.urzua@amicar.cl\\',1936,'2015-04-23 05:40:25',NULL),(1669,'141489909','BUTTO RODRIGUEZ PAOLA','paola.butto@amicar.cl\\',1906,'2015-04-23 05:40:25',NULL),(1670,'141551809','MORALES DABNER MITHZY','mitzhy.morales@amicar.cl\\',1954,'2015-04-23 05:40:25',NULL),(1671,'141852248','CORTES HORMAZABAL TERESA DE JESU','teresa.cortes@amicar.cl\\',1955,'2015-04-23 05:40:25',NULL),(1672,'142071959','ALVARADO VIRA IGNACIO','ignacio.alvarado@amicar.cl\\',1943,'2015-04-23 05:40:25',NULL),(1673,'142072726','LEIVA DIAZ FERNANDO','fernando.leiva@amicar.cl\\',1956,'2015-04-23 05:40:25',NULL),(1674,'142436736','NAVARRO HIDALGO PATRICIA','patricia.navarro@amicar.cl\\',1957,'2015-04-23 05:40:25',NULL),(1675,'143289974','SILVA FARIAS VALERIA','valeria.silva@amicar.cl\\',1958,'2015-04-23 05:40:25',NULL),(1676,'143921247','OLIVA ORTIZ CLAUDIA ANDREA','claudia.oliva@amicar.cl\\',1929,'2015-04-23 05:40:25',NULL),(1677,'144052595','VALDEBENITO VALDEBENITO PAOLA EL','paola.valdebenito@amicar.cl\\',1902,'2015-04-23 05:40:25',NULL),(1678,'144699122','GAJARDO CAMPOS JESSICA PAOLA','jessica.gajardo@amicar.cl\\',1959,'2015-04-23 05:40:25',NULL),(1679,'144760131','VALDES BELTIS','beltis.valdes@amicar.cl\\',1917,'2015-04-23 05:40:25',NULL),(1680,'146152643','BUSTOS  BUSTOS ROXANA MADELEINE','roxana.bustos@amicar.cl\\',1915,'2015-04-23 05:40:25',NULL),(1681,'146717020','ESPEJO SENIOR MARIA ALEJANDRA','maria.espejo@amicar.cl\\',1960,'2015-04-23 05:40:25',NULL),(1682,'150403006','PÉREZ HALTY  ROCÍO','rocio.perez@amicar.cl\\',1902,'2015-04-23 05:40:25',NULL),(1683,'150522471','MALUENDA JESSICA','jessica.maluenda@amicar.cl\\',1961,'2015-04-23 05:40:25',NULL),(1684,'150650364','JELDRES TISELJ MAURICIO','mauricio.jeldres@amicar.cl\\',1962,'2015-04-23 05:40:25',NULL),(1685,'150977789','COTRONEO MATURANA CARMEN GLORIA','carmen.cotroneo@amicar.cl\\',1963,'2015-04-23 05:40:25',NULL),(1686,'150996678','PEREZ MUÑOZ RICARDO ANDRES','ricardo.perez@amicar.cl\\',1964,'2015-04-23 05:40:26',NULL),(1687,'151090311','CELIS FUENTES RAUL','raul.celis@amicar.cl\\',1965,'2015-04-23 05:40:26',NULL),(1688,'152546203','EPULEF LLANCAFIL BETTY EVELIN','betty.epulef@amicar.cl\\',1966,'2015-04-23 05:40:26',NULL),(1689,'153317690','MARINO FLORES MANUEL ALEJANDRO','manuel.marino@amicar.cl\\',1967,'2015-04-23 05:40:26',NULL),(1690,'153790493','SCHNEIDER FICA DAVID ECHIER','david.schneider@amicar.cl\\',1968,'2015-04-23 05:40:26',NULL),(1691,'154215875','VERDUGO VERGARA JUAN RODRIGO','juan.verdugo@amicar.cl\\',1905,'2015-04-23 05:40:26',NULL),(1692,'154547134','AGUILA MARAMBIO ARIEL','ariel.aguila@amicar.cl\\',1928,'2015-04-23 05:40:26',NULL),(1693,'155013966','GONZALEZ GIOVAGNOLI PAMELA','pamela.gonzalez@amicar.cl\\',1969,'2015-04-23 05:40:26',NULL),(1694,'155069902','GUZMAN COFRE MANUEL','manuel.guzman@amicar.cl\\',1970,'2015-04-23 05:40:26',NULL),(1695,'155197188','CORDERO CHAVEZ CAMILA','camila.cordero@amicar.cl\\',1971,'2015-04-23 05:40:26',NULL),(1696,'155573066','HERNÁNDEZ  CHAMORRO ANGELO','angelo.hernandez@amicar.cl\\',1972,'2015-04-23 05:40:26',NULL),(1697,'156133175','HURTADO TENORIO JAVIERA ALEJANDRA','javiera.hurtado@amicar.cl\\',1973,'2015-04-23 05:40:26',NULL),(1698,'156182877','ARANEDA ORTIZ TAMARA','tamara.araneda@amicar.cl\\',1902,'2015-04-23 05:40:26',NULL),(1699,'156517879','ROA NOVOA DANIEL','daniel.roa@amicar.cl\\',1974,'2015-04-23 05:40:26',NULL),(1700,'156682713','ROJAS ASTORGA ESTEBAN ARMANDO','esteban.rojas@amicar.cl\\',1975,'2015-04-23 05:40:26',NULL),(1701,'157054929','GUTIERREZ CORTES MARIA JOSE','maria.gutierrez@amicar.cl\\',1941,'2015-04-23 05:40:26',NULL),(1702,'157182064','MARÍN NATALIA','natalia.marin@amicar.cl\\',1976,'2015-04-23 05:40:26',NULL),(1703,'157402889','LOAIZA PACHECO YANIRA','yanira.loaiza@amicar.cl\\',1977,'2015-04-23 05:40:26',NULL),(1704,'157767402','TORREBLANCA MALDONADO LIZ','liz.torreblanca@amicar.cl\\',1978,'2015-04-23 05:40:26',NULL),(1705,'157799754','ARRIAGADA LETELIER ISRAEL ESTEBAN','israel.arriagada@amicar.cl\\',1968,'2015-04-23 05:40:26',NULL),(1706,'157832786','AGUIRRE MORALES DANIELA','daniela.aguirre@amicar.cl\\',1979,'2015-04-23 05:40:26',NULL),(1707,'157845314','GOMEZ SALINAS CLAUDIA ','claudia.gomez@amicar.cl\\',1980,'2015-04-23 05:40:26',NULL),(1708,'158121263','PANOZO ANDRADE VIVIANA','viviana.panozo@amicar.cl\\',1902,'2015-04-23 05:40:26',NULL),(1709,'159075524','MENDEZ TRONCOSO ESTEBAN','esteban.mendez@amicar.cl\\',1923,'2015-04-23 05:40:26',NULL),(1710,'159499375','MIRANDA MENA HELLEN','hellen.miranda@amicar.cl\\',1981,'2015-04-23 05:40:26',NULL),(1711,'159648095','ZUÑIGA VALLET PAMELA','pamela.zuniga@amicar.cl\\',1980,'2015-04-23 05:40:26',NULL),(1712,'159752151','PAZ FIBLAS LUIS','luis.paz@amicar.cl\\',1982,'2015-04-23 05:40:26',NULL),(1713,'159859932','BENITEZ VEJAR ALEJANDRA','alejandra.benitez@amicar.cl\\',1983,'2015-04-23 05:40:26',NULL),(1714,'159882578','CASTRO CANOVI DAYSE','dayse.castro@amicar.cl\\',1984,'2015-04-23 05:40:26',NULL),(1715,'160148268','HENRIQUEZ HIDALGO GUSTAVO ALBERTO','gustavo.henriquez@amicar.cl\\',1985,'2015-04-23 05:40:26',NULL),(1716,'160453680','PADILLA SANCHEZ JOSCELYN ','joscelyn.padilla@amicar.cl\\',1943,'2015-04-23 05:40:26',NULL),(1717,'160682647','FERNANDEZ CASTILLO GONZALO','gonzalo.fernandez@amicar.cl\\',1980,'2015-04-23 05:40:26',NULL),(1718,'160919817','BASCUR BENARDOS ROCIO','rocio.bascur@amicar.cl\\',1986,'2015-04-23 05:40:27',NULL),(1719,'161393533','LEFORT SOTO IVONNE','ivone.lefort@amicar.cl\\',1981,'2015-04-23 05:40:27',NULL),(1720,'161524786','TORRES JARA CARLA','carla.torres@amicar.cl\\',1987,'2015-04-23 05:40:27',NULL),(1721,'162148680','GATICA VALENZUELA HUGO ANDRES','hugo.gatica@amicar.cl\\',1988,'2015-04-23 05:40:27',NULL),(1722,'162407317','MARQUEZ VASQUEZ CARLOS','carlos.marquez@amicar.cl\\',1989,'2015-04-23 05:40:27',NULL),(1723,'162837540','REMEDI OSORIO ALVARO','alvaro.remedi@amicar.cl\\',1971,'2015-04-23 05:40:27',NULL),(1724,'163041154','GONZALEZ YANTEN CLAUDIO','claudio.gonzalez@amicar.cl\\',1943,'2015-04-23 05:40:27',NULL),(1725,'163199424','LOPEZ VEGAS RODRIGO','rodrigo.lopez@amicar.cl\\',1969,'2015-04-23 05:40:27',NULL),(1726,'163342561','VEGA MUÑOZ JESSICA ALEXANDRA','jessica.vega@amicar.cl\\',1963,'2015-04-23 05:40:27',NULL),(1727,'163431815','DIAZ VEGA XIMENA IVETTE','ximena.diaz@amicar.cl\\',1990,'2015-04-23 05:40:27',NULL),(1728,'163838265','GUERRERO BECERA FELIPE','felipe.guerrero@amicar.cl\\',1902,'2015-04-23 05:40:27',NULL),(1729,'163926822','MORA ARRATIA CESAR','cesar.mora@amicar.cl\\',1943,'2015-04-23 05:40:27',NULL),(1730,'164152057','AGURTO STUARDO LORENA','lorena.agurto@amicar.cl\\',1991,'2015-04-23 05:40:27',NULL),(1731,'165183924','NUÑEZ YAÑEZ LESLIE','leslie.nuñez@amicar.cl\\',1992,'2015-04-23 05:40:27',NULL),(1732,'165577426','CARREÑO VALENCIA KARINA','karina.carreño@amicar.cl\\',1993,'2015-04-23 05:40:27',NULL),(1733,'166517362','GALLARDO CHAVEZ JOSELYN','joselyn.gallardo@amicar,cl\\',1994,'2015-04-23 05:40:27',NULL),(1734,'166743397','MONSALVE VASQUEZ RODRIGO','rodrigo.monsalve@amicar.cl\\',1995,'2015-04-23 05:40:27',NULL),(1735,'167187412','PONCE MEZA CYNTHIA','cynthia.ponce@amicar.cl\\',1917,'2015-04-23 05:40:27',NULL),(1736,'167649289','ALLENDES RODRIGUEZ PAZ','paz.allendes@amicar.cl\\',1943,'2015-04-23 05:40:27',NULL),(1737,'167674712','VERA SAAVEDRA STEVENS','stevens.vera@amicar.cl\\',1996,'2015-04-23 05:40:27',NULL),(1738,'169220107','ARAVENA CALFUNAO FELIPE','felipe.aravena@amicar.cl\\',1981,'2015-04-23 05:40:27',NULL),(1739,'169324395','QUIROGA RODRIGUEZ FELIX','felix.quiroga@amicar.cl\\',1997,'2015-04-23 05:40:27',NULL),(1740,'169461902','GERTNER GONZALEZ HOMERO','homero.gertner@amicar.cl\\',1943,'2015-04-23 05:40:27',NULL),(1741,'169983445','FIGUEROA PATRICIA','patricia.figueroa@amicar.cl\\',1998,'2015-04-23 05:40:27',NULL),(1742,'170061101','ARANGUIZ AGUILERA JIMMY','jimmy.aranguiz@amicar.cl\\',1943,'2015-04-23 05:40:27',NULL),(1743,'170229339','LOBOS ARANEDA MARCO','marco.lobos@amicar.cl\\',1999,'2015-04-23 05:40:27',NULL),(1744,'170413377','MENDOZA CORDERO ELIZABETH','elizabeth.mendoza@amicar.cl\\',2000,'2015-04-23 05:40:27',NULL),(1745,'170939921','CASTILLO LEDESMA JAVIER','javier.castillo@amicar.cl\\',1943,'2015-04-23 05:40:27',NULL),(1746,'171302757','ALARCÓN GONZALEZ VANESSA','vanessa.alarcon@amicar.cl\\',2001,'2015-04-23 05:40:27',NULL),(1747,'171340195','AROS TREJO NICOLAS','nicolas.aros@amicar.cl\\',1943,'2015-04-23 05:40:27',NULL),(1748,'172210406','CONCHA RAMOS JONATHAN','jonathan.concha@amicar.cl\\',2002,'2015-04-23 05:40:27',NULL),(1749,'172871003','PANTOJA VERA VICTOR','victor.pantoja@amicar.cl\\',2003,'2015-04-23 05:40:27',NULL),(1750,'172876463','VEJAR MORALES JOSCELYN','joscelyn.vejar@amicar.cl\\',1943,'2015-04-23 05:40:27',NULL),(1751,'173106521','RIOS COURBIS NICOLE','nicole.rios@amicar.cl\\',1902,'2015-04-23 05:40:27',NULL),(1752,'173137605','HURTADO GONZALEZ MAYRA','mayra.hurtado@amicar.cl\\',1960,'2015-04-23 05:40:27',NULL),(1753,'173183151','RAMOS ROJAS MAXIMILIANO','maximiliano.ramos@amicar.cl\\',2004,'2015-04-23 05:40:27',NULL),(1754,'173627823','JOFRE AGUIRRE KATHERINE','katherine.jofre@amicar.cl\\',1943,'2015-04-23 05:40:27',NULL),(1755,'173781180','DE LA FUENTE SANDOVAL PATRICIO','patricio.delafuente@amicar.cl\\',1974,'2015-04-23 05:40:27',NULL),(1756,'175685219','PIETRASANTA CATHERINE','catherinne.pietrasanta@amicar.cl\\',2005,'2015-04-23 05:40:27',NULL),(1757,'175946063','MOLINA SOTO SILVIA','silvia.molina@amicar.cl\\',2006,'2015-04-23 05:40:28',NULL),(1758,'176218142','CRISOSTOMO ARANCIBIA ROMINA','romina.crisostomo@amicar.cl\\',1943,'2015-04-23 05:40:28',NULL),(1759,'177618039','VIDELA MONTENEGRO PATRICIA','patricia.videla@amicar.cl\\',2007,'2015-04-23 05:40:28',NULL),(1760,'178426729','CHAMORRO NORMA','norma.chamorro@amicar.cl\\',1943,'2015-04-23 05:40:28',NULL),(1761,'181587547','SANCHEZ LEIVA TAINA','taina.sanchez@amicar.cl\\',2008,'2015-04-23 05:40:28',NULL),(1762,'237682122','OROZCO ATENCIO JANNY','janny.orozco@amicar.cl\\',2009,'2015-04-23 05:40:28',NULL),(1763,'12268248K','MOLINA FAURES POLA','pola.molina@amicar.cl\\',2010,'2015-04-23 05:40:28',NULL),(1764,'12485136K','CARDENAS BECERRA CRISTIAN ANDRES','cristian.cardenas@amicar.cl\\',2011,'2015-04-23 05:40:28',NULL),(1765,'13281886K','SAN MARTIN GARNICA DAVID','david.schneider@amicar.cl\\',2012,'2015-04-23 05:40:28',NULL),(1766,'13415490K','DIAZ COSTA PIA LORETA','pia.diaz@amicar.cl\\',2013,'2015-04-23 05:40:28',NULL),(1767,'13509742K','BASCUÑAN MORA CARLA','carla.bascuñan@amicar.cl\\',2014,'2015-04-23 05:40:28',NULL),(1768,'13914984K','VILLARROEL VILO CAROLINA','carolina.villarroel@amicar.cl\\',2015,'2015-04-23 05:40:28',NULL),(1769,'15297065K','CARABANTES BARRIA RODRIGO','rodrigo.carabantes@amicar.cl\\',2016,'2015-04-23 05:40:28',NULL),(1770,'15966743K','CORDOVA JORQUERA CATHERINNE','catherinne.cordova@micar.cl\\',1953,'2015-04-23 05:40:28',NULL),(1771,'16101611K','ALIQUINTUI VERA GABRIELA','gabriela.aliquintui@amicar.cl\\',1902,'2015-04-23 05:40:28',NULL),(1772,'16173005K','MEDINA GUZMAN ANA','ana.medina@amicar.cl\\',2017,'2015-04-23 05:40:28',NULL),(1773,'17105639K','URRUTIA JACKSON ANDRES','andres.urrutia@amicar.cl\\',2018,'2015-04-23 05:40:28',NULL),(1774,'17571281K','VILLARROEL VILLALOBOS OSCAR','oscar.villarroel@amicar.cl\\',2019,'2015-04-23 05:40:28',NULL),(1775,'8727456K','MUNDACA MUNIZAGA MONICA LILIAN','monica.mundaca@amicar.cl\\',2020,'2015-04-23 05:40:28',NULL);
/*!40000 ALTER TABLE `ejecutivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales` (
  `idLocal` int(11) NOT NULL AUTO_INCREMENT,
  `nombreLocal` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idLocal`)
) ENGINE=InnoDB AUTO_INCREMENT=2021 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales`
--

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
INSERT INTO `locales` VALUES (1845,'30 SERGIO ESCOBAR MALL'),(1846,'70 AG MALL PLAZA ALAMEDA'),(1847,'11 AG MALL PLAZA VESPUCIO'),(1848,'75 PLAZA OESTE (GWM-CHA-JAC-GEE)'),(1849,'20 MOVICENTER 4 (SUZUKI)'),(1850,'61 PLAZA OESTE SUZUKI'),(1851,'17 MEGACENTER (SUZUKI)'),(1852,'131 SUZUVAL BELLOTO'),(1853,'90 PLAZA VESPUCIO ( RENAULT - SAMSUNG )'),(1854,'11 CHAMY HNOS.'),(1855,'138 MOVICENTER (JAC)'),(1856,'121 FORTALEZA PLAZA LA SERENA'),(1857,'140 H MOTORES S.A PLAZA OESTE'),(1858,'18 MOVICENTER USADOS'),(1859,'24 PLAZA OESTE MAZDA'),(1860,'108 NUEVOS S.A.'),(1861,'27 PLAZA VESPUCIO SUZUKI'),(1862,'19 AG AUTO PLAZA ANTOFAGASTA'),(1863,'25 PLAZA OESTE USADOS'),(1864,'58 AG PLAZA LA SERENA'),(1865,'83 MOVICENTER (RNT - SMG)'),(1866,'59 CARMEISTER MALL PLAZA OESTE'),(1867,'144 COMERCIAL VALENTINI MALL'),(1868,'9 AUTOS YUSIC MALL ANTOFAGASTA'),(1869,'130 MEGACENTER (RNT-SMG)'),(1870,'92 AUTOS YUSIC COSTANERA'),(1871,'12 AG MOVICENTER'),(1872,'150  DERCO AUTOSHOPPING'),(1873,'110 FORTALEZA MALL PLAZA NORTE'),(1874,'63 PLAZA VESPUCIO (MAZDA)'),(1875,'10 AG MALL PLAZA TOBALABA'),(1876,'167 GUILLERMO MORALES PLAZA EGAÑA'),(1877,'23 PLAZA NORTE (SUZUKI)'),(1878,'95 DEPARTAMENTAL USADOS'),(1879,'26 PLAZA TOBALABA (SMG-SZK)'),(1880,'161 FORTALEZA AUTOSHOPPING'),(1881,'112 PLAZA VESPUCIO (GWM-GEE-JAC-CHA)'),(1882,'88 PLAZA TOBALABA (GWM-GEE-JAC-CHA)'),(1883,'174 AUTOMOTORA PUIG HYUNDAI MAIPU'),(1884,'19 MOVICENTER (MAZDA)'),(1885,'99 FORTALEZA PLAZA ANTOFAGASTA'),(1886,'112 FORTALEZA MALL PLAZA TOBALABA'),(1887,'111 MOVICENTER (GEE-CHA-GWM)'),(1888,'98 FORTALEZA PLAZA CALAMA'),(1889,'94 BRUNO FRITSCH PLAZA SUR'),(1890,'132 PLAZA NORTE (GWM-MZD-RNT-SMG)'),(1891,'169 AG MALL PLAZA BIO BIO'),(1892,'21 AG AUTOPLAZA MALL DEL TREBOL'),(1893,'129 MEGACENTER (MAZDA)'),(1894,'9 AG MALL PLAZA NORTE'),(1895,'145 MEGACENTER (GWM - JAC - GEE - CHA)'),(1896,'144 MINI STORE PARQUE ARAUCO'),(1897,'118 FORTALEZA MOVICENTER'),(1898,'141 H MOTORES BELLOTO'),(1899,'Autocentro Nicolás '),(1900,'Fortaleza-AG Cerrillos'),(1901,'Derco Departamental Usados'),(1902,''),(1903,'Camiones AG'),(1904,'Plaza Vespucio local Chinos'),(1905,'Plaza Tobalaba'),(1906,'Proyecto web'),(1907,'R y R Pinto'),(1908,'Carrera / Virtual Derco'),(1909,'AG Mall Plaza Norte '),(1910,'Curifor Curico'),(1911,'AG-Fortaleza Autoshopping'),(1912,'Plaza Vespucio MZD-RNT-SMS'),(1913,'Ok Usados Plaza Oeste'),(1914,'Patricio Hidalgo'),(1915,'AG Movicenter'),(1916,'Suzuval San Antonio'),(1917,'Anfruns Rancagua'),(1918,'Exequiel Berrios y Cia. Ltda. Valdivia'),(1919,'Plaza Oeste chinos'),(1920,'Mazda-Chinos Automotora Bilbao'),(1921,'Vega Artus'),(1922,'Circulo Talca'),(1923,'Automotora Arauco '),(1924,'AG-Fortaleza Antofagasta y Carmeister'),(1925,'AG Portugal'),(1926,'Siglo XXI Irarrazaval'),(1927,'Fortaleza Arica-Cytitime Arica'),(1928,'AG-Fortaleza  Mall Plaza Antofagasta'),(1929,'Movicenter SZK'),(1930,'H.Motores La Calera'),(1931,'AG-Fortaleza Mall Plaza Alameda'),(1932,'Hernández Motores Valparaíso'),(1933,'AG-Fortaleza Autoplaza Mall Plaza La Serena '),(1934,'Fortaleza Viña'),(1935,'AG Temuco'),(1936,'Curifor La Florida'),(1937,'AG Puerto Montt'),(1938,'AG Concepción -Carmeister Mall EL Trebol'),(1939,'AG Vitacura'),(1940,'AG Viña del Mar'),(1941,'Plaza Oeste SZK'),(1942,'Bruno Fritsch Gran Avenida'),(1943,'Trainee'),(1944,'rotando'),(1945,'Portillo Hyundai y Carmeister Bilbao'),(1946,'Bruno Fritsch Concepcion'),(1947,'Autos Yusic Jumbo'),(1948,'G. Morales Mall Plaza Egaña'),(1949,'Autofrance Concepción'),(1950,'AG Osorno'),(1951,'AG Plaza Vespucio'),(1952,'Movicenter MZD'),(1953,'Plaza Oeste MZD'),(1954,'Ovalle Hnos'),(1955,'AG y Fortaleza Alameda'),(1956,'AG Maipu'),(1957,'Aspillaga y Hornauer'),(1958,'AG/Fortaleza Plaza Calama'),(1959,'Jesus Pons  Curicó y Linares'),(1960,'Derco Plaza Norte'),(1961,'AG-Fortaleza Mall Plaza La Serena'),(1962,'Suzuval La Calera'),(1963,'Suzuval Viña del Mar'),(1964,'Hernandez Motores Viña 15 Norte'),(1965,'Automotriz Cumsille San Fernando'),(1966,'AG Iquique'),(1967,'Movicenter RNT-SMS-GW'),(1968,'Nuevos Mall Plaza Sur'),(1969,'Exequiel Berrios y Cia. Ltda. Castro y Puerto Montt'),(1970,'AG-Fortaleza Plaza Tobalaba '),(1971,'Sergio Escobar  Mall del Trebol, Concepción'),(1972,'Automotora Bilbao Suzuki'),(1973,'AG Los Angeles'),(1974,'Decar Temuco'),(1975,'Circulo Montt'),(1976,'Dercocenter Las Condes y Dercocenter usados'),(1977,'Suzuval El Belloto'),(1978,'Suzuval Valparaíso'),(1979,'Sergio Escobar Paicavi szk-mzd'),(1980,'H. MOTORES LONQUEN-P. OESTE'),(1981,'Megacenter todas las marcas'),(1982,'Autos Yusic Mall Plaza Antofagasta'),(1983,'Fortaleza Temuco'),(1984,'Decar Hoschtetter'),(1985,'Yusic Calama'),(1986,'Medina & Ballardt'),(1987,'AG-Fortaleza Autoplaza Mall del Trebol, Concepción'),(1988,'Curifor Chillan'),(1989,'Fortaleza Puerto Montt'),(1990,'AG Valdivia'),(1991,'AG Vicuña Mackenna'),(1992,'AG La Dehesa-Vitacura Mini'),(1993,'Chamy Hnos.'),(1994,'Recasur Zona Franca/Tovarias'),(1995,'Sergio Escobar Los Angeles'),(1996,'Sergio Escobar Carrera-Usados'),(1997,'Fortaleza Plaza Vespucio'),(1998,'AG-Fortaleza Casa Matriz'),(1999,'Ok Usados Movicenter'),(2000,'Derco Autoshopping'),(2001,'Sergio Escobar Chillán'),(2002,'Sergio Escobar Paicavi  Chinos-rnt'),(2003,'Movicenter JAC-Changan'),(2004,'Dercocenter Tabancura'),(2005,'Anfruns Santiago'),(2006,'Recasur Coyhaique'),(2007,'Valentini Puertas del Mar'),(2008,'Fortaleza Movicenter'),(2009,'Camiones'),(2010,'Carmeister Plaza Oeste'),(2011,'Plaza Vespucio szk'),(2012,'Automotora Bruno Fritsch Mall Plaza Sur'),(2013,'Derco Autos Yusic Costanera'),(2014,'Distribuidora Rosselot Ltda.'),(2015,'CARMEISTER MOVICENTER'),(2016,'Autos Bilbao, Michel Martabit Caspo'),(2017,'Promotors'),(2018,'Fortaleza Mall Plaza Norte'),(2019,'Covalsa La Serena'),(2020,'G. Carmona');
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `idlog` int(11) NOT NULL,
  `idVendedor` int(11) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idEjecutivo` int(11) DEFAULT NULL,
  `fechaLog` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idlog`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proceso`
--

DROP TABLE IF EXISTS `proceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proceso` (
  `idProceso` int(11) NOT NULL AUTO_INCREMENT,
  `fechaEnvio` timestamp NULL DEFAULT NULL,
  `fechaAperturaMail` timestamp NULL DEFAULT NULL,
  `fechaClickLink` timestamp NULL DEFAULT NULL,
  `clientes_idCliente` int(11) NOT NULL,
  `ejecutivos_idEjecutivo` int(11) NOT NULL,
  `vendedores_idVendedor` int(11) NOT NULL,
  PRIMARY KEY (`idProceso`),
  KEY `fk_proceso_clientes1_idx` (`clientes_idCliente`),
  KEY `fk_proceso_ejecutivos1_idx` (`ejecutivos_idEjecutivo`),
  KEY `fk_proceso_vendedores1_idx` (`vendedores_idVendedor`),
  CONSTRAINT `fk_proceso_clientes1` FOREIGN KEY (`clientes_idCliente`) REFERENCES `clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proceso_ejecutivos1` FOREIGN KEY (`ejecutivos_idEjecutivo`) REFERENCES `ejecutivos` (`idEjecutivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proceso_vendedores1` FOREIGN KEY (`vendedores_idVendedor`) REFERENCES `vendedores` (`idVendedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proceso`
--

LOCK TABLES `proceso` WRITE;
/*!40000 ALTER TABLE `proceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `proceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendedores` (
  `idVendedor` int(11) NOT NULL AUTO_INCREMENT,
  `rutVendedor` varchar(12) DEFAULT NULL,
  `nombreVendedor` varchar(100) DEFAULT NULL,
  `locales_idLocal` int(11) NOT NULL,
  PRIMARY KEY (`idVendedor`),
  KEY `fk_vendedores_locales1_idx` (`locales_idLocal`),
  CONSTRAINT `fk_vendedores_locales1` FOREIGN KEY (`locales_idLocal`) REFERENCES `locales` (`idLocal`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5903 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (5778,'16108672K\\','CRISTIAN MAURICIO VIGOR ACUA',1845),(5779,'157705806','MARCELA PAZ RAMIREZ TORRES',1846),(5780,'85349236','SILVIA MAGDALENA  SANDOVAL  VILLARROEL',1847),(5781,'224215908','LUIS ALBERTO  URANGO  ANGULO',1848),(5782,'134837438','CLAUDIO MARCELO  BALBOA GONZALES',1848),(5783,'152931336','JAVIER ANTONIO MATUS JIMENEZ',1849),(5784,'108456078','JOSÉ MIGUEL  PLAZA  BRAVO ',1850),(5785,'10953546K','CLAUDIA  AZOCAR DE LA FUENTE',1851),(5786,'130193196','JUAN PABLO FARIAS ZAMORA',1852),(5787,'138543013','NESTOR PATRICIO  VEGA  MUÑOZ ',1845),(5788,'103768489','MANUEL  SAEZ  ALARCON',1853),(5789,'164665038','HERNAN PATRICIO ARAYA ITURRA',1854),(5790,'9752601K','JOSE LUIS  LANTADILLA MALTES',1855),(5791,'158096056','ROBERTO SOTO MUÑOZ',1856),(5792,'154144714','CARLOS PATRICIO RIQUELME IBARRA',1857),(5793,'158941864','CRISTIAN ALBERTO VILLEGAS ESCOBAR',1858),(5794,'154277188','ALFREDO ANTONIO ZAMORANO PEREZ',1850),(5795,'104068960','FELIX  ARTURO OSSES VERA',1859),(5796,'130688047','RAUL ANDRES SEPULVEDA ALVARADO',1860),(5797,'155340975','JESUS GARRIDO PLAZA',1861),(5798,'158131153','PAULINA ANDREA HEREDIA PINO',1862),(5799,'90040596','ARTURO ROJAS RAMIREZ',1863),(5800,'64981927','ALBERTO EDUARDO ARCE ARREDONDO',1857),(5801,'107199713','JOSE LUIS  ESPINOZA  ESCOBAR',1864),(5802,'122425665','RODRIGO ALEJANDRO CARDEMIL HORTA',1865),(5803,'128104836','JORGE ALEX  SANCHEZ PIZARRO',1866),(5804,'118849744','FABRICIO RAMIRO  OSORIO TORO',1848),(5805,'15831567K','FELIPE  SEPÚLVEDA  SEPÚLVEDA',1867),(5806,'103938619','CARLOS ESTEBAN FERNANDEZ DIAZ',1857),(5807,'157012568','RODRIGO ANDRES  CORONADO  SEVERINO',1847),(5808,'142180626','GONZALO RICARDO   MUÑOZ  VÁSQUEZ',1868),(5809,'128836039','PABLO OSVALDO  SÁEZ  GONZALEZ',1869),(5810,'150227178','CAROLINA  ALEGRÍA .',1870),(5811,'168617860','FELIPE ANDRES LIZAMA ESPINOZA ',1871),(5812,'174397295','PAUL ANDRE MAILLARD BAHAMONDEZ',1857),(5813,'8666075K','EDUARDO GALVEZ  AVARIA',1853),(5814,'189134150','LINDSAY TORRES ROJAS',1866),(5815,'116961237','PAOLA ANDREA PEREZ LEON',1850),(5816,'141481967','MICHELLE SILVA SEMBLER',1872),(5817,'96774990','CRISTIAN VEGA LEIVA',1861),(5818,'243858070','RENE ROLANDO DE LOS RIOS SUAREZ',1873),(5819,'126568800','FREDDY CARRASCO PEREIRA',1874),(5820,'12289102K','CAROLINA DEL CARMEN  BECAR  AGÜERO',1849),(5821,'152516444','JONATTAN  TRAMALEO SOTO',1849),(5822,'91898640','ARCHIBALDO ANTONIO TYTHER ALLENDE',1875),(5823,'83136901','JORGE LENNON IRIARTE',1876),(5824,'143636070','MANUEL ALEJANDRO RAMIREZ MILLACURA',1877),(5825,'112075747','JUAN ENRIQUE GALVEZ OSORIO',1878),(5826,'116332817','PAOLA SOLANGE  ORREGO  RIVANO',1879),(5827,'142463156','SERGIO MAURICIO  AMPUERO  PARRA ',1858),(5828,'122695719','IVAN ENRIQUE  YAÑEZ  LIZANA',1880),(5829,'13711254K','MARIO JESÚS ZEVALLOS CHAVEZ',1859),(5830,'216740025','MANUEL  CARBAJAL FAL',1865),(5831,'169877858','DANIELA ORTIZ .',1881),(5832,'128886141','CAROLINA ANDREA  ARMIJO LAGOS',1857),(5833,'167975038','PABLO CESAR  LLANTEN  SEPULVEDA',1869),(5834,'142859289','PAOLA MARCELA  SANDOVAL  PALLACAL',1879),(5835,'126408056','JESSICA ALBA AREVALO SALGADO',1849),(5836,'161989452','GERMAN ANTONIO CATRINAO MUÑOZ',1855),(5837,'141618547','FRANCISCA  NUÑEZ  MOLINA',1861),(5838,'84525022','MARCO ANTONIO ESTAY BANDA',1882),(5839,'103073219','VICTOR MARCEL COLLARTE LORES',1851),(5840,'170245946','MILENKO CORNEJO .',1883),(5841,'160921447','PATRICIO SILVA .',1879),(5842,'80490933','LUIS TAPIA FERNANDEZ',1851),(5843,'88632478','CRISTIAN ANDRÉS  GUZMÁN  ORELLANA',1884),(5844,'131121865','NICOLAS MILLAN PEIGNAN',1884),(5845,'96693958','RODOLFO DURAN SOUR',1857),(5846,'120994255','FRANCISCO PARRA HIDALGO',1865),(5847,'138375943','LUIS FABIAN BARRIOS CALDERÓN',1863),(5848,'31391911','CESAR MADRID .',1871),(5849,'166566711','MARIA RENE RIVERA  ESCALANTE',1862),(5850,'9960364K','JACQUELINE IVONNE SEPULVEDA  RETAMALES',1861),(5851,'141757075','GENARO ANDRES FARIAS MUÑOZ',1885),(5852,'139737504','CARLOS PATRICIO SIERRA POBLETE',1864),(5853,'7812119K','FRANCISCO JAVIER MUÑOZ ESPINOZA',1875),(5854,'154367764','ALAN MONTERO .',1886),(5855,'14460010K','MAURICIO ANTONIO VALENZUELA  CALDERON',1887),(5856,'134339926','CAROLINA ANDREA  CUBILLOS  MIRANDA ',1874),(5857,'128547126','CRISTIAN  GONZALEZ CESPEDES',1884),(5858,'153545871','MIGUEL ALEJANDRO SOLIS LARA',1859),(5859,'109684759','YASNA DANAC  FONSECA  NAVARRETE',1888),(5860,'111859183','FRANCISCO ALBERTO VASQUEZ DUARTE',1855),(5861,'106677441','MAURICIO HERNAN JARA SOTO',1861),(5862,'132110662','MIGUEL ANGEL FALCON ANACONA',1882),(5863,'167045685','LAURA ECHEVERRIA DEL POZO',1868),(5864,'68465710','FERNANDO PATRICIO CAMPOS BRAMMBILLA',1865),(5865,'117538176','CLAUDIO GONZALO  VIDAL  CEA',1861),(5866,'143946517','IGNACIO GALARCE JARA',1860),(5867,'106775621','RUBEN EDUARDO MENDEZ ESTAY',1889),(5868,'14258302K','DANIEL  CAMPOS  VALENZUELA',1876),(5869,'78979534','JORGE EDUARDO  FRIANT  GAVILAN',1848),(5870,'134955589','JENNY CAROL  CORONADO  CONTRERAS',1890),(5871,'145274761','HUGO ESTEBAN GUERRERO CONTRERAS',1863),(5872,'154512500','DANIEL ANGEL RAMOS NUÑEZ',1881),(5873,'137224666','MACARENA AGUILERA REYES',1855),(5874,'120539078','CRISTIAN FABIAN MENDOZA AILLON',1845),(5875,'13663254K','RICARDO PAOLO OVIEDO GUTIERREZ',1887),(5876,'138690091','RODRIGO GUSTAVO  QUIROZ  MONDACA',1858),(5877,'149001085','FRANCISCO JAVIER HERRERA BLANCO',1860),(5878,'126322291','JULISSA ROSSANNA CISTERNAS TOBAR',1889),(5879,'151813488','FELIPE ALEJANDRO	 OPAZO	 TORRES',1891),(5880,'122078280','JOSE LUIS VALLADARES AYALA',1892),(5881,'126902263','CESAR EMILIO SAEZ RAMIREZ',1889),(5882,'139105001','JESSICA ANTONIETA  NIETO  HERRERA ',1877),(5883,'116388138','MARCOS  RETAMAL .',1879),(5884,'70430215','ROBERTO GATEÑO FUX',1855),(5885,'136625659','PABLO ALEJANDRO GALLARDO ARENAS',1893),(5886,'156136336','ALDO ESTEBAN  ROCHA CUADRA ',1894),(5887,'126362854','ADELQUI RODRIGO CAMPOS GARCIA',1884),(5888,'95848001','FREDDY SEGUNDO COVARRUBIAS URIOLA',1895),(5889,'130683134','OSCAR EDUARDO MUJICA GAETE',1896),(5890,'122500330','JORGE OPAZO LEYTON',1889),(5891,'213','LEANDRO MARCELO JARA JAÑA',1891),(5892,'122259226','MARCELO GIOVANNI MARÍN ARAYA',1852),(5893,'125238475','PAMELA SOLANGE GUTIERREZ OLIVARES',1845),(5894,'128723358','ARIEL GIOVANNE FARIAS AMEBA',1893),(5895,'87607380','MARCELO  ECHENIQUE  FERRANDO',1846),(5896,'134675926','LEONARDO ANDRES SAGAS CACERES',1897),(5897,'78711000','MIGUEL  VILLEGAS OLIVERA',1898),(5898,'144177002','MARCELINA ALCAINO PALLERO',1850),(5899,'156923230','OSCAR MAURICIO  AGUAYO  MORA',1895),(5900,'14136216K','JAIME  SAEZ .',1894),(5901,'143525368','ALEJANDRA CAROLINA VASQUEZ INOSTROZA',1884),(5902,'10165981K','PEDRO PABLO  VICUÑA  CALFIN ',1890);
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'amicarcotizante2'
--
/*!50003 DROP PROCEDURE IF EXISTS `ADD_BODY_MAIL_AMICAR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`test`@`*` PROCEDURE `ADD_BODY_MAIL_AMICAR`()
BEGIN

DECLARE GRUPO INT DEFAULT 1;
DECLARE DIASEMANA VARCHAR(10);
DECLARE VB_TERMINA VARCHAR(10);
DECLARE UNICO INT DEFAULT 0;
DECLARE MSG VARCHAR(10);

DECLARE ADD_ID CURSOR FOR SELECT IDCLIENTE FROM CLIENTESDIARIO;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET VB_TERMINA = TRUE;

SET SQL_SAFE_UPDATES = 0;        
SET @DIASEMANA = (SELECT DAYNAME(NOW()));

INSERT INTO CORREOSERRORFORMATO (IDCLIENTE,RUTCLIENTE,EMAILCLIENTE,NOMBRELOCAL,NOMBREVENDEDOR,RUTVENDEDOR,
								  RUTEJECUTIVOADJUDICA,NOMBREEJECUTIVOADJUDICA,NOMBRECLIENTE,FONOCELULAR,
								  FONOCOMERCIAL,FONOPARTICULAR,MARCAVEHICULO,MODELOVEHICULO,VALORVEHICULO,
                                  IDGRUPO,IDBODY,FECHA,NOMBREJRN,ESTADO)    
SELECT IDCLIENTE,RUTCLIENTE,EMAILCLIENTE,NOMBRELOCAL,NOMBREVENDEDOR,RUTVENDEDOR,
								  RUTEJECUTIVOADJUDICA,NOMBREEJECUTIVOADJUDICA,NOMBRECLIENTE,FONOCELULAR,
								  FONOCOMERCIAL,FONOPARTICULAR,MARCAVEHICULO,MODELOVEHICULO,VALORVEHICULO,
                                  IDGRUPO,IDBODY,FECHA,NOMBREJRN,'Error Formato Correo'
	FROM CLIENTESDIARIO 
	WHERE    EMAILCLIENTE REGEXP 'ñ(.*)@(.*)\.(.*)'
		  OR EMAILCLIENTE REGEXP '(.*)ñ(.*)@(.*)\.(.*)'
		  OR EMAILCLIENTE REGEXP '(.*)ñ@(.*)\.(.*)'
		  OR EMAILCLIENTE REGEXP '(.*)@ñ(.*)\.(.*)'          
		  OR EMAILCLIENTE REGEXP '(.*)@(.*)ñ(.*)\.(.*)'
		  OR EMAILCLIENTE REGEXP '(.*)@(.*)ñ\.(.*)'
		  OR EMAILCLIENTE REGEXP 'xxx(.*)@(.*)\.(.*)'
		  OR EMAILCLIENTE REGEXP '(.*)xxx(.*)@(.*)\.(.*)'
		  OR EMAILCLIENTE REGEXP '(.*)xxx@(.*)\.(.*)'		  
          OR EMAILCLIENTE REGEXP '(.*)@xxx(.*)\.(.*)'          
		  OR EMAILCLIENTE REGEXP '(.*)@(.*)xxx(.*)\.(.*)'
		  OR EMAILCLIENTE REGEXP '(.*)@(.*)xxx\.(.*)'
		  OR EMAILCLIENTE REGEXP 'notiene@(.*)\.(.*)'
		  OR EMAILCLIENTE REGEXP '(.*)@notiene\.(.*)'
		  OR EMAILCLIENTE REGEXP 'notienecorreo@(.*)\.(.*)'	  
          OR EMAILCLIENTE REGEXP '(.*)@notienecorreo\.(.*)'
		  OR EMAILCLIENTE REGEXP 'nousa@(.*)\.(.*)'
		  OR EMAILCLIENTE REGEXP '(.*)@nousa\.(.*)'
		  OR EMAILCLIENTE REGEXP 'nousacorreo@(.*)\.(.*)'
		  OR EMAILCLIENTE REGEXP '(.*)@nousacorreo\.(.*)'
		  OR EMAILCLIENTE REGEXP 'ntiene@(.*)\.(.*)'
		  OR EMAILCLIENTE REGEXP '(.*)@ntiene\.(.*)'
		  OR EMAILCLIENTE REGEXP 'sincorreo@(.*)\.(.*)'
		  OR EMAILCLIENTE REGEXP '(.*)@sincorreo\.(.*)'
		  OR EMAILCLIENTE REGEXP 'sininfo@(.*)\.(.*)'
		  OR EMAILCLIENTE REGEXP '(.*)@sininfo\.(.*)'
		  OR EMAILCLIENTE REGEXP 'sinmail@(.*)\.(.*)'
		  OR EMAILCLIENTE REGEXP '(.*)@sinmail\.(.*)'
		  OR EMAILCLIENTE REGEXP '^[0-9]+$'
		  OR EMAILCLIENTE REGEXP '^[0-9]+$@(.*)\.(.*)'
		  OR EMAILCLIENTE REGEXP '(.*)@^[0-9]+$\.(.*)'   
		  OR EMAILCLIENTE REGEXP '(.*)@(.*)\.^[0-9]+$'
		  OR EMAILCLIENTE NOT REGEXP '(.*)@(.*).(.*)'
          OR EMAILCLIENTE = ""
          OR EMAILCLIENTE IS NULL;
          
DELETE FROM CLIENTESDIARIO 
	WHERE
		EMAILCLIENTE REGEXP 'ñ(.*)@(.*).(.*)'
		OR EMAILCLIENTE REGEXP '(.*)ñ(.*)@(.*).(.*)'
		OR EMAILCLIENTE REGEXP '(.*)ñ@(.*).(.*)'
		OR EMAILCLIENTE REGEXP '(.*)@ñ(.*).(.*)'
		OR EMAILCLIENTE REGEXP '(.*)@(.*)ñ(.*).(.*)'
		OR EMAILCLIENTE REGEXP '(.*)@(.*)ñ.(.*)'
		OR EMAILCLIENTE REGEXP 'xxx(.*)@(.*).(.*)'
		OR EMAILCLIENTE REGEXP '(.*)xxx(.*)@(.*).(.*)'
		OR EMAILCLIENTE REGEXP '(.*)xxx@(.*).(.*)'
		OR EMAILCLIENTE REGEXP '(.*)@xxx(.*).(.*)'
		OR EMAILCLIENTE REGEXP '(.*)@(.*)xxx(.*).(.*)'
		OR EMAILCLIENTE REGEXP '(.*)@(.*)xxx.(.*)'
		OR EMAILCLIENTE REGEXP 'notiene@(.*).(.*)'
		OR EMAILCLIENTE REGEXP '(.*)@notiene.(.*)'
		OR EMAILCLIENTE REGEXP 'notienecorreo@(.*).(.*)'
		OR EMAILCLIENTE REGEXP '(.*)@notienecorreo.(.*)'
		OR EMAILCLIENTE REGEXP 'nousa@(.*).(.*)'
		OR EMAILCLIENTE REGEXP '(.*)@nousa.(.*)'
		OR EMAILCLIENTE REGEXP 'nousacorreo@(.*).(.*)'
		OR EMAILCLIENTE REGEXP '(.*)@nousacorreo.(.*)'
		OR EMAILCLIENTE REGEXP 'ntiene@(.*).(.*)'
		OR EMAILCLIENTE REGEXP '(.*)@ntiene.(.*)'
		OR EMAILCLIENTE REGEXP 'sincorreo@(.*).(.*)'
		OR EMAILCLIENTE REGEXP '(.*)@sincorreo.(.*)'
		OR EMAILCLIENTE REGEXP 'sininfo@(.*).(.*)'
		OR EMAILCLIENTE REGEXP '(.*)@sininfo.(.*)'
		OR EMAILCLIENTE REGEXP 'sinmail@(.*).(.*)'
		OR EMAILCLIENTE REGEXP '(.*)@sinmail.(.*)'
		OR EMAILCLIENTE REGEXP '^[0-9]+$'
		OR EMAILCLIENTE REGEXP '^[0-9]+$@(.*).(.*)'
		OR EMAILCLIENTE REGEXP '(.*)@^[0-9]+$.(.*)'
		OR EMAILCLIENTE REGEXP '(.*)@(.*).^[0-9]+$'
		OR EMAILCLIENTE NOT REGEXP '(.*)@(.*).(.*)'
		OR EMAILCLIENTE = ""
		OR EMAILCLIENTE IS NULL;
    
INSERT INTO CORREOSERRORFORMATO (IDCLIENTE,RUTCLIENTE,EMAILCLIENTE,NOMBRELOCAL,NOMBREVENDEDOR,RUTVENDEDOR,
								  RUTEJECUTIVOADJUDICA,NOMBREEJECUTIVOADJUDICA,NOMBRECLIENTE,FONOCELULAR,
								  FONOCOMERCIAL,FONOPARTICULAR,MARCAVEHICULO,MODELOVEHICULO,VALORVEHICULO,
                                  IDGRUPO,IDBODY,FECHA,NOMBREJRN,ESTADO)    
SELECT IDCLIENTE,RUTCLIENTE,EMAILCLIENTE,NOMBRELOCAL,NOMBREVENDEDOR,RUTVENDEDOR,
								  RUTEJECUTIVOADJUDICA,NOMBREEJECUTIVOADJUDICA,NOMBRECLIENTE,FONOCELULAR,
								  FONOCOMERCIAL,FONOPARTICULAR,MARCAVEHICULO,MODELOVEHICULO,VALORVEHICULO,
                                  IDGRUPO,IDBODY,FECHA,NOMBREJRN,'Error Rut Vendedor'
	FROM CLIENTESDIARIO 
	WHERE  	RUTVENDEDOR = ""
			OR RUTVENDEDOR IS NULL;
            
DELETE FROM CLIENTESDIARIO 
	WHERE  	RUTVENDEDOR = ""
			OR RUTVENDEDOR IS NULL;
            
INSERT INTO CORREOSERRORFORMATO (IDCLIENTE,RUTCLIENTE,EMAILCLIENTE,NOMBRELOCAL,NOMBREVENDEDOR,RUTVENDEDOR,
								  RUTEJECUTIVOADJUDICA,NOMBREEJECUTIVOADJUDICA,NOMBRECLIENTE,FONOCELULAR,
								  FONOCOMERCIAL,FONOPARTICULAR,MARCAVEHICULO,MODELOVEHICULO,VALORVEHICULO,
                                  IDGRUPO,IDBODY,FECHA,NOMBREJRN,ESTADO)    
SELECT IDCLIENTE,RUTCLIENTE,EMAILCLIENTE,NOMBRELOCAL,NOMBREVENDEDOR,RUTVENDEDOR,
								  RUTEJECUTIVOADJUDICA,NOMBREEJECUTIVOADJUDICA,NOMBRECLIENTE,FONOCELULAR,
								  FONOCOMERCIAL,FONOPARTICULAR,MARCAVEHICULO,MODELOVEHICULO,VALORVEHICULO,
                                  IDGRUPO,IDBODY,FECHA,NOMBREJRN,'Error Rut Ejecutivo'
	FROM CLIENTESDIARIO 
	WHERE  	RUTEJECUTIVOADJUDICA = ""
			OR RUTEJECUTIVOADJUDICA IS NULL;
            
DELETE FROM CLIENTESDIARIO 
	WHERE  	RUTEJECUTIVOADJUDICA = ""
			OR RUTEJECUTIVOADJUDICA IS NULL;
       
	DELETE Cd FROM CLIENTESDIARIO AS CD
        INNER JOIN
    CLIENTES AS C ON C.RUTCLIENTE = CD.RUTCLIENTE 
WHERE
    C.DESINSCRITO = 1;

	IF (@DIASEMANA = 'MONDAY') THEN	
		TRUNCATE CLIENTESSEMANAL;
        OPEN ADD_ID;
        RECORRE_CURSOR: LOOP
                FETCH ADD_ID INTO UNICO;
					IF VB_TERMINA THEN
						LEAVE RECORRE_CURSOR;
					END IF;
                    IF GRUPO <= 4 THEN
						UPDATE CLIENTESDIARIO
							SET IDGRUPO = GRUPO
						WHERE IDCLIENTE = UNICO;     
                        
                        SET GRUPO = GRUPO + 1;
                        
					ELSE
							
						UPDATE CLIENTESDIARIO C
						SET C.IDGRUPO = 1
						WHERE C.IDCLIENTE = UNICO 
                        AND C.IDGRUPO IS NULL;  
                    
						SET GRUPO = 2;
                        
					END IF;
				END LOOP;
			CLOSE ADD_ID;
            
		UPDATE CLIENTESDIARIO 
		SET 
		IDBODY = 1
		WHERE
		IDGRUPO IN (1 , 2) AND IDBODY IS NULL;

		UPDATE CLIENTESDIARIO 
		SET 
		IDBODY = 2
		WHERE
		IDGRUPO IN (3) AND IDBODY IS NULL;

		UPDATE CLIENTESDIARIO 
		SET 
		IDBODY = 3
		WHERE
		IDGRUPO IN (4) AND IDBODY IS NULL;

		DELETE FROM CLIENTESSEMANAL;
            
		INSERT INTO CLIENTESSEMANAL (IDCLIENTE,RUTCLIENTE,EMAILCLIENTE,NOMBRELOCAL,NOMBREVENDEDOR,RUTVENDEDOR,
								  RUTEJECUTIVOADJUDICA,NOMBREEJECUTIVOADJUDICA,NOMBRECLIENTE,FONOCELULAR,
								  FONOCOMERCIAL,FONOPARTICULAR,MARCAVEHICULO,MODELOVEHICULO,VALORVEHICULO,
                                  IDGRUPO,IDBODY,FECHA,NOMBREJRN)
		SELECT IDCLIENTE,RUTCLIENTE,EMAILCLIENTE,NOMBRELOCAL,NOMBREVENDEDOR,RUTVENDEDOR,
								  RUTEJECUTIVOADJUDICA,NOMBREEJECUTIVOADJUDICA,NOMBRECLIENTE,FONOCELULAR,
								  FONOCOMERCIAL,FONOPARTICULAR,MARCAVEHICULO,MODELOVEHICULO,VALORVEHICULO,
                                  IDGRUPO,IDBODY,FECHA,NOMBREJRN
		FROM CLIENTESDIARIO;
        
	ELSE
    
		UPDATE CLIENTESDIARIO AS C
		INNER JOIN CLIENTESSEMANAL AS S  
		ON S.EMAILCLIENTE = C.EMAILCLIENTE
		SET C.IDGRUPO = S.IDGRUPO, C.IDBODY = S.IDBODY;
        
        OPEN ADD_ID;

			RECORRE_CURSOR2: LOOP
				FETCH ADD_ID INTO UNICO;
					IF VB_TERMINA THEN
						LEAVE RECORRE_CURSOR2;
					END IF;

                    IF GRUPO <= 4 THEN
                    
						UPDATE CLIENTESDIARIO C
						SET C.IDGRUPO = GRUPO
						WHERE C.IDCLIENTE = UNICO 
                        AND C.IDGRUPO IS NULL;  
                        
						SET GRUPO = GRUPO + 1;
					ELSE
                    
						UPDATE CLIENTESDIARIO C
						SET C.IDGRUPO = 1
						WHERE C.IDCLIENTE = UNICO 
                        AND C.IDGRUPO IS NULL;  
                    
						SET GRUPO = 2;
                    END IF;
				END LOOP;
			CLOSE ADD_ID;
        
		UPDATE CLIENTESDIARIO 
		SET 
		IDBODY = 1
		WHERE
		IDGRUPO IN (1 , 2) AND IDBODY IS NULL;

		UPDATE CLIENTESDIARIO 
		SET 
		IDBODY = 2
		WHERE
		IDGRUPO IN (3) AND IDBODY IS NULL;

		UPDATE CLIENTESDIARIO 
		SET 
		IDBODY = 3
		WHERE
		IDGRUPO IN (4) AND IDBODY IS NULL;

        INSERT INTO CLIENTESSEMANAL (IDCLIENTE,RUTCLIENTE,EMAILCLIENTE,NOMBRELOCAL,NOMBREVENDEDOR,RUTVENDEDOR,
								  RUTEJECUTIVOADJUDICA,NOMBREEJECUTIVOADJUDICA,NOMBRECLIENTE,FONOCELULAR,
								  FONOCOMERCIAL,FONOPARTICULAR,MARCAVEHICULO,MODELOVEHICULO,VALORVEHICULO,
                                  IDGRUPO,IDBODY,FECHA,NOMBREJRN)
		SELECT IDCLIENTE,RUTCLIENTE,EMAILCLIENTE,NOMBRELOCAL,NOMBREVENDEDOR,RUTVENDEDOR,
								  RUTEJECUTIVOADJUDICA,NOMBREEJECUTIVOADJUDICA,NOMBRECLIENTE,FONOCELULAR,
								  FONOCOMERCIAL,FONOPARTICULAR,MARCAVEHICULO,MODELOVEHICULO,VALORVEHICULO,
                                  IDGRUPO,IDBODY,FECHA,NOMBREJRN
		FROM CLIENTESDIARIO CS WHERE DATE(CS.FECHA) NOT IN (SELECT DATE(FECHA) FROM CLIENTESSEMANAL);

	END IF;
    
	INSERT INTO CLIENTES (IDCLIENTE,RUTCLIENTE,EMAILCLIENTE,NOMBRELOCAL,NOMBREVENDEDOR,RUTVENDEDOR,
								  RUTEJECUTIVOADJUDICA,NOMBREEJECUTIVOADJUDICA,NOMBRECLIENTE,FONOCELULAR,
								  FONOCOMERCIAL,FONOPARTICULAR,MARCAVEHICULO,MODELOVEHICULO,VALORVEHICULO,
                                  IDGRUPO,IDBODY,FECHA,NOMBREJRN)
	SELECT IDCLIENTE,RUTCLIENTE,EMAILCLIENTE,NOMBRELOCAL,NOMBREVENDEDOR,RUTVENDEDOR,
								  RUTEJECUTIVOADJUDICA,NOMBREEJECUTIVOADJUDICA,NOMBRECLIENTE,FONOCELULAR,
								  FONOCOMERCIAL,FONOPARTICULAR,MARCAVEHICULO,MODELOVEHICULO,VALORVEHICULO,
                                  IDGRUPO,IDBODY,FECHA,NOMBREJRN
	FROM CLIENTESSEMANAL CS WHERE DATE(CS.FECHA) NOT IN (SELECT DATE(FECHA) FROM CLIENTES);

	SET SQL_SAFE_UPDATES = 1;
    
    SELECT "STORED PROCEDURE 'ADD_BODY_MAIL_AMICAR' FINISH OK" AS MSG;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-23  9:56:14
