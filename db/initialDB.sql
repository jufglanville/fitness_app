-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: health_fitness_app
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Exercise`
--

DROP TABLE IF EXISTS `Exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Exercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `calorie` int(3) NOT NULL,
  `exerciseType` varchar(45) NOT NULL,
  `exerciseTarget` varchar(45) NOT NULL,
  `reps` int(2) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exercise`
--

LOCK TABLES `Exercise` WRITE;
/*!40000 ALTER TABLE `Exercise` DISABLE KEYS */;
/*!40000 ALTER TABLE `Exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fitness_Plan`
--

DROP TABLE IF EXISTS `Fitness_Plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fitness_Plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exerciseID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exerciseID` (`exerciseID`),
  CONSTRAINT `fitness_plan_ibfk_1` FOREIGN KEY (`exerciseID`) REFERENCES `exercise` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fitness_Plan`
--

LOCK TABLES `Fitness_Plan` WRITE;
/*!40000 ALTER TABLE `Fitness_Plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fitness_Plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ingredient`
--

DROP TABLE IF EXISTS `Ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unitID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `quantity` int(3) NOT NULL,
  `calorie` int(4) NOT NULL,
  `fat` int(3) NOT NULL,
  `saturates` int(3) NOT NULL,
  `sugar` int(3) NOT NULL,
  `salt` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `unitID` (`unitID`),
  CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`unitID`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredient`
--

LOCK TABLES `Ingredient` WRITE;
/*!40000 ALTER TABLE `Ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ingredient_Stock`
--

DROP TABLE IF EXISTS `Ingredient_Stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ingredient_Stock` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `ingredientID` int(11) NOT NULL,
  `amount` int(3) NOT NULL,
  `unitID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`),
  KEY `unitID` (`unitID`),
  KEY `ingredientID` (`ingredientID`),
  CONSTRAINT `ingredient_stock_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`),
  CONSTRAINT `ingredient_stock_ibfk_2` FOREIGN KEY (`unitID`) REFERENCES `unit` (`id`),
  CONSTRAINT `ingredient_stock_ibfk_3` FOREIGN KEY (`ingredientID`) REFERENCES `ingredient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredient_Stock`
--

LOCK TABLES `Ingredient_Stock` WRITE;
/*!40000 ALTER TABLE `Ingredient_Stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ingredient_Stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Meal_Plan`
--

DROP TABLE IF EXISTS `Meal_Plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Meal_Plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipeID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `fitness_planID` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recipeID` (`recipeID`),
  KEY `userID` (`userID`),
  KEY `fitness_planID` (`fitness_planID`),
  CONSTRAINT `meal_plan_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`),
  CONSTRAINT `meal_plan_ibfk_2` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`id`),
  CONSTRAINT `meal_plan_ibfk_3` FOREIGN KEY (`userID`) REFERENCES `user` (`id`),
  CONSTRAINT `meal_plan_ibfk_4` FOREIGN KEY (`fitness_planID`) REFERENCES `fitness_plan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Meal_Plan`
--

LOCK TABLES `Meal_Plan` WRITE;
/*!40000 ALTER TABLE `Meal_Plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `Meal_Plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recipe`
--

DROP TABLE IF EXISTS `Recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipe_ingredientID` int(11) NOT NULL,
  `mealType` varchar(45) NOT NULL,
  `cuisineType` varchar(45) NOT NULL,
  `prepTime` varchar(45) NOT NULL,
  `cookTime` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `createdDate` datetime NOT NULL,
  `createdBy` int(11) NOT NULL,
  `updatedDate` datetime NOT NULL,
  `updatedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recipe_ingredientID` (`recipe_ingredientID`),
  CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`recipe_ingredientID`) REFERENCES `recipe_ingredient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recipe`
--

LOCK TABLES `Recipe` WRITE;
/*!40000 ALTER TABLE `Recipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `Recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recipe_Ingredient`
--

DROP TABLE IF EXISTS `Recipe_Ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recipe_Ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ingredientID` int(11) NOT NULL,
  `unitID` int(11) NOT NULL,
  `amount` smallint(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ingredientID` (`ingredientID`),
  CONSTRAINT `recipe_ingredient_ibfk_1` FOREIGN KEY (`ingredientID`) REFERENCES `ingredient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recipe_Ingredient`
--

LOCK TABLES `Recipe_Ingredient` WRITE;
/*!40000 ALTER TABLE `Recipe_Ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `Recipe_Ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recipe_Stock`
--

DROP TABLE IF EXISTS `Recipe_Stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recipe_Stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `recipeID` int(11) NOT NULL,
  `quantity` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`),
  KEY `recipeID` (`recipeID`),
  CONSTRAINT `recipe_stock_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`id`),
  CONSTRAINT `recipe_stock_ibfk_2` FOREIGN KEY (`recipeID`) REFERENCES `recipe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recipe_Stock`
--

LOCK TABLES `Recipe_Stock` WRITE;
/*!40000 ALTER TABLE `Recipe_Stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `Recipe_Stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Unit`
--

DROP TABLE IF EXISTS `Unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unitValue` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Unit`
--

LOCK TABLES `Unit` WRITE;
/*!40000 ALTER TABLE `Unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `Unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryID` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `createdDate` datetime NOT NULL,
  `createdBy` int(11) NOT NULL,
  `updatedDate` datetime NOT NULL,
  `updatedBy` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_User_countryID` (`countryID`) /*!80000 INVISIBLE */,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`countryID`) REFERENCES `country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-25 19:57:08
