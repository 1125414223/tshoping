-- MySQL dump 10.13  Distrib 5.7.23, for Linux (i686)
--
-- Host: localhost    Database: tshop
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.16.04.1-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_4fb7487a_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_4fb7487a_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_5d1da4bf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_47e9a2fe_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user info',7,'add_userinfo'),(20,'Can change user info',7,'change_userinfo'),(21,'Can delete user info',7,'delete_userinfo'),(22,'Can add user address',8,'add_useraddress'),(23,'Can change user address',8,'change_useraddress'),(24,'Can delete user address',8,'delete_useraddress'),(25,'Can add shoping type',9,'add_shopingtype'),(26,'Can change shoping type',9,'change_shopingtype'),(27,'Can delete shoping type',9,'delete_shopingtype'),(28,'Can add shoping',10,'add_shoping'),(29,'Can change shoping',10,'change_shoping'),(30,'Can delete shoping',10,'delete_shoping'),(31,'Can add carts',11,'add_carts'),(32,'Can change carts',11,'change_carts'),(33,'Can delete carts',11,'delete_carts'),(34,'Can add orders',12,'add_orders'),(35,'Can change orders',12,'change_orders'),(36,'Can delete orders',12,'delete_orders');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$lLiM9Uf8Ejgl$0maXWJb07QODe/xFg3bbqhKDCMyMFZNkUOWObWu1wSQ=','2018-11-04 13:10:44.868398',1,'longshun','','','1125414223@qq.com',1,1,'2018-10-26 08:02:59.004688');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_d09e6bc_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_d09e6bc_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6b662c0f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_285afabf_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_285afabf_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_1e1e5dcd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
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
  KEY `django_admin__content_type_id_5bc9259c_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_2cee287b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_5bc9259c_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_2cee287b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-10-26 08:05:10.875685','1','管理要',1,'',7,1),(2,'2018-10-28 04:00:17.337937','1','新鲜水果',1,'',9,1),(3,'2018-10-28 04:01:07.622516','2','海鲜水产',1,'',9,1),(4,'2018-10-28 04:01:46.260191','3','猪牛羊肉',1,'',9,1),(5,'2018-10-28 04:02:21.412689','4','禽类蛋品',1,'',9,1),(6,'2018-10-28 04:02:42.062224','5','新鲜蔬菜',1,'',9,1),(7,'2018-10-28 04:03:00.871563','6','速冻食品',1,'',9,1),(8,'2018-10-28 04:03:49.271639','7','时令蔬菜',1,'',9,1),(9,'2018-10-28 04:37:02.688727','1','新鲜水果',2,'已修改 simage 。',9,1),(10,'2018-10-28 04:42:33.105823','8','新鲜特供',1,'',9,1),(11,'2018-10-28 04:48:55.962110','1','草莓',1,'',10,1),(12,'2018-10-28 04:49:29.115355','7','时令水果',2,'已修改 sname 和 shopType 。',9,1),(13,'2018-10-28 04:54:06.617791','2','费力牛排',1,'',10,1),(14,'2018-10-28 05:10:58.788335','7','时令水果',2,'已修改 shop_show 。',9,1),(15,'2018-10-28 05:11:24.956390','8','新鲜特供',2,'已修改 shop_show 。',9,1),(16,'2018-10-28 05:27:41.214261','7','时令水果',2,'已修改 simage 。',9,1),(17,'2018-10-28 05:39:53.181681','7','时令水果',2,'已修改 simage 。',9,1),(18,'2018-10-28 05:40:37.629527','8','新鲜特供',2,'已修改 simage 。',9,1),(19,'2018-10-28 05:43:20.427048','1','草莓',2,'已修改 shop_img 。',10,1),(20,'2018-10-28 05:43:32.244457','2','费力牛排',2,'已修改 shop_img 。',10,1),(21,'2018-10-28 05:44:42.725313','1','草莓',2,'已修改 shop_img 。',10,1),(22,'2018-10-28 05:44:52.374169','2','费力牛排',2,'已修改 shop_img 。',10,1),(23,'2018-10-28 05:59:03.525437','2','费力牛排',2,'已修改 shop_img 。',10,1),(24,'2018-10-28 05:59:17.218820','1','草莓',2,'已修改 shop_img 。',10,1),(25,'2018-10-28 06:06:14.192329','2','费力牛排',2,'已修改 shop_img 。',10,1),(26,'2018-10-28 06:06:22.650396','1','草莓',2,'已修改 shop_img 。',10,1),(27,'2018-10-28 06:23:25.362308','7','时令水果',2,'已修改 simage 。',9,1),(28,'2018-10-28 06:23:33.319651','8','新鲜特供',2,'已修改 simage 。',9,1),(29,'2018-10-28 06:23:58.572585','8','新鲜特供',2,'已修改 simage 。',9,1),(30,'2018-10-28 06:24:08.332621','7','时令水果',2,'已修改 simage 。',9,1),(31,'2018-10-28 06:24:41.213391','8','新鲜特供',2,'已修改 simage 。',9,1),(32,'2018-10-28 06:24:52.920879','8','新鲜特供',2,'已修改 simage 。',9,1),(33,'2018-10-28 06:25:05.092788','2','费力牛排',2,'已修改 shop_img 。',10,1),(34,'2018-10-28 06:25:09.991624','1','草莓',2,'已修改 shop_img 。',10,1),(35,'2018-10-28 06:25:28.255629','2','费力牛排',2,'已修改 shop_img 。',10,1),(36,'2018-10-28 06:25:41.369010','1','草莓',2,'已修改 shop_img 。',10,1),(37,'2018-10-28 06:45:29.119573','7','时令水果',2,'已修改 simage 。',9,1),(38,'2018-10-28 06:46:02.689777','7','时令水果',2,'已修改 simage 。',9,1),(39,'2018-10-28 12:12:51.719169','1','草莓',2,'已修改 shop_detail 。',10,1),(40,'2018-10-29 08:09:25.634898','2','费力牛排',2,'已修改 shopin_type 。',10,1),(41,'2018-10-29 08:09:31.316979','1','草莓',2,'已修改 shopin_type 。',10,1),(42,'2018-10-29 08:13:44.667105','3','奇异果',1,'',10,1),(43,'2018-10-29 08:18:33.301317','4','海南太妃芒',1,'',10,1),(44,'2018-10-29 08:38:09.063460','1','草莓',2,'已修改 shop_img 。',10,1),(45,'2018-10-29 09:26:35.306714','3','奇异果',2,'已修改 visit_num 。',10,1),(46,'2018-10-29 09:58:31.492589','5','湿炒牛河',1,'',10,1),(47,'2018-11-04 11:38:41.382179','1','吴虹莉',1,'',8,1),(48,'2018-11-08 13:28:37.288959','1','隆顺',2,'已修改 user_name 和 user_addres 。',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_102c60cc_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(11,'shop','carts'),(12,'shop','orders'),(10,'shop','shoping'),(9,'shop','shopingtype'),(8,'shop','useraddress'),(7,'shop','userinfo');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-10-26 07:59:25.499470'),(2,'auth','0001_initial','2018-10-26 07:59:25.702736'),(3,'admin','0001_initial','2018-10-26 07:59:25.786174'),(4,'contenttypes','0002_remove_content_type_name','2018-10-26 07:59:25.878935'),(5,'auth','0002_alter_permission_name_max_length','2018-10-26 07:59:25.919132'),(6,'auth','0003_alter_user_email_max_length','2018-10-26 07:59:25.967688'),(7,'auth','0004_alter_user_username_opts','2018-10-26 07:59:25.986567'),(8,'auth','0005_alter_user_last_login_null','2018-10-26 07:59:26.033672'),(9,'auth','0006_require_contenttypes_0002','2018-10-26 07:59:26.042346'),(10,'sessions','0001_initial','2018-10-26 07:59:26.088452'),(11,'shop','0001_initial','2018-10-26 07:59:26.413248'),(12,'shop','0002_auto_20181028_1157','2018-10-28 03:57:32.323205'),(13,'shop','0003_auto_20181028_1235','2018-10-28 04:35:54.191518'),(14,'shop','0004_auto_20181028_1248','2018-10-28 04:48:38.131865'),(15,'shop','0005_auto_20181028_1310','2018-10-28 05:10:19.730051'),(16,'shop','0006_auto_20181028_1339','2018-10-28 05:39:36.039028'),(17,'shop','0007_auto_20181028_1344','2018-10-28 05:44:24.309662'),(18,'shop','0008_auto_20181028_1405','2018-10-28 06:05:53.871167'),(19,'shop','0009_auto_20181028_1411','2018-10-28 06:11:41.659772'),(20,'shop','0010_auto_20181028_1415','2018-10-28 06:15:15.659602'),(21,'shop','0002_shoping_shop_detail','2018-10-28 12:11:03.171181'),(22,'shop','0003_carts','2018-10-30 07:15:35.333087'),(23,'shop','0004_orders','2018-10-30 11:32:42.715402'),(24,'shop','0005_userinfo_user_addres','2018-11-08 13:27:33.571662');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0m9onknrrics2o3k97xsavr8kjabhrc3','NWI0YjhhZmJhNWYxOTBiMjdjOTJiMjQ3YmE1MzRiYjIxM2Y4NTYxYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNGRhYzU1M2VkYzA0OWRjMWE3NTA5NGQwNzc0YjllNTBlNDY4YzhmIn0=','2018-11-11 06:45:17.113171'),('5bsylk9u4tiowmz1lu749w0m6061no2z','ZDg1NmEyZGY5MWQ5NWJiMjc5MzMzYjM3ZjA2ODk0NTIwOWRlZWQ0Mzp7InZlcmlmeWNvZGUiOiI0OTQzIn0=','2018-11-18 13:10:35.919188'),('6cmjyfbqe2myatkr3zrgcj7h8208702n','NDZhODY2ODY0ZWU0OTc0NzhlNDJlNTVmOTQwNGI5YjQwZTY2ZjgwNjp7InZlcmlmeWNvZGUiOiI3MTc4IiwidXNlcm5hbWUiOiJcdTdiYTFcdTc0MDZcdTg5ODEiLCJ1c2VyaWQiOjEsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNGRhYzU1M2VkYzA0OWRjMWE3NTA5NGQwNzc0YjllNTBlNDY4YzhmIn0=','2018-11-18 11:35:00.218675'),('9h7hqn7ggafskbtf8dpys7qle7ptte53','MWU2NDdmMWNiNDMyZTg4MDU3NWEzOWM3NzY5NGM1MGViZTI1MzhkYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNGRhYzU1M2VkYzA0OWRjMWE3NTA5NGQwNzc0YjllNTBlNDY4YzhmIiwidmVyaWZ5Y29kZSI6IjE5NDMiLCJ1c2VybmFtZSI6Ilx1N2JhMVx1NzQwNlx1ODk4MSJ9','2018-11-09 11:40:04.132369'),('eclqs4c5u2u4vmis0b06ta21pk5w6yhe','YmNiMTE0ZWYxZGIwMTQ5ZDcxYThlNmQwMjgxYWQ1OGUwYmEzZDFmMzp7InZlcmlmeWNvZGUiOiI2NDgyIiwidXNlcm5hbWUiOiJcdTdiYTFcdTc0MDZcdTg5ODEiLCJ1c2VyaWQiOjEsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNGRhYzU1M2VkYzA0OWRjMWE3NTA5NGQwNzc0YjllNTBlNDY4YzhmIiwiYnJvd3NlIjoiMkAxQDVANUAifQ==','2018-11-22 14:24:09.814487');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_carts`
--

DROP TABLE IF EXISTS `shop_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_num` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_carts_shop_id_38cf80e_fk_shop_shoping_id` (`shop_id`),
  KEY `shop_carts_user_id_184def7c_fk_shop_userinfo_id` (`user_id`),
  CONSTRAINT `shop_carts_shop_id_38cf80e_fk_shop_shoping_id` FOREIGN KEY (`shop_id`) REFERENCES `shop_shoping` (`id`),
  CONSTRAINT `shop_carts_user_id_184def7c_fk_shop_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `shop_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_carts`
--

LOCK TABLES `shop_carts` WRITE;
/*!40000 ALTER TABLE `shop_carts` DISABLE KEYS */;
INSERT INTO `shop_carts` VALUES (20,1,2,1),(21,7,1,1);
/*!40000 ALTER TABLE `shop_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_orders`
--

DROP TABLE IF EXISTS `shop_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_status` int(11) NOT NULL,
  `goods_money` decimal(10,2) NOT NULL,
  `deliver_type` varchar(60) DEFAULT NULL,
  `deliver_money` decimal(10,2) NOT NULL,
  `total_money` decimal(10,2) NOT NULL,
  `real_total_money` decimal(10,2) NOT NULL,
  `pay_type` varchar(20) NOT NULL,
  `is_pay` tinyint(1) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `is_refund` tinyint(1) NOT NULL,
  `is_closed` tinyint(1) NOT NULL,
  `receive_time` datetime(6) DEFAULT NULL,
  `delivery_time` datetime(6) DEFAULT NULL,
  `expressld` varchar(50) DEFAULT NULL,
  `express_no` varchar(50) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_orders_shop_id_2e7ddaa8_fk_shop_shoping_id` (`shop_id`),
  KEY `shop_orders_user_id_6d3279_fk_shop_userinfo_id` (`user_id`),
  CONSTRAINT `shop_orders_shop_id_2e7ddaa8_fk_shop_shoping_id` FOREIGN KEY (`shop_id`) REFERENCES `shop_shoping` (`id`),
  CONSTRAINT `shop_orders_user_id_6d3279_fk_shop_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `shop_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_orders`
--

LOCK TABLES `shop_orders` WRITE;
/*!40000 ALTER TABLE `shop_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_shoping`
--

DROP TABLE IF EXISTS `shop_shoping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_shoping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_sn` int(11) NOT NULL,
  `shop_name` varchar(20) NOT NULL,
  `shop_intro` varchar(100) NOT NULL,
  `shop_text` longtext NOT NULL,
  `shop_img` varchar(100) DEFAULT NULL,
  `market_price` decimal(10,2) NOT NULL,
  `shop_price` decimal(10,2) NOT NULL,
  `warn_stock` int(11) NOT NULL,
  `shop_stock` int(11) NOT NULL,
  `shop_unit` varchar(10) NOT NULL,
  `is_sale` tinyint(1) NOT NULL,
  `is_best` tinyint(1) NOT NULL,
  `sale_num` int(11) DEFAULT NULL,
  `visit_num` int(11) DEFAULT NULL,
  `appraise_num` int(11) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `shopin_type_id` int(11) NOT NULL,
  `shop_show` int(11),
  `shop_detail` varchar(100),
  PRIMARY KEY (`id`),
  KEY `shop_shoping_e8decb94` (`shopin_type_id`),
  CONSTRAINT `shop_shoping_shopin_type_id_7699b5d3_fk_shop_shopingtype_id` FOREIGN KEY (`shopin_type_id`) REFERENCES `shop_shopingtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_shoping`
--

LOCK TABLES `shop_shoping` WRITE;
/*!40000 ALTER TABLE `shop_shoping` DISABLE KEYS */;
INSERT INTO `shop_shoping` VALUES (1,1,'草莓','原产地在青藏高原','原产地在青藏高原，长在海拔高一万七千名的地方，其名为死亡草莓','./goods003.jpg',60.00,30.00,500,5000,'500/克',1,1,NULL,13,NULL,'2018-11-08 13:48:42.605080',1,NULL,'./goods_detail.jpg'),(2,1,'费力牛排','采用澳洲牛肉','原地成澳洲牛肉，所有的牛都是放养切不吃饲料，并故因长年运动牛肉肉质更为紧凑','./goods.jpg',300.00,250.00,500,6000,'/份',1,1,NULL,4,NULL,'2018-11-08 13:48:36.043960',1,NULL,''),(3,1,'奇异果','奇异果生长在树上','奇异果生长在树上很好吃酸酸甜甜','./goods012.jpg',98.00,38.00,500,50,'500克',1,1,NULL,1,NULL,'2018-10-29 09:28:39.041099',1,1,'./59251bebNea0fc46f.jpg'),(4,1,'海南太妃芒','海南太妃芒个头很大，市芒果中的贵妃','海南太妃芒个头很大，市芒果中的贵妃，成熟期切仅需要15天即可食用甜甜的芒果','',88.00,58.00,500,6000,'斤',1,1,NULL,NULL,NULL,'2018-10-29 08:18:33.299642',1,1,''),(5,1,'湿炒牛河','湿炒牛河是潮汕出名的小吃','湿炒牛河是潮汕出名的小吃很好吃的','./goods007.jpg',180.00,170.00,2,900,'/份',1,1,NULL,5,NULL,'2018-11-08 14:24:09.782336',8,NULL,'./58e62d46Ndcc0a865.jpg');
/*!40000 ALTER TABLE `shop_shoping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_shopingtype`
--

DROP TABLE IF EXISTS `shop_shopingtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_shopingtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) NOT NULL,
  `ssort` int(11) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `shopType_id` int(11) DEFAULT NULL,
  `style` varchar(20),
  `simage` varchar(100),
  `shop_show` int(11),
  PRIMARY KEY (`id`),
  KEY `shop_shopingtype_shopType_id_12bfcb3e_fk_shop_shopingtype_id` (`shopType_id`),
  CONSTRAINT `shop_shopingtype_shopType_id_12bfcb3e_fk_shop_shopingtype_id` FOREIGN KEY (`shopType_id`) REFERENCES `shop_shopingtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_shopingtype`
--

LOCK TABLES `shop_shopingtype` WRITE;
/*!40000 ALTER TABLE `shop_shopingtype` DISABLE KEYS */;
INSERT INTO `shop_shopingtype` VALUES (1,'新鲜水果',1,'2018-10-28 04:37:02.684366',1,NULL,'fruit','shop/upload/banner01.jpg',NULL),(2,'海鲜水产',1,'2018-10-28 04:01:07.621218',1,NULL,'seafood',NULL,NULL),(3,'猪牛羊肉',1,'2018-10-28 04:01:46.258809',1,NULL,'meet',NULL,NULL),(4,'禽类蛋品',1,'2018-10-28 04:02:21.408705',1,NULL,'egg',NULL,NULL),(5,'新鲜蔬菜',1,'2018-10-28 04:02:42.061081',1,NULL,'vegetables',NULL,NULL),(6,'速冻食品',1,'2018-10-28 04:03:00.870060',1,NULL,'ice',NULL,NULL),(7,'时令水果',2,'2018-10-28 06:46:02.687210',1,1,'','./banner01.jpg',1),(8,'新鲜特供',2,'2018-10-28 06:24:52.916186',1,3,'','banner06.jpg',1);
/*!40000 ALTER TABLE `shop_shopingtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_useraddress`
--

DROP TABLE IF EXISTS `shop_useraddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_useraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `areald1` varchar(20) NOT NULL,
  `areald2` varchar(20) NOT NULL,
  `areald3` varchar(20) NOT NULL,
  `communityld` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  `post_code` varchar(20) NOT NULL,
  `is_defult` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_useraddress_e8701ad4` (`user_id`),
  CONSTRAINT `shop_useraddress_user_id_6e0f51c1_fk_shop_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `shop_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_useraddress`
--

LOCK TABLES `shop_useraddress` WRITE;
/*!40000 ALTER TABLE `shop_useraddress` DISABLE KEYS */;
INSERT INTO `shop_useraddress` VALUES (1,'吴虹莉','13642664087','广东','广州','白云区','江夏村','白云区江夏尚龙大夏A座','50001',1,'2018-11-04 11:38:41.380034',1);
/*!40000 ALTER TABLE `shop_useraddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_userinfo`
--

DROP TABLE IF EXISTS `shop_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(20) NOT NULL,
  `login_pwd` varchar(50) NOT NULL,
  `user_sex` tinyint(1) NOT NULL,
  `user_type` tinyint(1) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_qq` varchar(20) DEFAULT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `user_total_score` int(11),
  `user_status` tinyint(1) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `last_time` date DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `user_addres` varchar(20),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_userinfo`
--

LOCK TABLES `shop_userinfo` WRITE;
/*!40000 ALTER TABLE `shop_userinfo` DISABLE KEYS */;
INSERT INTO `shop_userinfo` VALUES (1,'admin','admin',1,1,'隆顺','1125414223','13642664087',0,1,1,'2018-10-26','2018-11-08 13:28:37.283863','广州市白云区石井金碧新城'),(2,'longshun','longshun',1,1,'longshun','1125414223@qq.com',NULL,0,1,1,NULL,'2018-10-26 11:35:13.288079',NULL),(3,'longshun','longhsun',1,1,'longshun','111',NULL,0,1,1,NULL,'2018-10-26 11:36:09.084177',NULL),(4,'longshun','longshun',1,1,'longshun','111',NULL,0,1,1,NULL,'2018-10-26 11:38:18.630118',NULL),(5,'longshun','longshun',1,1,'longshun','111',NULL,0,1,1,NULL,'2018-10-26 11:40:03.635791',NULL);
/*!40000 ALTER TABLE `shop_userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-09 10:20:18
