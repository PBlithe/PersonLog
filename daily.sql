# Host: 127.0.0.1  (Version 5.7.20)
# Date: 2019-06-05 09:16:30
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "response"
#

CREATE TABLE `response` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `zhudong_id` int(11) DEFAULT NULL,
  `beidong_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "response"
#

INSERT INTO `response` VALUES (1,1,2),(2,3,3),(3,2,2);

#
# Structure for table "rizhi"
#

CREATE TABLE `rizhi` (
  `daily_id` int(11) NOT NULL AUTO_INCREMENT,
  `daily_author` varchar(11) DEFAULT NULL,
  `daily_details` varchar(255) DEFAULT NULL,
  `daily_createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`daily_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "rizhi"
#

INSERT INTO `rizhi` VALUES (1,'1','第一条测试内容',NULL),(2,'1','第二条测试内容',NULL),(3,'用户1号','123','2019-06-03 20:27:11'),(6,'用户1号','324','2019-06-03 20:57:20'),(7,'用户1号','345','2019-06-03 20:59:02'),(8,'用户1号','345','2019-06-03 21:07:35'),(9,'用户1号','wer','2019-06-04 08:42:45'),(10,'用户1号','rt','2019-06-04 08:44:45'),(11,'用户1号','sety','2019-06-04 08:49:34'),(12,'用户1号','sdgf','2019-06-04 09:00:28'),(14,'用户1号','aaaaaaa','2019-06-04 11:38:10'),(15,'用户1号','qqqqq','2019-06-04 11:43:58');

#
# Structure for table "user"
#

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `user_code` varchar(255) DEFAULT NULL,
  `user_pswd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'用户1号','001','123'),(2,'用户2号','002','123'),(3,'用户3号','003','123'),(4,'用户4号','004','123');
