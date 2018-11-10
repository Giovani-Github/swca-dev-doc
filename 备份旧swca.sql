/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 8.0.12 : Database - swca
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`swca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `swca`;

/*Table structure for table `tb_order` */

DROP TABLE IF EXISTS `tb_order`;

CREATE TABLE `tb_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `accept_id` int(11) DEFAULT NULL COMMENT '接受该订单的人---用户的id',
  `name` varchar(40) DEFAULT NULL COMMENT '填写报修单时输入的姓名',
  `addres` varchar(100) DEFAULT NULL COMMENT '宿舍号，维修地址',
  `phone_num` varchar(100) DEFAULT NULL COMMENT '维修联系方式',
  `remark` varchar(600) DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '状态：0刚提交,1已接单正在维修，2维修完成',
  `submit_time` timestamp NULL DEFAULT NULL COMMENT '订单提交的时间',
  `accept_time` timestamp NULL DEFAULT NULL COMMENT '订单被维修人员接受的时间',
  `success_time` timestamp NULL DEFAULT NULL COMMENT '订单维修完成的时间',
  `gender` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_Reference_3` (`user_id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='报修订单表';

/*Data for the table `tb_order` */

insert  into `tb_order`(`order_id`,`user_id`,`accept_id`,`name`,`addres`,`phone_num`,`remark`,`state`,`submit_time`,`accept_time`,`success_time`,`gender`) values 
(7,2,2,'李庆旺','这里','15219331778','坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了',2,'2018-11-03 17:12:41','2018-11-04 10:44:45','2018-11-04 10:47:46','female'),
(8,3,4,'测试1','惠州','13560572491','想你了',2,'2018-11-04 10:57:13','2018-11-04 10:57:49','2018-11-04 10:58:55','female'),
(9,2,2,'测试2','脑子','13560572491','撒旦飞洒',2,'2018-11-04 11:08:02','2018-11-04 11:08:17',NULL,'male'),
(10,2,2,'测试3','在这','13560572491','你好啊',2,'2018-11-04 15:35:01','2018-11-04 15:42:49',NULL,'female'),
(11,2,NULL,'测试4','这里','13560572491','阿斯蒂芬',2,'2018-11-04 15:52:53',NULL,NULL,'male'),
(12,4,NULL,'测试5','这','13560572491','撒旦飞洒 撒',3,'2018-11-04 15:59:13',NULL,NULL,'male'),
(13,4,4,'测试5','这','13560572491','发斯蒂芬士大夫',3,'2018-11-04 16:18:43','2018-11-04 16:18:54',NULL,'male'),
(14,4,4,'测试6','地方士大夫沙发','13560572491','大声道发',2,'2018-11-04 16:20:53','2018-11-04 16:22:31','2018-11-04 16:22:33','female'),
(15,4,NULL,'张三','这','13560572491','沙发上',3,'2018-11-04 17:18:45',NULL,NULL,'male'),
(16,4,4,'测试7','这','13560572491','大厦法定',2,'2018-11-04 17:24:32','2018-11-04 17:24:41','2018-11-04 17:24:44','male'),
(17,4,4,'测试8','这路','13560572491','地方撒上',2,'2018-11-05 21:12:28','2018-11-05 21:12:34','2018-11-05 21:14:10','female'),
(18,4,4,'测试9','这里','13560572491','士大夫撒反对法撒旦法',2,'2018-11-05 21:16:34','2018-11-05 21:16:38','2018-11-05 21:17:11','female'),
(19,4,4,'测试10','这','13560572491','是飞洒发说说的方式阿道夫带上',2,'2018-11-05 21:22:28','2018-11-05 21:22:34','2018-11-05 21:25:33','male'),
(20,4,4,'测试111111111111111111111111111111111','1发送发送第三方','13560572491','士大夫撒旦',2,'2018-11-05 21:29:15','2018-11-05 21:29:20','2018-11-05 21:30:23','female'),
(21,4,4,'测试12','士大夫撒旦','13560572491','撒旦法所发生的撒旦法的说法是范德萨范德萨发生的sad',2,'2018-11-08 11:23:12','2018-11-08 11:25:32','2018-11-08 11:26:00','female'),
(22,4,2,'测试13','是飞洒发沙发斯蒂芬是安抚','13560572491','防守打法达到顶峰撒旦法撒旦法',1,'2018-11-08 11:26:19','2018-11-08 11:26:56',NULL,'female'),
(23,2,2,'短信测试','这里','15219331778','撒旦法法sfasd',1,'2018-11-08 20:22:23','2018-11-08 20:23:50',NULL,'female'),
(24,2,2,'短信测试2','这里','15219331778','发送到发送到阿斯蒂芬阿斯蒂芬s',1,'2018-11-08 20:22:35','2018-11-08 20:22:40',NULL,'female'),
(25,2,2,'短信测试3','这里','15219331778','是打发斯蒂芬撒旦法',1,'2018-11-08 20:27:34','2018-11-08 20:27:46',NULL,'male'),
(26,2,2,'短信测试4','这','15219331778','发送到发送到防守打法撒旦法',1,'2018-11-08 20:29:46','2018-11-08 20:30:38',NULL,'female'),
(27,2,2,'短信测试5','这阿斯蒂芬','15016305930','撒旦法sad',1,'2018-11-08 20:30:29','2018-11-08 20:30:56',NULL,'female'),
(28,2,NULL,'短信测试6','这里','15219331778','打算',0,'2018-11-08 20:51:35',NULL,NULL,'female'),
(29,2,NULL,'测试6','这里大声道','15219331778','撒旦法撒的发生的',0,'2018-11-08 20:52:17',NULL,NULL,'female'),
(30,2,NULL,'短信测试8','A2-203','13560572491','坏了',0,'2018-11-08 20:58:40',NULL,NULL,'female'),
(31,2,NULL,'短信测试9','这里','13560572491','沙发上法',0,'2018-11-08 20:59:52',NULL,NULL,'female'),
(32,2,NULL,'测试9','这里','15219331778','撒旦法安抚是',0,'2018-11-08 21:00:48',NULL,NULL,'male'),
(33,2,2,'测试10','惠州','15219331778','阿斯蒂芬撒旦法阿萨德',1,'2018-11-08 21:01:56','2018-11-08 21:12:22',NULL,'male'),
(34,2,2,'测试10','实训楼','18814055503','坏了',1,'2018-11-08 21:07:11','2018-11-08 21:11:54',NULL,'male'),
(35,2,NULL,'测试11','这','15219331778','富士达法',0,'2018-11-08 21:15:25',NULL,NULL,'female'),
(36,2,NULL,'测试12','对对对','15219331778','撒旦法',0,'2018-11-08 21:28:31',NULL,NULL,'female');

/*Table structure for table `tb_role` */

DROP TABLE IF EXISTS `tb_role`;

CREATE TABLE `tb_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '角色说明',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表，每个角色拥有不同的权限';

/*Data for the table `tb_role` */

insert  into `tb_role`(`role_id`,`role_name`,`remark`) values 
(1,'ROLE_USER','用户'),
(2,'ROLE_ADMIN','管理员'),
(3,'ROLE_ROOT','超级管理员');

/*Table structure for table `tb_role_user` */

DROP TABLE IF EXISTS `tb_role_user`;

CREATE TABLE `tb_role_user` (
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  KEY `FK_Reference_1` (`user_id`),
  KEY `FK_Reference_2` (`role_id`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表和用户表的中间表，让两个表建立关系关联起来';

/*Data for the table `tb_role_user` */

insert  into `tb_role_user`(`role_id`,`user_id`) values 
(1,4),
(2,4),
(1,5),
(1,6),
(1,2),
(2,2),
(3,2),
(1,3),
(1,7),
(1,8),
(2,8);

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL COMMENT '不能重复,可为中文',
  `eamil` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `password` varchar(64) DEFAULT NULL COMMENT 'shiro MD5密码32位',
  `stu_num` varchar(10) DEFAULT NULL COMMENT '通过学号可以确定该用户是否是汕职院学生',
  `phone_num` varchar(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户基本信息表\r\n';

/*Data for the table `tb_user` */

insert  into `tb_user`(`user_id`,`user_name`,`eamil`,`password`,`stu_num`,`phone_num`,`gender`) values 
(2,'giovani',NULL,'$2a$10$amd0LsLhHuJGmSkMRr0EjecWeZWg62a2sI1Ub6D7TuKQcXpTnE0qK',NULL,'15219331778','female'),
(3,'kingli',NULL,'$2a$10$xnQ02D32nBA.hGEMyc0DTe3V1f0VD8M3mxEtkAEY4DCKTfU5z1h5u',NULL,'15767131552','female'),
(4,'一欣',NULL,'$2a$10$5T1EVm1XA7YNsWRBDmRX1.kbSK3XXzD3hQmBs5wCuhQStHFgLlWdi',NULL,'13560572491','male'),
(5,'李',NULL,'$2a$10$nIfiHpMz2DKwjAgt7x9p4utWJi1QweZr.FVeH5Alz3er22dpEediK',NULL,'15819072869','male'),
(6,'新',NULL,'$2a$10$7aasIXO7rVTt40NC/nhInuqYZyX8hC1UwTTmTDzpIlK0CCi1aS9UC',NULL,'13437521322','female'),
(7,'ggggg',NULL,'$2a$10$siYMKZrYnW/C0fsFgwQq6O74zE2GxBIq51PIX4sxNkxc9TSpJPcHi',NULL,'15014356774',NULL),
(8,'古思凯',NULL,'$2a$10$SzaNojt8Yej8FvQW4Qui3O6DIESLTABRIVt4cidFhMfZTY.49CDX.',NULL,'18814055503',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
