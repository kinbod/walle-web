-- MySQL dump 10.13  Distrib 5.7.4-m14, for osx10.7 (x86_64)
--
-- Host: localhost    Database: walle_python
-- ------------------------------------------------------
-- Server version	5.7.4-m14

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
-- Current Database: `walle_python`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `walle_python` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `walle_python`;

--
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `name_cn` varchar(30) NOT NULL COMMENT '模块中文名称',
  `name_en` varchar(30) NOT NULL COMMENT '模块英文名称',
  `pid` int(6) NOT NULL COMMENT '父模块id，顶级pid为0',
  `type` enum('action','controller','module') DEFAULT 'action' COMMENT '类型',
  `sequence` int(11) DEFAULT '0' COMMENT '排序序号sprintf("%2d%2d%2d", module_id, controller_id, 自增两位数)',
  `archive` tinyint(1) DEFAULT '0' COMMENT '归档：0有效，1无效',
  `icon` varchar(30) DEFAULT '' COMMENT '模块',
  `fe_url` varchar(100) DEFAULT '' COMMENT '前端url',
  `fe_visible` tinyint(1) DEFAULT '1' COMMENT '前端是否展示该模块 0不展示，1展示',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
INSERT INTO `access` VALUES (1,'用户中心','',0,'module',10001,0,'leaf','xx.yy.zz',1,'2017-06-11 23:11:38','2017-06-12 00:15:29'),(2,'配置中心','',0,'module',10002,0,'leaf','xx.yy.zz',1,'2017-06-11 23:11:52','2017-06-12 00:15:29'),(3,'上线单','',0,'module',10003,0,'leaf','xx.yy.zz',1,'2017-06-11 23:12:45','2017-06-12 00:15:29'),(11,'用户管理','user',1,'controller',10101,0,'leaf','xx.yy.zz',1,'2017-06-11 23:13:51','2017-06-14 10:42:45'),(12,'用户组','group',1,'controller',10102,0,'leaf','xx.yy.zz',1,'2017-06-11 23:14:11','2017-06-14 10:42:48'),(13,'角色','role',1,'controller',10103,0,'leaf','xx.yy.zz',1,'2017-06-11 23:14:44','2017-06-14 10:42:52'),(14,'环境管理','environment',2,'controller',10201,0,'leaf','xx.yy.zz',1,'2017-06-11 23:15:30','2017-06-14 10:42:58'),(15,'服务器管理','server',2,'controller',10202,0,'leaf','xx.yy.zz',1,'2017-06-11 23:15:51','2017-06-14 10:43:01'),(16,'项目管理','project',2,'controller',10203,0,'leaf','xx.yy.zz',1,'2017-06-11 23:16:18','2017-06-14 10:43:07'),(101,'查看','get',11,'action',11101,0,'leaf','xx.yy.zz',1,'2017-06-11 23:17:12','2017-06-14 10:43:09'),(102,'修改','put',11,'action',11102,0,'leaf','xx.yy.zz',1,'2017-06-11 23:17:26','2017-06-14 10:43:17'),(103,'新增','post',11,'action',11103,0,'leaf','xx.yy.zz',1,'2017-06-11 23:17:59','2017-06-14 10:43:19'),(104,'删除','delete',11,'action',11104,0,'leaf','xx.yy.zz',1,'2017-06-11 23:18:16','2017-06-14 10:43:35'),(105,'查看','get',12,'action',11201,0,'leaf','xx.yy.zz',1,'2017-06-19 08:14:56','2017-06-19 08:14:56'),(106,'修改','put',12,'action',11202,0,'leaf','xx.yy.zz',1,'2017-06-19 08:14:56','2017-06-19 08:14:56'),(107,'新增','post',12,'action',11203,0,'leaf','xx.yy.zz',1,'2017-06-19 08:14:56','2017-06-19 08:14:56'),(108,'删除','delete',12,'action',11204,0,'leaf','xx.yy.zz',1,'2017-06-19 08:14:56','2017-06-19 08:14:56'),(109,'查看','get',13,'action',11301,0,'leaf','xx.yy.zz',1,'2017-06-19 08:15:22','2017-06-19 08:15:22'),(110,'修改','put',13,'action',11302,0,'leaf','xx.yy.zz',1,'2017-06-19 08:15:22','2017-06-19 08:15:22'),(111,'新增','post',13,'action',11303,0,'leaf','xx.yy.zz',1,'2017-06-19 08:15:22','2017-06-19 08:15:22'),(112,'删除','delete',13,'action',11304,0,'leaf','xx.yy.zz',1,'2017-06-19 08:15:22','2017-06-19 08:15:22'),(113,'查看','get',14,'action',11401,0,'leaf','xx.yy.zz',1,'2017-06-19 08:15:40','2017-06-19 08:15:40'),(114,'修改','put',14,'action',11402,0,'leaf','xx.yy.zz',1,'2017-06-19 08:15:40','2017-06-19 08:15:40'),(115,'新增','post',14,'action',11403,0,'leaf','xx.yy.zz',1,'2017-06-19 08:15:40','2017-06-19 08:15:40'),(116,'删除','delete',14,'action',11404,0,'leaf','xx.yy.zz',1,'2017-06-19 08:15:40','2017-06-19 08:15:40'),(117,'查看','get',15,'action',11501,0,'leaf','xx.yy.zz',1,'2017-06-19 08:16:21','2017-06-19 08:16:21'),(118,'修改','put',15,'action',11502,0,'leaf','xx.yy.zz',1,'2017-06-19 08:16:21','2017-06-19 08:16:21'),(119,'新增','post',15,'action',11503,0,'leaf','xx.yy.zz',1,'2017-06-19 08:16:21','2017-06-19 08:16:21'),(120,'删除','delete',15,'action',11504,0,'leaf','xx.yy.zz',1,'2017-06-19 08:16:21','2017-06-19 08:16:21'),(121,'查看','get',16,'action',11601,0,'leaf','xx.yy.zz',1,'2017-06-19 08:16:42','2017-06-19 08:16:42'),(122,'修改','put',16,'action',11602,0,'leaf','xx.yy.zz',1,'2017-06-19 08:16:42','2017-06-19 08:16:42'),(123,'新增','post',16,'action',11603,0,'leaf','xx.yy.zz',1,'2017-06-19 08:16:42','2017-06-19 08:16:42'),(124,'删除','delete',16,'action',11604,0,'leaf','xx.yy.zz',1,'2017-06-19 08:16:42','2017-06-19 08:16:42');
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `environment`
--

DROP TABLE IF EXISTS `environment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `environment` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) DEFAULT 'master' COMMENT '环境名称',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：0无效，1有效',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='项目环境配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `environment`
--

LOCK TABLES `environment` WRITE;
/*!40000 ALTER TABLE `environment` DISABLE KEYS */;
INSERT INTO `environment` VALUES (2,'开发环境',1,'2017-03-08 17:26:07','2018-09-06 22:35:33'),(3,'腾讯云测试联调',1,'2017-05-13 11:26:42','2017-05-13 11:26:42'),(5,'一个可以删除的环境',1,'2017-05-14 10:38:12','2017-05-14 10:38:12'),(6,'一个可以删除环境',1,'2017-05-14 10:40:47','2017-05-14 10:40:47'),(7,'一个可以删环境',1,'2017-05-14 10:42:23','2017-05-14 10:42:23'),(9,'开发环境火',1,'2017-05-14 10:46:31','2017-05-14 23:46:58');
/*!40000 ALTER TABLE `environment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foo`
--

DROP TABLE IF EXISTS `foo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foo`
--

LOCK TABLES `foo` WRITE;
/*!40000 ALTER TABLE `foo` DISABLE KEYS */;
INSERT INTO `foo` VALUES (1,'中test005','wushuiyong0095@walle-web.io','2017-05-22 22:45:14','2017-05-22 22:45:14'),(2,'wushuiyong1','wushuiyong1@walle-web.io','2017-05-22 23:17:48','2017-05-22 23:17:48'),(3,'wushuiyong2','wushuiyong2@walle-web.io','2017-05-22 23:17:48','2017-05-22 23:17:48');
/*!40000 ALTER TABLE `foo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `user_id` int(10) NOT NULL COMMENT '添加项目的用户id',
  `name` varchar(100) DEFAULT 'master' COMMENT '项目名字',
  `environment_id` int(1) NOT NULL COMMENT 'environment的id',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：0无效，1有效',
  `version` varchar(40) DEFAULT '' COMMENT '线上当前版本，用于快速回滚',
  `excludes` text COMMENT '要排除的文件',
  `target_user` varchar(50) NOT NULL COMMENT '目标机器的登录用户',
  `target_root` varchar(200) NOT NULL COMMENT '目标机器的 server 目录',
  `target_releases` varchar(200) NOT NULL COMMENT '目标机器的版本库',
  `server_ids` text COMMENT '目标机器列表',
  `task_vars` text COMMENT '高级环境变量',
  `prev_deploy` text COMMENT '部署前置任务',
  `post_deploy` text COMMENT '同步之前任务',
  `prev_release` text COMMENT '同步之前目标机器执行的任务',
  `post_release` text COMMENT '同步之后目标机器执行的任务',
  `keep_version_num` int(3) NOT NULL DEFAULT '20' COMMENT '线上版本保留数',
  `repo_url` varchar(200) DEFAULT '' COMMENT 'git地址',
  `repo_username` varchar(50) DEFAULT '' COMMENT '版本管理系统的用户名，一般为svn的用户名',
  `repo_password` varchar(50) DEFAULT '' COMMENT '版本管理系统的密码，一般为svn的密码',
  `repo_mode` varchar(50) DEFAULT 'branch' COMMENT '上线方式：branch/tag',
  `repo_type` varchar(10) DEFAULT 'git' COMMENT '上线方式：git/svn',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='项目配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,1,'瓦力自部署',1,1,'12121','*.log','work','/home/work/wushuiyong/webroot','/home/work/wushuiyong/releases','1,4','debug=1;\\napp=auotapp.py','echo prev_deploy; pwd','echo post_deploy; pwd','echo prev_release; pwd','echo post_release; pwd',5,'git@github.com:meolu/walden.git','','','branch','git','2017-03-11 23:30:53','2018-08-24 11:54:04'),(2,1,'瓦力自部署05',1,NULL,NULL,'*.log','work','/tmp/walle/root','/tmp/walle/library','1,3,2','debug=1;\\napp=auotapp.py','echo prev_deploy; pwd','echo post_deploy; pwd','echo prev_release; pwd','echo post_release; pwd',15,'git@github.com:meolu/walden.git','','','branch',NULL,'2017-05-25 14:53:21','2017-05-26 21:59:21'),(3,1,'walden-瓦尔登02',1,NULL,NULL,'*.log','work','/tmp/walle/root','/tmp/walle/library','1,3,2','debug=1;\\napp=auotapp.py','echo prev_deploy','echo post_deploy','echo prev_release','echo post_release',10,'git@github.com:meolu/walle-web.git','','','branch',NULL,'2017-05-25 15:02:18','2017-05-25 15:02:18'),(4,1,'瓦力自部署01',1,NULL,NULL,'*.log','work','/tmp/walle/root','/tmp/walle/library','1,3,2','debug=1;\\napp=auotapp.py','echo prev_deploy','echo post_deploy','echo prev_release','echo post_release',10,'git@github.com:meolu/walle-web.git','','','branch',NULL,'2017-05-25 23:48:06','2017-05-25 23:48:06');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_server`
--

DROP TABLE IF EXISTS `project_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_server` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `project_id` int(10) NOT NULL COMMENT '项目名字',
  `server_id` int(10) NOT NULL COMMENT '被打标签的实物id： 如 server.id',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='项目与服务器关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_server`
--

LOCK TABLES `project_server` WRITE;
/*!40000 ALTER TABLE `project_server` DISABLE KEYS */;
INSERT INTO `project_server` VALUES (1,1,1,'2017-03-11 23:37:50','2017-03-11 23:37:50'),(2,1,2,'2017-03-11 23:37:56','2017-03-11 23:37:56'),(3,1,3,'2017-03-11 23:38:03','2017-03-11 23:38:03');
/*!40000 ALTER TABLE `project_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '角色名称',
  `access_ids` text COMMENT '权限id列表,逗号分隔',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'测试同学','1,2,3,11,12,13,15,16,101,102,103,104,','2017-03-24 13:52:09','2017-06-12 19:25:51'),(2,'正式用户','1,2,3,11,12,13,14,15,16,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124','2017-03-26 13:23:44','2017-06-19 08:18:19'),(5,'业务端','1,2,3,11,12,13,14,15,16,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124','2017-05-11 09:41:58','2017-06-19 08:18:04'),(6,'没用的','','2017-05-14 16:44:41','2017-05-14 16:44:41'),(7,'业务端ss','','2017-05-14 16:50:02','2017-05-14 16:50:02'),(8,'业务端ss','','2017-05-14 16:51:06','2017-05-14 16:51:06'),(9,'业务端sss','','2017-05-14 16:51:06','2017-05-14 16:51:06'),(11,'业务端','','2017-05-14 16:53:06','2017-05-14 16:53:06'),(12,'业务端','','2017-06-14 15:24:01','2017-06-14 15:24:01');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `name` varchar(100) DEFAULT '' COMMENT 'server name',
  `host` varchar(100) NOT NULL COMMENT 'ip/host',
  `port` int(1) DEFAULT '22' COMMENT 'ssh port',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='服务器记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES (1,'dev-wushuiyong','172.16.0.231',22,'2017-03-11 23:34:27','2017-03-11 23:34:27'),(2,'mkt-dev-ky','172.16.0.194',22,'2017-03-11 23:35:12','2017-03-11 23:35:12'),(3,'mkt-dev-yindongyang','172.16.0.177',22,'2017-03-11 23:37:18','2017-03-11 23:37:18'),(4,'dev-songmeijing','172.16.0.52',22,'2018-08-24 11:54:04','2018-08-24 11:54:04');
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `name` varchar(100) DEFAULT 'master' COMMENT '标签',
  `label` varchar(20) NOT NULL COMMENT '标签类型：server, ',
  `label_id` int(10) NOT NULL COMMENT '被打标签的实物id： 如 server.id',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='tag 标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'用户端FE','user_group',0,'2017-05-08 19:56:19','2017-05-10 21:07:38'),(2,'营销中心','user_group',0,'2017-05-08 19:57:05','2017-05-08 19:57:05'),(3,'xx吴水永的新组xx','user_group',0,'2017-05-08 20:52:55','2017-05-11 23:34:45'),(11,'吴水永的新组','user_group',0,'2017-05-11 22:44:46','2017-05-11 22:44:46'),(13,'吴水永新增用户组','user_group',0,'2017-05-14 23:13:57','2017-05-14 23:13:57'),(14,'吴水永新增用户组吕','user_group',0,'2017-05-23 17:16:51','2017-05-23 17:16:51'),(15,'吴水永测试组','user_group',0,'2017-05-23 17:23:40','2017-05-23 17:23:40'),(16,'吴水永测试组在','user_group',0,'2017-05-23 17:25:30','2017-05-23 17:25:30'),(17,'吴水永测试组在','user_group',0,'2017-05-23 17:26:10','2017-05-23 17:26:10'),(18,'吴水永测试组在在','user_group',0,'2017-05-23 17:27:33','2017-05-23 17:27:33'),(19,'吴水永测试组在在在','user_group',0,'2017-05-23 17:28:56','2017-05-23 17:28:56'),(20,'吴水永测试组在在在在','user_group',0,'2017-05-23 17:30:01','2017-05-23 17:30:01'),(21,'吴水永测试组在在在在','user_group',0,'2017-05-23 17:30:23','2017-05-23 17:30:23'),(22,'吴水永测试组在在在在','user_group',0,'2017-05-23 17:31:10','2017-05-23 17:31:10'),(23,'吴水永测试组在在在在','user_group',0,'2017-05-23 17:31:44','2017-05-23 17:31:44'),(24,'吴水永测试组在在在在','user_group',0,'2017-05-23 17:31:44','2017-05-23 17:31:44'),(25,'吴水永测试组01','user_group',0,'2017-05-23 17:31:44','2017-05-23 17:31:44'),(26,'吴水永测试组02','user_group',0,'2017-05-23 17:44:19','2017-05-23 17:44:19'),(27,'吴水永测试组03','user_group',0,'2017-05-23 17:44:53','2017-05-23 17:44:53'),(28,'吴水永测试组04','user_group',0,'2017-05-23 17:47:37','2017-05-23 17:47:37'),(29,'吴水永测试组05','user_group',0,'2017-05-23 17:48:33','2017-05-23 17:48:33'),(30,'吴水永测试组05','user_group',0,'2017-05-23 17:48:33','2017-05-23 17:48:33'),(31,'这都有？','user_group',0,'2017-05-23 17:54:24','2017-05-23 17:54:24'),(32,'吴水永新增用户组不','user_group',0,'2017-05-23 18:02:48','2017-05-23 18:02:48'),(33,'吴水永新增用户组不有','user_group',0,'2017-05-23 18:06:20','2017-05-23 18:06:20'),(34,'吴水永新增用003','user_group',0,'2017-05-23 18:37:56','2017-05-23 18:37:56');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `name` varchar(100) NOT NULL COMMENT '上线单标题',
  `user_id` bigint(21) unsigned NOT NULL COMMENT '用户id',
  `project_id` int(11) NOT NULL COMMENT '项目id',
  `action` int(1) DEFAULT '0' COMMENT '0全新上线，2回滚',
  `status` tinyint(1) NOT NULL COMMENT '状态0：新建提交，1审核通过，2审核拒绝，3上线完成，4上线失败',
  `link_id` varchar(100) DEFAULT '' COMMENT '上线的软链号',
  `ex_link_id` varchar(100) DEFAULT '' COMMENT '被替换的上次上线的软链号',
  `servers` text COMMENT '上线的机器',
  `commit_id` varchar(40) DEFAULT '' COMMENT 'git commit id',
  `branch` varchar(100) DEFAULT 'master' COMMENT '选择上线的分支',
  `file_transmission_mode` smallint(3) NOT NULL DEFAULT '1' COMMENT '上线文件模式: 1.全量所有文件 2.指定文件列表',
  `file_list` text COMMENT '文件列表，svn上线方式可能会产生',
  `enable_rollback` int(1) NOT NULL DEFAULT '1' COMMENT '能否回滚此版本0：no 1：yes',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='上线单记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'Demo 测试上线单',1,1,0,1,'prev_link_id_test','prev_link_id_test','172.16.0.231,172.16.0.177','5bf82db','master',1,NULL,1,'2017-03-11 23:41:24','2017-03-11 23:45:10'),(2,'测试使用 vue 2.0',1,1,0,1,'vue_import','prev_link_id_test','172.16.0.231,172.16.0.177','5bf82db','master',1,NULL,1,'2017-03-12 17:31:55','2017-03-12 17:32:11'),(3,'到底 vue2 与 jinja 2 会产生什么样的火花呢？',1,1,0,1,'vue_jinja','vue_import','172.16.0.231,172.16.0.177','5bf82db','master',1,NULL,1,'2017-03-12 17:32:59','2017-03-12 17:33:29'),(6,'提交一个测试上线单',1,1,0,0,'','','127.0.0.1,192.168.0.1','a89eb23c','master',0,'*.log',1,'2017-05-27 14:50:37','2017-05-27 14:50:37'),(7,'提交一个测试上线单',1,1,0,0,'','','127.0.0.1,192.168.0.1','a89eb23c','master',0,'*.log',1,'2017-05-27 14:53:42','2017-05-27 14:53:42'),(8,'提交一个测试上线单',1,1,0,0,'','','127.0.0.1,192.168.0.1','a89eb23c','master',0,'*.log',1,'2017-05-27 15:37:39','2017-05-27 15:37:39'),(9,'提交一个测试上线单',1,1,0,0,'','','127.0.0.1,192.168.0.1','a89eb23c','master',0,'*.log',1,'2017-05-27 15:38:56','2017-05-27 15:38:56'),(10,'提交一个测试上线单',1,1,0,0,'','','127.0.0.1,192.168.0.1','a89eb23c','master',0,'*.log',1,'2017-05-27 15:40:04','2017-05-27 15:40:04'),(11,'提交一个测试上线单',1,1,0,0,'','','127.0.0.1,192.168.0.1','a89eb23c','master',0,'*.log',1,'2017-05-27 16:48:38','2017-05-27 16:48:38'),(12,'完美上线瓦尔登',1,1,0,0,'','','172.16.0.52,172.16.0.231','3041a953c288429f1cc69453c9bb908c2dec7d99','master',0,'*.log',1,'2018-08-24 11:54:04','2018-08-24 11:54:04');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_record`
--

DROP TABLE IF EXISTS `task_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_record` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `stage` varchar(20) DEFAULT NULL COMMENT '阶段',
  `sequence` int(10) DEFAULT NULL COMMENT '序列号',
  `user_id` int(21) unsigned NOT NULL COMMENT '用户id',
  `task_id` bigint(11) NOT NULL COMMENT 'Task id',
  `status` tinyint(1) NOT NULL COMMENT '状态0：新建提交，1审核通过，2审核拒绝，3上线完成，4上线失败',
  `host` varchar(200) DEFAULT '' COMMENT '命令执行所在机器',
  `user` varchar(200) DEFAULT '' COMMENT '命令执行所在机器的登录用户',
  `command` text COMMENT '命令与参数',
  `success` text COMMENT '成功返回信息',
  `error` text COMMENT '错误信息',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=957 DEFAULT CHARSET=utf8 COMMENT='任务执行记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_record`
--

LOCK TABLES `task_record` WRITE;
/*!40000 ALTER TABLE `task_record` DISABLE KEYS */;
INSERT INTO `task_record` VALUES (98,'prev_deploy',1,33,1,1,'','','whoami','wushuiyong','','2017-03-15 18:32:51','2017-03-15 18:32:51'),(99,'prev_deploy',1,33,32,1,'','','python --version','Python 2.7.10','','2017-03-15 18:32:51','2017-03-15 18:32:51'),(100,'prev_deploy',1,33,32,1,'','','git --version','git version 2.2.2','','2017-03-15 18:32:51','2017-03-15 18:32:51'),(101,'prev_deploy',1,33,32,1,'','','mkdir -p None','','','2017-03-15 18:32:51','2017-03-15 18:32:51'),(102,'prev_deploy',1,33,1,1,'','','whoami','wushuiyong','','2017-03-15 18:34:16','2017-03-15 18:34:16'),(103,'prev_deploy',1,33,32,1,'','','python --version','Python 2.7.10','','2017-03-15 18:34:16','2017-03-15 18:34:16'),(104,'prev_deploy',1,33,32,1,'','','git --version','git version 2.2.2','','2017-03-15 18:34:16','2017-03-15 18:34:16'),(105,'prev_deploy',1,33,32,1,'','','mkdir -p None','','','2017-03-15 18:34:16','2017-03-15 18:34:16'),(106,'prev_deploy',1,33,1,1,'','','whoami','wushuiyong','','2017-03-15 18:34:57','2017-03-15 18:34:57'),(107,'prev_deploy',1,33,32,1,'','','python --version','Python 2.7.10','','2017-03-15 18:34:58','2017-03-15 18:34:58'),(108,'prev_deploy',1,33,32,1,'','','git --version','git version 2.2.2','','2017-03-15 18:34:58','2017-03-15 18:34:58'),(109,'prev_deploy',1,33,32,1,'','','mkdir -p /Users/wushuiyong/workspace/meolu/data/codebase/walle-web','','','2017-03-15 18:34:58','2017-03-15 18:34:58'),(110,'prev_deploy',1,33,1,1,'','','whoami','wushuiyong','','2017-03-15 18:36:28','2017-03-15 18:36:28'),(111,'prev_deploy',1,33,32,1,'','','python --version','Python 2.7.10','','2017-03-15 18:36:28','2017-03-15 18:36:28'),(112,'prev_deploy',1,33,32,1,'','','git --version','git version 2.2.2','','2017-03-15 18:36:28','2017-03-15 18:36:28'),(113,'prev_deploy',1,33,32,1,'','','mkdir -p /Users/wushuiyong/workspace/meolu/data/codebase/walle-web','','','2017-03-15 18:36:28','2017-03-15 18:36:28'),(114,'prev_deploy',1,33,1,1,'','','whoami','wushuiyong','','2017-03-16 11:02:28','2017-03-16 11:02:28'),(115,'prev_deploy',1,33,32,1,'','','python --version','Python 2.7.10','','2017-03-16 11:02:29','2017-03-16 11:02:29'),(116,'prev_deploy',1,33,32,1,'','','git --version','git version 2.2.2','','2017-03-16 11:02:29','2017-03-16 11:02:29'),(117,'prev_deploy',1,33,32,1,'','','mkdir -p /Users/wushuiyong/workspace/meolu/data/codebase/walle-web','','','2017-03-16 11:02:29','2017-03-16 11:02:29'),(118,'prev_deploy',1,33,1,1,'','','whoami','wushuiyong','','2017-03-16 11:03:47','2017-03-16 11:03:47'),(119,'prev_deploy',1,33,32,1,'','','python --version','Python 2.7.10','','2017-03-16 11:03:47','2017-03-16 11:03:47'),(120,'prev_deploy',1,33,32,1,'','','git --version','git version 2.2.2','','2017-03-16 11:03:47','2017-03-16 11:03:47'),(121,'prev_deploy',1,33,32,1,'','','mkdir -p /Users/wushuiyong/workspace/meolu/data/codebase/walle-web','','','2017-03-16 11:03:47','2017-03-16 11:03:47'),(516,'1',1,1,1,1,'','','whoami','wushuiyong\r\n','','2018-09-03 14:17:51','2018-09-03 14:17:51'),(518,'1',1,1,1,1,'','','python --version','Python 2.7.10\r\n','','2018-09-03 14:17:51','2018-09-03 14:17:51'),(520,'1',1,1,1,1,'','','git --version','git version 2.15.1 (Apple Git-101)\r\n','','2018-09-03 14:17:51','2018-09-03 14:17:51'),(522,'1',1,1,1,1,'','','mkdir -p /tmp/walle/codebase/walden','','','2018-09-03 14:17:51','2018-09-03 14:17:51'),(524,'1',1,1,1,1,'','','cd /tmp/walle/codebase/walden && echo prev_deploy; pwd','prev_deploy\r\n/tmp/walle/codebase/walden\r\n','','2018-09-03 14:17:51','2018-09-03 14:17:51'),(526,'1',1,1,1,1,'','','whoami','wushuiyong\r\n','','2018-09-03 14:17:51','2018-09-03 14:17:51'),(528,'1',1,1,1,1,'','','python --version','Python 2.7.10\r\n','','2018-09-03 14:17:51','2018-09-03 14:17:51'),(530,'1',1,1,1,1,'','','git --version','git version 2.15.1 (Apple Git-101)\r\n','','2018-09-03 14:17:51','2018-09-03 14:17:51'),(532,'1',1,1,1,1,'','','mkdir -p /tmp/walle/codebase/walden','','','2018-09-03 14:17:51','2018-09-03 14:17:51'),(534,'1',1,1,1,1,'','','cd /tmp/walle/codebase/walden && echo prev_deploy; pwd','prev_deploy\r\n/tmp/walle/codebase/walden\r\n','','2018-09-03 14:17:51','2018-09-03 14:17:51'),(536,'1',1,1,1,1,'','','whoami','wushuiyong','','2018-09-03 14:19:38','2018-09-03 14:19:38'),(538,'1',1,1,1,1,'','','python --version','Python 2.7.10','','2018-09-03 14:19:38','2018-09-03 14:19:38'),(540,'1',1,1,1,1,'','','git --version','git version 2.15.1 (Apple Git-101)','','2018-09-03 14:19:38','2018-09-03 14:19:38'),(542,'1',1,1,1,1,'','','mkdir -p /tmp/walle/codebase/walden','','','2018-09-03 14:19:38','2018-09-03 14:19:38'),(544,'1',1,1,1,1,'','','cd /tmp/walle/codebase/walden && echo prev_deploy; pwd','prev_deploy\r\n/tmp/walle/codebase/walden','','2018-09-03 14:19:38','2018-09-03 14:19:38'),(546,'1',1,1,1,1,'','','whoami','wushuiyong','','2018-09-03 14:20:30','2018-09-03 14:20:30'),(548,'1',1,1,1,1,'','','python --version','Python 2.7.10','','2018-09-03 14:20:30','2018-09-03 14:20:30'),(550,'1',1,1,1,1,'','','git --version','git version 2.15.1 (Apple Git-101)','','2018-09-03 14:20:30','2018-09-03 14:20:30'),(552,'1',1,1,1,1,'','','mkdir -p /tmp/walle/codebase/walden','','','2018-09-03 14:20:30','2018-09-03 14:20:30'),(554,'1',1,1,1,1,'','','cd /tmp/walle/codebase/walden && echo prev_deploy; pwd','prev_deploy\r\n/tmp/walle/codebase/walden','','2018-09-03 14:20:30','2018-09-03 14:20:30'),(556,'1',1,1,1,1,'','','whoami','wushuiyong','','2018-09-03 14:20:30','2018-09-03 14:20:30'),(558,'1',1,1,1,1,'','','python --version','Python 2.7.10','','2018-09-03 14:20:30','2018-09-03 14:20:30'),(560,'1',1,1,1,1,'','','git --version','git version 2.15.1 (Apple Git-101)','','2018-09-03 14:20:30','2018-09-03 14:20:30'),(562,'1',1,1,1,1,'','','mkdir -p /tmp/walle/codebase/walden','','','2018-09-03 14:20:30','2018-09-03 14:20:30'),(564,'1',1,1,1,1,'','','cd /tmp/walle/codebase/walden && echo prev_deploy; pwd','prev_deploy\r\n/tmp/walle/codebase/walden','','2018-09-03 14:20:30','2018-09-03 14:20:30'),(566,'1',1,1,1,1,'','','whoami','wushuiyong','','2018-09-03 14:20:30','2018-09-03 14:20:30'),(568,'1',1,1,1,1,'','','python --version','Python 2.7.10','','2018-09-03 14:20:30','2018-09-03 14:20:30'),(570,'1',1,1,1,1,'','','git --version','git version 2.15.1 (Apple Git-101)','','2018-09-03 14:20:30','2018-09-03 14:20:30'),(572,'1',1,1,1,1,'','','mkdir -p /tmp/walle/codebase/walden','','','2018-09-03 14:20:30','2018-09-03 14:20:30'),(574,'1',1,1,1,1,'','','cd /tmp/walle/codebase/walden && echo prev_deploy; pwd','prev_deploy\r\n/tmp/walle/codebase/walden','','2018-09-03 14:20:30','2018-09-03 14:20:30'),(596,'1',1,1,1,1,'','','whoami','wushuiyong','','2018-09-04 08:53:32','2018-09-04 08:53:32'),(597,'prev_deploy',1,1,1,1,'','','whoami','wushuiyong','','2018-09-04 08:55:05','2018-09-04 08:55:05'),(893,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-06 21:58:34','2018-09-06 21:58:34'),(894,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-06 21:58:34','2018-09-06 21:58:34'),(895,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-06 21:58:34','2018-09-06 21:58:34'),(896,'prev_deploy',1,1,12,1,'127.0.0.1','wushuiyong','whoami','','e.result','2018-09-07 11:23:58','2018-09-07 11:23:58'),(897,'prev_deploy',1,1,12,1,'127.0.0.1','wushuiyong','whoami','','e.result','2018-09-07 11:23:58','2018-09-07 11:23:58'),(898,'prev_deploy',1,1,12,1,'127.0.0.1','wushuiyong','whoami','','e.result','2018-09-07 11:24:25','2018-09-07 11:24:25'),(899,'prev_deploy',1,1,12,1,'127.0.0.1','wushuiyong','whoami','','e.result','2018-09-07 11:24:25','2018-09-07 11:24:25'),(900,'prev_deploy',1,1,12,1,'127.0.0.1','wushuiyong','whoami','','e.result','2018-09-07 11:28:51','2018-09-07 11:28:51'),(901,'prev_deploy',1,1,12,1,'127.0.0.1','wushuiyong','whoami','','e.result','2018-09-07 11:29:32','2018-09-07 11:29:32'),(902,'prev_deploy',1,1,12,1,'127.0.0.1','wushuiyong','whoami','','e.result','2018-09-07 11:30:06','2018-09-07 11:30:06'),(903,'prev_deploy',1,1,12,1,'127.0.0.1','wushuiyong','whoami','','e.result','2018-09-07 11:36:15','2018-09-07 11:36:15'),(904,'prev_deploy',1,1,12,1,'127.0.0.1','wushuiyong','whoami','','e.result','2018-09-07 11:41:33','2018-09-07 11:41:33'),(905,'prev_deploy',1,1,12,1,'127.0.0.1','wushuiyong','whoami','','e.result','2018-09-07 11:42:30','2018-09-07 11:42:30'),(906,'prev_deploy',1,1,12,1,'127.0.0.1','wushuiyong','whoami','','e.result','2018-09-07 11:43:12','2018-09-07 11:43:12'),(907,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-07 11:47:30','2018-09-07 11:47:30'),(908,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-07 11:47:30','2018-09-07 11:47:30'),(909,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-07 11:47:30','2018-09-07 11:47:30'),(910,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-07 17:07:17','2018-09-07 17:07:17'),(911,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-07 17:22:37','2018-09-07 17:22:37'),(912,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-07 17:22:37','2018-09-07 17:22:37'),(913,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-07 17:35:19','2018-09-07 17:35:19'),(914,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-07 17:35:19','2018-09-07 17:35:19'),(915,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-07 17:41:20','2018-09-07 17:41:20'),(916,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-07 17:41:20','2018-09-07 17:41:20'),(917,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-07 17:47:31','2018-09-07 17:47:31'),(918,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-07 17:47:56','2018-09-07 17:47:56'),(919,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-07 18:03:20','2018-09-07 18:03:20'),(920,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-07 18:04:45','2018-09-07 18:04:45'),(921,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-07 18:13:08','2018-09-07 18:13:08'),(922,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(923,'deploy',2,1,12,0,'127.0.0.1','wushuiyong','cd /tmp/walle/codebase/walden && pwd && git pull','/tmp/walle/codebase/walden','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(924,'deploy',2,1,12,0,'127.0.0.1','wushuiyong','cd /tmp/walle/codebase/ && cp -rf /tmp/walle/codebase/walden walden_12_20180907_181345','','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(925,'deploy',2,1,12,0,'127.0.0.1','wushuiyong','cd /tmp/walle/codebase/walden_12_20180907_181345 && git reset -q --hard 3041a953c288429f1cc69453c9bb908c2dec7d99','','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(926,'post_deploy',3,1,12,0,'127.0.0.1','wushuiyong','cd /tmp/walle/codebase/walden_12_20180907_181345 && echo post_deploy; pwd','post_deploy\r\n/tmp/walle/codebase/walden_12_20180907_181345','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(927,'post_deploy',3,1,12,0,'127.0.0.1','wushuiyong','cd /tmp/walle/codebase/ && tar zcvf walden_12_20180907_181345.tgz walden_12_20180907_181345','a walden_12_20180907_181345\r\na walden_12_20180907_181345/Document.php\r\na walden_12_20180907_181345/favicon.ico\r\na walden_12_20180907_181345/index.php\r\na walden_12_20180907_181345/CHANGELOG.md\r\na walden_12_20180907_181345/Bootstrap.php\r\na walden_12_20180907_181345/Config.php\r\na walden_12_20180907_181345/README.md\r\na walden_12_20180907_181345/.gitignore\r\na walden_12_20180907_181345/static\r\na walden_12_20180907_181345/Parsedown.php\r\na walden_12_20180907_181345/Command.php\r\na walden_12_20180907_181345/templates\r\na walden_12_20180907_181345/.git\r\na walden_12_20180907_181345/.travis.yml\r\na walden_12_20180907_181345/.htaccess\r\na walden_12_20180907_181345/.git/ORIG_HEAD\r\na walden_12_20180907_181345/.git/config\r\na walden_12_20180907_181345/.git/objects\r\na walden_12_20180907_181345/.git/HEAD\r\na walden_12_20180907_181345/.git/info\r\na walden_12_20180907_181345/.git/logs\r\na walden_12_20180907_181345/.git/description\r\na walden_12_20180907_181345/.git/hooks\r\na walden_12_20180907_181345/.git/refs\r\na walden_12_20180907_181345/.git/index\r\na walden_12_20180907_181345/.git/packed-refs\r\na walden_12_20180907_181345/.git/FETCH_HEAD\r\na walden_12_20180907_181345/.git/refs/heads\r\na walden_12_20180907_181345/.git/refs/remotes\r\na walden_12_20180907_181345/.git/refs/remotes/origin\r\na walden_12_20180907_181345/.git/refs/heads/master\r\na walden_12_20180907_181345/.git/hooks/commit-msg.sample\r\na walden_12_20180907_181345/.git/hooks/pre-rebase.sample\r\na walden_12_20180907_181345/.git/hooks/pre-commit.sample\r\na walden_12_20180907_181345/.git/hooks/applypatch-msg.sample\r\na walden_12_20180907_181345/.git/hooks/pre-receive.sample\r\na walden_12_20180907_181345/.git/hooks/prepare-commit-msg.sample\r\na walden_12_20180907_181345/.git/hooks/post-update.sample\r\na walden_12_20180907_181345/.git/hooks/pre-applypatch.sample\r\na walden_12_20180907_181345/.git/hooks/pre-push.sample\r\na walden_12_20180907_181345/.git/hooks/update.sample\r\na walden_12_20180907_181345/.git/logs/HEAD\r\na walden_12_20180907_181345/.git/logs/refs\r\na walden_12_20180907_181345/.git/logs/refs/heads\r\na walden_12_20180907_181345/.git/logs/refs/remotes\r\na walden_12_20180907_181345/.git/logs/refs/remotes/origin\r\na walden_12_20180907_181345/.git/logs/refs/remotes/origin/HEAD\r\na walden_12_20180907_181345/.git/logs/refs/heads/master\r\na walden_12_20180907_181345/.git/objects/pack\r\na walden_12_20180907_181345/.git/objects/pack/pack-f3effb1b0871952625ad845fd42469be582c4d94.pack\r\na walden_12_20180907_181345/.git/objects/pack/pack-f3effb1b0871952625ad845fd42469be582c4d94.idx\r\na walden_12_20180907_181345/templates/default\r\na walden_12_20180907_181345/templates/default/markdown-detail-view.php\r\na walden_12_20180907_181345/templates/default/markdown-editor-view.php\r\na walden_12_20180907_181345/static/screenshots\r\na walden_12_20180907_181345/static/bootstrap\r\na walden_12_20180907_181345/static/editor\r\na walden_12_20180907_181345/static/editor/jquery.uploadify.js\r\na walden_12_20180907_181345/static/editor/editor.css\r\na walden_12_20180907_181345/static/editor/uploadify.swf\r\na walden_12_20180907_181345/static/editor/uploadify-cancel.png\r\na walden_12_20180907_181345/static/editor/jquery-1.8.2.min.js\r\na walden_12_20180907_181345/static/bootstrap/css\r\na walden_12_20180907_181345/static/bootstrap/images\r\na walden_12_20180907_181345/static/bootstrap/js\r\na walden_12_20180907_181345/static/bootstrap/img\r\na walden_12_20180907_181345/static/bootstrap/font\r\na walden_12_20180907_181345/static/bootstrap/fonts\r\na walden_12_20180907_181345/static/bootstrap/fonts/glyphicons-halflings-regular.woff\r\na walden_12_20180907_181345/static/bootstrap/fonts/glyphicons-halflings-regular.eot\r\na walden_12_20180907_181345/static/bootstrap/fonts/glyphicons-halflings-regular.ttf\r\na walden_12_20180907_181345/static/bootstrap/fonts/glyphicons-halflings-regular.svg\r\na walden_12_20180907_181345/static/bootstrap/fonts/fonts.googleapis.com.css\r\na walden_12_20180907_181345/static/bootstrap/font/fontawesome-webfont.svg\r\na walden_12_20180907_181345/static/bootstrap/font/fontawesome-webfont.ttf\r\na walden_12_20180907_181345/static/bootstrap/font/fontawesome-webfont.woff\r\na walden_12_20180907_181345/static/bootstrap/font/fontawesome-webfont.eot\r\na walden_12_20180907_181345/static/bootstrap/img/clear.png\r\na walden_12_20180907_181345/static/bootstrap/img/loading.gif\r\na walden_12_20180907_181345/static/bootstrap/js/select2.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/ace-elements.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/jquery-ui-1.10.3.full.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/html5shiv.js\r\na walden_12_20180907_181345/static/bootstrap/js/bootbox.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/jquery.autosize.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/date-time\r\na walden_12_20180907_181345/static/bootstrap/js/jquery.validate.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/jquery.colorbox-min.js\r\na walden_12_20180907_181345/static/bootstrap/js/highlight.pack.js\r\na walden_12_20180907_181345/static/bootstrap/js/jquery-2.0.3.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/respond.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/ace.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/additional-methods.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/jquery.hotkeys.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/bootstrap-colorpicker.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/prettify.js\r\na walden_12_20180907_181345/static/bootstrap/js/flot\r\na walden_12_20180907_181345/static/bootstrap/js/jquery.easy-pie-chart.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/jquery.ui.touch-punch.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/chosen.jquery.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/jquery.dataTables.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/bootstrap.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/fullcalendar.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/jquery.maskedinput.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/excanvas.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/jquery.knob.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/spin.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/x-editable\r\na walden_12_20180907_181345/static/bootstrap/js/jquery.inputlimiter.1.3.1.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/jquery.dataTables.bootstrap.js\r\na walden_12_20180907_181345/static/bootstrap/js/fuelux\r\na walden_12_20180907_181345/static/bootstrap/js/dropzone.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/jqGrid\r\na walden_12_20180907_181345/static/bootstrap/js/jquery.gritter.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/jquery-ui-1.10.3.custom.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/ace-extra.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/jquery.nestable.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/jquery.sparkline.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/jquery.slimscroll.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/bootstrap-wysiwyg.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/typeahead-bs2.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/bootstrap-tag.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/jqGrid/jquery.jqGrid.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/jqGrid/i18n\r\na walden_12_20180907_181345/static/bootstrap/js/jqGrid/i18n/grid.locale-en.js\r\na walden_12_20180907_181345/static/bootstrap/js/fuelux/fuelux.wizard.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/fuelux/data\r\na walden_12_20180907_181345/static/bootstrap/js/fuelux/fuelux.tree.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/fuelux/fuelux.spinner.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/fuelux/data/fuelux.tree-sampledata.js\r\na walden_12_20180907_181345/static/bootstrap/js/x-editable/bootstrap-editable.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/x-editable/ace-editable.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/flot/jquery.flot.pie.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/flot/jquery.flot.resize.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/flot/jquery.flot.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/date-time/bootstrap-datepicker.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/date-time/bootstrap-timepicker.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/date-time/daterangepicker.min.js\r\na walden_12_20180907_181345/static/bootstrap/js/date-time/moment.min.js\r\na walden_12_20180907_181345/static/bootstrap/images/walden.jpg\r\na walden_12_20180907_181345/static/bootstrap/images/bs-docs-masthead-pattern.png\r\na walden_12_20180907_181345/static/bootstrap/css/font-awesome-ie7.min.css\r\na walden_12_20180907_181345/static/bootstrap/css/select2x2.png\r\na walden_12_20180907_181345/static/bootstrap/css/bootstrap.min.css\r\na walden_12_20180907_181345/static/bootstrap/css/chosen.css\r\na walden_12_20180907_181345/static/bootstrap/css/jquery-ui-1.10.3.custom.min.css\r\na walden_12_20180907_181345/static/bootstrap/css/bootstrap-editable.css\r\na walden_12_20180907_181345/static/bootstrap/css/github.css\r\na walden_12_20180907_181345/static/bootstrap/css/chosen-sprite@2x.png\r\na walden_12_20180907_181345/static/bootstrap/css/daterangepicker.css\r\na walden_12_20180907_181345/static/bootstrap/css/colorbox.css\r\na walden_12_20180907_181345/static/bootstrap/css/images\r\na walden_12_20180907_181345/static/bootstrap/css/ace-rtl.min.css\r\na walden_12_20180907_181345/static/bootstrap/css/datepicker.css\r\na walden_12_20180907_181345/static/bootstrap/css/fullcalendar.css\r\na walden_12_20180907_181345/static/bootstrap/css/select2-spinner.gif\r\na walden_12_20180907_181345/static/bootstrap/css/dropzone.css\r\na walden_12_20180907_181345/static/bootstrap/css/chosen-sprite.png\r\na walden_12_20180907_181345/static/bootstrap/css/colorpicker.css\r\na walden_12_20180907_181345/static/bootstrap/css/bootstrap-timepicker.css\r\na walden_12_20180907_181345/static/bootstrap/css/img\r\na walden_12_20180907_181345/static/bootstrap/css/ace.min.css\r\na walden_12_20180907_181345/static/bootstrap/css/jquery.gritter.css\r\na walden_12_20180907_181345/static/bootstrap/css/prettify.css\r\na walden_12_20180907_181345/static/bootstrap/css/ace-skins.min.css\r\na walden_12_20180907_181345/static/bootstrap/css/select2.css\r\na walden_12_20180907_181345/static/bootstrap/css/ui.jqgrid.css\r\na walden_12_20180907_181345/static/bootstrap/css/font-awesome.min.css\r\na walden_12_20180907_181345/static/bootstrap/css/jquery-ui-1.10.3.full.min.css\r\na walden_12_20180907_181345/static/bootstrap/css/base.css\r\na walden_12_20180907_181345/static/bootstrap/css/select2.png\r\na walden_12_20180907_181345/static/bootstrap/css/ace-ie.min.css\r\na walden_12_20180907_181345/static/bootstrap/css/img/hue.png\r\na walden_12_20180907_181345/static/bootstrap/css/img/alpha.png\r\na walden_12_20180907_181345/static/bootstrap/css/img/saturation.png\r\na walden_12_20180907_181345/static/bootstrap/css/images/border.png\r\na walden_12_20180907_181345/static/bootstrap/css/images/loading.gif\r\na walden_12_20180907_181345/static/bootstrap/css/images/overlay.png\r\na walden_12_20180907_181345/static/bootstrap/css/images/controls.png\r\na walden_12_20180907_181345/static/bootstrap/css/images/loading_background.png\r\na walden_12_20180907_181345/static/screenshots/preview.png\r\na walden_12_20180907_181345/static/screenshots/editor.png\r\na walden_12_20180907_181345/static/screenshots/walden.gif','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(928,'prev_release',4,1,12,0,'172.16.0.231','work','mkdir -p /home/work/wushuiyong/releases','','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(929,'prev_release',4,1,12,0,'172.16.0.231','work','cd /home/work/wushuiyong/releases && tar zxf walden_12_20180907_181345.tgz','','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(930,'release',5,1,12,0,'172.16.0.231','work','cd /home/work/wushuiyong/releases && ln -sfn /home/work/wushuiyong/releases/walden_12_20180907_181345 /home/work/wushuiyong/releases/current-tmp-12','','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(931,'release',5,1,12,0,'172.16.0.231','work','cd /home/work/wushuiyong/releases && mv -fT /home/work/wushuiyong/releases/current-tmp-12 /home/work/wushuiyong/webroot','','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(932,'post_release',6,1,12,0,'172.16.0.231','work','cd /home/work/wushuiyong/webroot && sudo service nginx restart','nginx: the configuration file /etc/nginx/nginx.conf syntax is ok\r\nnginx: configuration file /etc/nginx/nginx.conf test is successful\r\nStopping nginx: [60G[[0;32m  OK  [0;39m]\r\r\nStarting nginx: [60G[[0;32m  OK  [0;39m]','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(933,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(934,'deploy',2,1,12,0,'127.0.0.1','wushuiyong','cd /tmp/walle/codebase/walden && pwd && git pull','/tmp/walle/codebase/walden\r\nAlready up to date.','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(935,'deploy',2,1,12,0,'127.0.0.1','wushuiyong','cd /tmp/walle/codebase/ && cp -rf /tmp/walle/codebase/walden walden_12_20180907_181423','','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(936,'deploy',2,1,12,0,'127.0.0.1','wushuiyong','cd /tmp/walle/codebase/walden_12_20180907_181423 && git reset -q --hard 3041a953c288429f1cc69453c9bb908c2dec7d99','','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(937,'post_deploy',3,1,12,0,'127.0.0.1','wushuiyong','cd /tmp/walle/codebase/walden_12_20180907_181423 && echo post_deploy; pwd','post_deploy\r\n/tmp/walle/codebase/walden_12_20180907_181423','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(938,'post_deploy',3,1,12,0,'127.0.0.1','wushuiyong','cd /tmp/walle/codebase/ && tar zcvf walden_12_20180907_181423.tgz walden_12_20180907_181423','a walden_12_20180907_181423\r\na walden_12_20180907_181423/Document.php\r\na walden_12_20180907_181423/favicon.ico\r\na walden_12_20180907_181423/index.php\r\na walden_12_20180907_181423/CHANGELOG.md\r\na walden_12_20180907_181423/Bootstrap.php\r\na walden_12_20180907_181423/Config.php\r\na walden_12_20180907_181423/README.md\r\na walden_12_20180907_181423/.gitignore\r\na walden_12_20180907_181423/static\r\na walden_12_20180907_181423/Parsedown.php\r\na walden_12_20180907_181423/Command.php\r\na walden_12_20180907_181423/templates\r\na walden_12_20180907_181423/.git\r\na walden_12_20180907_181423/.travis.yml\r\na walden_12_20180907_181423/.htaccess\r\na walden_12_20180907_181423/.git/ORIG_HEAD\r\na walden_12_20180907_181423/.git/config\r\na walden_12_20180907_181423/.git/objects\r\na walden_12_20180907_181423/.git/HEAD\r\na walden_12_20180907_181423/.git/info\r\na walden_12_20180907_181423/.git/logs\r\na walden_12_20180907_181423/.git/description\r\na walden_12_20180907_181423/.git/hooks\r\na walden_12_20180907_181423/.git/refs\r\na walden_12_20180907_181423/.git/index\r\na walden_12_20180907_181423/.git/packed-refs\r\na walden_12_20180907_181423/.git/FETCH_HEAD\r\na walden_12_20180907_181423/.git/refs/heads\r\na walden_12_20180907_181423/.git/refs/remotes\r\na walden_12_20180907_181423/.git/refs/remotes/origin\r\na walden_12_20180907_181423/.git/refs/heads/master\r\na walden_12_20180907_181423/.git/hooks/commit-msg.sample\r\na walden_12_20180907_181423/.git/hooks/pre-rebase.sample\r\na walden_12_20180907_181423/.git/hooks/pre-commit.sample\r\na walden_12_20180907_181423/.git/hooks/applypatch-msg.sample\r\na walden_12_20180907_181423/.git/hooks/pre-receive.sample\r\na walden_12_20180907_181423/.git/hooks/prepare-commit-msg.sample\r\na walden_12_20180907_181423/.git/hooks/post-update.sample\r\na walden_12_20180907_181423/.git/hooks/pre-applypatch.sample\r\na walden_12_20180907_181423/.git/hooks/pre-push.sample\r\na walden_12_20180907_181423/.git/hooks/update.sample\r\na walden_12_20180907_181423/.git/logs/HEAD\r\na walden_12_20180907_181423/.git/logs/refs\r\na walden_12_20180907_181423/.git/logs/refs/heads\r\na walden_12_20180907_181423/.git/logs/refs/remotes\r\na walden_12_20180907_181423/.git/logs/refs/remotes/origin\r\na walden_12_20180907_181423/.git/logs/refs/remotes/origin/HEAD\r\na walden_12_20180907_181423/.git/logs/refs/heads/master\r\na walden_12_20180907_181423/.git/objects/pack\r\na walden_12_20180907_181423/.git/objects/pack/pack-f3effb1b0871952625ad845fd42469be582c4d94.pack\r\na walden_12_20180907_181423/.git/objects/pack/pack-f3effb1b0871952625ad845fd42469be582c4d94.idx\r\na walden_12_20180907_181423/templates/default\r\na walden_12_20180907_181423/templates/default/markdown-detail-view.php\r\na walden_12_20180907_181423/templates/default/markdown-editor-view.php\r\na walden_12_20180907_181423/static/screenshots\r\na walden_12_20180907_181423/static/bootstrap\r\na walden_12_20180907_181423/static/editor\r\na walden_12_20180907_181423/static/editor/jquery.uploadify.js\r\na walden_12_20180907_181423/static/editor/editor.css\r\na walden_12_20180907_181423/static/editor/uploadify.swf\r\na walden_12_20180907_181423/static/editor/uploadify-cancel.png\r\na walden_12_20180907_181423/static/editor/jquery-1.8.2.min.js\r\na walden_12_20180907_181423/static/bootstrap/css\r\na walden_12_20180907_181423/static/bootstrap/images\r\na walden_12_20180907_181423/static/bootstrap/js\r\na walden_12_20180907_181423/static/bootstrap/img\r\na walden_12_20180907_181423/static/bootstrap/font\r\na walden_12_20180907_181423/static/bootstrap/fonts\r\na walden_12_20180907_181423/static/bootstrap/fonts/glyphicons-halflings-regular.woff\r\na walden_12_20180907_181423/static/bootstrap/fonts/glyphicons-halflings-regular.eot\r\na walden_12_20180907_181423/static/bootstrap/fonts/glyphicons-halflings-regular.ttf\r\na walden_12_20180907_181423/static/bootstrap/fonts/glyphicons-halflings-regular.svg\r\na walden_12_20180907_181423/static/bootstrap/fonts/fonts.googleapis.com.css\r\na walden_12_20180907_181423/static/bootstrap/font/fontawesome-webfont.svg\r\na walden_12_20180907_181423/static/bootstrap/font/fontawesome-webfont.ttf\r\na walden_12_20180907_181423/static/bootstrap/font/fontawesome-webfont.woff\r\na walden_12_20180907_181423/static/bootstrap/font/fontawesome-webfont.eot\r\na walden_12_20180907_181423/static/bootstrap/img/clear.png\r\na walden_12_20180907_181423/static/bootstrap/img/loading.gif\r\na walden_12_20180907_181423/static/bootstrap/js/select2.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/ace-elements.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/jquery-ui-1.10.3.full.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/html5shiv.js\r\na walden_12_20180907_181423/static/bootstrap/js/bootbox.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/jquery.autosize.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/date-time\r\na walden_12_20180907_181423/static/bootstrap/js/jquery.validate.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/jquery.colorbox-min.js\r\na walden_12_20180907_181423/static/bootstrap/js/highlight.pack.js\r\na walden_12_20180907_181423/static/bootstrap/js/jquery-2.0.3.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/respond.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/ace.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/additional-methods.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/jquery.hotkeys.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/bootstrap-colorpicker.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/prettify.js\r\na walden_12_20180907_181423/static/bootstrap/js/flot\r\na walden_12_20180907_181423/static/bootstrap/js/jquery.easy-pie-chart.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/jquery.ui.touch-punch.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/chosen.jquery.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/jquery.dataTables.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/bootstrap.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/fullcalendar.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/jquery.maskedinput.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/excanvas.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/jquery.knob.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/spin.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/x-editable\r\na walden_12_20180907_181423/static/bootstrap/js/jquery.inputlimiter.1.3.1.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/jquery.dataTables.bootstrap.js\r\na walden_12_20180907_181423/static/bootstrap/js/fuelux\r\na walden_12_20180907_181423/static/bootstrap/js/dropzone.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/jqGrid\r\na walden_12_20180907_181423/static/bootstrap/js/jquery.gritter.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/jquery-ui-1.10.3.custom.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/ace-extra.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/jquery.nestable.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/jquery.sparkline.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/jquery.slimscroll.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/bootstrap-wysiwyg.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/typeahead-bs2.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/bootstrap-tag.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/jqGrid/jquery.jqGrid.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/jqGrid/i18n\r\na walden_12_20180907_181423/static/bootstrap/js/jqGrid/i18n/grid.locale-en.js\r\na walden_12_20180907_181423/static/bootstrap/js/fuelux/fuelux.wizard.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/fuelux/data\r\na walden_12_20180907_181423/static/bootstrap/js/fuelux/fuelux.tree.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/fuelux/fuelux.spinner.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/fuelux/data/fuelux.tree-sampledata.js\r\na walden_12_20180907_181423/static/bootstrap/js/x-editable/bootstrap-editable.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/x-editable/ace-editable.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/flot/jquery.flot.pie.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/flot/jquery.flot.resize.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/flot/jquery.flot.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/date-time/bootstrap-datepicker.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/date-time/bootstrap-timepicker.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/date-time/daterangepicker.min.js\r\na walden_12_20180907_181423/static/bootstrap/js/date-time/moment.min.js\r\na walden_12_20180907_181423/static/bootstrap/images/walden.jpg\r\na walden_12_20180907_181423/static/bootstrap/images/bs-docs-masthead-pattern.png\r\na walden_12_20180907_181423/static/bootstrap/css/font-awesome-ie7.min.css\r\na walden_12_20180907_181423/static/bootstrap/css/select2x2.png\r\na walden_12_20180907_181423/static/bootstrap/css/bootstrap.min.css\r\na walden_12_20180907_181423/static/bootstrap/css/chosen.css\r\na walden_12_20180907_181423/static/bootstrap/css/jquery-ui-1.10.3.custom.min.css\r\na walden_12_20180907_181423/static/bootstrap/css/bootstrap-editable.css\r\na walden_12_20180907_181423/static/bootstrap/css/github.css\r\na walden_12_20180907_181423/static/bootstrap/css/chosen-sprite@2x.png\r\na walden_12_20180907_181423/static/bootstrap/css/daterangepicker.css\r\na walden_12_20180907_181423/static/bootstrap/css/colorbox.css\r\na walden_12_20180907_181423/static/bootstrap/css/images\r\na walden_12_20180907_181423/static/bootstrap/css/ace-rtl.min.css\r\na walden_12_20180907_181423/static/bootstrap/css/datepicker.css\r\na walden_12_20180907_181423/static/bootstrap/css/fullcalendar.css\r\na walden_12_20180907_181423/static/bootstrap/css/select2-spinner.gif\r\na walden_12_20180907_181423/static/bootstrap/css/dropzone.css\r\na walden_12_20180907_181423/static/bootstrap/css/chosen-sprite.png\r\na walden_12_20180907_181423/static/bootstrap/css/colorpicker.css\r\na walden_12_20180907_181423/static/bootstrap/css/bootstrap-timepicker.css\r\na walden_12_20180907_181423/static/bootstrap/css/img\r\na walden_12_20180907_181423/static/bootstrap/css/ace.min.css\r\na walden_12_20180907_181423/static/bootstrap/css/jquery.gritter.css\r\na walden_12_20180907_181423/static/bootstrap/css/prettify.css\r\na walden_12_20180907_181423/static/bootstrap/css/ace-skins.min.css\r\na walden_12_20180907_181423/static/bootstrap/css/select2.css\r\na walden_12_20180907_181423/static/bootstrap/css/ui.jqgrid.css\r\na walden_12_20180907_181423/static/bootstrap/css/font-awesome.min.css\r\na walden_12_20180907_181423/static/bootstrap/css/jquery-ui-1.10.3.full.min.css\r\na walden_12_20180907_181423/static/bootstrap/css/base.css\r\na walden_12_20180907_181423/static/bootstrap/css/select2.png\r\na walden_12_20180907_181423/static/bootstrap/css/ace-ie.min.css\r\na walden_12_20180907_181423/static/bootstrap/css/img/hue.png\r\na walden_12_20180907_181423/static/bootstrap/css/img/alpha.png\r\na walden_12_20180907_181423/static/bootstrap/css/img/saturation.png\r\na walden_12_20180907_181423/static/bootstrap/css/images/border.png\r\na walden_12_20180907_181423/static/bootstrap/css/images/loading.gif\r\na walden_12_20180907_181423/static/bootstrap/css/images/overlay.png\r\na walden_12_20180907_181423/static/bootstrap/css/images/controls.png\r\na walden_12_20180907_181423/static/bootstrap/css/images/loading_background.png\r\na walden_12_20180907_181423/static/screenshots/preview.png\r\na walden_12_20180907_181423/static/screenshots/editor.png\r\na walden_12_20180907_181423/static/screenshots/walden.gif','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(939,'prev_release',4,1,12,0,'172.16.0.231','work','mkdir -p /home/work/wushuiyong/releases','','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(940,'prev_release',4,1,12,0,'172.16.0.231','work','cd /home/work/wushuiyong/releases && tar zxf walden_12_20180907_181423.tgz','','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(941,'release',5,1,12,0,'172.16.0.231','work','cd /home/work/wushuiyong/releases && ln -sfn /home/work/wushuiyong/releases/walden_12_20180907_181423 /home/work/wushuiyong/releases/current-tmp-12','','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(942,'release',5,1,12,0,'172.16.0.231','work','cd /home/work/wushuiyong/releases && mv -fT /home/work/wushuiyong/releases/current-tmp-12 /home/work/wushuiyong/webroot','','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(943,'post_release',6,1,12,0,'172.16.0.231','work','cd /home/work/wushuiyong/webroot && sudo service nginx restart','nginx: the configuration file /etc/nginx/nginx.conf syntax is ok\r\nnginx: configuration file /etc/nginx/nginx.conf test is successful\r\nStopping nginx: [60G[[0;32m  OK  [0;39m]\r\r\nStarting nginx: [60G[[0;32m  OK  [0;39m]','','2018-09-07 18:13:40','2018-09-07 18:13:40'),(944,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-08 22:51:50','2018-09-08 22:51:50'),(945,'deploy',2,1,12,1,'127.0.0.1','wushuiyong','pwd && git pull','','e.result','2018-09-08 22:51:50','2018-09-08 22:51:50'),(946,'prev_deploy',1,1,12,0,'127.0.0.1','wushuiyong','whoami','wushuiyong','','2018-09-08 23:42:22','2018-09-08 23:42:22'),(947,'deploy',2,1,12,0,'127.0.0.1','wushuiyong','cd /tmp/walle/codebase/walden && pwd && git pull','/tmp/walle/codebase/walden\r\nAlready up to date.','','2018-09-08 23:42:22','2018-09-08 23:42:22'),(948,'deploy',2,1,12,0,'127.0.0.1','wushuiyong','cd /tmp/walle/codebase/ && cp -rf /tmp/walle/codebase/walden walden_12_20180908_234233','','','2018-09-08 23:42:22','2018-09-08 23:42:22'),(949,'deploy',2,1,12,0,'127.0.0.1','wushuiyong','cd /tmp/walle/codebase/walden_12_20180908_234233 && git reset -q --hard 3041a953c288429f1cc69453c9bb908c2dec7d99','','','2018-09-08 23:42:22','2018-09-08 23:42:22'),(950,'post_deploy',3,1,12,0,'127.0.0.1','wushuiyong','cd /tmp/walle/codebase/walden_12_20180908_234233 && echo post_deploy; pwd','post_deploy\r\n/tmp/walle/codebase/walden_12_20180908_234233','','2018-09-08 23:42:22','2018-09-08 23:42:22'),(951,'post_deploy',3,1,12,0,'127.0.0.1','wushuiyong','cd /tmp/walle/codebase/ && tar zcvf walden_12_20180908_234233.tgz walden_12_20180908_234233','a walden_12_20180908_234233\r\na walden_12_20180908_234233/Document.php\r\na walden_12_20180908_234233/favicon.ico\r\na walden_12_20180908_234233/index.php\r\na walden_12_20180908_234233/CHANGELOG.md\r\na walden_12_20180908_234233/Bootstrap.php\r\na walden_12_20180908_234233/Config.php\r\na walden_12_20180908_234233/README.md\r\na walden_12_20180908_234233/.gitignore\r\na walden_12_20180908_234233/static\r\na walden_12_20180908_234233/Parsedown.php\r\na walden_12_20180908_234233/Command.php\r\na walden_12_20180908_234233/templates\r\na walden_12_20180908_234233/.git\r\na walden_12_20180908_234233/.travis.yml\r\na walden_12_20180908_234233/.htaccess\r\na walden_12_20180908_234233/.git/ORIG_HEAD\r\na walden_12_20180908_234233/.git/config\r\na walden_12_20180908_234233/.git/objects\r\na walden_12_20180908_234233/.git/HEAD\r\na walden_12_20180908_234233/.git/info\r\na walden_12_20180908_234233/.git/logs\r\na walden_12_20180908_234233/.git/description\r\na walden_12_20180908_234233/.git/hooks\r\na walden_12_20180908_234233/.git/refs\r\na walden_12_20180908_234233/.git/index\r\na walden_12_20180908_234233/.git/packed-refs\r\na walden_12_20180908_234233/.git/FETCH_HEAD\r\na walden_12_20180908_234233/.git/refs/heads\r\na walden_12_20180908_234233/.git/refs/remotes\r\na walden_12_20180908_234233/.git/refs/remotes/origin\r\na walden_12_20180908_234233/.git/refs/heads/master\r\na walden_12_20180908_234233/.git/hooks/commit-msg.sample\r\na walden_12_20180908_234233/.git/hooks/pre-rebase.sample\r\na walden_12_20180908_234233/.git/hooks/pre-commit.sample\r\na walden_12_20180908_234233/.git/hooks/applypatch-msg.sample\r\na walden_12_20180908_234233/.git/hooks/pre-receive.sample\r\na walden_12_20180908_234233/.git/hooks/prepare-commit-msg.sample\r\na walden_12_20180908_234233/.git/hooks/post-update.sample\r\na walden_12_20180908_234233/.git/hooks/pre-applypatch.sample\r\na walden_12_20180908_234233/.git/hooks/pre-push.sample\r\na walden_12_20180908_234233/.git/hooks/update.sample\r\na walden_12_20180908_234233/.git/logs/HEAD\r\na walden_12_20180908_234233/.git/logs/refs\r\na walden_12_20180908_234233/.git/logs/refs/heads\r\na walden_12_20180908_234233/.git/logs/refs/remotes\r\na walden_12_20180908_234233/.git/logs/refs/remotes/origin\r\na walden_12_20180908_234233/.git/logs/refs/remotes/origin/HEAD\r\na walden_12_20180908_234233/.git/logs/refs/heads/master\r\na walden_12_20180908_234233/.git/objects/pack\r\na walden_12_20180908_234233/.git/objects/pack/pack-f3effb1b0871952625ad845fd42469be582c4d94.pack\r\na walden_12_20180908_234233/.git/objects/pack/pack-f3effb1b0871952625ad845fd42469be582c4d94.idx\r\na walden_12_20180908_234233/templates/default\r\na walden_12_20180908_234233/templates/default/markdown-detail-view.php\r\na walden_12_20180908_234233/templates/default/markdown-editor-view.php\r\na walden_12_20180908_234233/static/screenshots\r\na walden_12_20180908_234233/static/bootstrap\r\na walden_12_20180908_234233/static/editor\r\na walden_12_20180908_234233/static/editor/jquery.uploadify.js\r\na walden_12_20180908_234233/static/editor/editor.css\r\na walden_12_20180908_234233/static/editor/uploadify.swf\r\na walden_12_20180908_234233/static/editor/uploadify-cancel.png\r\na walden_12_20180908_234233/static/editor/jquery-1.8.2.min.js\r\na walden_12_20180908_234233/static/bootstrap/css\r\na walden_12_20180908_234233/static/bootstrap/images\r\na walden_12_20180908_234233/static/bootstrap/js\r\na walden_12_20180908_234233/static/bootstrap/img\r\na walden_12_20180908_234233/static/bootstrap/font\r\na walden_12_20180908_234233/static/bootstrap/fonts\r\na walden_12_20180908_234233/static/bootstrap/fonts/glyphicons-halflings-regular.woff\r\na walden_12_20180908_234233/static/bootstrap/fonts/glyphicons-halflings-regular.eot\r\na walden_12_20180908_234233/static/bootstrap/fonts/glyphicons-halflings-regular.ttf\r\na walden_12_20180908_234233/static/bootstrap/fonts/glyphicons-halflings-regular.svg\r\na walden_12_20180908_234233/static/bootstrap/fonts/fonts.googleapis.com.css\r\na walden_12_20180908_234233/static/bootstrap/font/fontawesome-webfont.svg\r\na walden_12_20180908_234233/static/bootstrap/font/fontawesome-webfont.ttf\r\na walden_12_20180908_234233/static/bootstrap/font/fontawesome-webfont.woff\r\na walden_12_20180908_234233/static/bootstrap/font/fontawesome-webfont.eot\r\na walden_12_20180908_234233/static/bootstrap/img/clear.png\r\na walden_12_20180908_234233/static/bootstrap/img/loading.gif\r\na walden_12_20180908_234233/static/bootstrap/js/select2.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/ace-elements.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/jquery-ui-1.10.3.full.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/html5shiv.js\r\na walden_12_20180908_234233/static/bootstrap/js/bootbox.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/jquery.autosize.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/date-time\r\na walden_12_20180908_234233/static/bootstrap/js/jquery.validate.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/jquery.colorbox-min.js\r\na walden_12_20180908_234233/static/bootstrap/js/highlight.pack.js\r\na walden_12_20180908_234233/static/bootstrap/js/jquery-2.0.3.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/respond.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/ace.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/additional-methods.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/jquery.hotkeys.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/bootstrap-colorpicker.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/prettify.js\r\na walden_12_20180908_234233/static/bootstrap/js/flot\r\na walden_12_20180908_234233/static/bootstrap/js/jquery.easy-pie-chart.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/jquery.ui.touch-punch.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/chosen.jquery.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/jquery.dataTables.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/bootstrap.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/fullcalendar.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/jquery.maskedinput.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/excanvas.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/jquery.knob.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/spin.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/x-editable\r\na walden_12_20180908_234233/static/bootstrap/js/jquery.inputlimiter.1.3.1.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/jquery.dataTables.bootstrap.js\r\na walden_12_20180908_234233/static/bootstrap/js/fuelux\r\na walden_12_20180908_234233/static/bootstrap/js/dropzone.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/jqGrid\r\na walden_12_20180908_234233/static/bootstrap/js/jquery.gritter.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/jquery-ui-1.10.3.custom.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/ace-extra.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/jquery.nestable.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/jquery.sparkline.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/jquery.slimscroll.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/bootstrap-wysiwyg.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/typeahead-bs2.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/bootstrap-tag.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/jqGrid/jquery.jqGrid.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/jqGrid/i18n\r\na walden_12_20180908_234233/static/bootstrap/js/jqGrid/i18n/grid.locale-en.js\r\na walden_12_20180908_234233/static/bootstrap/js/fuelux/fuelux.wizard.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/fuelux/data\r\na walden_12_20180908_234233/static/bootstrap/js/fuelux/fuelux.tree.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/fuelux/fuelux.spinner.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/fuelux/data/fuelux.tree-sampledata.js\r\na walden_12_20180908_234233/static/bootstrap/js/x-editable/bootstrap-editable.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/x-editable/ace-editable.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/flot/jquery.flot.pie.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/flot/jquery.flot.resize.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/flot/jquery.flot.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/date-time/bootstrap-datepicker.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/date-time/bootstrap-timepicker.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/date-time/daterangepicker.min.js\r\na walden_12_20180908_234233/static/bootstrap/js/date-time/moment.min.js\r\na walden_12_20180908_234233/static/bootstrap/images/walden.jpg\r\na walden_12_20180908_234233/static/bootstrap/images/bs-docs-masthead-pattern.png\r\na walden_12_20180908_234233/static/bootstrap/css/font-awesome-ie7.min.css\r\na walden_12_20180908_234233/static/bootstrap/css/select2x2.png\r\na walden_12_20180908_234233/static/bootstrap/css/bootstrap.min.css\r\na walden_12_20180908_234233/static/bootstrap/css/chosen.css\r\na walden_12_20180908_234233/static/bootstrap/css/jquery-ui-1.10.3.custom.min.css\r\na walden_12_20180908_234233/static/bootstrap/css/bootstrap-editable.css\r\na walden_12_20180908_234233/static/bootstrap/css/github.css\r\na walden_12_20180908_234233/static/bootstrap/css/chosen-sprite@2x.png\r\na walden_12_20180908_234233/static/bootstrap/css/daterangepicker.css\r\na walden_12_20180908_234233/static/bootstrap/css/colorbox.css\r\na walden_12_20180908_234233/static/bootstrap/css/images\r\na walden_12_20180908_234233/static/bootstrap/css/ace-rtl.min.css\r\na walden_12_20180908_234233/static/bootstrap/css/datepicker.css\r\na walden_12_20180908_234233/static/bootstrap/css/fullcalendar.css\r\na walden_12_20180908_234233/static/bootstrap/css/select2-spinner.gif\r\na walden_12_20180908_234233/static/bootstrap/css/dropzone.css\r\na walden_12_20180908_234233/static/bootstrap/css/chosen-sprite.png\r\na walden_12_20180908_234233/static/bootstrap/css/colorpicker.css\r\na walden_12_20180908_234233/static/bootstrap/css/bootstrap-timepicker.css\r\na walden_12_20180908_234233/static/bootstrap/css/img\r\na walden_12_20180908_234233/static/bootstrap/css/ace.min.css\r\na walden_12_20180908_234233/static/bootstrap/css/jquery.gritter.css\r\na walden_12_20180908_234233/static/bootstrap/css/prettify.css\r\na walden_12_20180908_234233/static/bootstrap/css/ace-skins.min.css\r\na walden_12_20180908_234233/static/bootstrap/css/select2.css\r\na walden_12_20180908_234233/static/bootstrap/css/ui.jqgrid.css\r\na walden_12_20180908_234233/static/bootstrap/css/font-awesome.min.css\r\na walden_12_20180908_234233/static/bootstrap/css/jquery-ui-1.10.3.full.min.css\r\na walden_12_20180908_234233/static/bootstrap/css/base.css\r\na walden_12_20180908_234233/static/bootstrap/css/select2.png\r\na walden_12_20180908_234233/static/bootstrap/css/ace-ie.min.css\r\na walden_12_20180908_234233/static/bootstrap/css/img/hue.png\r\na walden_12_20180908_234233/static/bootstrap/css/img/alpha.png\r\na walden_12_20180908_234233/static/bootstrap/css/img/saturation.png\r\na walden_12_20180908_234233/static/bootstrap/css/images/border.png\r\na walden_12_20180908_234233/static/bootstrap/css/images/loading.gif\r\na walden_12_20180908_234233/static/bootstrap/css/images/overlay.png\r\na walden_12_20180908_234233/static/bootstrap/css/images/controls.png\r\na walden_12_20180908_234233/static/bootstrap/css/images/loading_background.png\r\na walden_12_20180908_234233/static/screenshots/preview.png\r\na walden_12_20180908_234233/static/screenshots/editor.png\r\na walden_12_20180908_234233/static/screenshots/walden.gif','','2018-09-08 23:42:22','2018-09-08 23:42:22'),(952,'prev_release',4,1,12,0,'172.16.0.231','work','mkdir -p /home/work/wushuiyong/releases','','','2018-09-08 23:42:22','2018-09-08 23:42:22'),(953,'prev_release',4,1,12,0,'172.16.0.231','work','cd /home/work/wushuiyong/releases && tar zxf walden_12_20180908_234233.tgz','','','2018-09-08 23:42:22','2018-09-08 23:42:22'),(954,'release',5,1,12,0,'172.16.0.231','work','cd /home/work/wushuiyong/releases && ln -sfn /home/work/wushuiyong/releases/walden_12_20180908_234233 /home/work/wushuiyong/releases/current-tmp-12','','','2018-09-08 23:42:22','2018-09-08 23:42:22'),(955,'release',5,1,12,0,'172.16.0.231','work','cd /home/work/wushuiyong/releases && mv -fT /home/work/wushuiyong/releases/current-tmp-12 /home/work/wushuiyong/webroot','','','2018-09-08 23:42:22','2018-09-08 23:42:22'),(956,'post_release',6,1,12,0,'172.16.0.231','work','cd /home/work/wushuiyong/webroot && sudo service nginx restart','nginx: the configuration file /etc/nginx/nginx.conf syntax is ok\r\nnginx: configuration file /etc/nginx/nginx.conf test is successful\r\nStopping nginx: [60G[[0;32m  OK  [0;39m]\r\r\nStarting nginx: [60G[[0;32m  OK  [0;39m]','','2018-09-08 23:42:22','2018-09-08 23:42:22');
/*!40000 ALTER TABLE `task_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `test_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `gmt_created` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_testid` (`test_id`),
  KEY `idx_groupid` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户昵称',
  `is_email_verified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否邮箱认证',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `password_hash` varchar(50) DEFAULT NULL COMMENT 'hash',
  `avatar` varchar(100) DEFAULT 'default.jpg' COMMENT '头像图片地址',
  `role_id` int(6) NOT NULL COMMENT '角色id',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态: 0新建，1正常，2冻结',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'wushuiyong',1,'wushuiyong@renrenche.com','','','default.jpg',1,1,'2017-03-17 09:03:09','2017-03-17 09:03:09'),(2,'wushuiyong@local.com',0,'wushuiyong@walle-web.io','pbkdf2:sha1:1000$59T3110Q$7703684fd0bb722985b037703329c82891acd84b','',NULL,2,1,'2017-03-20 19:05:44','2017-06-19 08:18:47'),(3,'wushuiyong@walle-web.ios',0,'wushuiyong@walle-web.ios','pbkdf2:sha1:1000$KSjsIBCf$762bf8c30adc6eef288df31547dbd80fa8b81c93','',NULL,1,1,'2017-04-13 15:03:57','2017-06-13 23:53:46'),(7,'x吴水永的新组x',0,'demo02@walle.com','pbkdf2:sha1:1000$3jENzbZ3$345e44980dcf44ffab60f16b35a913dca93677ab','',NULL,1,1,'2017-05-11 22:33:35','2017-06-12 23:23:30'),(8,'中文啦',0,'demo03@walle.com','pbkdf2:sha1:1000$DButSYQG$d3fe6a80e23461e565ca1a8b8f9ee8302e7a29a7','',NULL,2,1,'2017-05-11 23:39:11','2017-06-12 23:23:30'),(9,'中文啦',0,'demo06@walle.com','pbkdf2:sha1:1000$AjTbiwj6$991080c601009c612ae81647c797334cffdf4aa6',NULL,NULL,2,1,'2017-05-13 22:16:14','2017-06-12 23:23:30'),(10,'x吴水永的新组x',0,'demo07@walle.com','pbkdf2:sha1:1000$V6VewIqF$7eec3681b0994abe8f1be769319a6a276f4658fc',NULL,NULL,1,1,'2017-05-13 23:12:44','2017-06-12 23:23:30');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `user_id` int(10) DEFAULT '0' COMMENT '用户id',
  `group_id` int(10) DEFAULT '0' COMMENT '用户组id',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='用户组关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (1,13,1,'2017-05-08 19:56:38','2017-05-08 19:56:38'),(2,1,1,'2017-05-10 20:53:42','2017-05-10 20:53:42'),(45,8,11,'2017-05-11 22:44:46','2017-05-11 22:44:46'),(46,1,11,'2017-05-11 22:44:46','2017-05-11 22:44:46'),(47,2,11,'2017-05-11 22:44:46','2017-05-11 22:44:46'),(52,1,3,'2017-05-11 23:29:43','2017-05-11 23:29:43'),(54,15,3,'2017-05-11 23:32:07','2017-05-11 23:32:07'),(56,13,3,'2017-05-11 23:34:45','2017-05-11 23:34:45'),(57,1,13,'2017-05-14 23:13:57','2017-05-14 23:13:57'),(58,13,13,'2017-05-14 23:13:57','2017-05-14 23:13:57'),(59,18,13,'2017-05-14 23:13:57','2017-05-14 23:13:57'),(60,1,14,'2017-05-23 17:16:51','2017-05-23 17:16:51'),(61,1,15,'2017-05-23 17:23:40','2017-05-23 17:23:40'),(62,1,16,'2017-05-23 17:25:30','2017-05-23 17:25:30'),(63,1,17,'2017-05-23 17:26:10','2017-05-23 17:26:10'),(64,1,18,'2017-05-23 17:27:33','2017-05-23 17:27:33'),(65,1,19,'2017-05-23 17:28:56','2017-05-23 17:28:56'),(66,1,20,'2017-05-23 17:30:01','2017-05-23 17:30:01'),(67,1,21,'2017-05-23 17:30:23','2017-05-23 17:30:23'),(68,1,22,'2017-05-23 17:31:10','2017-05-23 17:31:10'),(69,1,23,'2017-05-23 17:31:44','2017-05-23 17:31:44'),(70,1,24,'2017-05-23 17:31:44','2017-05-23 17:31:44'),(71,1,25,'2017-05-23 17:31:44','2017-05-23 17:31:44'),(72,1,26,'2017-05-23 17:44:19','2017-05-23 17:44:19'),(73,1,27,'2017-05-23 17:44:53','2017-05-23 17:44:53'),(74,1,28,'2017-05-23 17:47:37','2017-05-23 17:47:37'),(75,1,29,'2017-05-23 17:48:33','2017-05-23 17:48:33'),(76,3,29,'2017-05-23 17:48:33','2017-05-23 17:48:33'),(77,2,29,'2017-05-23 17:48:33','2017-05-23 17:48:33'),(78,1,30,'2017-05-23 17:48:33','2017-05-23 17:48:33'),(79,3,30,'2017-05-23 17:48:33','2017-05-23 17:48:33'),(80,2,30,'2017-05-23 17:48:33','2017-05-23 17:48:33'),(82,1,31,'2017-05-23 17:54:24','2017-05-23 17:54:24'),(83,3,31,'2017-05-23 17:54:24','2017-05-23 17:54:24'),(84,2,31,'2017-05-23 17:54:24','2017-05-23 17:54:24'),(86,1,32,'2017-05-23 18:02:48','2017-05-23 18:02:48'),(87,1,33,'2017-05-23 18:06:20','2017-05-23 18:06:20'),(88,1,34,'2017-05-23 18:37:56','2017-05-23 18:37:56'),(89,3,34,'2017-05-23 18:37:56','2017-05-23 18:37:56');
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-09  0:08:20
