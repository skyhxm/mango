/*
Navicat MySQL Data Transfer

Source Server         : 本机（127.0.0.1）
Source Server Version : 80016
Source Host           : 127.0.0.1:3306
Source Database       : mango

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2021-03-30 20:50:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for m_mall_cate
-- ----------------------------
DROP TABLE IF EXISTS `m_mall_cate`;
CREATE TABLE `m_mall_cate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '分类名',
  `image` varchar(500) DEFAULT NULL COMMENT '分类图片',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品分类';

-- ----------------------------
-- Records of m_mall_cate
-- ----------------------------
INSERT INTO `m_mall_cate` VALUES ('9', '手机', 'http://admin.host/upload/20200514/98fc09b0c4ad4d793a6f04bef79a0edc.jpg', '0', '1', '', '1589440437', '1589440437', null);

-- ----------------------------
-- Table structure for m_mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `m_mall_goods`;
CREATE TABLE `m_mall_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) DEFAULT NULL COMMENT '分类ID',
  `title` varchar(20) NOT NULL COMMENT '商品名称',
  `logo` varchar(500) DEFAULT NULL COMMENT '商品logo',
  `images` text COMMENT '商品图片 以 | 做分割符号',
  `describe` text COMMENT '商品描述',
  `market_price` decimal(10,2) DEFAULT '0.00' COMMENT '市场价',
  `discount_price` decimal(10,2) DEFAULT '0.00' COMMENT '折扣价',
  `sales` int(11) DEFAULT '0' COMMENT '销量',
  `virtual_sales` int(11) DEFAULT '0' COMMENT '虚拟销量',
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `total_stock` int(11) DEFAULT '0' COMMENT '总库存',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品列表';

-- ----------------------------
-- Records of m_mall_goods
-- ----------------------------
INSERT INTO `m_mall_goods` VALUES ('8', '10', '落地-风扇', 'http://admin.host/upload/20200514/a0f7fe9637abd219f7e93ceb2820df9b.jpg', 'http://admin.host/upload/20200514/95496713918290f6315ea3f87efa6bf2.jpg|http://admin.host/upload/20200514/ae29fa9cba4fc02defb7daed41cb2b13.jpg|http://admin.host/upload/20200514/f0a104d88ec7dc6fb42d2f87cbc71b76.jpg|http://admin.host/upload/20200514/3b88be4b1934690e5c1bd6b54b9ab5c8.jpg', '<p>76654757</p>\n\n<p><img alt=\"\" src=\"http://admin.host/upload/20200515/198070421110fa01f2c2ac2f52481647.jpg\" style=\"height:689px; width:790px\" /></p>\n\n<p><img alt=\"\" src=\"http://admin.host/upload/20200515/a07a742c15a78781e79f8a3317006c1d.jpg\" style=\"height:877px; width:790px\" /></p>\n', '599.00', '368.00', '0', '594', '0', '0', '675', '1', '', '1589454309', '1589567016', null);
INSERT INTO `m_mall_goods` VALUES ('9', '9', '电脑', 'http://admin.host/upload/20200514/bbf858d469dec2e12a89460110068d3d.jpg', 'http://admin.host/upload/20200514/f0a104d88ec7dc6fb42d2f87cbc71b76.jpg', '<p>477</p>\n', '0.00', '0.00', '0', '0', '115', '320', '0', '1', '', '1589465215', '1617092988', null);

-- ----------------------------
-- Table structure for m_plugin
-- ----------------------------
DROP TABLE IF EXISTS `m_plugin`;
CREATE TABLE `m_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标志',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text NOT NULL COMMENT '插件描述',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `version` varchar(16) NOT NULL COMMENT '版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `install` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否安装',
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth_ids` varchar(255) DEFAULT NULL COMMENT '角色权限ID',
  `head_img` varchar(255) DEFAULT NULL COMMENT '头像',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(40) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `remark` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用,)',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户表';

-- ----------------------------
-- Records of m_system_admin
-- ----------------------------
INSERT INTO `m_system_admin` VALUES ('1', null, '/static/admin/images/head.jpg', 'admin', 'ed696eb5bba1f7460585cc6975e6cf9bf24903dd', null, '', '9', '0', '1', '1615542339', '1617089693', null);

-- ----------------------------
-- Table structure for m_system_auth
-- ----------------------------
DROP TABLE IF EXISTS `m_system_auth`;
CREATE TABLE `m_system_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '权限名称',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth_id` bigint(20) unsigned DEFAULT NULL COMMENT '角色ID',
  `node_id` bigint(20) DEFAULT NULL COMMENT '节点ID',
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `value` text COMMENT '变量值',
  `remark` varchar(100) DEFAULT '' COMMENT '备注信息',
  `sort` int(10) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned DEFAULT '0' COMMENT '管理员ID',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `method` varchar(50) NOT NULL COMMENT '请求方法',
  `title` varchar(100) DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) DEFAULT '' COMMENT 'User-Agent',
  `create_time` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=662 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='后台操作日志表 - 202103';

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

-- ----------------------------
-- Table structure for m_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `m_system_menu`;
CREATE TABLE `m_system_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `remark` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT '' COMMENT '名称',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `href` (`href`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统菜单表';

-- ----------------------------
-- Records of m_system_menu
-- ----------------------------
INSERT INTO `m_system_menu` VALUES ('227', '99999999', '后台首页', 'fa fa-home', 'index/welcome', '', '_self', '0', '1', null, '', null, '1573120497', null);
INSERT INTO `m_system_menu` VALUES ('228', '0', '系统管理', 'fa fa-cog', '', '', '_self', '0', '1', '', '', null, '1588999529', null);
INSERT INTO `m_system_menu` VALUES ('234', '228', '菜单管理', 'fa fa-tree', 'system.menu/index', '', '_self', '10', '1', '', '', null, '1588228555', null);
INSERT INTO `m_system_menu` VALUES ('244', '228', '管理员管理', 'fa fa-user', 'system.admin/index', '', '_self', '12', '1', '', '', '1573185011', '1588228573', null);
INSERT INTO `m_system_menu` VALUES ('245', '228', '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', '', '_self', '11', '1', '', '', '1573435877', '1588228634', null);
INSERT INTO `m_system_menu` VALUES ('246', '228', '节点管理', 'fa fa-list', 'system.node/index', '', '_self', '9', '1', '', '', '1573435919', '1588228648', null);
INSERT INTO `m_system_menu` VALUES ('247', '228', '配置管理', 'fa fa-asterisk', 'system.config/index', '', '_self', '8', '1', '', '', '1573457448', '1588228566', null);
INSERT INTO `m_system_menu` VALUES ('248', '228', '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', '', '_self', '0', '1', '', '', '1573542953', '1588228043', null);
INSERT INTO `m_system_menu` VALUES ('249', '0', '商城管理', 'fa fa-list', '', '', '_self', '0', '1', '', '', '1589439884', '1589439884', null);
INSERT INTO `m_system_menu` VALUES ('250', '249', '商品分类', 'fa fa-calendar-check-o', 'mall.cate/index', '', '_self', '0', '1', '', '', '1589439910', '1589439966', null);
INSERT INTO `m_system_menu` VALUES ('251', '249', '商品管理', 'fa fa-list', 'mall.goods/index', '', '_self', '0', '1', '', '', '1589439931', '1589439942', null);
INSERT INTO `m_system_menu` VALUES ('252', '228', '快捷入口', 'fa fa-list', 'system.quick/index', '', '_self', '0', '1', '', '', '1589623683', '1589623683', null);
INSERT INTO `m_system_menu` VALUES ('253', '228', '日志管理', 'fa fa-connectdevelop', 'system.log/index', '', '_self', '0', '1', '', '', '1589623684', '1589623684', null);
INSERT INTO `m_system_menu` VALUES ('254', '228', '插件管理', 'fa fa-android', 'system.plugin/index', '', '_self', '0', '1', '插件管理模块', '', '1615677684', '1615677927', null);
INSERT INTO `m_system_menu` VALUES ('303', '0', '测试插件菜单', '&#xe66f;', 'test', '', '_self', '0', '1', null, '', '1617108412', '1617108412', null);
INSERT INTO `m_system_menu` VALUES ('304', '303', '查看', '', '/addons/test/index/index', '', '_self', '0', '1', null, '', '1617108412', '1617108412', null);
INSERT INTO `m_system_menu` VALUES ('305', '303', '添加', '', '/addons/test/index/add', '', '_self', '0', '1', null, '', '1617108412', '1617108412', null);
INSERT INTO `m_system_menu` VALUES ('306', '303', '详情', '', '/addons/test/index/detail', '', '_self', '0', '1', null, '', '1617108412', '1617108412', null);

-- ----------------------------
-- Table structure for m_system_node
-- ----------------------------
DROP TABLE IF EXISTS `m_system_node`;
CREATE TABLE `m_system_node` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(100) DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) DEFAULT NULL COMMENT '节点标题',
  `type` tinyint(1) DEFAULT '3' COMMENT '节点类型（1：控制器，2：节点）',
  `is_auth` tinyint(1) unsigned DEFAULT '1' COMMENT '是否启动RBAC权限控制',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '快捷入口名称',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `href` varchar(255) DEFAULT NULL COMMENT '快捷链接',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
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
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `upload_type` varchar(20) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `original_name` varchar(255) DEFAULT NULL COMMENT '文件原名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `image_width` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `image_height` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `image_type` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `image_frames` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `mime_type` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `file_ext` varchar(100) DEFAULT NULL,
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int(10) DEFAULT NULL COMMENT '创建日期',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `upload_time` int(10) DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  KEY `upload_type` (`upload_type`),
  KEY `original_name` (`original_name`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='上传文件表';

-- ----------------------------
-- Records of m_system_uploadfile
-- ----------------------------
INSERT INTO `m_system_uploadfile` VALUES ('316', 'local', '1294681 - 副本.ico', 'http://mango.cn/upload/20210314/84b162a73c432a7474346884e0b6e929.ico', '', '', '', '0', 'image/x-icon', '0', 'ico', '', '1615714262', null, null);
INSERT INTO `m_system_uploadfile` VALUES ('317', 'local', '1294681.png', 'http://mango.cn/upload/20210314/1026a10f1202b9324b4657ddb9ba8361.png', '', '', '', '0', 'image/png', '0', 'png', '', '1615714273', null, null);
INSERT INTO `m_system_uploadfile` VALUES ('318', 'local', '1294681 - 副本.ico', 'http://mango.cn/upload/20210314/266d9bc4d6b893fa5590bbdd772b3ddd.ico', '', '', '', '0', 'image/x-icon', '0', 'ico', '', '1615714299', null, null);
INSERT INTO `m_system_uploadfile` VALUES ('319', 'local', '1294681.png', 'http://mango.cn/upload/20210314/204b0f540f11a5c893bef72ec471b1d6.png', '', '', '', '0', 'image/png', '0', 'png', '', '1615714314', null, null);

-- ----------------------------
-- Table structure for m_text_addondownload
-- ----------------------------
DROP TABLE IF EXISTS `m_text_addondownload`;
CREATE TABLE `m_text_addondownload` (
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

-- ----------------------------
-- Records of m_text_addondownload
-- ----------------------------
