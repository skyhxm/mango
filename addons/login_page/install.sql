CREATE TABLE IF NOT EXISTS `__PREFIX__page_login` (
  `id` int(10) NOT NULL,
  `title` varchar(20) NOT NULL COMMENT '名称',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 {radio} (0:禁用,1:启用)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录页面';
