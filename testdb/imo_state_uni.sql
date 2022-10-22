CREATE DATABASE  IF NOT EXISTS `imo_state_uni` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `imo_state_uni`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: imo_state_uni
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_id` varchar(32) NOT NULL,
  `vacation_hours` varchar(32) NOT NULL,
  `accpassword` varchar(32) NOT NULL,
  `ownername` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('11223','50','dumb','Lana'),('7483','16','badpass','Sarah');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `asset_id` varchar(32) NOT NULL,
  `assetname` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  KEY `asset_fk` (`company`),
  CONSTRAINT `asset_fk` FOREIGN KEY (`company`) REFERENCES `company` (`company_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES ('HFR39224','Delivery Van','Amazon'),('JEK493','Espresso Machine','Starbucks');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_account`
--

DROP TABLE IF EXISTS `bank_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_account` (
  `routingnum` varchar(32) NOT NULL,
  `ownername` varchar(32) NOT NULL,
  `branchname` varchar(32) NOT NULL,
  KEY `bankownername` (`ownername`),
  CONSTRAINT `bankownername` FOREIGN KEY (`ownername`) REFERENCES `person` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_account`
--

LOCK TABLES `bank_account` WRITE;
/*!40000 ALTER TABLE `bank_account` DISABLE KEYS */;
INSERT INTO `bank_account` VALUES ('8888','Lana','Chase');
/*!40000 ALTER TABLE `bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_branch`
--

DROP TABLE IF EXISTS `bank_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_branch` (
  `branch_id` varchar(32) DEFAULT NULL,
  `bank_name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_branch`
--

LOCK TABLES `bank_branch` WRITE;
/*!40000 ALTER TABLE `bank_branch` DISABLE KEYS */;
INSERT INTO `bank_branch` VALUES ('4393','Chase');
/*!40000 ALTER TABLE `bank_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_id` varchar(32) DEFAULT NULL,
  `company_name` varchar(32) NOT NULL,
  PRIMARY KEY (`company_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('49023F','Amazon'),('493DF','Starbucks');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `contract_id` varchar(32) NOT NULL,
  `companyName` varchar(32) NOT NULL,
  `empName` varchar(32) NOT NULL,
  `beginDate` varchar(32) NOT NULL,
  `pay` varchar(32) NOT NULL,
  KEY `contractcompany_fk` (`companyName`),
  KEY `contractemp_fk` (`empName`),
  CONSTRAINT `contractcompany_fk` FOREIGN KEY (`companyName`) REFERENCES `company` (`company_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contractemp_fk` FOREIGN KEY (`empName`) REFERENCES `employee` (`empname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES ('EF743','Amazon','Lana','July 23, 2004','65,000');
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dentalinsurance`
--

DROP TABLE IF EXISTS `dentalinsurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dentalinsurance` (
  `dental_id` varchar(32) NOT NULL,
  `practitioner` varchar(32) NOT NULL,
  `benificiary` varchar(32) NOT NULL,
  KEY `dental_fk` (`benificiary`),
  CONSTRAINT `dental_fk` FOREIGN KEY (`benificiary`) REFERENCES `employee` (`empname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dentalinsurance`
--

LOCK TABLES `dentalinsurance` WRITE;
/*!40000 ALTER TABLE `dentalinsurance` DISABLE KEYS */;
INSERT INTO `dentalinsurance` VALUES ('WSF492','Happy Dental','Lana');
/*!40000 ALTER TABLE `dentalinsurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` varchar(32) NOT NULL,
  `depName` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  KEY `departmentcomp_fk` (`company`),
  CONSTRAINT `departmentcomp_fk` FOREIGN KEY (`company`) REFERENCES `company` (`company_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('FF473','IT','Amazon');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent` (
  `dependenton` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  KEY `dependent_fk` (`dependenton`),
  CONSTRAINT `dependent_fk` FOREIGN KEY (`dependenton`) REFERENCES `employee` (`empname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES ('Lana','Joey');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `license` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('NFEM93M','Jim Smith');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edd`
--

DROP TABLE IF EXISTS `edd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edd` (
  `case_number` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `location` varchar(32) NOT NULL,
  KEY `edd_fk` (`name`),
  CONSTRAINT `edd_fk` FOREIGN KEY (`name`) REFERENCES `employee` (`empname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edd`
--

LOCK TABLES `edd` WRITE;
/*!40000 ALTER TABLE `edd` DISABLE KEYS */;
INSERT INTO `edd` VALUES ('9568','Lana','1000 Street Avenue');
/*!40000 ALTER TABLE `edd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` varchar(32) NOT NULL,
  `position` varchar(32) NOT NULL,
  `department` varchar(32) NOT NULL,
  `empname` varchar(32) NOT NULL,
  `companyName` varchar(32) NOT NULL,
  PRIMARY KEY (`empname`),
  KEY `employee_comp_fk` (`companyName`),
  CONSTRAINT `employee_comp_fk` FOREIGN KEY (`companyName`) REFERENCES `company` (`company_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_person_name` FOREIGN KEY (`empname`) REFERENCES `person` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('7778','Engineer','IT','Lana','Amazon'),('7483','Cashier','Customer Service','Sarah','Starbucks');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeebenefits`
--

DROP TABLE IF EXISTS `employeebenefits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeebenefits` (
  `name` varchar(32) NOT NULL,
  `monthlycost` varchar(32) NOT NULL,
  KEY `benefit_fk` (`name`),
  CONSTRAINT `benefit_fk` FOREIGN KEY (`name`) REFERENCES `employee` (`empname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeebenefits`
--

LOCK TABLES `employeebenefits` WRITE;
/*!40000 ALTER TABLE `employeebenefits` DISABLE KEYS */;
INSERT INTO `employeebenefits` VALUES ('Lana','450');
/*!40000 ALTER TABLE `employeebenefits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expensereport`
--

DROP TABLE IF EXISTS `expensereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expensereport` (
  `expense_id` varchar(32) NOT NULL,
  `expensetype` varchar(32) NOT NULL,
  `expense_amount` varchar(32) NOT NULL,
  KEY `expenset_fk` (`expensetype`),
  CONSTRAINT `expenset_fk` FOREIGN KEY (`expensetype`) REFERENCES `reports` (`reporttype`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expensereport`
--

LOCK TABLES `expensereport` WRITE;
/*!40000 ALTER TABLE `expensereport` DISABLE KEYS */;
INSERT INTO `expensereport` VALUES ('123','Expense','130');
/*!40000 ALTER TABLE `expensereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externalaudit`
--

DROP TABLE IF EXISTS `externalaudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `externalaudit` (
  `audit_id` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `rate` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `discrepency` varchar(32) NOT NULL,
  KEY `external_fk` (`company`),
  CONSTRAINT `external_fk` FOREIGN KEY (`company`) REFERENCES `company` (`company_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externalaudit`
--

LOCK TABLES `externalaudit` WRITE;
/*!40000 ALTER TABLE `externalaudit` DISABLE KEYS */;
INSERT INTO `externalaudit` VALUES ('9548G','Amazon','15/Hr','Joes Taxes','7,820');
/*!40000 ALTER TABLE `externalaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `federaltax`
--

DROP TABLE IF EXISTS `federaltax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `federaltax` (
  `country` varchar(32) NOT NULL,
  `rate` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `federaltax`
--

LOCK TABLES `federaltax` WRITE;
/*!40000 ALTER TABLE `federaltax` DISABLE KEYS */;
INSERT INTO `federaltax` VALUES ('USA','.04');
/*!40000 ALTER TABLE `federaltax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital` (
  `hospital_id` varchar(32) NOT NULL,
  `address` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES ('JW84NM','3200 Hospital Street','Kaiser');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injuredemployee`
--

DROP TABLE IF EXISTS `injuredemployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injuredemployee` (
  `name` varchar(32) NOT NULL,
  `injury` varchar(32) NOT NULL,
  KEY `injured_fk` (`name`),
  CONSTRAINT `injured_fk` FOREIGN KEY (`name`) REFERENCES `employee` (`empname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injuredemployee`
--

LOCK TABLES `injuredemployee` WRITE;
/*!40000 ALTER TABLE `injuredemployee` DISABLE KEYS */;
INSERT INTO `injuredemployee` VALUES ('Lana','Broken foot');
/*!40000 ALTER TABLE `injuredemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injuryclaim`
--

DROP TABLE IF EXISTS `injuryclaim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injuryclaim` (
  `claim_id` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `compensation` varchar(32) NOT NULL,
  KEY `injuryclaim_fk` (`name`),
  CONSTRAINT `injuryclaim_fk` FOREIGN KEY (`name`) REFERENCES `employee` (`empname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injuryclaim`
--

LOCK TABLES `injuryclaim` WRITE;
/*!40000 ALTER TABLE `injuryclaim` DISABLE KEYS */;
INSERT INTO `injuryclaim` VALUES ('4738','Lana','4,000');
/*!40000 ALTER TABLE `injuryclaim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurancecompany`
--

DROP TABLE IF EXISTS `insurancecompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurancecompany` (
  `company_name` varchar(32) NOT NULL,
  `phone` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurancecompany`
--

LOCK TABLES `insurancecompany` WRITE;
/*!40000 ALTER TABLE `insurancecompany` DISABLE KEYS */;
INSERT INTO `insurancecompany` VALUES ('Allstate','111-1111');
/*!40000 ALTER TABLE `insurancecompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internalaudit`
--

DROP TABLE IF EXISTS `internalaudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internalaudit` (
  `audit_id` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `discrepency` varchar(32) NOT NULL,
  KEY `internal_fk` (`company`),
  CONSTRAINT `internal_fk` FOREIGN KEY (`company`) REFERENCES `company` (`company_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internalaudit`
--

LOCK TABLES `internalaudit` WRITE;
/*!40000 ALTER TABLE `internalaudit` DISABLE KEYS */;
INSERT INTO `internalaudit` VALUES ('FF84','Amazon','6,823');
/*!40000 ALTER TABLE `internalaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `irs`
--

DROP TABLE IF EXISTS `irs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `irs` (
  `audit_id` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `discrepency` varchar(32) NOT NULL,
  KEY `irs_fk` (`company`),
  CONSTRAINT `irs_fk` FOREIGN KEY (`company`) REFERENCES `company` (`company_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `irs`
--

LOCK TABLES `irs` WRITE;
/*!40000 ALTER TABLE `irs` DISABLE KEYS */;
INSERT INTO `irs` VALUES ('H5K84','Amazon','4,203');
/*!40000 ALTER TABLE `irs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicalinsurance`
--

DROP TABLE IF EXISTS `medicalinsurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicalinsurance` (
  `medical_id` varchar(32) NOT NULL,
  `practitioner` varchar(32) NOT NULL,
  `benificiary` varchar(32) NOT NULL,
  KEY `medical_fk` (`benificiary`),
  CONSTRAINT `medical_fk` FOREIGN KEY (`benificiary`) REFERENCES `employee` (`empname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicalinsurance`
--

LOCK TABLES `medicalinsurance` WRITE;
/*!40000 ALTER TABLE `medicalinsurance` DISABLE KEYS */;
INSERT INTO `medicalinsurance` VALUES ('EV43H','UCSF','Lana');
/*!40000 ALTER TABLE `medicalinsurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paycheck`
--

DROP TABLE IF EXISTS `paycheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paycheck` (
  `paycheck_id` varchar(32) NOT NULL,
  `payperiod` varchar(32) NOT NULL,
  `netpay` varchar(32) NOT NULL,
  `grosspay` varchar(32) NOT NULL,
  `empname` varchar(32) NOT NULL,
  KEY `paycheckemployee` (`empname`),
  CONSTRAINT `paycheckemployee` FOREIGN KEY (`empname`) REFERENCES `employee` (`empname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paycheck`
--

LOCK TABLES `paycheck` WRITE;
/*!40000 ALTER TABLE `paycheck` DISABLE KEYS */;
INSERT INTO `paycheck` VALUES ('48329','September 1, 2019','1200','950','Lana');
/*!40000 ALTER TABLE `paycheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payrolltaxform`
--

DROP TABLE IF EXISTS `payrolltaxform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payrolltaxform` (
  `form_id` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `date` varchar(32) NOT NULL,
  `totalpaid` varchar(32) NOT NULL,
  KEY `form_fk` (`company`),
  CONSTRAINT `form_fk` FOREIGN KEY (`company`) REFERENCES `company` (`company_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payrolltaxform`
--

LOCK TABLES `payrolltaxform` WRITE;
/*!40000 ALTER TABLE `payrolltaxform` DISABLE KEYS */;
INSERT INTO `payrolltaxform` VALUES ('MN48N','Amazon','August 3, 2019','800,000');
/*!40000 ALTER TABLE `payrolltaxform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `ssn` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `dob` varchar(32) NOT NULL,
  `address` varchar(32) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('521987790','Efren','05201996','4631 11th Avenue'),('619887890','Lana','08281996','1600 Holloway Ave'),('987896667','Sarah','12252001','9825 Honeybook Street');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `report_id` varchar(32) NOT NULL,
  `dateprinted` varchar(32) NOT NULL,
  `reporttype` varchar(32) NOT NULL,
  `expense_total` varchar(32) NOT NULL,
  PRIMARY KEY (`reporttype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES ('12313','July 1, 2020','Expense','300');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialsecurity`
--

DROP TABLE IF EXISTS `socialsecurity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialsecurity` (
  `rate` varchar(32) NOT NULL,
  `accumulated` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  KEY `ss_fk` (`name`),
  CONSTRAINT `ss_fk` FOREIGN KEY (`name`) REFERENCES `person` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialsecurity`
--

LOCK TABLES `socialsecurity` WRITE;
/*!40000 ALTER TABLE `socialsecurity` DISABLE KEYS */;
INSERT INTO `socialsecurity` VALUES ('.45','80,000','Lana');
/*!40000 ALTER TABLE `socialsecurity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statetax`
--

DROP TABLE IF EXISTS `statetax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statetax` (
  `state` varchar(32) NOT NULL,
  `rate` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statetax`
--

LOCK TABLES `statetax` WRITE;
/*!40000 ALTER TABLE `statetax` DISABLE KEYS */;
INSERT INTO `statetax` VALUES ('California','.08'),('Washington','.08');
/*!40000 ALTER TABLE `statetax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxreturn`
--

DROP TABLE IF EXISTS `taxreturn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxreturn` (
  `return_id` varchar(32) NOT NULL,
  `taxespaid` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  KEY `return_fk` (`company`),
  CONSTRAINT `return_fk` FOREIGN KEY (`company`) REFERENCES `company` (`company_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxreturn`
--

LOCK TABLES `taxreturn` WRITE;
/*!40000 ALTER TABLE `taxreturn` DISABLE KEYS */;
INSERT INTO `taxreturn` VALUES ('7548JF','25,000','Amazon');
/*!40000 ALTER TABLE `taxreturn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timecard`
--

DROP TABLE IF EXISTS `timecard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timecard` (
  `timecard_id` varchar(32) NOT NULL,
  `nametimecard` varchar(32) NOT NULL,
  `punchin` varchar(32) NOT NULL,
  `punchout` varchar(32) NOT NULL,
  `total_time` varchar(32) NOT NULL,
  KEY `timecard_name` (`nametimecard`),
  CONSTRAINT `timecard_name` FOREIGN KEY (`nametimecard`) REFERENCES `employee` (`empname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timecard`
--

LOCK TABLES `timecard` WRITE;
/*!40000 ALTER TABLE `timecard` DISABLE KEYS */;
INSERT INTO `timecard` VALUES ('11453','Lana','5:00','10:30','23');
/*!40000 ALTER TABLE `timecard` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-22 23:54:30
