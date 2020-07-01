-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: turisticka_agencija
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `aplikacija_client`
--

DROP TABLE IF EXISTS `aplikacija_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aplikacija_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `surname` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `number_of_guests` int(11) NOT NULL,
  `tour_id` int(11) NOT NULL,
  `total_price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aplikacija_client_tour_id_0f61e6f6_fk_aplikacija_tour_id` (`tour_id`),
  CONSTRAINT `aplikacija_client_tour_id_0f61e6f6_fk_aplikacija_tour_id` FOREIGN KEY (`tour_id`) REFERENCES `aplikacija_tour` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aplikacija_client`
--

LOCK TABLES `aplikacija_client` WRITE;
/*!40000 ALTER TABLE `aplikacija_client` DISABLE KEYS */;
INSERT INTO `aplikacija_client` VALUES (1,'Jane','Doe','jane@doe.com',2,1,2200.00),(2,'Jim','Jones','jim@jones.com',3,4,1950.00),(4,'Ally','Edwards','ally@gmail.com',3,9,4200.00);
/*!40000 ALTER TABLE `aplikacija_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aplikacija_contactmessage`
--

DROP TABLE IF EXISTS `aplikacija_contactmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aplikacija_contactmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(254) NOT NULL,
  `title` varchar(256) NOT NULL,
  `body` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aplikacija_contactmessage`
--

LOCK TABLES `aplikacija_contactmessage` WRITE;
/*!40000 ALTER TABLE `aplikacija_contactmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `aplikacija_contactmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aplikacija_tour`
--

DROP TABLE IF EXISTS `aplikacija_tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aplikacija_tour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination` varchar(256) NOT NULL,
  `country` varchar(256) NOT NULL,
  `date_of_arrival` date NOT NULL,
  `total_days` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `available_beds` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aplikacija_tour`
--

LOCK TABLES `aplikacija_tour` WRITE;
/*!40000 ALTER TABLE `aplikacija_tour` DISABLE KEYS */;
INSERT INTO `aplikacija_tour` VALUES (1,'Melbourne','Australia','2020-08-31',10,1100.00,38,'photos/melb_tN71M5o.png','Melbourne (Kulin: Birrarunga, meaning \"place next to the Yarra River\" /ˈmɛlbərn/ (About this soundlisten) MEL-bərn)[note 1] is the capital and most populous city of the Australian state of Victoria, and the second most populous city in Australia and Oceania.[1] Its name refers to an urban agglomeration of 9,993 km2 (3,858 sq mi),[10] comprising a metropolitan area with 31 municipalities,[11] and is also the common name for its city centre. The city occupies much of the coastline of Port Phillip bay (Kulin: Naarm) and spreads into the Hinterland towards the Dandenong and Macedon ranges, Mornington Peninsula and Yarra Valley. It has a population of 5 million (19% of the population of Australia), and its inhabitants are referred to as \"Melburnians\".[note 2]\r\n\r\nHome to Indigenous Australians for over 40,000 years, the Melbourne area served as a popular meeting place for local Kulin nation clans. A short-lived penal settlement was established at Port Phillip, then part of the British colony of New South Wales, in 1803, but it was not until 1835, with the arrival of free settlers from Van Diemen’s Land (modern-day Tasmania), that Melbourne was founded.[14] It was incorporated as a Crown settlement in 1837, and named Melbourne by Governor General Richard Bourke on 10 April 1837[15] in honour of the then British Prime Minister, William Lamb, 2nd Viscount Melbourne.[14] In 1851, four years after Queen Victoria declared it a city, Melbourne became the capital of the new colony of Victoria.'),(2,'Dubai','UAE','2020-09-01',10,900.00,35,'photos/duba_T0Wql7Z.png','Dubai (/duːˈbaɪ/ doo-BY; Arabic: دبي‎, romanized: Dubayy [dʊˈbajj], Gulf Arabic pronunciation: [dəˈbaj]) is the most populous city in the United Arab Emirates (UAE) and the capital of the Emirate of Dubai.[5][6][7]\r\n\r\nLocated in the eastern part of the Arabian Peninsula on the coast of the Persian Gulf, Dubai aims to be the business hub of Western Asia.[8] It is also a major global transport hub for passengers and cargo.[9] Oil revenue helped accelerate the development of the city, which was already a major mercantile hub. Dubai’s oil output made up 2.1 percent of the Persian Gulf emirate’s economy in 2008.[10] A centre for regional and international trade since the early 20th century, Dubai\'s economy relies on revenues from trade, tourism, aviation, real estate, and financial services.[11][12][13][14] According to government data, the population of Dubai is estimated at around 3.39 million as of January 2020.[15][16]'),(3,'Paris','France','2020-09-30',5,700.00,45,'photos/def.png','The city is a major railway, highway and air-transport hub served by two international airports: Paris-Charles de Gaulle (the second busiest airport in Europe) and Paris-Orly.[6][7] Opened in 1900, the city\'s subway system, the Paris Métro, serves 5.23 million passengers daily;[8] it is the second busiest metro system in Europe after the Moscow Metro. Gare du Nord is the 24th busiest railway station in the world, but the first located outside Japan, with 262 million passengers in 2015.[9] Paris is especially known for its museums and architectural landmarks: the Louvre was the most visited art museum in the world in 2019, with 9.6 million visitors.[10] [11] The Musée d\'Orsay, Musée Marmottan Monet, and Musée de l\'Orangerie are noted for their collections of French Impressionist art, the Pompidou Centre Musée National d\'Art Moderne has the largest collection of modern and contemporary art in Europe, and the Musée Rodin and Musée Picasso exhibit the works of two noted Parisians. The historical district along the Seine in the city centre is classified as a UNESCO Heritage Site, and popular landmarks in the city centre included the Cathedral of Notre Dame de Paris, on the Île de la Cité, now closed for renovation after the 15 April 2019 fire. Other popular tourist sites include the Gothic royal chapel of Sainte-Chapelle, also on the Île de la Cité; the Eiffel Tower, constructed for the Paris Universal Exposition of 1889; the Grand Palais and Petit Palais, built for the Paris Universal Exposition of 1900; the Arc de Triomphe on the Champs-Élysées, and the Basilica of Sacré-Coeur on the hill of Montmartre.'),(4,'Berlin','Germany','2020-10-01',5,650.00,27,'photos/def.png','Berlin straddles the banks of the River Spree, which flows into the River Havel (a tributary of the River Elbe) in the western borough of Spandau. Among the city\'s main topographical features are the many lakes in the western and southeastern boroughs formed by the Spree, Havel, and Dahme rivers (the largest of which is Lake Müggelsee). Due to its location in the European Plain, Berlin is influenced by a temperate seasonal climate. About one-third of the city\'s area is composed of forests, parks, gardens, rivers, canals and lakes.[10] The city lies in the Central German dialect area, the Berlin dialect being a variant of the Lusatian-New Marchian dialects.\r\n\r\nFirst documented in the 13th century and situated at the crossing of two important historic trade routes,[11] Berlin became the capital of the Margraviate of Brandenburg (1417–1701), the Kingdom of Prussia (1701–1918), the German Empire (1871–1918), the Weimar Republic (1919–1933), and the Third Reich (1933–1945).[12] Berlin in the 1920s was the third-largest municipality in the world.[13] After World War II and its subsequent occupation by the victorious countries, the city was divided; West Berlin became a de facto West German exclave, surrounded by the Berlin Wall (1961–1989) and East German territory.[14] East Berlin was declared capital of East Germany, while Bonn became the West German capital. Following German reunification in 1990, Berlin once again became the capital of all of Germany.'),(5,'Madrid','Spain','2020-10-15',5,550.00,35,'photos/def.png','Madrid lies on the River Manzanares in the centre of both the country and the Community of Madrid region, of which it is also the capital. As the capital city of Spain, seat of government, residence of the Spanish monarch, Madrid is also the political, economic and cultural centre of the country.[13] The current mayor is José Luis Martínez-Almeida from the People\'s Party.\r\n\r\nThe Madrid urban agglomeration has the third-largest GDP[14] in the European Union and its influence in politics, education, entertainment, environment, media, fashion, science, culture, and the arts all contribute to its status as one of the world\'s major global cities.[15][16] Madrid is home to two world-famous football clubs, Real Madrid and Atlético Madrid. Due to its economic output, high standard of living, and market size, Madrid is considered the major financial centre[17] and the leading economic hub of the Iberian Peninsula and of Southern Europe.[18][19] It hosts the head offices of the vast majority of major Spanish companies, such as Telefónica, IAG or Repsol. Madrid is also the 10th most liveable city in the world according to Monocle magazine, in its 2017 index.[20]'),(6,'New York','USA','2020-09-10',10,1200.00,50,'photos/def.png','Situated on one of the world\'s largest natural harbors, New York City is composed of five boroughs, each of which is a county of the State of New York. The five boroughs—Brooklyn, Queens, Manhattan, the Bronx, and Staten Island—were consolidated into a single city in 1898.[15] The city and its metropolitan area constitute the premier gateway for legal immigration to the United States. As many as 800 languages are spoken in New York,[16] making it the most linguistically diverse city in the world. New York is home to more than 3.2 million residents born outside the United States,[17] the largest foreign-born population of any city in the world as of 2016.[18][19] As of 2019, the New York metropolitan area is estimated to produce a gross metropolitan product (GMP) of $2.0 trillion. If the New York metropolitan area were a sovereign state, it would have the eighth-largest economy in the world. New York is home to the highest number of billionaires of any city in the world.\r\n\r\nNew York City traces its origins to a trading post founded by colonists from the Dutch Republic in 1624 on Lower Manhattan; the post was named New Amsterdam in 1626.[20] The city and its surroundings came under English control in 1664[20] and were renamed New York after King Charles II of England granted the lands to his brother, the Duke of York.[21] New York was the capital of the United States from 1785 until 1790,[22] and has been the largest U.S. city since 1790.[23] The Statue of Liberty greeted millions of immigrants as they came to the U.S. by ship in the late 19th and early 20th centuries,[24] and is a symbol of the U.S. and its ideals of liberty and peace.[25] In the 21st century, New York has emerged as a global node of creativity, entrepreneurship,[26] and environmental sustainability,[27][28] and as a symbol of freedom and cultural diversity.[29] In 2019, New York was voted the greatest city in the world per a survey of over 30,000 people from 48 cities worldwide, citing its cultural diversity.[30]'),(8,'Athens','Greece','2020-09-15',5,450.00,14,'photos/def.png','Classical Athens was a powerful city-state that emerged in conjunction with the seagoing development of the port of Piraeus. A center for the arts, learning and philosophy, home of Plato\'s Academy and Aristotle\'s Lyceum,[5][6] it is widely referred to as the cradle of Western civilization and the birthplace of democracy,[7][8] largely because of its cultural and political impact on the European continent, and in particular the Romans.[9] In modern times, Athens is a large cosmopolitan metropolis and central to economic, financial, industrial, maritime, political and cultural life in Greece.\r\n\r\nAthens is a global city and one of the biggest economic centers in southeastern Europe. It has a large financial sector, and its port Piraeus is both the largest passenger port in Europe,[10][11] and the second largest in the world.[12]'),(9,'Miami','USA','2020-07-15',10,1400.00,0,'photos/def.png','');
/*!40000 ALTER TABLE `aplikacija_tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add tour',7,'add_tour'),(26,'Can change tour',7,'change_tour'),(27,'Can delete tour',7,'delete_tour'),(28,'Can view tour',7,'view_tour'),(29,'Can add client',8,'add_client'),(30,'Can change client',8,'change_client'),(31,'Can delete client',8,'delete_client'),(32,'Can view client',8,'view_client'),(33,'Can add contact message',9,'add_contactmessage'),(34,'Can change contact message',9,'change_contactmessage'),(35,'Can delete contact message',9,'delete_contactmessage'),(36,'Can view contact message',9,'view_contactmessage');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$j2N9aDTe1ZdI$+1x+lhcYnTyYG1/j/QFFZjNpY+e4zayTmGmQ98xpKsU=','2020-07-01 10:25:41.874639',1,'pavle','','','',1,1,'2020-06-24 07:03:27.628881');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-06-24 07:04:50.303327','1','Melbourne , Australia , 10 days for $ 1100',1,'[{\"added\": {}}]',7,1),(2,'2020-06-24 07:05:24.821659','2','Dubai , UAE , 10 days for $ 900',1,'[{\"added\": {}}]',7,1),(3,'2020-07-01 09:38:18.826522','3','Paris , France , 5 days for $ 700',1,'[{\"added\": {}}]',7,1),(4,'2020-07-01 09:38:49.618053','4','Berlin , Germany , 5 days for $ 650',1,'[{\"added\": {}}]',7,1),(5,'2020-07-01 09:39:34.868886','5','Madrid , Spain , 5 days for $ 550',1,'[{\"added\": {}}]',7,1),(6,'2020-07-01 09:40:09.176493','6','New York , USA , 10 days for $ 1200',1,'[{\"added\": {}}]',7,1),(7,'2020-07-01 10:12:20.805623','7','Athens , Greece , 5 days for $ 450',1,'[{\"added\": {}}]',7,1),(8,'2020-07-01 10:13:40.645942','3','Client object (3)',3,'',8,1),(9,'2020-07-01 10:15:35.174186','7','Athens , Greece , 5 days for $ 450.00',3,'',7,1),(10,'2020-07-01 10:16:20.880799','8','Athens , Greece , 5 days for $ 450',1,'[{\"added\": {}}]',7,1),(11,'2020-07-01 10:26:04.660886','9','Miami , USA , 10 days for $ 1400',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(8,'aplikacija','client'),(9,'aplikacija','contactmessage'),(7,'aplikacija','tour'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-06-24 06:59:13.108829'),(2,'auth','0001_initial','2020-06-24 06:59:28.864856'),(3,'admin','0001_initial','2020-06-24 07:00:07.743778'),(4,'admin','0002_logentry_remove_auto_add','2020-06-24 07:00:14.846741'),(5,'admin','0003_logentry_add_action_flag_choices','2020-06-24 07:00:15.056610'),(6,'aplikacija','0001_initial','2020-06-24 07:00:16.629633'),(7,'aplikacija','0002_auto_20200616_1014','2020-06-24 07:00:22.140086'),(8,'aplikacija','0003_auto_20200616_1016','2020-06-24 07:00:29.114870'),(9,'aplikacija','0004_tour_description','2020-06-24 07:00:31.331551'),(10,'aplikacija','0005_auto_20200618_0944','2020-06-24 07:00:33.902957'),(11,'aplikacija','0006_auto_20200622_1319','2020-06-24 07:00:34.040871'),(12,'aplikacija','0007_contactmessage','2020-06-24 07:00:35.698843'),(13,'contenttypes','0002_remove_content_type_name','2020-06-24 07:00:39.759758'),(14,'auth','0002_alter_permission_name_max_length','2020-06-24 07:00:41.823479'),(15,'auth','0003_alter_user_email_max_length','2020-06-24 07:00:42.115298'),(16,'auth','0004_alter_user_username_opts','2020-06-24 07:00:42.186254'),(17,'auth','0005_alter_user_last_login_null','2020-06-24 07:00:43.839714'),(18,'auth','0006_require_contenttypes_0002','2020-06-24 07:00:44.247505'),(19,'auth','0007_alter_validators_add_error_messages','2020-06-24 07:00:44.416398'),(20,'auth','0008_alter_user_username_max_length','2020-06-24 07:00:45.804536'),(21,'auth','0009_alter_user_last_name_max_length','2020-06-24 07:00:51.166817'),(22,'auth','0010_alter_group_name_max_length','2020-06-24 07:00:51.797425'),(23,'auth','0011_update_proxy_permissions','2020-06-24 07:00:51.867382'),(24,'sessions','0001_initial','2020-06-24 07:00:53.234921');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5tqyy1yuscmequdpqkgfyn8xtju6revr','YjNhNDgxYTBhNTMzZThkMzUxMWE3YjEwYzM3NTZhODk3MTMxZDY5Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZTE0NzE3NDBkNzMyMDQyNmJiOTYwMjQzZTY2ZTFiZDFiY2RhNjQxIn0=','2020-07-08 07:03:46.251914'),('jqrr0hpczgr2hmaefgs4vtvyqc1v2ojw','YjNhNDgxYTBhNTMzZThkMzUxMWE3YjEwYzM3NTZhODk3MTMxZDY5Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZTE0NzE3NDBkNzMyMDQyNmJiOTYwMjQzZTY2ZTFiZDFiY2RhNjQxIn0=','2020-07-15 10:25:41.966643'),('n3ecb120nke2tmhs4zthqogq52xdzjxa','YjNhNDgxYTBhNTMzZThkMzUxMWE3YjEwYzM3NTZhODk3MTMxZDY5Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZTE0NzE3NDBkNzMyMDQyNmJiOTYwMjQzZTY2ZTFiZDFiY2RhNjQxIn0=','2020-07-15 09:37:17.862493'),('najkl39px51etpb9nljymq0yhq8p20di','YjNhNDgxYTBhNTMzZThkMzUxMWE3YjEwYzM3NTZhODk3MTMxZDY5Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZTE0NzE3NDBkNzMyMDQyNmJiOTYwMjQzZTY2ZTFiZDFiY2RhNjQxIn0=','2020-07-15 10:11:34.638932');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-01 12:30:20
