CREATE TABLE IF NOT EXISTS `__PREFIX__text_addondownload` (
  `id` int(10) NOT NULL,
  `content` longtext NOT NULL,
  `os` set('windows','linux','mac','ubuntu') DEFAULT '' COMMENT '操作系统',
  `version` varchar(255) DEFAULT '' COMMENT '最新版本',
  `filesize` varchar(255) DEFAULT '' COMMENT '文件大小',
  `language` set('zh-cn','en') DEFAULT '' COMMENT '语言',
  `downloadurl` varchar(1500) DEFAULT '' COMMENT '下载地址',
  `screenshots` varchar(1500) DEFAULT '' COMMENT '预览截图',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '价格',
  `downloads` varchar(10) DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='下载';
