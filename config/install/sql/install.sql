/*
Navicat MySQL Data Transfer

Source Server         : mango
Source Server Version : 80020
Source Host           : 127.0.0.1:3306
Source Database       : mango

Target Server Type    : MYSQL
Target Server Version : 80020
File Encoding         : 65001

Date: 2021-05-09 16:18:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for m_mall_cate
-- ----------------------------
DROP TABLE IF EXISTS `m_mall_cate`;
CREATE TABLE `m_mall_cate` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '分类名',
  `image` varchar(500) DEFAULT NULL COMMENT '分类图片',
  `sort` int DEFAULT '0' COMMENT '排序',
  `status` tinyint unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `delete_time` int DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品分类';

-- ----------------------------
-- Records of m_mall_cate
-- ----------------------------
INSERT INTO `m_mall_cate` VALUES ('9', '手机', 'http://admin.host/upload/20200514/98fc09b0c4ad4d793a6f04bef79a0edc.jpg', '0', '1', '', '1589440437', '1589440437', null);
INSERT INTO `m_mall_cate` VALUES ('10', '撒地方', 'http://mango.cn/upload/20210409/2d87e02a0ad56c04fafd3de32a53dfa1.png', '0', '1', '', '1617972349', '1617972349', null);
INSERT INTO `m_mall_cate` VALUES ('11', '阿斯蒂芬', 'http://mango.cn/upload/20210409/332dd71a3049b9834ffae81e121b0b74.png', '0', '1', '', '1617973843', '1617973843', null);

-- ----------------------------
-- Table structure for m_mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `m_mall_goods`;
CREATE TABLE `m_mall_goods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int DEFAULT NULL COMMENT '分类ID',
  `title` varchar(20) NOT NULL COMMENT '商品名称',
  `logo` varchar(500) DEFAULT NULL COMMENT '商品logo',
  `images` text COMMENT '商品图片 以 | 做分割符号',
  `describe` text COMMENT '商品描述',
  `market_price` decimal(10,2) DEFAULT '0.00' COMMENT '市场价',
  `discount_price` decimal(10,2) DEFAULT '0.00' COMMENT '折扣价',
  `sales` int DEFAULT '0' COMMENT '销量',
  `virtual_sales` int DEFAULT '0' COMMENT '虚拟销量',
  `stock` int DEFAULT '0' COMMENT '库存',
  `total_stock` int DEFAULT '0' COMMENT '总库存',
  `sort` int DEFAULT '0' COMMENT '排序',
  `status` tinyint unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `delete_time` int DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品列表';

-- ----------------------------
-- Records of m_mall_goods
-- ----------------------------
INSERT INTO `m_mall_goods` VALUES ('8', '10', '落地-风扇', 'http://admin.host/upload/20200514/a0f7fe9637abd219f7e93ceb2820df9b.jpg', 'http://admin.host/upload/20200514/95496713918290f6315ea3f87efa6bf2.jpg|http://admin.host/upload/20200514/ae29fa9cba4fc02defb7daed41cb2b13.jpg|http://admin.host/upload/20200514/f0a104d88ec7dc6fb42d2f87cbc71b76.jpg|http://admin.host/upload/20200514/3b88be4b1934690e5c1bd6b54b9ab5c8.jpg', '<p>76654757</p>\n\n<p><img alt=\"\" src=\"http://admin.host/upload/20200515/198070421110fa01f2c2ac2f52481647.jpg\" style=\"height:689px; width:790px\" /></p>\n\n<p><img alt=\"\" src=\"http://admin.host/upload/20200515/a07a742c15a78781e79f8a3317006c1d.jpg\" style=\"height:877px; width:790px\" /></p>\n', '599.00', '368.00', '0', '594', '0', '0', '675', '1', '', '1589454309', '1589567016', null);
INSERT INTO `m_mall_goods` VALUES ('9', '9', '电脑', 'http://admin.host/upload/20200514/bbf858d469dec2e12a89460110068d3d.jpg', 'http://admin.host/upload/20200514/f0a104d88ec7dc6fb42d2f87cbc71b76.jpg', '<p>477</p>\n', '0.00', '0.00', '0', '0', '115', '320', '0', '1', '', '1589465215', '1617092988', null);

-- ----------------------------
-- Table structure for m_page_login
-- ----------------------------
DROP TABLE IF EXISTS `m_page_login`;
CREATE TABLE `m_page_login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '名称',
  `status` tinyint unsigned DEFAULT '1' COMMENT '状态 {radio} (0:禁用,1:启用)',
  `delete_time` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='登录页面';

-- ----------------------------
-- Records of m_page_login
-- ----------------------------
INSERT INTO `m_page_login` VALUES ('1', '登录页面1', '1', null);
INSERT INTO `m_page_login` VALUES ('2', '登录页面2', '1', null);
INSERT INTO `m_page_login` VALUES ('3', '登录页面3', '0', null);

-- ----------------------------
-- Table structure for m_plugin
-- ----------------------------
DROP TABLE IF EXISTS `m_plugin`;
CREATE TABLE `m_plugin` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标志',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text NOT NULL COMMENT '插件描述',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `version` varchar(16) NOT NULL COMMENT '版本号',
  `createtime` int unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `updatetime` int NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态',
  `install` tinyint NOT NULL DEFAULT '1' COMMENT '是否安装',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of m_plugin
-- ----------------------------

-- ----------------------------
-- Table structure for m_system_admin
-- ----------------------------
DROP TABLE IF EXISTS `m_system_admin`;
CREATE TABLE `m_system_admin` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `auth_ids` varchar(255) DEFAULT NULL COMMENT '角色权限ID',
  `head_img` varchar(255) DEFAULT NULL COMMENT '头像',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(40) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `remark` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint unsigned DEFAULT '0' COMMENT '登录次数',
  `sort` int DEFAULT '0' COMMENT '排序',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用,)',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `delete_time` int DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户表';

-- ----------------------------
-- Records of m_system_admin
-- ----------------------------
INSERT INTO `m_system_admin` VALUES ('1', null, '/static/admin/images/head.jpg', 'admin', 'ed696eb5bba1f7460585cc6975e6cf9bf24903dd', null, '', '61', '0', '1', '1615542339', '1620546712', null);

-- ----------------------------
-- Table structure for m_system_auth
-- ----------------------------
DROP TABLE IF EXISTS `m_system_auth`;
CREATE TABLE `m_system_auth` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '权限名称',
  `sort` int DEFAULT '0' COMMENT '排序',
  `status` tinyint unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `delete_time` int DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统权限表';

-- ----------------------------
-- Records of m_system_auth
-- ----------------------------
INSERT INTO `m_system_auth` VALUES ('1', '管理员', '1', '1', '测试管理员', '1588921753', '1589614331', null);
INSERT INTO `m_system_auth` VALUES ('6', '游客权限', '0', '1', '', '1588227513', '1589591751', '1589591751');
INSERT INTO `m_system_auth` VALUES ('7', '活动管理', '0', '1', 'afd ', '1617091776', '1617091793', '1617091793');

-- ----------------------------
-- Table structure for m_system_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `m_system_auth_node`;
CREATE TABLE `m_system_auth_node` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `auth_id` bigint unsigned DEFAULT NULL COMMENT '角色ID',
  `node_id` bigint DEFAULT NULL COMMENT '节点ID',
  PRIMARY KEY (`id`),
  KEY `index_system_auth_auth` (`auth_id`) USING BTREE,
  KEY `index_system_auth_node` (`node_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色与节点关系表';

-- ----------------------------
-- Records of m_system_auth_node
-- ----------------------------
INSERT INTO `m_system_auth_node` VALUES ('1', '6', '1');
INSERT INTO `m_system_auth_node` VALUES ('2', '6', '2');
INSERT INTO `m_system_auth_node` VALUES ('3', '6', '9');
INSERT INTO `m_system_auth_node` VALUES ('4', '6', '12');
INSERT INTO `m_system_auth_node` VALUES ('5', '6', '18');
INSERT INTO `m_system_auth_node` VALUES ('6', '6', '19');
INSERT INTO `m_system_auth_node` VALUES ('7', '6', '21');
INSERT INTO `m_system_auth_node` VALUES ('8', '6', '22');
INSERT INTO `m_system_auth_node` VALUES ('9', '6', '29');
INSERT INTO `m_system_auth_node` VALUES ('10', '6', '30');
INSERT INTO `m_system_auth_node` VALUES ('11', '6', '38');
INSERT INTO `m_system_auth_node` VALUES ('12', '6', '39');
INSERT INTO `m_system_auth_node` VALUES ('13', '6', '45');
INSERT INTO `m_system_auth_node` VALUES ('14', '6', '46');
INSERT INTO `m_system_auth_node` VALUES ('15', '6', '52');
INSERT INTO `m_system_auth_node` VALUES ('16', '6', '53');

-- ----------------------------
-- Table structure for m_system_config
-- ----------------------------
DROP TABLE IF EXISTS `m_system_config`;
CREATE TABLE `m_system_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `value` text COMMENT '变量值',
  `remark` varchar(100) DEFAULT '' COMMENT '备注信息',
  `sort` int DEFAULT '0',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `group` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统配置表';

-- ----------------------------
-- Records of m_system_config
-- ----------------------------
INSERT INTO `m_system_config` VALUES ('41', 'alisms_access_key_id', 'sms', '填你的', '阿里大于公钥', '0', null, null);
INSERT INTO `m_system_config` VALUES ('42', 'alisms_access_key_secret', 'sms', '填你的', '阿里大鱼私钥', '0', null, null);
INSERT INTO `m_system_config` VALUES ('55', 'upload_type', 'upload', 'local', '当前上传方式 （local,alioss,qnoss,txoss）', '0', null, null);
INSERT INTO `m_system_config` VALUES ('56', 'upload_allow_ext', 'upload', 'doc,gif,ico,icon,jpg,mp3,mp4,p12,pem,png,rar,jpeg', '允许上传的文件类型', '0', null, null);
INSERT INTO `m_system_config` VALUES ('57', 'upload_allow_size', 'upload', '1024000', '允许上传的大小', '0', null, null);
INSERT INTO `m_system_config` VALUES ('58', 'upload_allow_mime', 'upload', 'image/gif,image/jpeg,video/x-msvideo,text/plain,image/png', '允许上传的文件mime', '0', null, null);
INSERT INTO `m_system_config` VALUES ('59', 'upload_allow_type', 'upload', 'local,alioss,qnoss,txcos', '可用的上传文件方式', '0', null, null);
INSERT INTO `m_system_config` VALUES ('60', 'alioss_access_key_id', 'upload', '填你的', '阿里云oss公钥', '0', null, null);
INSERT INTO `m_system_config` VALUES ('61', 'alioss_access_key_secret', 'upload', '填你的', '阿里云oss私钥', '0', null, null);
INSERT INTO `m_system_config` VALUES ('62', 'alioss_endpoint', 'upload', '填你的', '阿里云oss数据中心', '0', null, null);
INSERT INTO `m_system_config` VALUES ('63', 'alioss_bucket', 'upload', '填你的', '阿里云oss空间名称', '0', null, null);
INSERT INTO `m_system_config` VALUES ('64', 'alioss_domain', 'upload', '填你的', '阿里云oss访问域名', '0', null, null);
INSERT INTO `m_system_config` VALUES ('65', 'logo_title', 'site', 'mangoadmin', 'LOGO标题', '0', null, null);
INSERT INTO `m_system_config` VALUES ('66', 'logo_image', 'site', 'http://mango.cn/upload/20210314/204b0f540f11a5c893bef72ec471b1d6.png', 'logo图片', '0', null, null);
INSERT INTO `m_system_config` VALUES ('68', 'site_name', 'site', '芒果后台系统', '站点名称', '0', null, null);
INSERT INTO `m_system_config` VALUES ('69', 'site_ico', 'site', 'http://mango.cn/upload/20210314/266d9bc4d6b893fa5590bbdd772b3ddd.ico', '浏览器图标', '0', null, null);
INSERT INTO `m_system_config` VALUES ('70', 'site_copyright', 'site', '©版权所有 2014-2018 叁贰柒工作室66', '版权信息', '0', null, null);
INSERT INTO `m_system_config` VALUES ('71', 'site_beian', 'site', '粤ICP备16006642号-2', '备案信息', '0', null, null);
INSERT INTO `m_system_config` VALUES ('72', 'site_version', 'site', '2.0.0', '版本信息', '0', null, null);
INSERT INTO `m_system_config` VALUES ('75', 'sms_type', 'sms', 'alisms', '短信类型', '0', null, null);
INSERT INTO `m_system_config` VALUES ('76', 'miniapp_appid', 'wechat', '填你的', '小程序公钥', '0', null, null);
INSERT INTO `m_system_config` VALUES ('77', 'miniapp_appsecret', 'wechat', '填你的', '小程序私钥', '0', null, null);
INSERT INTO `m_system_config` VALUES ('78', 'web_appid', 'wechat', '填你的', '公众号公钥', '0', null, null);
INSERT INTO `m_system_config` VALUES ('79', 'web_appsecret', 'wechat', '填你的', '公众号私钥', '0', null, null);
INSERT INTO `m_system_config` VALUES ('80', 'txcos_secret_id', 'upload', '填你的', '腾讯云cos密钥', '0', null, null);
INSERT INTO `m_system_config` VALUES ('81', 'txcos_secret_key', 'upload', '填你的', '腾讯云cos私钥', '0', null, null);
INSERT INTO `m_system_config` VALUES ('82', 'txcos_region', 'upload', '填你的', '存储桶地域', '0', null, null);
INSERT INTO `m_system_config` VALUES ('83', 'tecos_bucket', 'upload', '填你的', '存储桶名称', '0', null, null);
INSERT INTO `m_system_config` VALUES ('84', 'qnoss_access_key', 'upload', '填你的', '访问密钥', '0', null, null);
INSERT INTO `m_system_config` VALUES ('85', 'qnoss_secret_key', 'upload', '填你的', '安全密钥', '0', null, null);
INSERT INTO `m_system_config` VALUES ('86', 'qnoss_bucket', 'upload', '填你的', '存储空间', '0', null, null);
INSERT INTO `m_system_config` VALUES ('87', 'qnoss_domain', 'upload', '填你的', '访问域名', '0', null, null);

-- ----------------------------
-- Table structure for m_system_log_202103
-- ----------------------------
DROP TABLE IF EXISTS `m_system_log_202103`;
CREATE TABLE `m_system_log_202103` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int unsigned DEFAULT '0' COMMENT '管理员ID',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `method` varchar(50) NOT NULL COMMENT '请求方法',
  `title` varchar(100) DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) DEFAULT '' COMMENT 'User-Agent',
  `create_time` int DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=663 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台操作日志表 - 202103';

-- ----------------------------
-- Records of m_system_log_202103
-- ----------------------------
INSERT INTO `m_system_log_202103` VALUES ('630', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"d75v\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615542359');
INSERT INTO `m_system_log_202103` VALUES ('631', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"ge4u\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615675487');
INSERT INTO `m_system_log_202103` VALUES ('632', '1', '/admin/system.menu/add', 'post', '', '{\"pid\":\"228\",\"title\":\"插件管理\",\"href\":\"\",\"icon\":\"fa fa-android\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"插件管理模块\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615677684');
INSERT INTO `m_system_log_202103` VALUES ('633', '1', '/admin/system.menu/edit?id=254', 'post', '', '{\"id\":\"254\",\"pid\":\"228\",\"title\":\"插件管理\",\"href\":\"system.Addons\\/index\",\"icon\":\"fa fa-android\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"插件管理模块\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615677792');
INSERT INTO `m_system_log_202103` VALUES ('634', '1', '/admin/system.menu/edit?id=254', 'post', '', '{\"id\":\"254\",\"pid\":\"228\",\"title\":\"插件管理\",\"href\":\"system.addons\\/index\",\"icon\":\"fa fa-android\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"插件管理模块\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615677808');
INSERT INTO `m_system_log_202103` VALUES ('635', '1', '/admin/system.menu/edit?id=254', 'post', '', '{\"id\":\"254\",\"pid\":\"228\",\"title\":\"插件管理\",\"href\":\"system.plugin\\/index\",\"icon\":\"fa fa-android\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"插件管理模块\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615677927');
INSERT INTO `m_system_log_202103` VALUES ('636', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"byju\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615682740');
INSERT INTO `m_system_log_202103` VALUES ('637', '1', '/admin/system.menu/edit?id=267', 'post', '', '{\"id\":\"267\",\"pid\":\"228\",\"title\":\"测试插件菜单\",\"href\":\"system.plugin\\/index\",\"icon\":\"fa fa-android\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615686991');
INSERT INTO `m_system_log_202103` VALUES ('638', '1', '/admin/system.menu/edit?id=267', 'post', '', '{\"id\":\"267\",\"pid\":\"228\",\"title\":\"测试插件菜单\",\"href\":\"test\",\"icon\":\"fa fa-android\",\"target\":\"_self\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615687046');
INSERT INTO `m_system_log_202103` VALUES ('639', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"cg2l\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615691038');
INSERT INTO `m_system_log_202103` VALUES ('640', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"bjj7\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615691059');
INSERT INTO `m_system_log_202103` VALUES ('641', '1', '/admin/system.config/save', 'post', '', '{\"site_name\":\"芒果后台系统\",\"site_ico\":\"https:\\/\\/lxn-99php.oss-cn-shenzhen.aliyuncs.com\\/upload\\/20191111\\/7d32671f4c1d1b01b0b28f45205763f9.ico\",\"file\":\"\",\"site_version\":\"2.0.0\",\"site_beian\":\"粤ICP备16006642号-2\",\"site_copyright\":\"©版权所有 2014-2018 叁贰柒工作室66\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615708490');
INSERT INTO `m_system_log_202103` VALUES ('642', '1', '/admin/system.config/save', 'post', '', '{\"logo_title\":\"mangoadmin\",\"logo_image\":\"\\/favicon.ico\",\"file\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615708528');
INSERT INTO `m_system_log_202103` VALUES ('643', '1', '/admin/ajax/upload', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615714262');
INSERT INTO `m_system_log_202103` VALUES ('644', '1', '/admin/ajax/upload', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615714273');
INSERT INTO `m_system_log_202103` VALUES ('645', '1', '/admin/system.config/save', 'post', '', '{\"upload_type\":\"local\",\"upload_allow_ext\":\"doc,gif,ico,icon,jpg,mp3,mp4,p12,pem,png,rar,jpeg\",\"upload_allow_size\":\"1024000\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615714278');
INSERT INTO `m_system_log_202103` VALUES ('646', '1', '/admin/ajax/upload', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615714299');
INSERT INTO `m_system_log_202103` VALUES ('647', '1', '/admin/system.config/save', 'post', '', '{\"site_name\":\"芒果后台系统\",\"site_ico\":\"http:\\/\\/mango.cn\\/upload\\/20210314\\/266d9bc4d6b893fa5590bbdd772b3ddd.ico\",\"file\":\"\",\"site_version\":\"2.0.0\",\"site_beian\":\"粤ICP备16006642号-2\",\"site_copyright\":\"©版权所有 2014-2018 叁贰柒工作室66\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615714303');
INSERT INTO `m_system_log_202103` VALUES ('648', '1', '/admin/ajax/upload', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615714314');
INSERT INTO `m_system_log_202103` VALUES ('649', '1', '/admin/system.config/save', 'post', '', '{\"logo_title\":\"mangoadmin\",\"logo_image\":\"http:\\/\\/mango.cn\\/upload\\/20210314\\/204b0f540f11a5c893bef72ec471b1d6.png\",\"file\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615714316');
INSERT INTO `m_system_log_202103` VALUES ('650', '1', '/admin/system.uploadfile/delete?id=288', 'post', '', '{\"id\":\"288\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615726612');
INSERT INTO `m_system_log_202103` VALUES ('651', '1', '/admin/system.uploadfile/delete', 'post', '', '{\"id\":[\"302\",\"301\",\"300\",\"299\",\"298\",\"297\",\"296\",\"291\",\"290\",\"289\",\"287\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615726628');
INSERT INTO `m_system_log_202103` VALUES ('652', '1', '/admin/system.uploadfile/delete?id=286', 'post', '', '{\"id\":\"286\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615726641');
INSERT INTO `m_system_log_202103` VALUES ('653', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"mpuw\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36', '1615860338');
INSERT INTO `m_system_log_202103` VALUES ('654', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"klft\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1615990241');
INSERT INTO `m_system_log_202103` VALUES ('655', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"cmwf\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617012901');
INSERT INTO `m_system_log_202103` VALUES ('656', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"iy3f\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617088357');
INSERT INTO `m_system_log_202103` VALUES ('657', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"3fsa\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617089693');
INSERT INTO `m_system_log_202103` VALUES ('658', '1', '/admin/system.auth/add', 'post', '', '{\"title\":\"活动管理\",\"remark\":\"afd \"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617091776');
INSERT INTO `m_system_log_202103` VALUES ('659', '1', '/admin/system.auth/delete?id=7', 'post', '', '{\"id\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617091793');
INSERT INTO `m_system_log_202103` VALUES ('660', '1', '/admin/mall.goods/modify', 'post', '', '{\"id\":\"9\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617092981');
INSERT INTO `m_system_log_202103` VALUES ('661', '1', '/admin/mall.goods/modify', 'post', '', '{\"id\":\"9\",\"field\":\"status\",\"value\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617092988');
INSERT INTO `m_system_log_202103` VALUES ('662', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"m5gt\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617175354');

-- ----------------------------
-- Table structure for m_system_log_202104
-- ----------------------------
DROP TABLE IF EXISTS `m_system_log_202104`;
CREATE TABLE `m_system_log_202104` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int unsigned DEFAULT '0' COMMENT '管理员ID',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `method` varchar(50) NOT NULL COMMENT '请求方法',
  `title` varchar(100) DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) DEFAULT '' COMMENT 'User-Agent',
  `create_time` int DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=781 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台操作日志表 - 202104';

-- ----------------------------
-- Records of m_system_log_202104
-- ----------------------------
INSERT INTO `m_system_log_202104` VALUES ('630', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"kmtx\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617689631');
INSERT INTO `m_system_log_202104` VALUES ('631', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"ncvo\",\"keep_login\":\"1\"}', '183.94.122.69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617690641');
INSERT INTO `m_system_log_202104` VALUES ('632', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"ncvo\",\"keep_login\":\"1\"}', '183.94.122.69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617690645');
INSERT INTO `m_system_log_202104` VALUES ('633', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"dajr\",\"keep_login\":\"1\"}', '183.94.122.69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617690652');
INSERT INTO `m_system_log_202104` VALUES ('634', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"q7m6\",\"keep_login\":\"0\"}', '61.191.200.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1617691736');
INSERT INTO `m_system_log_202104` VALUES ('635', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"fubm\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617707429');
INSERT INTO `m_system_log_202104` VALUES ('636', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"jmql\",\"keep_login\":\"1\"}', '183.94.122.69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617781625');
INSERT INTO `m_system_log_202104` VALUES ('637', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"k3y7\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617781975');
INSERT INTO `m_system_log_202104` VALUES ('638', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"dtqh\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617783270');
INSERT INTO `m_system_log_202104` VALUES ('639', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xszg\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617785004');
INSERT INTO `m_system_log_202104` VALUES ('640', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"ept\",\"keep_login\":\"0\"}', '183.94.122.69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617785967');
INSERT INTO `m_system_log_202104` VALUES ('641', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xszg\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617786532');
INSERT INTO `m_system_log_202104` VALUES ('642', null, '/admin/login/index.html', 'post', '', '{\"username\":\"demo\",\"password\":\"3a4ef15800b8b4104c42e935b566761f8c255065\",\"captcha\":\"tmjy\",\"keep_login\":\"0\"}', '183.94.122.69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617877973');
INSERT INTO `m_system_log_202104` VALUES ('643', null, '/admin/login/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xszg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617878327');
INSERT INTO `m_system_log_202104` VALUES ('644', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xszg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617878347');
INSERT INTO `m_system_log_202104` VALUES ('645', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xszg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617878444');
INSERT INTO `m_system_log_202104` VALUES ('646', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xszg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617878463');
INSERT INTO `m_system_log_202104` VALUES ('647', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xszg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617878474');
INSERT INTO `m_system_log_202104` VALUES ('648', null, '/admin/login/index.html', 'post', '', '{\"username\":\"demo\",\"password\":\"3a4ef15800b8b4104c42e935b566761f8c255065\",\"captcha\":\"tmjy\",\"keep_login\":\"1\"}', '183.94.122.69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617878552');
INSERT INTO `m_system_log_202104` VALUES ('649', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xszg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617878865');
INSERT INTO `m_system_log_202104` VALUES ('650', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xszg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617878887');
INSERT INTO `m_system_log_202104` VALUES ('651', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xszg\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617879283');
INSERT INTO `m_system_log_202104` VALUES ('652', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xszg\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617879287');
INSERT INTO `m_system_log_202104` VALUES ('653', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xszg\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617879322');
INSERT INTO `m_system_log_202104` VALUES ('654', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xszg\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617879340');
INSERT INTO `m_system_log_202104` VALUES ('655', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xszg\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617879409');
INSERT INTO `m_system_log_202104` VALUES ('656', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xszg\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617879416');
INSERT INTO `m_system_log_202104` VALUES ('657', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"3mkf\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617879476');
INSERT INTO `m_system_log_202104` VALUES ('658', null, '/admin/login/index', 'post', '', '{\"username\":\"a\",\"password\":\"b36e3ffa19e32d1eeccc47ccc37e23c362967336\",\"captcha\":\"a\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617932745');
INSERT INTO `m_system_log_202104` VALUES ('659', null, '/admin/login/index', 'post', '', '{\"username\":\"a\",\"password\":\"b36e3ffa19e32d1eeccc47ccc37e23c362967336\",\"captcha\":\"ebqa\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617932753');
INSERT INTO `m_system_log_202104` VALUES ('660', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"b36e3ffa19e32d1eeccc47ccc37e23c362967336\",\"captcha\":\"ebqa\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617932759');
INSERT INTO `m_system_log_202104` VALUES ('661', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"b36e3ffa19e32d1eeccc47ccc37e23c362967336\",\"captcha\":\"xgm4\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617932771');
INSERT INTO `m_system_log_202104` VALUES ('662', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"ce5u\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617932781');
INSERT INTO `m_system_log_202104` VALUES ('663', null, '/admin/login/index', 'post', '', '{\"username\":\"1\",\"password\":\"4360f49170d09fc14a5249e837c4769eea59fee2\",\"captcha\":\"1\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617932882');
INSERT INTO `m_system_log_202104` VALUES ('664', null, '/admin/login/index', 'post', '', '{\"username\":\"1\",\"password\":\"4360f49170d09fc14a5249e837c4769eea59fee2\",\"captcha\":\"5ymb\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617932889');
INSERT INTO `m_system_log_202104` VALUES ('665', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"4360f49170d09fc14a5249e837c4769eea59fee2\",\"captcha\":\"2y48\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617932906');
INSERT INTO `m_system_log_202104` VALUES ('666', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"2y48\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617932913');
INSERT INTO `m_system_log_202104` VALUES ('667', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"2y48\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617932914');
INSERT INTO `m_system_log_202104` VALUES ('668', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"ndak\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617932921');
INSERT INTO `m_system_log_202104` VALUES ('669', null, '/admin/login/index', 'post', '', '{\"username\":\"\",\"password\":\"2edf895d7f04c4711a1e9f570ff1872ae53b99de\",\"captcha\":\"\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617933373');
INSERT INTO `m_system_log_202104` VALUES ('670', null, '/admin/login/index', 'post', '', '{\"username\":\"ad\",\"password\":\"2edf895d7f04c4711a1e9f570ff1872ae53b99de\",\"captcha\":\"\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617933490');
INSERT INTO `m_system_log_202104` VALUES ('671', null, '/admin/login/index', 'post', '', '{\"username\":\"ad\",\"password\":\"2edf895d7f04c4711a1e9f570ff1872ae53b99de\",\"captcha\":\"\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617933490');
INSERT INTO `m_system_log_202104` VALUES ('672', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"erwu\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617933507');
INSERT INTO `m_system_log_202104` VALUES ('673', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"erwu\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617933507');
INSERT INTO `m_system_log_202104` VALUES ('674', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"1ac3f1c9d43f8964d3f25a422c2b5a7403281546\",\"captcha\":\"mfph\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617933526');
INSERT INTO `m_system_log_202104` VALUES ('675', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"1ac3f1c9d43f8964d3f25a422c2b5a7403281546\",\"captcha\":\"mfph\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617933526');
INSERT INTO `m_system_log_202104` VALUES ('676', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"vutu\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617933845');
INSERT INTO `m_system_log_202104` VALUES ('677', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"vutu\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617933845');
INSERT INTO `m_system_log_202104` VALUES ('678', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"r5qq\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617941301');
INSERT INTO `m_system_log_202104` VALUES ('679', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"r5qq\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617941301');
INSERT INTO `m_system_log_202104` VALUES ('680', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"7fq3\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617955159');
INSERT INTO `m_system_log_202104` VALUES ('681', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"7fq3\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617955159');
INSERT INTO `m_system_log_202104` VALUES ('682', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"23ih\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617955170');
INSERT INTO `m_system_log_202104` VALUES ('683', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"23ih\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617955170');
INSERT INTO `m_system_log_202104` VALUES ('684', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"vcka\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617962868');
INSERT INTO `m_system_log_202104` VALUES ('685', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"vcka\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617962868');
INSERT INTO `m_system_log_202104` VALUES ('686', null, '/admin/login/index', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617970097');
INSERT INTO `m_system_log_202104` VALUES ('687', null, '/admin/login/index', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617970097');
INSERT INTO `m_system_log_202104` VALUES ('688', null, '/admin/login/index.html?username=admin&password=123456&captcha=8efj&keep_login=0', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"uw3m\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617970108');
INSERT INTO `m_system_log_202104` VALUES ('689', null, '/admin/login/index.html?username=admin&password=123456&captcha=8efj&keep_login=0', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"uw3m\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617970108');
INSERT INTO `m_system_log_202104` VALUES ('690', '1', '/admin/ajax/upload', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617972344');
INSERT INTO `m_system_log_202104` VALUES ('691', '1', '/admin/mall.cate/add', 'post', '', '{\"title\":\"撒地方\",\"image\":\"http:\\/\\/mango.cn\\/upload\\/20210409\\/2d87e02a0ad56c04fafd3de32a53dfa1.png\",\"file\":\"\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617972348');
INSERT INTO `m_system_log_202104` VALUES ('692', '1', '/admin/ajax/upload', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617973838');
INSERT INTO `m_system_log_202104` VALUES ('693', '1', '/admin/mall.cate/add', 'post', '', '{\"title\":\"阿斯蒂芬\",\"image\":\"http:\\/\\/mango.cn\\/upload\\/20210409\\/332dd71a3049b9834ffae81e121b0b74.png\",\"file\":\"\",\"sort\":\"0\",\"remark\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617973842');
INSERT INTO `m_system_log_202104` VALUES ('694', '1', '/admin/addons/login_page/back/modify', 'post', '', '{\"id\":\"1\",\"field\":\"status\",\"value\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617975364');
INSERT INTO `m_system_log_202104` VALUES ('695', '1', '/admin/addons/login_page/back/modify', 'post', '', '{\"id\":\"1\",\"field\":\"status\",\"value\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617975378');
INSERT INTO `m_system_log_202104` VALUES ('696', '1', '/admin/addons/login_page/back/delete?id=1', 'post', '', '{\"id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1617975386');
INSERT INTO `m_system_log_202104` VALUES ('697', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"j6qz\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618015933');
INSERT INTO `m_system_log_202104` VALUES ('698', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"j6qz\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618015933');
INSERT INTO `m_system_log_202104` VALUES ('699', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"gfwq\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618015957');
INSERT INTO `m_system_log_202104` VALUES ('700', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"gfwq\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618015957');
INSERT INTO `m_system_log_202104` VALUES ('701', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xxyx\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618015962');
INSERT INTO `m_system_log_202104` VALUES ('702', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xxyx\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618015962');
INSERT INTO `m_system_log_202104` VALUES ('703', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xxyx\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618015984');
INSERT INTO `m_system_log_202104` VALUES ('704', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xxyx\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618015985');
INSERT INTO `m_system_log_202104` VALUES ('705', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"my6m\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618015991');
INSERT INTO `m_system_log_202104` VALUES ('706', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"my6m\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618015991');
INSERT INTO `m_system_log_202104` VALUES ('707', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"nlbf\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618016006');
INSERT INTO `m_system_log_202104` VALUES ('708', null, '/admin/login/index.html', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"nlbf\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618016006');
INSERT INTO `m_system_log_202104` VALUES ('709', '1', '/admin/login/index', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618016210');
INSERT INTO `m_system_log_202104` VALUES ('710', '1', '/admin/login/index', 'post', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618016210');
INSERT INTO `m_system_log_202104` VALUES ('711', '1', '/admin/addons/login_page/back/add', 'post', '', '{\"title\":\"登录页面2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618016587');
INSERT INTO `m_system_log_202104` VALUES ('712', '1', '/admin/addons/login_page/back/add', 'post', '', '{\"title\":\"登录页面2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618016621');
INSERT INTO `m_system_log_202104` VALUES ('713', '1', '/admin/addons/login_page/back/add', 'post', '', '{\"title\":\"登录页面2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618016655');
INSERT INTO `m_system_log_202104` VALUES ('714', '1', '/admin/addons/login_page/back/delete', 'post', '', '{\"id\":[\"1\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618017046');
INSERT INTO `m_system_log_202104` VALUES ('715', '1', '/admin/addons/login_page/back/delete', 'post', '', '{\"id\":[\"1\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618017053');
INSERT INTO `m_system_log_202104` VALUES ('716', '1', '/admin/addons/login_page/back/delete', 'post', '', '{\"id\":[\"1\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618017187');
INSERT INTO `m_system_log_202104` VALUES ('717', '1', '/admin/addons/login_page/back/edit?id=2', 'post', '', '{\"id\":\"2\",\"title\":\"登录页面1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618017197');
INSERT INTO `m_system_log_202104` VALUES ('718', '1', '/admin/addons/login_page/back/delete?id=2', 'post', '', '{\"id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618017209');
INSERT INTO `m_system_log_202104` VALUES ('719', '1', '/admin/addons/login_page/back/add', 'post', '', '{\"title\":\"登录页面1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618017222');
INSERT INTO `m_system_log_202104` VALUES ('720', '1', '/admin/addons/login_page/back/add', 'post', '', '{\"title\":\"登录页面2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618017230');
INSERT INTO `m_system_log_202104` VALUES ('721', '1', '/admin/addons/login_page/back/add', 'post', '', '{\"title\":\"登录页面3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618017243');
INSERT INTO `m_system_log_202104` VALUES ('722', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"jtc5\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618027029');
INSERT INTO `m_system_log_202104` VALUES ('723', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"m5t3\",\"keep_login\":\"0\"}', '183.94.122.69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618027058');
INSERT INTO `m_system_log_202104` VALUES ('724', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"xdjq\",\"keep_login\":\"0\"}', '101.24.187.119', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 11_2_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '1618029662');
INSERT INTO `m_system_log_202104` VALUES ('725', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"7vvu\",\"keep_login\":\"0\"}', '27.152.242.49', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Safari/605.1.15', '1618049103');
INSERT INTO `m_system_log_202104` VALUES ('726', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"evmu\",\"keep_login\":\"0\"}', '40.83.73.129', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618284780');
INSERT INTO `m_system_log_202104` VALUES ('727', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"rwy6\",\"keep_login\":\"0\"}', '123.52.19.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '1618366640');
INSERT INTO `m_system_log_202104` VALUES ('728', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"kzma\",\"keep_login\":\"1\"}', '27.18.238.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1618366721');
INSERT INTO `m_system_log_202104` VALUES ('729', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"atwwy\",\"keep_login\":\"1\"}', '27.18.238.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618368026');
INSERT INTO `m_system_log_202104` VALUES ('730', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"ikxa\",\"keep_login\":\"1\"}', '27.18.238.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618368036');
INSERT INTO `m_system_log_202104` VALUES ('731', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"fwfb\",\"keep_login\":\"1\"}', '121.13.246.253', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1618369602');
INSERT INTO `m_system_log_202104` VALUES ('732', '1', '/admin/ajax/upload', 'post', '', '[]', '121.13.246.253', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1618369703');
INSERT INTO `m_system_log_202104` VALUES ('733', '1', '/admin/system.auth/modify', 'post', '', '{\"id\":\"1\",\"field\":\"status\",\"value\":\"0\"}', '121.13.246.253', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1618369811');
INSERT INTO `m_system_log_202104` VALUES ('734', '1', '/admin/system.node/modify', 'post', '', '{\"id\":\"2\",\"field\":\"is_auth\",\"value\":\"0\"}', '121.13.246.253', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1618369817');
INSERT INTO `m_system_log_202104` VALUES ('735', '1', '/admin/system.node/modify', 'post', '', '{\"id\":\"2\",\"field\":\"is_auth\",\"value\":\"0\"}', '121.13.246.253', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1618369819');
INSERT INTO `m_system_log_202104` VALUES ('736', '1', '/admin/system.node/modify', 'post', '', '{\"id\":\"2\",\"field\":\"title\",\"value\":\"列表99\"}', '121.13.246.253', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1618369830');
INSERT INTO `m_system_log_202104` VALUES ('737', '1', '/admin/index/editAdmin.html', 'post', '', '{\"head_img\":\"\\/static\\/admin\\/images\\/head.jpg\",\"file\":\"\",\"username\":\"admin\",\"phone\":\"admin\",\"remark\":\"admin\"}', '121.13.246.253', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '1618369888');
INSERT INTO `m_system_log_202104` VALUES ('738', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"rdlv\",\"keep_login\":\"0\"}', '113.67.157.153', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.25 Safari/537.36 Core/1.70.3776.400 QQBrowser/10.6.4212.400', '1618448850');
INSERT INTO `m_system_log_202104` VALUES ('739', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"ufvb\",\"keep_login\":\"0\"}', '113.67.157.153', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.25 Safari/537.36 Core/1.70.3776.400 QQBrowser/10.6.4212.400', '1618448858');
INSERT INTO `m_system_log_202104` VALUES ('740', '1', '/admin/system.quick/modify', 'post', '', '{\"id\":\"11\",\"field\":\"status\",\"value\":\"0\"}', '113.67.157.153', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.25 Safari/537.36 Core/1.70.3776.400 QQBrowser/10.6.4212.400', '1618448915');
INSERT INTO `m_system_log_202104` VALUES ('741', '1', '/admin/system.quick/modify', 'post', '', '{\"id\":\"11\",\"field\":\"status\",\"value\":\"0\"}', '113.67.157.153', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.25 Safari/537.36 Core/1.70.3776.400 QQBrowser/10.6.4212.400', '1618448919');
INSERT INTO `m_system_log_202104` VALUES ('742', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"nkbx\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1619054384');
INSERT INTO `m_system_log_202104` VALUES ('743', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"tr6i\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1619140399');
INSERT INTO `m_system_log_202104` VALUES ('744', '1', '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"tr6i\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1619140402');
INSERT INTO `m_system_log_202104` VALUES ('745', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"ccfm\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1619143173');
INSERT INTO `m_system_log_202104` VALUES ('746', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"ccfm\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1619143317');
INSERT INTO `m_system_log_202104` VALUES ('747', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"hp5u\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1619143323');
INSERT INTO `m_system_log_202104` VALUES ('748', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"btmf\",\"keep_login\":\"0\"}', '221.219.193.208', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', '1619148038');
INSERT INTO `m_system_log_202104` VALUES ('749', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"ufah\",\"keep_login\":\"0\"}', '27.17.135.52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1619148084');
INSERT INTO `m_system_log_202104` VALUES ('750', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"tcgk\",\"keep_login\":\"0\"}', '27.17.135.52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1619148305');
INSERT INTO `m_system_log_202104` VALUES ('751', '1', '/admin/mall.goods/delete?id=9', 'post', '', '{\"id\":\"9\"}', '27.17.135.52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1619148476');
INSERT INTO `m_system_log_202104` VALUES ('752', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"rbdw\",\"keep_login\":\"0\"}', '58.210.4.122', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36 Edg/90.0.818.42', '1619148581');
INSERT INTO `m_system_log_202104` VALUES ('753', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"ycuc\",\"keep_login\":\"0\"}', '117.158.195.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.122 Safari/537.36', '1619524543');
INSERT INTO `m_system_log_202104` VALUES ('754', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"pg8z\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1619573759');
INSERT INTO `m_system_log_202104` VALUES ('755', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"afpx\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1619663119');
INSERT INTO `m_system_log_202104` VALUES ('756', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"afpx\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1619663120');
INSERT INTO `m_system_log_202104` VALUES ('757', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"ciah\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1619663125');
INSERT INTO `m_system_log_202104` VALUES ('758', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"kcjd\",\"keep_login\":\"1\"}', '65.49.38.149', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '1619666128');
INSERT INTO `m_system_log_202104` VALUES ('759', '1', '/admin/addons/login_page/back/modify', 'post', '', '{\"id\":\"3\",\"field\":\"status\",\"value\":\"1\"}', '27.17.135.52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '1619666257');
INSERT INTO `m_system_log_202104` VALUES ('760', '1', '/admin/addons/login_page/back/modify', 'post', '', '{\"id\":\"3\",\"field\":\"status\",\"value\":\"1\"}', '27.17.135.52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '1619666339');
INSERT INTO `m_system_log_202104` VALUES ('761', '1', '/admin/addons/login_page/back/modify', 'post', '', '{\"id\":\"3\",\"field\":\"status\",\"value\":\"1\"}', '27.17.135.52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '1619666340');
INSERT INTO `m_system_log_202104` VALUES ('762', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"3a4ef15800b8b4104c42e935b566761f8c255065\",\"captcha\":\"nebm\",\"keep_login\":\"0\"}', '27.17.135.52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', '1619668588');
INSERT INTO `m_system_log_202104` VALUES ('763', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"7lhc\",\"keep_login\":\"0\"}', '27.17.135.52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', '1619668598');
INSERT INTO `m_system_log_202104` VALUES ('764', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"vqea\",\"keep_login\":\"0\"}', '27.17.135.52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1619668628');
INSERT INTO `m_system_log_202104` VALUES ('765', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\" tmhi\",\"keep_login\":\"1\"}', '110.53.222.161', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 SocketLog(tabid=2566&client_id=zoudingyong_zfH5NbLn)', '1619677903');
INSERT INTO `m_system_log_202104` VALUES ('766', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"8hqw\",\"keep_login\":\"1\"}', '110.53.222.161', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 SocketLog(tabid=2566&client_id=zoudingyong_zfH5NbLn)', '1619677908');
INSERT INTO `m_system_log_202104` VALUES ('767', '1', '/admin/ajax/upload', 'post', '', '[]', '110.53.222.161', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 SocketLog(tabid=2566&client_id=zoudingyong_zfH5NbLn)', '1619678020');
INSERT INTO `m_system_log_202104` VALUES ('768', '1', '/admin/system.node/refreshNode?force=0', 'post', '', '{\"force\":\"0\"}', '110.53.222.161', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 SocketLog(tabid=2566&client_id=zoudingyong_zfH5NbLn)', '1619678149');
INSERT INTO `m_system_log_202104` VALUES ('769', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"ynvg\",\"keep_login\":\"0\"}', '1.80.147.172', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '1619752557');
INSERT INTO `m_system_log_202104` VALUES ('770', '1', '/admin/mall.cate/modify', 'post', '', '{\"id\":\"11\",\"field\":\"status\",\"value\":\"0\"}', '1.80.147.172', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '1619752643');
INSERT INTO `m_system_log_202104` VALUES ('771', '1', '/admin/mall.cate/modify', 'post', '', '{\"id\":\"11\",\"field\":\"status\",\"value\":\"0\"}', '1.80.147.172', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '1619752644');
INSERT INTO `m_system_log_202104` VALUES ('772', '1', '/admin/mall.cate/modify', 'post', '', '{\"id\":\"10\",\"field\":\"status\",\"value\":\"0\"}', '1.80.147.172', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '1619752648');
INSERT INTO `m_system_log_202104` VALUES ('773', '1', '/admin/mall.cate/modify', 'post', '', '{\"id\":\"9\",\"field\":\"status\",\"value\":\"0\"}', '1.80.147.172', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '1619752649');
INSERT INTO `m_system_log_202104` VALUES ('774', '1', '/admin/system.uploadfile/delete?id=316', 'post', '', '{\"id\":\"316\"}', '1.80.147.172', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '1619752991');
INSERT INTO `m_system_log_202104` VALUES ('775', '1', '/admin/system.uploadfile/delete?id=317', 'post', '', '{\"id\":\"317\"}', '1.80.147.172', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '1619752995');
INSERT INTO `m_system_log_202104` VALUES ('776', '1', '/admin/system.uploadfile/delete', 'post', '', '{\"id\":[\"323\"]}', '1.80.147.172', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '1619753004');
INSERT INTO `m_system_log_202104` VALUES ('777', '1', '/admin/ajax/upload', 'post', '', '[]', '1.80.147.172', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '1619753025');
INSERT INTO `m_system_log_202104` VALUES ('778', '1', '/admin/ajax/upload', 'post', '', '[]', '1.80.147.172', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '1619753036');
INSERT INTO `m_system_log_202104` VALUES ('779', '1', '/admin/system.uploadfile/delete?id=324', 'post', '', '{\"id\":\"324\"}', '1.80.147.172', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '1619753047');
INSERT INTO `m_system_log_202104` VALUES ('780', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"tyhk\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1619769357');

-- ----------------------------
-- Table structure for m_system_log_202105
-- ----------------------------
DROP TABLE IF EXISTS `m_system_log_202105`;
CREATE TABLE `m_system_log_202105` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int unsigned DEFAULT '0' COMMENT '管理员ID',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `method` varchar(50) NOT NULL COMMENT '请求方法',
  `title` varchar(100) DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) DEFAULT '' COMMENT 'User-Agent',
  `create_time` int DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=639 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台操作日志表 - 202105';

-- ----------------------------
-- Records of m_system_log_202105
-- ----------------------------
INSERT INTO `m_system_log_202105` VALUES ('630', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"mpgs\",\"keep_login\":\"0\"}', '183.22.29.168', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '1619856132');
INSERT INTO `m_system_log_202105` VALUES ('631', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"jrnu\",\"keep_login\":\"0\"}', '182.100.130.241', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '1620146959');
INSERT INTO `m_system_log_202105` VALUES ('632', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"fqup\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1620288008');
INSERT INTO `m_system_log_202105` VALUES ('633', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"dr2k\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.25 Safari/537.36 Core/1.70.3775.400 QQBrowser/10.6.4208.400', '1620288311');
INSERT INTO `m_system_log_202105` VALUES ('634', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"nyjh\",\"keep_login\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36 Edg/90.0.818.51', '1620288384');
INSERT INTO `m_system_log_202105` VALUES ('635', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"26aw\",\"keep_login\":\"0\"}', '51.81.35.164', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '1620293731');
INSERT INTO `m_system_log_202105` VALUES ('636', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"jfv7\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1620546699');
INSERT INTO `m_system_log_202105` VALUES ('637', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"jfv7\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1620546702');
INSERT INTO `m_system_log_202105` VALUES ('638', null, '/admin/login/index', 'post', '', '{\"username\":\"admin\",\"password\":\"ed696eb5bba1f7460585cc6975e6cf9bf24903dd\",\"captcha\":\"5d8k\",\"keep_login\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4442.4 Safari/537.36', '1620546712');

-- ----------------------------
-- Table structure for m_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `m_system_menu`;
CREATE TABLE `m_system_menu` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `remark` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT '' COMMENT '名称',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `delete_time` int DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `href` (`href`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统菜单表';

-- ----------------------------
-- Records of m_system_menu
-- ----------------------------
INSERT INTO `m_system_menu` VALUES ('1', '0', '插件管理', 'fa fa-list', '', '', '_self', '2', '1', null, '', '1617938576', '1617938576', null);
INSERT INTO `m_system_menu` VALUES ('227', '99999999', '后台首页', 'fa fa-home', 'index/welcome', '', '_self', '0', '1', null, '', null, '1573120497', null);
INSERT INTO `m_system_menu` VALUES ('228', '0', '系统管理', 'fa fa-cog', '', '', '_self', '1', '1', '', '', null, '1588999529', null);
INSERT INTO `m_system_menu` VALUES ('234', '228', '菜单管理', 'fa fa-tree', 'system.menu/index', '', '_self', '10', '1', '', '', null, '1588228555', null);
INSERT INTO `m_system_menu` VALUES ('244', '228', '管理员管理', 'fa fa-user', 'system.admin/index', '', '_self', '12', '1', '', '', '1573185011', '1588228573', null);
INSERT INTO `m_system_menu` VALUES ('245', '228', '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', '', '_self', '11', '1', '', '', '1573435877', '1588228634', null);
INSERT INTO `m_system_menu` VALUES ('246', '228', '节点管理', 'fa fa-list', 'system.node/index', '', '_self', '9', '1', '', '', '1573435919', '1588228648', null);
INSERT INTO `m_system_menu` VALUES ('247', '228', '配置管理', 'fa fa-asterisk', 'system.config/index', '', '_self', '8', '1', '', '', '1573457448', '1588228566', null);
INSERT INTO `m_system_menu` VALUES ('248', '228', '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', '', '_self', '0', '1', '', '', '1573542953', '1588228043', null);
INSERT INTO `m_system_menu` VALUES ('249', '0', '商城管理', 'fa fa-list', '', '', '_self', '3', '1', '', '', '1589439884', '1589439884', null);
INSERT INTO `m_system_menu` VALUES ('250', '249', '商品分类', 'fa fa-calendar-check-o', 'mall.cate/index', '', '_self', '0', '1', '', '', '1589439910', '1589439966', null);
INSERT INTO `m_system_menu` VALUES ('251', '249', '商品管理', 'fa fa-list', 'mall.goods/index', '', '_self', '0', '1', '', '', '1589439931', '1589439942', null);
INSERT INTO `m_system_menu` VALUES ('252', '228', '快捷入口', 'fa fa-list', 'system.quick/index', '', '_self', '0', '1', '', '', '1589623683', '1589623683', null);
INSERT INTO `m_system_menu` VALUES ('253', '228', '日志管理', 'fa fa-connectdevelop', 'system.log/index', '', '_self', '0', '1', '', '', '1589623684', '1589623684', null);
INSERT INTO `m_system_menu` VALUES ('254', '228', '插件管理', 'fa fa-android', 'system.plugin/index', '', '_self', '0', '1', '插件管理模块', '', '1615677684', '1615677927', null);
INSERT INTO `m_system_menu` VALUES ('343', '1', '登录页面', 'fa fa-list', '/addons/login_page/back/index', '', '_self', '0', '1', null, 'login_page', '1619147352', '1619147352', null);

-- ----------------------------
-- Table structure for m_system_node
-- ----------------------------
DROP TABLE IF EXISTS `m_system_node`;
CREATE TABLE `m_system_node` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(100) DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) DEFAULT NULL COMMENT '节点标题',
  `type` tinyint(1) DEFAULT '3' COMMENT '节点类型（1：控制器，2：节点）',
  `is_auth` tinyint unsigned DEFAULT '1' COMMENT '是否启动RBAC权限控制',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统节点表';

-- ----------------------------
-- Records of m_system_node
-- ----------------------------
INSERT INTO `m_system_node` VALUES ('1', 'system.admin', '管理员管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('2', 'system.admin/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('3', 'system.admin/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('4', 'system.admin/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('5', 'system.admin/password', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('6', 'system.admin/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('7', 'system.admin/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('8', 'system.admin/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('9', 'system.auth', '角色权限管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('10', 'system.auth/authorize', '授权', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('11', 'system.auth/saveAuthorize', '授权保存', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('12', 'system.auth/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('13', 'system.auth/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('14', 'system.auth/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('15', 'system.auth/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('16', 'system.auth/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('17', 'system.auth/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('18', 'system.config', '系统配置管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('19', 'system.config/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('20', 'system.config/save', '保存', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('21', 'system.menu', '菜单管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('22', 'system.menu/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('23', 'system.menu/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('24', 'system.menu/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('25', 'system.menu/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('26', 'system.menu/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('27', 'system.menu/getMenuTips', '添加菜单提示', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('28', 'system.menu/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('29', 'system.node', '系统节点管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('30', 'system.node/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('31', 'system.node/refreshNode', '系统节点更新', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('32', 'system.node/clearNode', '清除失效节点', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('33', 'system.node/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('34', 'system.node/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('35', 'system.node/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('36', 'system.node/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('37', 'system.node/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('38', 'system.uploadfile', '上传文件管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('39', 'system.uploadfile/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('40', 'system.uploadfile/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('41', 'system.uploadfile/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('42', 'system.uploadfile/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('43', 'system.uploadfile/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('44', 'system.uploadfile/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('45', 'mall.cate', '商品分类管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('46', 'mall.cate/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('47', 'mall.cate/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('48', 'mall.cate/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('49', 'mall.cate/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('50', 'mall.cate/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('51', 'mall.cate/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('52', 'mall.goods', '商城商品管理', '1', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('53', 'mall.goods/index', '列表', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('54', 'mall.goods/stock', '入库', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('55', 'mall.goods/add', '添加', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('56', 'mall.goods/edit', '编辑', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('57', 'mall.goods/delete', '删除', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('58', 'mall.goods/export', '导出', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('59', 'mall.goods/modify', '属性修改', '2', '1', '1589580432', '1589580432');
INSERT INTO `m_system_node` VALUES ('60', 'system.quick', '快捷入口管理', '1', '1', '1589623188', '1589623188');
INSERT INTO `m_system_node` VALUES ('61', 'system.quick/index', '列表', '2', '1', '1589623188', '1589623188');
INSERT INTO `m_system_node` VALUES ('62', 'system.quick/add', '添加', '2', '1', '1589623188', '1589623188');
INSERT INTO `m_system_node` VALUES ('63', 'system.quick/edit', '编辑', '2', '1', '1589623188', '1589623188');
INSERT INTO `m_system_node` VALUES ('64', 'system.quick/delete', '删除', '2', '1', '1589623188', '1589623188');
INSERT INTO `m_system_node` VALUES ('65', 'system.quick/export', '导出', '2', '1', '1589623188', '1589623188');
INSERT INTO `m_system_node` VALUES ('66', 'system.quick/modify', '属性修改', '2', '1', '1589623188', '1589623188');
INSERT INTO `m_system_node` VALUES ('67', 'system.log', '操作日志管理', '1', '1', '1589623188', '1589623188');
INSERT INTO `m_system_node` VALUES ('68', 'system.log/index', '列表', '2', '1', '1589623188', '1589623188');

-- ----------------------------
-- Table structure for m_system_quick
-- ----------------------------
DROP TABLE IF EXISTS `m_system_quick`;
CREATE TABLE `m_system_quick` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '快捷入口名称',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `href` varchar(255) DEFAULT NULL COMMENT '快捷链接',
  `sort` int DEFAULT '0' COMMENT '排序',
  `status` tinyint unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int DEFAULT NULL COMMENT '创建时间',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `delete_time` int DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统快捷入口表';

-- ----------------------------
-- Records of m_system_quick
-- ----------------------------
INSERT INTO `m_system_quick` VALUES ('1', '管理员管理', 'fa fa-user', 'system.admin/index', '0', '1', '', '1589624097', '1589624792', null);
INSERT INTO `m_system_quick` VALUES ('2', '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', '0', '1', '', '1589624772', '1589624781', null);
INSERT INTO `m_system_quick` VALUES ('3', '菜单管理', 'fa fa-tree', 'system.menu/index', '0', '1', null, '1589624097', '1589624792', null);
INSERT INTO `m_system_quick` VALUES ('6', '节点管理', 'fa fa-list', 'system.node/index', '0', '1', null, '1589624772', '1589624781', null);
INSERT INTO `m_system_quick` VALUES ('7', '配置管理', 'fa fa-asterisk', 'system.config/index', '0', '1', null, '1589624097', '1589624792', null);
INSERT INTO `m_system_quick` VALUES ('8', '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', '0', '1', null, '1589624772', '1589624781', null);
INSERT INTO `m_system_quick` VALUES ('10', '商品分类', 'fa fa-calendar-check-o', 'mall.cate/index', '0', '1', null, '1589624097', '1589624792', null);
INSERT INTO `m_system_quick` VALUES ('11', '商品管理', 'fa fa-list', 'mall.goods/index', '0', '1', null, '1589624772', '1589624781', null);

-- ----------------------------
-- Table structure for m_system_uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `m_system_uploadfile`;
CREATE TABLE `m_system_uploadfile` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `upload_type` varchar(20) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `original_name` varchar(255) DEFAULT NULL COMMENT '文件原名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `image_width` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `image_height` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `image_type` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `image_frames` int unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `mime_type` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `file_size` int unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `file_ext` varchar(100) DEFAULT NULL,
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int DEFAULT NULL COMMENT '创建日期',
  `update_time` int DEFAULT NULL COMMENT '更新时间',
  `upload_time` int DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  KEY `upload_type` (`upload_type`),
  KEY `original_name` (`original_name`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='上传文件表';

-- ----------------------------
-- Records of m_system_uploadfile
-- ----------------------------
INSERT INTO `m_system_uploadfile` VALUES ('316', 'local', '1294681 - 副本.ico', 'http://mango.cn/upload/20210314/84b162a73c432a7474346884e0b6e929.ico', '', '', '', '0', 'image/x-icon', '0', 'ico', '', '1615714262', null, null);
INSERT INTO `m_system_uploadfile` VALUES ('317', 'local', '1294681.png', 'http://mango.cn/upload/20210314/1026a10f1202b9324b4657ddb9ba8361.png', '', '', '', '0', 'image/png', '0', 'png', '', '1615714273', null, null);
INSERT INTO `m_system_uploadfile` VALUES ('318', 'local', '1294681 - 副本.ico', 'http://mango.cn/upload/20210314/266d9bc4d6b893fa5590bbdd772b3ddd.ico', '', '', '', '0', 'image/x-icon', '0', 'ico', '', '1615714299', null, null);
INSERT INTO `m_system_uploadfile` VALUES ('319', 'local', '1294681.png', 'http://mango.cn/upload/20210314/204b0f540f11a5c893bef72ec471b1d6.png', '', '', '', '0', 'image/png', '0', 'png', '', '1615714314', null, null);
INSERT INTO `m_system_uploadfile` VALUES ('320', 'local', 'aliyun.png', 'http://mango.cn/upload/20210409/2d87e02a0ad56c04fafd3de32a53dfa1.png', '', '', '', '0', 'image/png', '0', 'png', '', '1617972344', null, null);
INSERT INTO `m_system_uploadfile` VALUES ('321', 'local', 'aliyun.png', 'http://mango.cn/upload/20210409/332dd71a3049b9834ffae81e121b0b74.png', '', '', '', '0', 'image/png', '0', 'png', '', '1617973839', null, null);
INSERT INTO `m_system_uploadfile` VALUES ('322', 'local', 't_031.jpg', 'http://test.ruanzubao.com/upload/20210414/8465623efd021f6b5c6729109132addd.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1618369703', null, null);
INSERT INTO `m_system_uploadfile` VALUES ('323', 'local', '4564565.jpg', 'http://test.ruanzubao.com/upload/20210429/e263794b872b2ba0cb25c42beca5f539.jpg', '', '', '', '0', 'image/jpeg', '0', 'jpg', '', '1619678020', null, null);
INSERT INTO `m_system_uploadfile` VALUES ('324', 'local', 'gecclogo.png', 'http://test.ruanzubao.com/upload/20210430/1efce2dc0ba197ef9252f2677faef71d.png', '', '', '', '0', 'image/png', '0', 'png', '', '1619753036', null, null);

-- ----------------------------
-- Table structure for m_text_addondownload
-- ----------------------------
DROP TABLE IF EXISTS `m_text_addondownload`;
CREATE TABLE `m_text_addondownload` (
  `id` int NOT NULL,
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

-- ----------------------------
-- Records of m_text_addondownload
-- ----------------------------
