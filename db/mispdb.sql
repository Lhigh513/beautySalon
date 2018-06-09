DROP TABLE IF EXISTS `blog`;

LOCK TABLES `blog` WRITE;
INSERT INTO `blog` VALUES (1,'标题1','通知1详细内容'),(2,'标题2','通知2详细内容');
UNLOCK TABLES;


DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


LOCK TABLES `role` WRITE;
INSERT INTO `role` VALUES (1,'管理员'),(2,'收银员');
UNLOCK TABLES;


DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId_idx` (`roleId`),
  CONSTRAINT `roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES (1,'admin','admin',1),(2,'user','user',2);
UNLOCK TABLES;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL auto_increment,
  `cid` varchar(10) NOT null,
  `name` varchar(200) NOT NULL,
  `gender` varchar(2) NOT null,
  `phone` varchar(20) NOT NULL,

  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `customer` VALUES ('1','0100438944','李晓曦', '女','13945837175');
INSERT INTO `customer` VALUES ('2','2319586790','梁纾', '女','13857395871');
INSERT INTO `customer` VALUES ('3','4420567831','赵颂伶', '女','13947382645');
INSERT INTO `customer` VALUES ('4','1345334970','郑泽凯', '男','13750798236');
INSERT INTO `customer` VALUES ('5','5443875420','陈炳文', '男','13539687392');


CREATE TABLE `customerdemo` (
  `cid`  I (11) NOT null,
  `name` varchar(200) NOT NULL,
  `gender` varchar(2) NOT null,
  `phone` varchar(20) NOT NULL,
  `vipId` INT (2) NOT NULL
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table customer2(
     `id` INT (11) not null auto_increment,
     `cid` VARCHAR (20) not null,
     `name` varchar(20) not null,
     `gender` varchar(2) not null,
    `phone`varchar(20) not null,
    `vip` int(2) not null,
     primary key(`id`))ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `customer2` VALUES ('1','0100438944','李晓曦', '女','13945837175',0);
INSERT INTO `customer2` VALUES ('2','2319586790','梁纾', '女','13857395871',0);
INSERT INTO `customer2` VALUES ('3','4420567831','赵颂伶', '女','13947382645',0);
INSERT INTO `customer2` VALUES ('4','1345334970','郑泽凯', '男','13750798236',0);
INSERT INTO `customer2` VALUES ('5','5443875420','陈炳文', '男','13539687392',0);


CREATE TABLE `vip` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(10) NOT NULL,
  `gender` varchar(2) NOT null,
  `phone` varchar(20) NOT NULL,
  `name2` varchar(10) ,
  `phone2` varchar(20) ,
  `regdate` varchar (20) NOT NULL,
  `level` int(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `vip` VALUES ('1','王甄','女','1394566717',NULL,NULL ,'2016-02-29','1');
INSERT INTO `vip` VALUES ('2','刘思钰','女','1297395321',NULL,NULL ,'2016-07-30','1');
INSERT INTO `vip` VALUES ('3','赵卓娜', '女','13547382645',NULL,NULL ,'2017-01-14','2');
INSERT INTO `vip` VALUES ('4','翁瑜','女','13929998236',NULL,NULL ,'2015-08-05','3');





DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `percentage` double(10,5) NOT NULL,
   `start` time NOT NULL,
   `last` time NOT NULL,
   `price` double(10,2) NOT NULL,
   `maxcap` int(3) DEFAULT NULL,
   `rId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
   KEY `rId_idx` (`rId`),
  CONSTRAINT `rId` FOREIGN KEY (`rId`) REFERENCES `role` (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


LOCK TABLES `subject` WRITE;
INSERT INTO `subject` VALUES (1,'面部护理','0.15','08:30:00','16:30:00','2000','10','1'),(2,'补水护理',
'0.2','08:30:00','16:30:00','1500','10','1');
UNLOCK TABLES;



DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


LOCK TABLES `category` WRITE;
INSERT INTO `category` VALUES (1,'补水'),(2,'面部护理');
UNLOCK TABLES;


DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qty` int(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL ,
  `categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryId_idx` (`categoryId`),
  CONSTRAINT `categoryId` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


LOCK TABLES `product` WRITE;
INSERT INTO `product` VALUES (1,'补水产品',200,155,1),(2,'祛斑产品',400,266,2);
UNLOCK TABLES;

CREATE table `employee`(
`id` INT (20) NOT null,
`name` VARCHAR (45) NOT null,
`password` VARCHAR (20) NOT NULL ,
`roleName` VARCHAR (20) NOT NULL ,
`roleId` INT (20) NOT NULL ,
PRIMARY KEY (`id`)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;
KEY `roleId_idx` (`roleId`),
  CONSTRAINT `roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`);


alter table `employee`add constraint fk_reference foreign key (`roleId`) references `role`(`id`);

CREATE TABLE `order`(
`id` INT (50) NOT NULL ,
`date` VARCHAR (20) NOT NULL ,
`categoryId` INT (20) NOT NULL ,
`employeeId` INT (20) NOT NULL ,
`productId` INT (20) NOT NULL ,
`status` INT (20) NOT NULL ,
PRIMARY KEY (`id`)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8;
ALTER TABLE `order` ADD CONSTRAINT fk_reference1 FOREIGN KEY (`categoryId`) REFERENCES `category`(`id`);
ALTER TABLE `order` ADD CONSTRAINT fk_reference2 FOREIGN KEY (`employeeId`) REFERENCES `employee`(`id`);
ALTER TABLE `order` ADD CONSTRAINT fk_refenrece3 FOREIGN KEY (`productId`) REFERENCES `product`(`id`);


CREATE TABLE `tempTotalMoney`(
`id` INT (50) NOT NULL ,
`money` INT (50) NOT NULL ,
PRIMARY KEY (`id`)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8;


CREATE TABLE `vipOrder`(
`orderId` INT (50) NOT NULL ,
`vipId` INT (50) NOT NULL ,
`time` VARCHAR (30) NOT NULL ,
`name` VARCHAR (30) NOT NULL ,
`phone` INT (100) NOT NULL ,
`money` INT (100) NOT NULL ,
PRIMARY KEY (`orderId`)
)ENGINE=InnoDB  DEFAULT CHARSET=utf8;