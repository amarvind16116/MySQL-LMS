-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: lms
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `CandidateBankDetails`
--

DROP TABLE IF EXISTS `CandidateBankDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CandidateBankDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `account_number` bigint(20) NOT NULL,
  `account_number_verified` tinyint(1) NOT NULL,
  `ifsc_code` varchar(10) NOT NULL,
  `is_ifsc_code_verified` tinyint(1) DEFAULT NULL,
  `pan_number` varchar(10) NOT NULL,
  `pan_number_verified` tinyint(1) NOT NULL,
  `addhaar_number` bigint(20) NOT NULL,
  `is_adhaar_number_verified` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_id` (`candidate_id`),
  KEY `creator_user` (`creator_user`),
  CONSTRAINT `CandidateBankDetails_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `HiredCandidate` (`id`),
  CONSTRAINT `CandidateBankDetails_ibfk_2` FOREIGN KEY (`creator_user`) REFERENCES `UserDetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CandidateBankDetails`
--

LOCK TABLES `CandidateBankDetails` WRITE;
/*!40000 ALTER TABLE `CandidateBankDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `CandidateBankDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CandidateDocuments`
--

DROP TABLE IF EXISTS `CandidateDocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CandidateDocuments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `doc_type` varchar(10) NOT NULL,
  `doc_path` varchar(50) NOT NULL,
  `doc_status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_id` (`candidate_id`),
  KEY `creator_user` (`creator_user`),
  CONSTRAINT `CandidateDocuments_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `HiredCandidate` (`id`),
  CONSTRAINT `CandidateDocuments_ibfk_2` FOREIGN KEY (`creator_user`) REFERENCES `UserDetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CandidateDocuments`
--

LOCK TABLES `CandidateDocuments` WRITE;
/*!40000 ALTER TABLE `CandidateDocuments` DISABLE KEYS */;
/*!40000 ALTER TABLE `CandidateDocuments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CandidateQualification`
--

DROP TABLE IF EXISTS `CandidateQualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CandidateQualification` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `diploma` varchar(20) NOT NULL,
  `degree_name` varchar(25) NOT NULL,
  `is_degree_name_verified` tinyint(1) NOT NULL,
  `employee_discipline` varchar(10) NOT NULL,
  `is_employee_discipline_verified` tinyint(1) NOT NULL,
  `passing_year` int(11) NOT NULL,
  `is_passing_year_verified` tinyint(1) NOT NULL,
  `aggregate_percentage` double(4,2) NOT NULL,
  `final_year_percentage` double(4,2) NOT NULL,
  `is_final_year_per_verified` tinyint(1) NOT NULL,
  `training_institute` varchar(50) NOT NULL,
  `is_training_institute_verified` tinyint(1) NOT NULL,
  `training_duration_month` int(11) NOT NULL,
  `is_training_duration_month_verified` tinyint(1) NOT NULL,
  `other_training` varchar(30) NOT NULL,
  `is_other_training_verified` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `candidate_id` (`candidate_id`),
  KEY `creator_user` (`creator_user`),
  CONSTRAINT `CandidateQualification_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `HiredCandidate` (`id`),
  CONSTRAINT `CandidateQualification_ibfk_2` FOREIGN KEY (`creator_user`) REFERENCES `UserDetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CandidateQualification`
--

LOCK TABLES `CandidateQualification` WRITE;
/*!40000 ALTER TABLE `CandidateQualification` DISABLE KEYS */;
/*!40000 ALTER TABLE `CandidateQualification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CandidateTechStackAssignment`
--

DROP TABLE IF EXISTS `CandidateTechStackAssignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CandidateTechStackAssignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requirement_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `assign_date` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `requirement_id` (`requirement_id`),
  KEY `candidate_id` (`candidate_id`),
  KEY `creator_user` (`creator_user`),
  CONSTRAINT `CandidateTechStackAssignment_ibfk_1` FOREIGN KEY (`requirement_id`) REFERENCES `CompanyRequirement` (`id`),
  CONSTRAINT `CandidateTechStackAssignment_ibfk_2` FOREIGN KEY (`candidate_id`) REFERENCES `HiredCandidate` (`id`),
  CONSTRAINT `CandidateTechStackAssignment_ibfk_3` FOREIGN KEY (`creator_user`) REFERENCES `UserDetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CandidateTechStackAssignment`
--

LOCK TABLES `CandidateTechStackAssignment` WRITE;
/*!40000 ALTER TABLE `CandidateTechStackAssignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `CandidateTechStackAssignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Company`
--

DROP TABLE IF EXISTS `Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `address` varchar(70) NOT NULL,
  `location` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `creator_user` (`creator_user`),
  CONSTRAINT `Company_ibfk_1` FOREIGN KEY (`creator_user`) REFERENCES `UserDetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Company`
--

LOCK TABLES `Company` WRITE;
/*!40000 ALTER TABLE `Company` DISABLE KEYS */;
/*!40000 ALTER TABLE `Company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `CompanyRequire`
--

DROP TABLE IF EXISTS `CompanyRequire`;
/*!50001 DROP VIEW IF EXISTS `CompanyRequire`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `CompanyRequire` AS SELECT 
 1 AS `id`,
 1 AS `company_id`,
 1 AS `tech_stack_id`,
 1 AS `tech_type_id`,
 1 AS `lead_id`,
 1 AS `maker_program_id`,
 1 AS `mentor_ideation_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `CompanyRequirement`
--

DROP TABLE IF EXISTS `CompanyRequirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompanyRequirement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `requested_month` date NOT NULL,
  `city` varchar(15) NOT NULL,
  `is_doc_verification` tinyint(1) NOT NULL,
  `requirement_doc_path` varchar(50) NOT NULL,
  `number_of_engg` int(11) NOT NULL,
  `tech_stack_id` int(11) NOT NULL,
  `tech_type_id` int(11) NOT NULL,
  `maker_program_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `mentor_ideation_id` int(11) NOT NULL,
  `buddy_engg_id` int(11) NOT NULL,
  `special_remark` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `tech_stack_id` (`tech_stack_id`),
  KEY `tech_type_id` (`tech_type_id`),
  KEY `maker_program_id` (`maker_program_id`),
  KEY `mentor_ideation_id` (`mentor_ideation_id`),
  KEY `creator_user` (`creator_user`),
  CONSTRAINT `CompanyRequirement_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `Company` (`id`),
  CONSTRAINT `CompanyRequirement_ibfk_2` FOREIGN KEY (`tech_stack_id`) REFERENCES `TechStack` (`id`),
  CONSTRAINT `CompanyRequirement_ibfk_3` FOREIGN KEY (`tech_type_id`) REFERENCES `TechType` (`id`),
  CONSTRAINT `CompanyRequirement_ibfk_4` FOREIGN KEY (`maker_program_id`) REFERENCES `MakerProgram` (`id`),
  CONSTRAINT `CompanyRequirement_ibfk_5` FOREIGN KEY (`mentor_ideation_id`) REFERENCES `MentorIdeationMap` (`id`),
  CONSTRAINT `CompanyRequirement_ibfk_6` FOREIGN KEY (`creator_user`) REFERENCES `UserDetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompanyRequirement`
--

LOCK TABLES `CompanyRequirement` WRITE;
/*!40000 ALTER TABLE `CompanyRequirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompanyRequirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FellowshipCandidate`
--

DROP TABLE IF EXISTS `FellowshipCandidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FellowshipCandidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email_id` varchar(30) NOT NULL,
  `hired_city` varchar(20) NOT NULL,
  `degree` varchar(20) NOT NULL,
  `hired_date` date DEFAULT NULL,
  `mobile_number` bigint(20) NOT NULL,
  `permanent_pincode` bigint(20) NOT NULL,
  `hired_lab` varchar(15) NOT NULL,
  `communication_remark` varchar(20) NOT NULL,
  `knowledge_remark` varchar(20) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `is_birth_date_verified` tinyint(1) DEFAULT NULL,
  `parent_name` varchar(30) DEFAULT NULL,
  `parent_occupation` varchar(15) DEFAULT NULL,
  `parents_mobile_number` bigint(20) DEFAULT NULL,
  `parents_annual_salary` bigint(20) DEFAULT NULL,
  `local_address` varchar(70) DEFAULT NULL,
  `permanent_address` varchar(70) DEFAULT NULL,
  `photo_path` varchar(200) DEFAULT NULL,
  `joinig_date` date DEFAULT NULL,
  `candidate_status` varchar(10) DEFAULT NULL,
  `personal_information` varchar(70) DEFAULT NULL,
  `bank_information` varchar(70) DEFAULT NULL,
  `educational_information` varchar(70) DEFAULT NULL,
  `document_status` varchar(20) DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `aggregate_percentage` double(4,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FellowshipCandidate`
--

LOCK TABLES `FellowshipCandidate` WRITE;
/*!40000 ALTER TABLE `FellowshipCandidate` DISABLE KEYS */;
INSERT INTO `FellowshipCandidate` VALUES (2,'Arvind','Mavi','amarvind16116@gmail.com','Bangalore','Btech','2019-11-25',9818104950,121004,'Bangalore','Average','Good','2020-02-26 01:35:26',102,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,55.30);
/*!40000 ALTER TABLE `FellowshipCandidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HiredCandidate`
--

DROP TABLE IF EXISTS `HiredCandidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HiredCandidate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `email_id` varchar(60) DEFAULT NULL,
  `hired_city` varchar(20) NOT NULL,
  `degree` varchar(20) NOT NULL,
  `hired_date` date NOT NULL,
  `mobile_number` bigint(20) NOT NULL,
  `permanent_pincode` bigint(20) NOT NULL,
  `hired_lab` varchar(20) NOT NULL,
  `communication_remark` varchar(20) NOT NULL,
  `knowledge_remark` varchar(20) NOT NULL,
  `aggregate_percentage` double(4,2) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HiredCandidate`
--

LOCK TABLES `HiredCandidate` WRITE;
/*!40000 ALTER TABLE `HiredCandidate` DISABLE KEYS */;
INSERT INTO `HiredCandidate` VALUES (2,'Arvind','Mavi','amarvind16116@gmail.com','Bangalore','Btech','2019-11-25',9818104950,121004,'Bangalore','Average','Good',55.30,'2020-02-26 01:35:26',102),(3,'Amresh','Kumar','amreshkr81257@gmail.com','Bangalore','BTech','2019-11-13',9818104950,854761,'Bangalore','Good','Good',75.32,'2020-02-26 07:08:12',2);
/*!40000 ALTER TABLE `HiredCandidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lab`
--

DROP TABLE IF EXISTS `Lab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `location` varchar(20) NOT NULL,
  `address` varchar(70) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `creator_user` (`creator_user`),
  CONSTRAINT `Lab_ibfk_1` FOREIGN KEY (`creator_user`) REFERENCES `UserDetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lab`
--

LOCK TABLES `Lab` WRITE;
/*!40000 ALTER TABLE `Lab` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LabThreshold`
--

DROP TABLE IF EXISTS `LabThreshold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LabThreshold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_id` int(11) NOT NULL,
  `lab_capacity` int(11) NOT NULL,
  `lead_threshold` varchar(25) NOT NULL,
  `ideation_engg_threshold` varchar(25) NOT NULL,
  `buddy_engg_threshold` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lab_id` (`lab_id`),
  KEY `creator_user` (`creator_user`),
  CONSTRAINT `LabThreshold_ibfk_1` FOREIGN KEY (`lab_id`) REFERENCES `Lab` (`id`),
  CONSTRAINT `LabThreshold_ibfk_2` FOREIGN KEY (`creator_user`) REFERENCES `UserDetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LabThreshold`
--

LOCK TABLES `LabThreshold` WRITE;
/*!40000 ALTER TABLE `LabThreshold` DISABLE KEYS */;
/*!40000 ALTER TABLE `LabThreshold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MakerProgram`
--

DROP TABLE IF EXISTS `MakerProgram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MakerProgram` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_name` varchar(30) NOT NULL,
  `program_type` varchar(15) NOT NULL,
  `program_link` varchar(50) NOT NULL,
  `tech_stack_id` int(11) NOT NULL,
  `tech_type_id` int(11) NOT NULL,
  `program_approved` tinyint(1) NOT NULL,
  `description` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `creator_user` (`creator_user`),
  KEY `tech_stack_id` (`tech_stack_id`),
  KEY `tech_type_id` (`tech_type_id`),
  CONSTRAINT `MakerProgram_ibfk_1` FOREIGN KEY (`creator_user`) REFERENCES `UserDetails` (`id`),
  CONSTRAINT `MakerProgram_ibfk_2` FOREIGN KEY (`tech_stack_id`) REFERENCES `TechStack` (`id`),
  CONSTRAINT `MakerProgram_ibfk_3` FOREIGN KEY (`tech_type_id`) REFERENCES `TechType` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MakerProgram`
--

LOCK TABLES `MakerProgram` WRITE;
/*!40000 ALTER TABLE `MakerProgram` DISABLE KEYS */;
/*!40000 ALTER TABLE `MakerProgram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mentor`
--

DROP TABLE IF EXISTS `Mentor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mentor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `mentor_type` varchar(15) NOT NULL,
  `lab_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lab_id` (`lab_id`),
  KEY `creator_user` (`creator_user`),
  CONSTRAINT `Mentor_ibfk_1` FOREIGN KEY (`lab_id`) REFERENCES `Lab` (`id`),
  CONSTRAINT `Mentor_ibfk_2` FOREIGN KEY (`creator_user`) REFERENCES `UserDetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mentor`
--

LOCK TABLES `Mentor` WRITE;
/*!40000 ALTER TABLE `Mentor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mentor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MentorIdeationMap`
--

DROP TABLE IF EXISTS `MentorIdeationMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MentorIdeationMap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mentor_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `creator_user` (`creator_user`),
  KEY `mentor_id` (`mentor_id`),
  CONSTRAINT `MentorIdeationMap_ibfk_1` FOREIGN KEY (`creator_user`) REFERENCES `UserDetails` (`id`),
  CONSTRAINT `MentorIdeationMap_ibfk_2` FOREIGN KEY (`mentor_id`) REFERENCES `Mentor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MentorIdeationMap`
--

LOCK TABLES `MentorIdeationMap` WRITE;
/*!40000 ALTER TABLE `MentorIdeationMap` DISABLE KEYS */;
/*!40000 ALTER TABLE `MentorIdeationMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MentorTechStack`
--

DROP TABLE IF EXISTS `MentorTechStack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MentorTechStack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mentor_id` int(11) NOT NULL,
  `tech_stack_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mentor_id` (`mentor_id`),
  KEY `tech_stack_id` (`tech_stack_id`),
  KEY `creator_user` (`creator_user`),
  CONSTRAINT `MentorTechStack_ibfk_1` FOREIGN KEY (`mentor_id`) REFERENCES `Mentor` (`id`),
  CONSTRAINT `MentorTechStack_ibfk_2` FOREIGN KEY (`tech_stack_id`) REFERENCES `TechStack` (`id`),
  CONSTRAINT `MentorTechStack_ibfk_3` FOREIGN KEY (`creator_user`) REFERENCES `UserDetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MentorTechStack`
--

LOCK TABLES `MentorTechStack` WRITE;
/*!40000 ALTER TABLE `MentorTechStack` DISABLE KEYS */;
/*!40000 ALTER TABLE `MentorTechStack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TechStack`
--

DROP TABLE IF EXISTS `TechStack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TechStack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tech_name` varchar(20) NOT NULL,
  `image_path` varchar(50) NOT NULL,
  `framework` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `creator_user` (`creator_user`),
  CONSTRAINT `TechStack_ibfk_1` FOREIGN KEY (`creator_user`) REFERENCES `UserDetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TechStack`
--

LOCK TABLES `TechStack` WRITE;
/*!40000 ALTER TABLE `TechStack` DISABLE KEYS */;
/*!40000 ALTER TABLE `TechStack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TechType`
--

DROP TABLE IF EXISTS `TechType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TechType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `creator_user` (`creator_user`),
  CONSTRAINT `TechType_ibfk_1` FOREIGN KEY (`creator_user`) REFERENCES `UserDetails` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TechType`
--

LOCK TABLES `TechType` WRITE;
/*!40000 ALTER TABLE `TechType` DISABLE KEYS */;
/*!40000 ALTER TABLE `TechType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserDetails`
--

DROP TABLE IF EXISTS `UserDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  `contact_number` bigint(20) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserDetails`
--

LOCK TABLES `UserDetails` WRITE;
/*!40000 ALTER TABLE `UserDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserRoles`
--

DROP TABLE IF EXISTS `UserRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserRoles` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(25) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserRoles`
--

LOCK TABLES `UserRoles` WRITE;
/*!40000 ALTER TABLE `UserRoles` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'lms'
--

--
-- Dumping routines for database 'lms'
--
/*!50003 DROP PROCEDURE IF EXISTS `candidateBank` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `candidateBank`()
SELECT * FROM CandidateBankDetails ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `candidateBankDesc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `candidateBankDesc`()
DESC  CandidateBankDetails ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `candidateDocumentDesc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `candidateDocumentDesc`()
DESC  CandidateDocuments ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `companyDesc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `companyDesc`()
DESC  Company ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fellowshipDesc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `fellowshipDesc`()
DESC  FellowshipCandidate ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `hiredforfellowship` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `hiredforfellowship`()
BEGIN
DECLARE idcan int(11);
DECLARE firstname varchar(30);
DECLARE lastnmae varchar(30);
DECLARE emailid varchar(30);
DECLARE hiredcity varchar(30);
DECLARE degreename varchar(20);
DECLARE hireddate date;
DECLARE mobilenum bigint(20);
DECLARE permananentpincode bigint(20);
DECLARE hiredlab varchar(30);
DECLARE communicationremark varchar(20);
DECLARE knowledgeremark varchar(20);
DECLARE aggregatepercentage double(4,2);
DECLARE creatorstamp timestamp;
DECLARE creatoruser int(11);
DECLARE IS_DONE INTEGER DEFAULT O;
DECLARE c2 cursor FOR
select * from HiredCandidate;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET IS_DONE = 1;
OPEN c2;
get_list : LOOP
fetch c2 into idcan,firstname,lastnmae,emailid,hiredcity,degreename,hireddate,mobilenum,permananentpincode,hiredlab,communicationremark,
knowledgeremark,aggregatepercentage,creatorstamp,creatoruser;
IF IS_DONE =1 THEN
LEAVE get_list;
END IF;
insert into FellowshipCandidate(id,first_name,last_name,email_id,hired_city,degree,hired_date,mobile_number,permanent_pincode,hired_lab,
communication_remark,knowledge_remark,aggregate_remark,creator_stamp,creator_user) values(idcan,firstname,lastnmae,emailid,hiredcity,degreename,hireddate,mobilenum,permananentpincode,hiredlab,communicationremark,
knowledgeremark,aggregatepercentage,creatorstamp,creatoruser);
END LOOP get_list;

CLOSE c2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `hired_fellowship` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `hired_fellowship`(IN candidate_id int(11))
BEGIN
DECLARE id int(11);
DECLARE first_name varchar(20);
DECLARE last_name varchar(20);
DECLARE email_id varchar(60);
DECLARE hired_city varchar(20);
DECLARE degree varchar(20);
DECLARE hired_date DATE;
DECLARE mobile_number bigint(20);
DECLARE permanent_pincode bigint(20);
DECLARE hired_lab varchar(20);
DECLARE communication_remark varchar(20);
DECLARE knowledge_remark varchar(20);
DECLARE aggregate_percentage double(4,2);
DECLARE creator_stamp timestamp;
DECLARE creator_user int(11);
DECLARE IS_DONE INTEGER DEFAULT 0;
DECLARE C1 CURSOR FOR 
SELECT  * FROM HiredCandidate WHERE id=candidate_id;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET IS_DONE = 1;
OPEN C1;
get_list : LOOP
FETCH C1 INTO  id,first_name,last_name,email_id,hired_city,degree,hired_date,mobile_number,permanent_pincode,hired_lab,communication_remark ,knowledge_remark,aggregate_percentage,creator_stamp,creator_user;
IF IS_DONE = 1 THEN
LEAVE get_list;
END IF;
INSERT INTO FellowshipCandidate
(id,first_name,last_name,email_id,hired_city,degree,hired_date,mobile_number,permanent_pincode,hired_lab,communication_remark ,knowledge_remark,aggregate_percentage,creator_stamp,creator_user) values(id,first_name,last_name,email_id,hired_city,degree,hired_date,mobile_number,permanent_pincode,hired_lab,communication_remark ,knowledge_remark,aggregate_percentage,creator_stamp,creator_user);
END LOOP get_list;
CLOSE C1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `hired_to_fellowship` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `hired_to_fellowship`()
BEGIN
DECLARE id int(11);
DECLARE firstname varchar(20);
DECLARE lastname varchar(20);
DECLARE emailid varchar(60);
DECLARE hiredcity varchar(20);
DECLARE degree varchar(20);
DECLARE hireddate DATE;
DECLARE mobilenumber bigint(20);
DECLARE permanentpincode bigint(20);
DECLARE hiredlab varchar(20);
DECLARE communicationremark varchar(20);
DECLARE knowledgeremark varchar(20);
DECLARE aggregatepercentage double(4,2);
DECLARE creatorstamp timestamp;
DECLARE creatoruser int(11);
DECLARE IS_DONE INTEGER DEFAULT 0;
DECLARE C1 CURSOR FOR 
SELECT  * FROM HiredCandidate;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET IS_DONE = 1;
OPEN C1;
get_list : LOOP
FETCH C1 INTO  id,firstname,lastname,emailid,hiredcity,degree,hireddate,mobilenumber,permanentpincode,hiredlab,communicationremark,knowledgeremark,aggregatepercentage,creatorstamp,creatoruser;
IF IS_DONE = 1 THEN
LEAVE get_list;
END IF;
INSERT INTO FellowshipCandidate
(id,first_name,last_name,email_id,hired_city,degree,hired_date,mobile_number,permanent_pincode,hired_lab,communication_remark,knowledge_remark,aggregate_percentage,creator_stamp,creator_user ) values(id,firstname,lastname,emailid,hiredcity,degree,hireddate,mobilenumber,permanentpincode,hiredlab,communicationremark,knowledgeremark,aggregatepercentage,creatorstamp,creatoruser);
END LOOP get_list;
CLOSE C1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `CompanyRequire`
--

/*!50001 DROP VIEW IF EXISTS `CompanyRequire`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `CompanyRequire` AS select `CompanyRequirement`.`id` AS `id`,`CompanyRequirement`.`company_id` AS `company_id`,`CompanyRequirement`.`tech_stack_id` AS `tech_stack_id`,`CompanyRequirement`.`tech_type_id` AS `tech_type_id`,`CompanyRequirement`.`lead_id` AS `lead_id`,`CompanyRequirement`.`maker_program_id` AS `maker_program_id`,`CompanyRequirement`.`mentor_ideation_id` AS `mentor_ideation_id` from `CompanyRequirement` where (`CompanyRequirement`.`company_id` >= 6) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-26 13:12:38
