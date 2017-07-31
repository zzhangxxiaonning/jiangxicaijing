-- Tea SQL Dump Program
-- 
-- DATE : 2017-07-31 11:32:59
-- Vol : 1
DROP TABLE IF EXISTS `cms_actapp`;
CREATE TABLE `cms_actapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(200) DEFAULT NULL COMMENT '栏目名称',
  `up_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级id',
  `path` varchar(200) DEFAULT NULL COMMENT '栏目路径',
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 默认1显示 0隐藏',
  `admin_id` int(11) DEFAULT NULL COMMENT '添加管理员id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_actapp ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','教导处','0','0','0','1','2','1500973660','1500973660');
INSERT INTO cms_actapp ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('2','学生处','0','0','0','1','2','1500973670','1500973670');
INSERT INTO cms_actapp ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('3','组织部','0','0','0','1','2','1500973685','1500973685');
INSERT INTO cms_actapp ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('4','李欣','1','0-1','0','1','2','1500973697','1500973697');
INSERT INTO cms_actapp ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('5','刘林','3','0-3','0','1','2','1500973707','1500973707');
INSERT INTO cms_actapp ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('6','方宇','2','0-2','0','1','2','1500973727','1500973727');
DROP TABLE IF EXISTS `cms_actattr`;
CREATE TABLE `cms_actattr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(200) DEFAULT NULL COMMENT '栏目名称',
  `up_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级id',
  `path` varchar(200) DEFAULT NULL COMMENT '栏目路径',
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 默认1显示 0隐藏',
  `admin_id` int(11) DEFAULT NULL COMMENT '添加管理员id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_actattr ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','级别','0','0','0','1','2','1500973738','1500973738');
INSERT INTO cms_actattr ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('2','校级','1','0-1','0','1','2','1500973752','1500973752');
INSERT INTO cms_actattr ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('3','院级','1','0-1','0','1','2','1500973764','1500973764');
INSERT INTO cms_actattr ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('4','系级','1','0-1','0','1','2','1500973774','1500973774');
INSERT INTO cms_actattr ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('5','123456','1','0-1','0','1','2','1501135149','1501135149');
DROP TABLE IF EXISTS `cms_activity`;
CREATE TABLE `cms_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `rank_id` int(11) NOT NULL DEFAULT '0' COMMENT '级别ID',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `img` text COMMENT '多图',
  `nums` int(11) DEFAULT '0' COMMENT '活动限定人数',
  `address` varchar(255) DEFAULT NULL COMMENT '活动具体地址',
  `start_time` int(11) DEFAULT '0' COMMENT '活动开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '活动结束时间',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活动费用',
  `content` text COMMENT '活动内容',
  `approval_id` int(11) NOT NULL DEFAULT '0' COMMENT '审批机构',
  `approver_id` int(11) NOT NULL DEFAULT '0' COMMENT '审批人',
  `apply_is` tinyint(1) NOT NULL DEFAULT '0' COMMENT '报名是否需要审核 默认0不审核 1审核',
  `examine` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审核状态 默认1审核中 2审核通过 3审核未通过',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 默认1显示 0隐藏',
  `admin_id` int(11) DEFAULT '0' COMMENT '管理员ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_activity ( `id`, `mid`, `title`, `rank_id`, `thumb`, `img`, `nums`, `address`, `start_time`, `end_time`, `money`, `content`, `approval_id`, `approver_id`, `apply_is`, `examine`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','1','铿锵四人行','4','/Uploads/image/20170725/20170725200816_55994.png',',/Source/kindeditor/php/../attached/image/20170725/20170725141237_64813.png,/Source/kindeditor/php/../attached/image/20170725/20170725141237_15300.png,/Source/kindeditor/php/../attached/image/20170725/20170725141329_88563.png,','30','','1501325757','1501367457','0.00','<p style=\"text-align:center;\">
	静夜思
</p>
<p style=\"text-align:center;\">
	            ----李白
</p>
<p style=\"text-align:center;\">
	床前明月光，疑是地上霜
</p>
<p style=\"text-align:center;\">
	举头望明月，低头思故乡
</p>','1','4','0','2','2','1','0','1501037058','1501037058');
DROP TABLE IF EXISTS `cms_actrep`;
CREATE TABLE `cms_actrep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '活动ID',
  `content` varchar(512) DEFAULT NULL COMMENT '内容',
  `warn` tinyint(1) NOT NULL DEFAULT '0' COMMENT '提醒状态 默认0提醒 1不提醒',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '举报类型 默认0 线下活动1 直播2 录播3',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 默认0未查看 1已查看',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_actrep ( `id`, `mid`, `aid`, `content`, `warn`, `type`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','1','1','你们这个直播内容有一些违反网络安全，请及时做出处理','1','2','1','0','1500000000','1501067438');
DROP TABLE IF EXISTS `cms_ad`;
CREATE TABLE `cms_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '广告名称',
  `url` varchar(200) NOT NULL COMMENT '跳转地址',
  `target` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1新窗口打开 0 当前窗口打开',
  `image` varchar(200) NOT NULL COMMENT '广告图片',
  `cat_id` int(11) NOT NULL COMMENT '广告位id',
  `start_time` int(11) DEFAULT NULL COMMENT '开始时间',
  `end_time` int(11) DEFAULT NULL COMMENT '结束时间',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(111) NOT NULL DEFAULT '1' COMMENT '1启用0禁用',
  `admin_id` int(11) NOT NULL COMMENT '管理员id',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_ad ( `id`, `name`, `url`, `target`, `image`, `cat_id`, `start_time`, `end_time`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('28','图一','','1','/Uploads/image/20170725/20170725153812_67216.png','9','0','0','0','0','2','1500968297','1500968313');
DROP TABLE IF EXISTS `cms_ad_cat`;
CREATE TABLE `cms_ad_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `info` varchar(200) NOT NULL COMMENT '广告描述',
  `size_info` varchar(200) NOT NULL COMMENT '尺寸说明',
  `sort` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_ad_cat ( `id`, `name`, `info`, `size_info`, `sort`, `update_time` ) VALUES  ('9','首页轮播图','首页轮播图','首页轮播图宽*高','0','1500968178');
DROP TABLE IF EXISTS `cms_admin`;
CREATE TABLE `cms_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密码',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '真实姓名/昵称',
  `tel` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `role_id` tinyint(5) NOT NULL COMMENT '用户角色',
  `login_time` int(11) NOT NULL COMMENT '最近一次登录时间',
  `login_ip` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '最近一次登录ip',
  `sign` char(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '加密字符窜',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账户是否启用1启用 0禁用',
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '添加人id',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_admin ( `id`, `username`, `password`, `name`, `tel`, `email`, `role_id`, `login_time`, `login_ip`, `sign`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('2','admin','62b1d5876afb76daa88c580132fb4117','ning','12314456423013','','1','1473487506','127.0.0.1','nr20g','1','1','1405235431','1496650737');
INSERT INTO cms_admin ( `id`, `username`, `password`, `name`, `tel`, `email`, `role_id`, `login_time`, `login_ip`, `sign`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('11','asdasdasdas','f310a28e1a9feb627a246fd10a06a7d2','asd','18844596875','369621609@qq.com','2','0','','9blDC','1','2','1496651111','1496651111');
DROP TABLE IF EXISTS `cms_admin_logs`;
CREATE TABLE `cms_admin_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL COMMENT '操作类型',
  `ip_address` varchar(255) DEFAULT NULL COMMENT '操作ip',
  `info` varchar(255) DEFAULT NULL COMMENT '操作描述',
  `admin_id` int(11) DEFAULT '0' COMMENT '管理员id',
  `admin_name` varchar(255) DEFAULT NULL COMMENT '管理员名称',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('1','login','127.0.0.1','用户名：admin;密码：; 登录成功！','0','admin','1501135016');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('2','Actattr','127.0.0.1','属性：123456,ID:5 添加成功','2','admin','1501135149');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('3','Teacher','127.0.0.1','教师：张庆,ID:1 编辑成功','2','admin','1501139685');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('4','Teacher','127.0.0.1','教师：李玲,ID:2 编辑成功','2','admin','1501139703');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('5','Circle','127.0.0.1','创客项目：关于对自然资源的消耗绘画,ID:1 编辑成功','2','admin','1501143271');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('6','Circle','127.0.0.1','创客项目：关于对自然资源的消耗绘画,ID:1 编辑成功','2','admin','1501143310');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('7','Circle','127.0.0.1','创客项目：关于对自然资源的消耗绘画,ID:1 编辑成功','2','admin','1501143404');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('8','Circle','127.0.0.1','科研申请：关于对自然资源的消耗绘画,ID:1 编辑成功','2','admin','1501151712');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('9','Circle','127.0.0.1','科研申请：关于对自然资源的消耗绘画,ID:1 编辑成功','2','admin','1501152056');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('10','Circle','127.0.0.1','科研申请：关于对自然资源的消耗绘画,ID:1 编辑成功','2','admin','1501152160');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('11','Circle','127.0.0.1','科研申请：关于对自然资源的消耗绘画,ID:1 编辑成功','2','admin','1501152169');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('12','Circle','127.0.0.1','科研申请：关于对自然资源的消耗绘画,ID:1 编辑成功','2','admin','1501152210');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('13','Circle','127.0.0.1','科研申请：关于对自然资源的消耗绘画,ID:1 编辑成功','2','admin','1501152464');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('14','Apply','127.0.0.1','科研申请：关于对自然资源的消耗绘画,ID:1 编辑成功','2','admin','1501152799');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('15','Apply','127.0.0.1','科研申请：关于对自然资源的消耗绘画,ID:1 编辑成功','2','admin','1501152843');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('16','Apply','127.0.0.1','科研申请：关于对自然资源的消耗绘画,ID:1 编辑成功','2','admin','1501152867');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('17','Apply','127.0.0.1','科研申请：关于对自然资源的消耗绘画,ID:2 编辑成功','2','admin','1501152986');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('18','login','127.0.0.1','用户名：admin;密码：ibnagoo00; 用户名或密码错误！','0','','1501207901');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('19','login','127.0.0.1','用户名：admin;密码：; 登录成功！','0','admin','1501207908');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('20','Student','127.0.0.1','用户：,ID:9 删除成功','2','admin','1501212509');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('21','Student','127.0.0.1','用户：张明,ID:2 修改状态成功','2','admin','1501222450');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('22','Student','127.0.0.1','用户：李辉,ID:8 修改状态成功','2','admin','1501222452');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('23','Circle','127.0.0.1','批量导入联系人，数量：2','2','admin','1501225009');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('24','Circle','127.0.0.1','批量导入联系人，数量：1','2','admin','1501225646');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('25','Circle','127.0.0.1','批量导入学生，数量：1','2','admin','1501226007');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('26','login','127.0.0.1','用户名：admin;密码：; 登录成功！','0','admin','1501466761');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('27','Member','127.0.0.1','用户：张宁,ID:1 编辑成功','2','admin','1501470209');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('28','Content','127.0.0.1','单页：校园介绍,ID:1 添加成功','2','admin','1501470382');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('29','Flash','127.0.0.1','直播：测试直播,ID:2 编辑成功','2','admin','1501470803');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('30','Content','127.0.0.1','单页：校园介绍,ID:1 添加成功','2','admin','1501470860');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('31','Content','127.0.0.1','单页：校园介绍,ID:1 编辑成功','2','admin','1501471182');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('32','Member','127.0.0.1','用户：张宁,ID:1 编辑成功','2','admin','1501471294');
INSERT INTO cms_admin_logs ( `id`, `type`, `ip_address`, `info`, `admin_id`, `admin_name`, `create_time` ) VALUES  ('33','Content','127.0.0.1','单页：校园介绍,ID:1 编辑成功','2','admin','1501471973');
DROP TABLE IF EXISTS `cms_admin_role`;
CREATE TABLE `cms_admin_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL COMMENT '用户组名称',
  `info` varchar(200) NOT NULL COMMENT '描述',
  `rules` char(80) NOT NULL DEFAULT '1,2' COMMENT '组所有权限',
  `sort` int(11) NOT NULL COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1启用 0禁用',
  `admin_id` int(11) NOT NULL COMMENT '添加管理员id',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_admin_role ( `id`, `title`, `info`, `rules`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','系统管理员','系统管理员','22,23,24,25,26,27','0','1','1','0','0');
INSERT INTO cms_admin_role ( `id`, `title`, `info`, `rules`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('2','站点管理员','',',1,2,7,','1','1','2','1444818721','1498805963');
DROP TABLE IF EXISTS `cms_admin_role_access`;
CREATE TABLE `cms_admin_role_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_admin_role_access ( `uid`, `group_id` ) VALUES  ('2','1');
DROP TABLE IF EXISTS `cms_admin_rule`;
CREATE TABLE `cms_admin_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(40) NOT NULL,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL DEFAULT '0',
  `condition` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('1','index','Index/index','控制面板','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('2','index','Index/onlogin','退出','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('3','config','Config/index','配置管理','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('4','ads','Ads/index','广告管理','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('5','ads','Ads/position_lists','广告位管理','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('6','Content','Content/index','单页列表','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('7','Order','Order/index','线下讲堂','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('8','Order','Order2/index2','校园竞赛','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('9','Order','Order3/index3','视频课堂','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('10','Order','Order4/index4','充值提现','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('11','Member','Member/index','用户列表','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('12','Download','Download/index','软件列表','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('13','Expert','Expert/index','专家列表','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('14','News','News/index','资讯列表','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('15','News','Newscat/act_index','资讯分类','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('16','Article','Article/index','作品列表','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('17','Article','Articlecat/act_index','作品分类','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('18','Library','Library/index','内容列表','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('19','Library','Libcat/act_index','栏目列表','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('20','Flash','Flash/index','直播列表','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('21','Flash','Flashrec/rec_index','录播列表','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('22','Flash','Flashcat/act_index','视频分类','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('23','Activity','Activity/index','内容列表','1','1','0','');
INSERT INTO cms_admin_rule ( `id`, `module`, `name`, `title`, `type`, `status`, `sort`, `condition` ) VALUES  ('24','Activity','Activitycat/act_index','活动分类','1','1','0','');
DROP TABLE IF EXISTS `cms_apply`;
CREATE TABLE `cms_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '科研ID',
  `mid` int(11) NOT NULL DEFAULT '0' COMMENT '申请人ID',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT '导师ID',
  `phone` varchar(128) DEFAULT NULL COMMENT '导师手机号',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '申报金额',
  `files_start` varchar(512) DEFAULT NULL COMMENT '申请书文件',
  `files_in` varchar(512) DEFAULT NULL COMMENT '中期检查文件',
  `files_end` varchar(512) DEFAULT NULL COMMENT '结题文件',
  `grade` int(11) NOT NULL DEFAULT '0' COMMENT '评分',
  `content` text COMMENT '说明内容',
  `examine` tinyint(1) NOT NULL DEFAULT '0' COMMENT '申请状态 默认0未提交（待申请） 1已提交（审核中） 2通过（审核通过） 3驳回（审核不通过）',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_apply ( `id`, `aid`, `mid`, `tid`, `phone`, `money`, `files_start`, `files_in`, `files_end`, `grade`, `content`, `examine`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','1','1','1','18810393754','100.00','/Source/kindeditor/attached/file/20170725/20170725101809_31508.docx','/Source/kindeditor/attached/file/20170725/20170725101809_31508.docx','/Source/kindeditor/attached/file/20170725/20170725101809_31508.docx','1','哈哈 ，这个暂时等一下审批
阿卡','1','0','1500000000','1501152867');
INSERT INTO cms_apply ( `id`, `aid`, `mid`, `tid`, `phone`, `money`, `files_start`, `files_in`, `files_end`, `grade`, `content`, `examine`, `admin_id`, `create_time`, `update_time` ) VALUES  ('2','1','2','2','','200.00','/Source/kindeditor/attached/file/20170725/20170725101809_31508.docx','','','0','','1','0','1500000000','1501152986');
DROP TABLE IF EXISTS `cms_area`;
CREATE TABLE `cms_area` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `up_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级id',
  `path` varchar(200) NOT NULL COMMENT '路径',
  `level` tinyint(5) NOT NULL DEFAULT '1',
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`up_id`),
  KEY `region_type` (`path`),
  KEY `agency_id` (`update_time`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1','中国','0','0-1','1','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2','北京','1','0-1-2','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3','安徽','1','0-1-3','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('4','福建','1','0-1-4','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('5','甘肃','1','0-1-5','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('6','广东','1','0-1-6','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('7','广西','1','0-1-7','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('8','贵州','1','0-1-8','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('9','海南','1','0-1-9','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('10','河北','1','0-1-10','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('11','河南','1','0-1-11','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('12','黑龙江','1','0-1-12','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('13','湖北','1','0-1-13','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('14','湖南','1','0-1-14','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('15','吉林','1','0-1-15','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('16','江苏','1','0-1-16','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('17','江西','1','0-1-17','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('18','辽宁','1','0-1-18','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('19','内蒙古','1','0-1-19','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('20','宁夏','1','0-1-20','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('21','青海','1','0-1-21','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('22','山东','1','0-1-22','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('23','山西','1','0-1-23','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('24','陕西','1','0-1-24','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('25','上海','1','0-1-25','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('26','四川','1','0-1-26','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('27','天津','1','0-1-27','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('28','西藏','1','0-1-28','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('29','新疆','1','0-1-29','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('30','云南','1','0-1-30','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('31','浙江','1','0-1-31','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('32','重庆','1','0-1-32','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('33','香港','1','0-1-33','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('34','澳门','1','0-1-34','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('35','台湾','1','0-1-35','2','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('36','安庆','3','0-1-3-36','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('37','蚌埠','3','0-1-3-37','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('38','巢湖','3','0-1-3-38','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('39','池州','3','0-1-3-39','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('40','滁州','3','0-1-3-40','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('41','阜阳','3','0-1-3-41','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('42','淮北','3','0-1-3-42','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('43','淮南','3','0-1-3-43','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('44','黄山','3','0-1-3-44','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('45','六安','3','0-1-3-45','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('46','马鞍山','3','0-1-3-46','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('47','宿州','3','0-1-3-47','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('48','铜陵','3','0-1-3-48','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('49','芜湖','3','0-1-3-49','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('50','宣城','3','0-1-3-50','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('51','亳州','3','0-1-3-51','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('52','北京','2','0-1-2-52','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('53','福州','4','0-1-4-53','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('54','龙岩','4','0-1-4-54','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('55','南平','4','0-1-4-55','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('56','宁德','4','0-1-4-56','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('57','莆田','4','0-1-4-57','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('58','泉州','4','0-1-4-58','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('59','三明','4','0-1-4-59','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('60','厦门','4','0-1-4-60','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('61','漳州','4','0-1-4-61','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('62','兰州','5','0-1-5-62','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('63','白银','5','0-1-5-63','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('64','定西','5','0-1-5-64','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('65','甘南','5','0-1-5-65','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('66','嘉峪关','5','0-1-5-66','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('67','金昌','5','0-1-5-67','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('68','酒泉','5','0-1-5-68','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('69','临夏','5','0-1-5-69','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('70','陇南','5','0-1-5-70','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('71','平凉','5','0-1-5-71','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('72','庆阳','5','0-1-5-72','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('73','天水','5','0-1-5-73','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('74','武威','5','0-1-5-74','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('75','张掖','5','0-1-5-75','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('76','广州','6','0-1-6-76','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('77','深圳','6','0-1-6-77','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('78','潮州','6','0-1-6-78','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('79','东莞','6','0-1-6-79','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('80','佛山','6','0-1-6-80','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('81','河源','6','0-1-6-81','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('82','惠州','6','0-1-6-82','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('83','江门','6','0-1-6-83','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('84','揭阳','6','0-1-6-84','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('85','茂名','6','0-1-6-85','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('86','梅州','6','0-1-6-86','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('87','清远','6','0-1-6-87','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('88','汕头','6','0-1-6-88','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('89','汕尾','6','0-1-6-89','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('90','韶关','6','0-1-6-90','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('91','阳江','6','0-1-6-91','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('92','云浮','6','0-1-6-92','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('93','湛江','6','0-1-6-93','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('94','肇庆','6','0-1-6-94','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('95','中山','6','0-1-6-95','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('96','珠海','6','0-1-6-96','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('97','南宁','7','0-1-7-97','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('98','桂林','7','0-1-7-98','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('99','百色','7','0-1-7-99','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('100','北海','7','0-1-7-100','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('101','崇左','7','0-1-7-101','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('102','防城港','7','0-1-7-102','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('103','贵港','7','0-1-7-103','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('104','河池','7','0-1-7-104','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('105','贺州','7','0-1-7-105','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('106','来宾','7','0-1-7-106','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('107','柳州','7','0-1-7-107','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('108','钦州','7','0-1-7-108','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('109','梧州','7','0-1-7-109','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('110','玉林','7','0-1-7-110','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('111','贵阳','8','0-1-8-111','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('112','安顺','8','0-1-8-112','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('113','毕节','8','0-1-8-113','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('114','六盘水','8','0-1-8-114','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('115','黔东南','8','0-1-8-115','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('116','黔南','8','0-1-8-116','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('117','黔西南','8','0-1-8-117','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('118','铜仁','8','0-1-8-118','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('119','遵义','8','0-1-8-119','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('120','海口','9','0-1-9-120','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('121','三亚','9','0-1-9-121','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('122','白沙','9','0-1-9-122','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('123','保亭','9','0-1-9-123','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('124','昌江','9','0-1-9-124','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('125','澄迈县','9','0-1-9-125','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('126','定安县','9','0-1-9-126','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('127','东方','9','0-1-9-127','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('128','乐东','9','0-1-9-128','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('129','临高县','9','0-1-9-129','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('130','陵水','9','0-1-9-130','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('131','琼海','9','0-1-9-131','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('132','琼中','9','0-1-9-132','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('133','屯昌县','9','0-1-9-133','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('134','万宁','9','0-1-9-134','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('135','文昌','9','0-1-9-135','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('136','五指山','9','0-1-9-136','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('137','儋州','9','0-1-9-137','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('138','石家庄','10','0-1-10-138','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('139','保定','10','0-1-10-139','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('140','沧州','10','0-1-10-140','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('141','承德','10','0-1-10-141','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('142','邯郸','10','0-1-10-142','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('143','衡水','10','0-1-10-143','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('144','廊坊','10','0-1-10-144','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('145','秦皇岛','10','0-1-10-145','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('146','唐山','10','0-1-10-146','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('147','邢台','10','0-1-10-147','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('148','张家口','10','0-1-10-148','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('149','郑州','11','0-1-11-149','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('150','洛阳','11','0-1-11-150','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('151','开封','11','0-1-11-151','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('152','安阳','11','0-1-11-152','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('153','鹤壁','11','0-1-11-153','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('154','济源','11','0-1-11-154','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('155','焦作','11','0-1-11-155','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('156','南阳','11','0-1-11-156','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('157','平顶山','11','0-1-11-157','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('158','三门峡','11','0-1-11-158','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('159','商丘','11','0-1-11-159','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('160','新乡','11','0-1-11-160','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('161','信阳','11','0-1-11-161','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('162','许昌','11','0-1-11-162','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('163','周口','11','0-1-11-163','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('164','驻马店','11','0-1-11-164','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('165','漯河','11','0-1-11-165','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('166','濮阳','11','0-1-11-166','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('167','哈尔滨','12','0-1-12-167','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('168','大庆','12','0-1-12-168','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('169','大兴安岭','12','0-1-12-169','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('170','鹤岗','12','0-1-12-170','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('171','黑河','12','0-1-12-171','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('172','鸡西','12','0-1-12-172','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('173','佳木斯','12','0-1-12-173','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('174','牡丹江','12','0-1-12-174','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('175','七台河','12','0-1-12-175','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('176','齐齐哈尔','12','0-1-12-176','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('177','双鸭山','12','0-1-12-177','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('178','绥化','12','0-1-12-178','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('179','伊春','12','0-1-12-179','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('180','武汉','13','0-1-13-180','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('181','仙桃','13','0-1-13-181','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('182','鄂州','13','0-1-13-182','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('183','黄冈','13','0-1-13-183','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('184','黄石','13','0-1-13-184','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('185','荆门','13','0-1-13-185','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('186','荆州','13','0-1-13-186','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('187','潜江','13','0-1-13-187','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('188','神农架林区','13','0-1-13-188','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('189','十堰','13','0-1-13-189','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('190','随州','13','0-1-13-190','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('191','天门','13','0-1-13-191','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('192','咸宁','13','0-1-13-192','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('193','襄阳','13','0-1-13-193','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('194','孝感','13','0-1-13-194','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('195','宜昌','13','0-1-13-195','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('196','恩施','13','0-1-13-196','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('197','长沙','14','0-1-14-197','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('198','张家界','14','0-1-14-198','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('199','常德','14','0-1-14-199','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('200','郴州','14','0-1-14-200','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('201','衡阳','14','0-1-14-201','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('202','怀化','14','0-1-14-202','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('203','娄底','14','0-1-14-203','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('204','邵阳','14','0-1-14-204','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('205','湘潭','14','0-1-14-205','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('206','湘西','14','0-1-14-206','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('207','益阳','14','0-1-14-207','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('208','永州','14','0-1-14-208','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('209','岳阳','14','0-1-14-209','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('210','株洲','14','0-1-14-210','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('211','长春','15','0-1-15-211','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('212','吉林','15','0-1-15-212','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('213','白城','15','0-1-15-213','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('214','白山','15','0-1-15-214','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('215','辽源','15','0-1-15-215','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('216','四平','15','0-1-15-216','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('217','松原','15','0-1-15-217','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('218','通化','15','0-1-15-218','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('219','延边','15','0-1-15-219','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('220','南京','16','0-1-16-220','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('221','苏州','16','0-1-16-221','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('222','无锡','16','0-1-16-222','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('223','常州','16','0-1-16-223','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('224','淮安','16','0-1-16-224','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('225','连云港','16','0-1-16-225','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('226','南通','16','0-1-16-226','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('227','宿迁','16','0-1-16-227','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('228','泰州','16','0-1-16-228','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('229','徐州','16','0-1-16-229','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('230','盐城','16','0-1-16-230','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('231','扬州','16','0-1-16-231','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('232','镇江','16','0-1-16-232','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('233','南昌','17','0-1-17-233','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('234','抚州','17','0-1-17-234','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('235','赣州','17','0-1-17-235','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('236','吉安','17','0-1-17-236','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('237','景德镇','17','0-1-17-237','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('238','九江','17','0-1-17-238','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('239','萍乡','17','0-1-17-239','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('240','上饶','17','0-1-17-240','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('241','新余','17','0-1-17-241','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('242','宜春','17','0-1-17-242','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('243','鹰潭','17','0-1-17-243','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('244','沈阳','18','0-1-18-244','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('245','大连','18','0-1-18-245','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('246','鞍山','18','0-1-18-246','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('247','本溪','18','0-1-18-247','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('248','朝阳','18','0-1-18-248','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('249','丹东','18','0-1-18-249','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('250','抚顺','18','0-1-18-250','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('251','阜新','18','0-1-18-251','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('252','葫芦岛','18','0-1-18-252','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('253','锦州','18','0-1-18-253','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('254','辽阳','18','0-1-18-254','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('255','盘锦','18','0-1-18-255','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('256','铁岭','18','0-1-18-256','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('257','营口','18','0-1-18-257','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('258','呼和浩特','19','0-1-19-258','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('259','阿拉善盟','19','0-1-19-259','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('260','巴彦淖尔盟','19','0-1-19-260','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('261','包头','19','0-1-19-261','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('262','赤峰','19','0-1-19-262','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('263','鄂尔多斯','19','0-1-19-263','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('264','呼伦贝尔','19','0-1-19-264','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('265','通辽','19','0-1-19-265','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('266','乌海','19','0-1-19-266','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('267','乌兰察布市','19','0-1-19-267','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('268','锡林郭勒盟','19','0-1-19-268','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('269','兴安盟','19','0-1-19-269','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('270','银川','20','0-1-20-270','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('271','固原','20','0-1-20-271','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('272','石嘴山','20','0-1-20-272','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('273','吴忠','20','0-1-20-273','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('274','中卫','20','0-1-20-274','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('275','西宁','21','0-1-21-275','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('276','果洛','21','0-1-21-276','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('277','海北','21','0-1-21-277','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('278','海东','21','0-1-21-278','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('279','海南','21','0-1-21-279','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('280','海西','21','0-1-21-280','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('281','黄南','21','0-1-21-281','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('282','玉树','21','0-1-21-282','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('283','济南','22','0-1-22-283','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('284','青岛','22','0-1-22-284','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('285','滨州','22','0-1-22-285','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('286','德州','22','0-1-22-286','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('287','东营','22','0-1-22-287','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('288','菏泽','22','0-1-22-288','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('289','济宁','22','0-1-22-289','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('290','莱芜','22','0-1-22-290','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('291','聊城','22','0-1-22-291','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('292','临沂','22','0-1-22-292','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('293','日照','22','0-1-22-293','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('294','泰安','22','0-1-22-294','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('295','威海','22','0-1-22-295','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('296','潍坊','22','0-1-22-296','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('297','烟台','22','0-1-22-297','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('298','枣庄','22','0-1-22-298','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('299','淄博','22','0-1-22-299','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('300','太原','23','0-1-23-300','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('301','长治','23','0-1-23-301','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('302','大同','23','0-1-23-302','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('303','晋城','23','0-1-23-303','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('304','晋中','23','0-1-23-304','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('305','临汾','23','0-1-23-305','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('306','吕梁','23','0-1-23-306','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('307','朔州','23','0-1-23-307','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('308','忻州','23','0-1-23-308','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('309','阳泉','23','0-1-23-309','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('310','运城','23','0-1-23-310','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('311','西安','24','0-1-24-311','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('312','安康','24','0-1-24-312','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('313','宝鸡','24','0-1-24-313','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('314','汉中','24','0-1-24-314','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('315','商洛','24','0-1-24-315','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('316','铜川','24','0-1-24-316','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('317','渭南','24','0-1-24-317','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('318','咸阳','24','0-1-24-318','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('319','延安','24','0-1-24-319','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('320','榆林','24','0-1-24-320','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('321','上海','25','0-1-25-321','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('322','成都','26','0-1-26-322','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('323','绵阳','26','0-1-26-323','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('324','阿坝','26','0-1-26-324','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('325','巴中','26','0-1-26-325','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('326','达州','26','0-1-26-326','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('327','德阳','26','0-1-26-327','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('328','甘孜','26','0-1-26-328','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('329','广安','26','0-1-26-329','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('330','广元','26','0-1-26-330','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('331','乐山','26','0-1-26-331','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('332','凉山','26','0-1-26-332','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('333','眉山','26','0-1-26-333','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('334','南充','26','0-1-26-334','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('335','内江','26','0-1-26-335','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('336','攀枝花','26','0-1-26-336','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('337','遂宁','26','0-1-26-337','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('338','雅安','26','0-1-26-338','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('339','宜宾','26','0-1-26-339','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('340','资阳','26','0-1-26-340','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('341','自贡','26','0-1-26-341','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('342','泸州','26','0-1-26-342','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('343','天津','27','0-1-27-343','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('344','拉萨','28','0-1-28-344','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('345','阿里','28','0-1-28-345','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('346','昌都','28','0-1-28-346','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('347','林芝','28','0-1-28-347','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('348','那曲','28','0-1-28-348','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('349','日喀则','28','0-1-28-349','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('350','山南','28','0-1-28-350','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('351','乌鲁木齐','29','0-1-29-351','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('352','阿克苏','29','0-1-29-352','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('353','阿拉尔','29','0-1-29-353','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('354','巴音郭楞','29','0-1-29-354','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('355','博尔塔拉','29','0-1-29-355','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('356','昌吉','29','0-1-29-356','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('357','哈密','29','0-1-29-357','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('358','和田','29','0-1-29-358','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('359','喀什','29','0-1-29-359','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('360','克拉玛依','29','0-1-29-360','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('361','克孜勒苏','29','0-1-29-361','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('362','石河子','29','0-1-29-362','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('363','图木舒克','29','0-1-29-363','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('364','吐鲁番','29','0-1-29-364','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('365','五家渠','29','0-1-29-365','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('366','伊犁','29','0-1-29-366','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('367','昆明','30','0-1-30-367','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('368','怒江','30','0-1-30-368','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('369','普洱','30','0-1-30-369','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('370','丽江','30','0-1-30-370','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('371','保山','30','0-1-30-371','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('372','楚雄','30','0-1-30-372','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('373','大理','30','0-1-30-373','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('374','德宏','30','0-1-30-374','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('375','迪庆','30','0-1-30-375','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('376','红河','30','0-1-30-376','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('377','临沧','30','0-1-30-377','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('378','曲靖','30','0-1-30-378','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('379','文山','30','0-1-30-379','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('380','西双版纳','30','0-1-30-380','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('381','玉溪','30','0-1-30-381','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('382','昭通','30','0-1-30-382','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('383','杭州','31','0-1-31-383','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('384','湖州','31','0-1-31-384','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('385','嘉兴','31','0-1-31-385','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('386','金华','31','0-1-31-386','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('387','丽水','31','0-1-31-387','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('388','宁波','31','0-1-31-388','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('389','绍兴','31','0-1-31-389','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('390','台州','31','0-1-31-390','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('391','温州','31','0-1-31-391','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('392','舟山','31','0-1-31-392','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('393','衢州','31','0-1-31-393','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('394','重庆','32','0-1-32-394','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('395','香港','33','0-1-33-395','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('396','澳门','34','0-1-34-396','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('397','台湾','35','0-1-35-397','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('398','迎江区','36','0-1-3-36-398','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('399','大观区','36','0-1-3-36-399','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('400','宜秀区','36','0-1-3-36-400','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('401','桐城市','36','0-1-3-36-401','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('402','怀宁县','36','0-1-3-36-402','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('403','枞阳县','36','0-1-3-36-403','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('404','潜山县','36','0-1-3-36-404','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('405','太湖县','36','0-1-3-36-405','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('406','宿松县','36','0-1-3-36-406','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('407','望江县','36','0-1-3-36-407','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('408','岳西县','36','0-1-3-36-408','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('409','中市区','37','0-1-3-37-409','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('410','东市区','37','0-1-3-37-410','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('411','西市区','37','0-1-3-37-411','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('412','郊区','37','0-1-3-37-412','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('413','怀远县','37','0-1-3-37-413','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('414','五河县','37','0-1-3-37-414','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('415','固镇县','37','0-1-3-37-415','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('416','居巢区','38','0-1-3-38-416','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('417','庐江县','38','0-1-3-38-417','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('418','无为县','38','0-1-3-38-418','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('419','含山县','38','0-1-3-38-419','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('420','和县','38','0-1-3-38-420','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('421','贵池区','39','0-1-3-39-421','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('422','东至县','39','0-1-3-39-422','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('423','石台县','39','0-1-3-39-423','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('424','青阳县','39','0-1-3-39-424','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('425','琅琊区','40','0-1-3-40-425','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('426','南谯区','40','0-1-3-40-426','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('427','天长市','40','0-1-3-40-427','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('428','明光市','40','0-1-3-40-428','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('429','来安县','40','0-1-3-40-429','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('430','全椒县','40','0-1-3-40-430','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('431','定远县','40','0-1-3-40-431','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('432','凤阳县','40','0-1-3-40-432','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('433','蚌山区','41','0-1-3-41-433','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('434','龙子湖区','41','0-1-3-41-434','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('435','禹会区','41','0-1-3-41-435','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('436','淮上区','41','0-1-3-41-436','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('437','颍州区','41','0-1-3-41-437','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('438','颍东区','41','0-1-3-41-438','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('439','颍泉区','41','0-1-3-41-439','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('440','界首市','41','0-1-3-41-440','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('441','临泉县','41','0-1-3-41-441','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('442','太和县','41','0-1-3-41-442','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('443','阜南县','41','0-1-3-41-443','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('444','颍上县','41','0-1-3-41-444','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('445','相山区','42','0-1-3-42-445','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('446','杜集区','42','0-1-3-42-446','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('447','烈山区','42','0-1-3-42-447','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('448','濉溪县','42','0-1-3-42-448','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('449','田家庵区','43','0-1-3-43-449','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('450','大通区','43','0-1-3-43-450','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('451','谢家集区','43','0-1-3-43-451','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('452','八公山区','43','0-1-3-43-452','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('453','潘集区','43','0-1-3-43-453','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('454','凤台县','43','0-1-3-43-454','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('455','屯溪区','44','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('456','黄山区','44','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('457','徽州区','44','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('458','歙县','44','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('459','休宁县','44','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('460','黟县','44','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('461','祁门县','44','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('462','金安区','45','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('463','裕安区','45','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('464','寿县','45','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('465','霍邱县','45','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('466','舒城县','45','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('467','金寨县','45','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('468','霍山县','45','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('469','雨山区','46','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('470','花山区','46','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('471','金家庄区','46','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('472','当涂县','46','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('473','埇桥区','47','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('474','砀山县','47','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('475','萧县','47','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('476','灵璧县','47','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('477','泗县','47','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('478','铜官山区','48','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('479','狮子山区','48','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('480','郊区','48','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('481','铜陵县','48','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('482','镜湖区','49','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('483','弋江区','49','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('484','鸠江区','49','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('485','三山区','49','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('486','芜湖县','49','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('487','繁昌县','49','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('488','南陵县','49','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('489','宣州区','50','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('490','宁国市','50','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('491','郎溪县','50','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('492','广德县','50','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('493','泾县','50','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('494','绩溪县','50','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('495','旌德县','50','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('496','涡阳县','51','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('497','蒙城县','51','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('498','利辛县','51','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('499','谯城区','51','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('500','东城区','52','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('501','西城区','52','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('502','海淀区','52','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('503','朝阳区','52','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('504','崇文区','52','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('505','宣武区','52','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('506','丰台区','52','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('507','石景山区','52','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('508','房山区','52','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('509','门头沟区','52','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('510','通州区','52','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('511','顺义区','52','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('512','昌平区','52','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('513','怀柔区','52','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('514','平谷区','52','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('515','大兴区','52','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('516','密云县','52','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('517','延庆县','52','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('518','鼓楼区','53','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('519','台江区','53','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('520','仓山区','53','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('521','马尾区','53','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('522','晋安区','53','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('523','福清市','53','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('524','长乐市','53','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('525','闽侯县','53','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('526','连江县','53','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('527','罗源县','53','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('528','闽清县','53','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('529','永泰县','53','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('530','平潭县','53','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('531','新罗区','54','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('532','漳平市','54','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('533','长汀县','54','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('534','永定县','54','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('535','上杭县','54','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('536','武平县','54','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('537','连城县','54','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('538','延平区','55','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('539','邵武市','55','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('540','武夷山市','55','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('541','建瓯市','55','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('542','建阳市','55','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('543','顺昌县','55','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('544','浦城县','55','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('545','光泽县','55','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('546','松溪县','55','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('547','政和县','55','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('548','蕉城区','56','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('549','福安市','56','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('550','福鼎市','56','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('551','霞浦县','56','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('552','古田县','56','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('553','屏南县','56','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('554','寿宁县','56','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('555','周宁县','56','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('556','柘荣县','56','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('557','城厢区','57','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('558','涵江区','57','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('559','荔城区','57','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('560','秀屿区','57','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('561','仙游县','57','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('562','鲤城区','58','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('563','丰泽区','58','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('564','洛江区','58','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('565','清濛开发区','58','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('566','泉港区','58','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('567','石狮市','58','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('568','晋江市','58','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('569','南安市','58','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('570','惠安县','58','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('571','安溪县','58','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('572','永春县','58','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('573','德化县','58','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('574','金门县','58','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('575','梅列区','59','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('576','三元区','59','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('577','永安市','59','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('578','明溪县','59','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('579','清流县','59','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('580','宁化县','59','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('581','大田县','59','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('582','尤溪县','59','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('583','沙县','59','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('584','将乐县','59','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('585','泰宁县','59','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('586','建宁县','59','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('587','思明区','60','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('588','海沧区','60','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('589','湖里区','60','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('590','集美区','60','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('591','同安区','60','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('592','翔安区','60','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('593','芗城区','61','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('594','龙文区','61','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('595','龙海市','61','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('596','云霄县','61','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('597','漳浦县','61','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('598','诏安县','61','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('599','长泰县','61','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('600','东山县','61','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('601','南靖县','61','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('602','平和县','61','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('603','华安县','61','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('604','皋兰县','62','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('605','城关区','62','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('606','七里河区','62','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('607','西固区','62','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('608','安宁区','62','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('609','红古区','62','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('610','永登县','62','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('611','榆中县','62','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('612','白银区','63','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('613','平川区','63','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('614','会宁县','63','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('615','景泰县','63','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('616','靖远县','63','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('617','临洮县','64','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('618','陇西县','64','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('619','通渭县','64','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('620','渭源县','64','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('621','漳县','64','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('622','岷县','64','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('623','安定区','64','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('624','安定区','64','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('625','合作市','65','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('626','临潭县','65','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('627','卓尼县','65','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('628','舟曲县','65','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('629','迭部县','65','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('630','玛曲县','65','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('631','碌曲县','65','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('632','夏河县','65','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('633','嘉峪关市','66','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('634','金川区','67','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('635','永昌县','67','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('636','肃州区','68','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('637','玉门市','68','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('638','敦煌市','68','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('639','金塔县','68','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('640','瓜州县','68','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('641','肃北','68','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('642','阿克塞','68','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('643','临夏市','69','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('644','临夏县','69','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('645','康乐县','69','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('646','永靖县','69','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('647','广河县','69','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('648','和政县','69','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('649','东乡族自治县','69','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('650','积石山','69','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('651','成县','70','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('652','徽县','70','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('653','康县','70','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('654','礼县','70','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('655','两当县','70','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('656','文县','70','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('657','西和县','70','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('658','宕昌县','70','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('659','武都区','70','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('660','崇信县','71','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('661','华亭县','71','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('662','静宁县','71','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('663','灵台县','71','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('664','崆峒区','71','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('665','庄浪县','71','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('666','泾川县','71','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('667','合水县','72','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('668','华池县','72','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('669','环县','72','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('670','宁县','72','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('671','庆城县','72','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('672','西峰区','72','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('673','镇原县','72','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('674','正宁县','72','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('675','甘谷县','73','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('676','秦安县','73','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('677','清水县','73','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('678','秦州区','73','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('679','麦积区','73','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('680','武山县','73','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('681','张家川','73','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('682','古浪县','74','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('683','民勤县','74','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('684','天祝','74','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('685','凉州区','74','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('686','高台县','75','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('687','临泽县','75','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('688','民乐县','75','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('689','山丹县','75','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('690','肃南','75','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('691','甘州区','75','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('692','从化市','76','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('693','天河区','76','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('694','东山区','76','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('695','白云区','76','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('696','海珠区','76','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('697','荔湾区','76','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('698','越秀区','76','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('699','黄埔区','76','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('700','番禺区','76','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('701','花都区','76','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('702','增城区','76','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('703','从化区','76','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('704','市郊','76','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('705','福田区','77','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('706','罗湖区','77','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('707','南山区','77','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('708','宝安区','77','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('709','龙岗区','77','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('710','盐田区','77','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('711','湘桥区','78','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('712','潮安县','78','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('713','饶平县','78','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('714','南城区','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('715','东城区','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('716','万江区','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('717','莞城区','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('718','石龙镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('719','虎门镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('720','麻涌镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('721','道滘镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('722','石碣镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('723','沙田镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('724','望牛墩镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('725','洪梅镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('726','茶山镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('727','寮步镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('728','大岭山镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('729','大朗镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('730','黄江镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('731','樟木头','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('732','凤岗镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('733','塘厦镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('734','谢岗镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('735','厚街镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('736','清溪镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('737','常平镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('738','桥头镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('739','横沥镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('740','东坑镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('741','企石镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('742','石排镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('743','长安镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('744','中堂镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('745','高埗镇','79','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('746','禅城区','80','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('747','南海区','80','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('748','顺德区','80','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('749','三水区','80','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('750','高明区','80','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('751','东源县','81','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('752','和平县','81','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('753','源城区','81','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('754','连平县','81','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('755','龙川县','81','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('756','紫金县','81','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('757','惠阳区','82','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('758','惠城区','82','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('759','大亚湾','82','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('760','博罗县','82','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('761','惠东县','82','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('762','龙门县','82','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('763','江海区','83','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('764','蓬江区','83','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('765','新会区','83','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('766','台山市','83','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('767','开平市','83','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('768','鹤山市','83','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('769','恩平市','83','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('770','榕城区','84','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('771','普宁市','84','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('772','揭东县','84','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('773','揭西县','84','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('774','惠来县','84','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('775','茂南区','85','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('776','茂港区','85','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('777','高州市','85','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('778','化州市','85','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('779','信宜市','85','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('780','电白县','85','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('781','梅县','86','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('782','梅江区','86','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('783','兴宁市','86','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('784','大埔县','86','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('785','丰顺县','86','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('786','五华县','86','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('787','平远县','86','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('788','蕉岭县','86','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('789','清城区','87','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('790','英德市','87','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('791','连州市','87','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('792','佛冈县','87','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('793','阳山县','87','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('794','清新县','87','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('795','连山','87','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('796','连南','87','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('797','南澳县','88','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('798','潮阳区','88','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('799','澄海区','88','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('800','龙湖区','88','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('801','金平区','88','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('802','濠江区','88','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('803','潮南区','88','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('804','城区','89','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('805','陆丰市','89','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('806','海丰县','89','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('807','陆河县','89','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('808','曲江县','90','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('809','浈江区','90','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('810','武江区','90','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('811','曲江区','90','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('812','乐昌市','90','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('813','南雄市','90','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('814','始兴县','90','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('815','仁化县','90','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('816','翁源县','90','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('817','新丰县','90','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('818','乳源','90','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('819','江城区','91','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('820','阳春市','91','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('821','阳西县','91','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('822','阳东县','91','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('823','云城区','92','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('824','罗定市','92','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('825','新兴县','92','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('826','郁南县','92','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('827','云安县','92','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('828','赤坎区','93','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('829','霞山区','93','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('830','坡头区','93','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('831','麻章区','93','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('832','廉江市','93','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('833','雷州市','93','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('834','吴川市','93','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('835','遂溪县','93','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('836','徐闻县','93','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('837','端州区','94','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('838','高要市','94','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('839','鼎湖区','94','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('840','广宁县','94','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('841','怀集县','94','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('842','封开县','94','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('843','德庆县','94','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('844','石岐街道','95','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('845','东区街道','95','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('846','西区街道','95','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('847','环城街道','95','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('848','中山港街道','95','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('849','五桂山街道','95','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('850','香洲区','96','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('851','斗门区','96','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('852','金湾区','96','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('853','邕宁区','97','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('854','青秀区','97','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('855','兴宁区','97','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('856','良庆区','97','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('857','西乡塘区','97','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('858','江南区','97','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('859','武鸣县','97','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('860','隆安县','97','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('861','马山县','97','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('862','上林县','97','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('863','宾阳县','97','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('864','横县','97','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('865','秀峰区','98','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('866','叠彩区','98','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('867','象山区','98','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('868','七星区','98','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('869','雁山区','98','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('870','阳朔县','98','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('871','临桂县','98','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('872','灵川县','98','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('873','全州县','98','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('874','平乐县','98','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('875','兴安县','98','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('876','灌阳县','98','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('877','荔浦县','98','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('878','资源县','98','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('879','永福县','98','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('880','龙胜','98','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('881','恭城','98','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('882','右江区','99','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('883','凌云县','99','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('884','平果县','99','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('885','西林县','99','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('886','乐业县','99','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('887','德保县','99','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('888','田林县','99','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('889','田阳县','99','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('890','靖西县','99','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('891','田东县','99','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('892','那坡县','99','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('893','隆林','99','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('894','海城区','100','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('895','银海区','100','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('896','铁山港区','100','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('897','合浦县','100','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('898','江州区','101','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('899','凭祥市','101','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('900','宁明县','101','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('901','扶绥县','101','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('902','龙州县','101','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('903','大新县','101','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('904','天等县','101','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('905','港口区','102','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('906','防城区','102','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('907','东兴市','102','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('908','上思县','102','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('909','港北区','103','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('910','港南区','103','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('911','覃塘区','103','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('912','桂平市','103','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('913','平南县','103','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('914','金城江区','104','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('915','宜州市','104','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('916','天峨县','104','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('917','凤山县','104','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('918','南丹县','104','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('919','东兰县','104','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('920','都安','104','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('921','罗城','104','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('922','巴马','104','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('923','环江','104','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('924','大化','104','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('925','八步区','105','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('926','钟山县','105','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('927','昭平县','105','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('928','富川','105','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('929','兴宾区','106','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('930','合山市','106','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('931','象州县','106','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('932','武宣县','106','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('933','忻城县','106','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('934','金秀','106','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('935','城中区','107','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('936','鱼峰区','107','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('937','柳北区','107','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('938','柳南区','107','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('939','柳江县','107','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('940','柳城县','107','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('941','鹿寨县','107','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('942','融安县','107','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('943','融水','107','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('944','三江','107','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('945','钦南区','108','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('946','钦北区','108','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('947','灵山县','108','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('948','浦北县','108','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('949','万秀区','109','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('950','蝶山区','109','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('951','长洲区','109','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('952','岑溪市','109','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('953','苍梧县','109','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('954','藤县','109','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('955','蒙山县','109','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('956','玉州区','110','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('957','北流市','110','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('958','容县','110','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('959','陆川县','110','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('960','博白县','110','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('961','兴业县','110','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('962','南明区','111','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('963','云岩区','111','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('964','花溪区','111','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('965','乌当区','111','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('966','白云区','111','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('967','小河区','111','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('968','金阳新区','111','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('969','新天园区','111','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('970','清镇市','111','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('971','开阳县','111','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('972','修文县','111','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('973','息烽县','111','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('974','西秀区','112','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('975','关岭','112','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('976','镇宁','112','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('977','紫云','112','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('978','平坝县','112','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('979','普定县','112','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('980','毕节市','113','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('981','大方县','113','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('982','黔西县','113','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('983','金沙县','113','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('984','织金县','113','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('985','纳雍县','113','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('986','赫章县','113','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('987','威宁','113','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('988','钟山区','114','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('989','六枝特区','114','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('990','水城县','114','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('991','盘县','114','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('992','凯里市','115','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('993','黄平县','115','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('994','施秉县','115','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('995','三穗县','115','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('996','镇远县','115','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('997','岑巩县','115','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('998','天柱县','115','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('999','锦屏县','115','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1000','剑河县','115','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1001','台江县','115','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1002','黎平县','115','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1003','榕江县','115','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1004','从江县','115','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1005','雷山县','115','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1006','麻江县','115','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1007','丹寨县','115','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1008','都匀市','116','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1009','福泉市','116','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1010','荔波县','116','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1011','贵定县','116','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1012','瓮安县','116','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1013','独山县','116','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1014','平塘县','116','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1015','罗甸县','116','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1016','长顺县','116','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1017','龙里县','116','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1018','惠水县','116','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1019','三都','116','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1020','兴义市','117','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1021','兴仁县','117','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1022','普安县','117','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1023','晴隆县','117','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1024','贞丰县','117','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1025','望谟县','117','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1026','册亨县','117','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1027','安龙县','117','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1028','铜仁市','118','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1029','江口县','118','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1030','石阡县','118','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1031','思南县','118','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1032','德江县','118','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1033','玉屏','118','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1034','印江','118','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1035','沿河','118','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1036','松桃','118','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1037','万山特区','118','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1038','红花岗区','119','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1039','务川县','119','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1040','道真县','119','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1041','汇川区','119','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1042','赤水市','119','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1043','仁怀市','119','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1044','遵义县','119','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1045','桐梓县','119','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1046','绥阳县','119','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1047','正安县','119','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1048','凤冈县','119','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1049','湄潭县','119','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1050','余庆县','119','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1051','习水县','119','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1052','道真','119','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1053','务川','119','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1054','秀英区','120','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1055','龙华区','120','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1056','琼山区','120','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1057','美兰区','120','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1058','市区','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1059','洋浦开发区','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1060','那大镇','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1061','王五镇','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1062','雅星镇','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1063','大成镇','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1064','中和镇','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1065','峨蔓镇','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1066','南丰镇','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1067','白马井镇','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1068','兰洋镇','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1069','和庆镇','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1070','海头镇','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1071','排浦镇','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1072','东成镇','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1073','光村镇','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1074','木棠镇','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1075','新州镇','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1076','三都镇','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1077','其他','137','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1078','长安区','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1079','桥东区','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1080','桥西区','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1081','新华区','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1082','裕华区','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1083','井陉矿区','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1084','高新区','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1085','辛集市','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1086','藁城市','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1087','晋州市','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1088','新乐市','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1089','鹿泉市','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1090','井陉县','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1091','正定县','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1092','栾城县','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1093','行唐县','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1094','灵寿县','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1095','高邑县','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1096','深泽县','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1097','赞皇县','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1098','无极县','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1099','平山县','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1100','元氏县','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1101','赵县','138','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1102','新市区','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1103','南市区','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1104','北市区','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1105','涿州市','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1106','定州市','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1107','安国市','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1108','高碑店市','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1109','满城县','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1110','清苑县','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1111','涞水县','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1112','阜平县','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1113','徐水县','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1114','定兴县','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1115','唐县','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1116','高阳县','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1117','容城县','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1118','涞源县','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1119','望都县','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1120','安新县','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1121','易县','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1122','曲阳县','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1123','蠡县','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1124','顺平县','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1125','博野县','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1126','雄县','139','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1127','运河区','140','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1128','新华区','140','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1129','泊头市','140','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1130','任丘市','140','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1131','黄骅市','140','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1132','河间市','140','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1133','沧县','140','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1134','青县','140','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1135','东光县','140','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1136','海兴县','140','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1137','盐山县','140','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1138','肃宁县','140','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1139','南皮县','140','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1140','吴桥县','140','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1141','献县','140','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1142','孟村','140','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1143','双桥区','141','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1144','双滦区','141','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1145','鹰手营子矿区','141','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1146','承德县','141','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1147','兴隆县','141','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1148','平泉县','141','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1149','滦平县','141','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1150','隆化县','141','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1151','丰宁','141','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1152','宽城','141','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1153','围场','141','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1154','丛台区','142','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1155','复兴区','142','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1156','邯山区','142','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1157','峰峰矿区','142','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1158','武安市','142','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1159','邯郸县','142','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1160','临漳县','142','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1161','成安县','142','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1162','大名县','142','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1163','涉县','142','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1164','磁县','142','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1165','肥乡县','142','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1166','永年县','142','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1167','邱县','142','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1168','鸡泽县','142','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1169','广平县','142','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1170','馆陶县','142','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1171','魏县','142','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1172','曲周县','142','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1173','桃城区','143','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1174','冀州市','143','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1175','深州市','143','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1176','枣强县','143','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1177','武邑县','143','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1178','武强县','143','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1179','饶阳县','143','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1180','安平县','143','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1181','故城县','143','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1182','景县','143','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1183','阜城县','143','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1184','安次区','144','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1185','广阳区','144','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1186','霸州市','144','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1187','三河市','144','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1188','固安县','144','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1189','永清县','144','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1190','香河县','144','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1191','大城县','144','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1192','文安县','144','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1193','大厂','144','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1194','海港区','145','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1195','山海关区','145','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1196','北戴河区','145','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1197','昌黎县','145','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1198','抚宁县','145','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1199','卢龙县','145','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1200','青龙','145','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1201','路北区','146','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1202','路南区','146','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1203','古冶区','146','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1204','开平区','146','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1205','丰南区','146','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1206','丰润区','146','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1207','遵化市','146','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1208','迁安市','146','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1209','滦县','146','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1210','滦南县','146','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1211','乐亭县','146','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1212','迁西县','146','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1213','玉田县','146','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1214','唐海县','146','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1215','桥东区','147','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1216','桥西区','147','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1217','南宫市','147','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1218','沙河市','147','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1219','邢台县','147','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1220','临城县','147','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1221','内丘县','147','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1222','柏乡县','147','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1223','隆尧县','147','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1224','任县','147','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1225','南和县','147','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1226','宁晋县','147','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1227','巨鹿县','147','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1228','新河县','147','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1229','广宗县','147','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1230','平乡县','147','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1231','威县','147','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1232','清河县','147','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1233','临西县','147','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1234','桥西区','148','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1235','桥东区','148','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1236','宣化区','148','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1237','下花园区','148','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1238','宣化县','148','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1239','张北县','148','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1240','康保县','148','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1241','沽源县','148','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1242','尚义县','148','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1243','蔚县','148','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1244','阳原县','148','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1245','怀安县','148','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1246','万全县','148','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1247','怀来县','148','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1248','涿鹿县','148','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1249','赤城县','148','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1250','崇礼县','148','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1251','金水区','149','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1252','邙山区','149','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1253','二七区','149','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1254','管城区','149','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1255','中原区','149','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1256','上街区','149','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1257','惠济区','149','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1258','郑东新区','149','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1259','经济技术开发区','149','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1260','高新开发区','149','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1261','出口加工区','149','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1262','巩义市','149','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1263','荥阳市','149','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1264','新密市','149','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1265','新郑市','149','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1266','登封市','149','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1267','中牟县','149','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1268','西工区','150','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1269','老城区','150','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1270','涧西区','150','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1271','瀍河回族区','150','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1272','洛龙区','150','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1273','吉利区','150','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1274','偃师市','150','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1275','孟津县','150','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1276','新安县','150','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1277','栾川县','150','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1278','嵩县','150','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1279','汝阳县','150','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1280','宜阳县','150','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1281','洛宁县','150','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1282','伊川县','150','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1283','鼓楼区','151','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1284','龙亭区','151','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1285','顺河回族区','151','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1286','金明区','151','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1287','禹王台区','151','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1288','杞县','151','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1289','通许县','151','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1290','尉氏县','151','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1291','开封县','151','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1292','兰考县','151','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1293','北关区','152','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1294','文峰区','152','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1295','殷都区','152','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1296','龙安区','152','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1297','林州市','152','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1298','安阳县','152','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1299','汤阴县','152','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1300','滑县','152','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1301','内黄县','152','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1302','淇滨区','153','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1303','山城区','153','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1304','鹤山区','153','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1305','浚县','153','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1306','淇县','153','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1307','济源市','154','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1308','解放区','155','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1309','中站区','155','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1310','马村区','155','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1311','山阳区','155','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1312','沁阳市','155','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1313','孟州市','155','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1314','修武县','155','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1315','博爱县','155','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1316','武陟县','155','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1317','温县','155','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1318','卧龙区','156','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1319','宛城区','156','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1320','邓州市','156','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1321','南召县','156','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1322','方城县','156','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1323','西峡县','156','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1324','镇平县','156','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1325','内乡县','156','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1326','淅川县','156','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1327','社旗县','156','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1328','唐河县','156','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1329','新野县','156','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1330','桐柏县','156','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1331','新华区','157','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1332','卫东区','157','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1333','湛河区','157','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1334','石龙区','157','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1335','舞钢市','157','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1336','汝州市','157','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1337','宝丰县','157','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1338','叶县','157','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1339','鲁山县','157','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1340','郏县','157','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1341','湖滨区','158','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1342','义马市','158','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1343','灵宝市','158','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1344','渑池县','158','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1345','陕县','158','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1346','卢氏县','158','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1347','梁园区','159','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1348','睢阳区','159','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1349','永城市','159','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1350','民权县','159','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1351','睢县','159','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1352','宁陵县','159','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1353','虞城县','159','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1354','柘城县','159','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1355','夏邑县','159','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1356','卫滨区','160','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1357','红旗区','160','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1358','凤泉区','160','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1359','牧野区','160','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1360','卫辉市','160','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1361','辉县市','160','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1362','新乡县','160','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1363','获嘉县','160','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1364','原阳县','160','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1365','延津县','160','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1366','封丘县','160','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1367','长垣县','160','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1368','浉河区','161','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1369','平桥区','161','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1370','罗山县','161','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1371','光山县','161','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1372','新县','161','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1373','商城县','161','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1374','固始县','161','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1375','潢川县','161','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1376','淮滨县','161','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1377','息县','161','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1378','魏都区','162','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1379','禹州市','162','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1380','长葛市','162','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1381','许昌县','162','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1382','鄢陵县','162','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1383','襄城县','162','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1384','川汇区','163','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1385','项城市','163','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1386','扶沟县','163','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1387','西华县','163','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1388','商水县','163','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1389','沈丘县','163','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1390','郸城县','163','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1391','淮阳县','163','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1392','太康县','163','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1393','鹿邑县','163','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1394','驿城区','164','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1395','西平县','164','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1396','上蔡县','164','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1397','平舆县','164','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1398','正阳县','164','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1399','确山县','164','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1400','泌阳县','164','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1401','汝南县','164','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1402','遂平县','164','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1403','新蔡县','164','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1404','郾城区','165','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1405','源汇区','165','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1406','召陵区','165','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1407','舞阳县','165','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1408','临颍县','165','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1409','华龙区','166','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1410','清丰县','166','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1411','南乐县','166','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1412','范县','166','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1413','台前县','166','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1414','濮阳县','166','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1415','道里区','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1416','南岗区','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1417','动力区','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1418','平房区','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1419','香坊区','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1420','太平区','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1421','道外区','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1422','阿城区','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1423','呼兰区','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1424','松北区','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1425','尚志市','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1426','双城市','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1427','五常市','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1428','方正县','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1429','宾县','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1430','依兰县','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1431','巴彦县','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1432','通河县','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1433','木兰县','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1434','延寿县','167','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1435','萨尔图区','168','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1436','红岗区','168','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1437','龙凤区','168','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1438','让胡路区','168','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1439','大同区','168','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1440','肇州县','168','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1441','肇源县','168','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1442','林甸县','168','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1443','杜尔伯特','168','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1444','呼玛县','169','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1445','漠河县','169','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1446','塔河县','169','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1447','兴山区','170','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1448','工农区','170','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1449','南山区','170','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1450','兴安区','170','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1451','向阳区','170','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1452','东山区','170','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1453','萝北县','170','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1454','绥滨县','170','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1455','爱辉区','171','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1456','五大连池市','171','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1457','北安市','171','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1458','嫩江县','171','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1459','逊克县','171','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1460','孙吴县','171','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1461','鸡冠区','172','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1462','恒山区','172','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1463','城子河区','172','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1464','滴道区','172','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1465','梨树区','172','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1466','虎林市','172','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1467','密山市','172','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1468','鸡东县','172','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1469','前进区','173','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1470','郊区','173','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1471','向阳区','173','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1472','东风区','173','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1473','同江市','173','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1474','富锦市','173','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1475','桦南县','173','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1476','桦川县','173','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1477','汤原县','173','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1478','抚远县','173','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1479','爱民区','174','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1480','东安区','174','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1481','阳明区','174','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1482','西安区','174','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1483','绥芬河市','174','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1484','海林市','174','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1485','宁安市','174','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1486','穆棱市','174','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1487','东宁县','174','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1488','林口县','174','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1489','桃山区','175','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1490','新兴区','175','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1491','茄子河区','175','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1492','勃利县','175','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1493','龙沙区','176','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1494','昂昂溪区','176','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1495','铁峰区','176','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1496','建华区','176','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1497','富拉尔基区','176','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1498','碾子山区','176','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1499','梅里斯达斡尔区','176','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1500','讷河市','176','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1501','龙江县','176','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1502','依安县','176','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1503','泰来县','176','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1504','甘南县','176','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1505','富裕县','176','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1506','克山县','176','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1507','克东县','176','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1508','拜泉县','176','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1509','尖山区','177','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1510','岭东区','177','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1511','四方台区','177','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1512','宝山区','177','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1513','集贤县','177','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1514','友谊县','177','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1515','宝清县','177','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1516','饶河县','177','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1517','北林区','178','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1518','安达市','178','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1519','肇东市','178','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1520','海伦市','178','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1521','望奎县','178','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1522','兰西县','178','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1523','青冈县','178','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1524','庆安县','178','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1525','明水县','178','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1526','绥棱县','178','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1527','伊春区','179','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1528','带岭区','179','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1529','南岔区','179','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1530','金山屯区','179','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1531','西林区','179','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1532','美溪区','179','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1533','乌马河区','179','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1534','翠峦区','179','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1535','友好区','179','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1536','上甘岭区','179','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1537','五营区','179','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1538','红星区','179','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1539','新青区','179','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1540','汤旺河区','179','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1541','乌伊岭区','179','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1542','铁力市','179','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1543','嘉荫县','179','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1544','江岸区','180','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1545','武昌区','180','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1546','江汉区','180','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1547','硚口区','180','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1548','汉阳区','180','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1549','青山区','180','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1550','洪山区','180','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1551','东西湖区','180','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1552','汉南区','180','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1553','蔡甸区','180','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1554','江夏区','180','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1555','黄陂区','180','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1556','新洲区','180','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1557','经济开发区','180','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1558','仙桃市','181','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1559','鄂城区','182','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1560','华容区','182','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1561','梁子湖区','182','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1562','黄州区','183','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1563','麻城市','183','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1564','武穴市','183','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1565','团风县','183','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1566','红安县','183','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1567','罗田县','183','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1568','英山县','183','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1569','浠水县','183','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1570','蕲春县','183','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1571','黄梅县','183','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1572','黄石港区','184','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1573','西塞山区','184','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1574','下陆区','184','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1575','铁山区','184','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1576','大冶市','184','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1577','阳新县','184','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1578','东宝区','185','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1579','掇刀区','185','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1580','钟祥市','185','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1581','京山县','185','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1582','沙洋县','185','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1583','沙市区','186','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1584','荆州区','186','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1585','石首市','186','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1586','洪湖市','186','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1587','松滋市','186','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1588','公安县','186','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1589','监利县','186','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1590','江陵县','186','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1591','潜江市','187','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1592','神农架林区','188','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1593','张湾区','189','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1594','茅箭区','189','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1595','丹江口市','189','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1596','郧县','189','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1597','郧西县','189','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1598','竹山县','189','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1599','竹溪县','189','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1600','房县','189','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1601','曾都区','190','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1602','广水市','190','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1603','天门市','191','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1604','咸安区','192','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1605','赤壁市','192','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1606','嘉鱼县','192','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1607','通城县','192','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1608','崇阳县','192','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1609','通山县','192','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1610','襄城区','193','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1611','樊城区','193','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1612','襄州区','193','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1613','老河口市','193','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1614','枣阳市','193','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1615','宜城市','193','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1616','南漳县','193','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1617','谷城县','193','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1618','保康县','193','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1619','孝南区','194','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1620','应城市','194','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1621','安陆市','194','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1622','汉川市','194','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1623','孝昌县','194','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1624','大悟县','194','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1625','云梦县','194','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1626','长阳','195','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1627','五峰','195','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1628','西陵区','195','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1629','伍家岗区','195','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1630','点军区','195','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1631','猇亭区','195','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1632','夷陵区','195','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1633','宜都市','195','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1634','当阳市','195','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1635','枝江市','195','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1636','远安县','195','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1637','兴山县','195','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1638','秭归县','195','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1639','恩施市','196','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1640','利川市','196','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1641','建始县','196','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1642','巴东县','196','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1643','宣恩县','196','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1644','咸丰县','196','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1645','来凤县','196','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1646','鹤峰县','196','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1647','岳麓区','197','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1648','芙蓉区','197','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1649','天心区','197','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1650','开福区','197','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1651','雨花区','197','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1652','开发区','197','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1653','浏阳市','197','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1654','长沙县','197','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1655','望城县','197','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1656','宁乡县','197','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1657','永定区','198','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1658','武陵源区','198','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1659','慈利县','198','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1660','桑植县','198','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1661','武陵区','199','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1662','鼎城区','199','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1663','津市市','199','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1664','安乡县','199','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1665','汉寿县','199','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1666','澧县','199','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1667','临澧县','199','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1668','桃源县','199','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1669','石门县','199','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1670','北湖区','200','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1671','苏仙区','200','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1672','资兴市','200','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1673','桂阳县','200','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1674','宜章县','200','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1675','永兴县','200','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1676','嘉禾县','200','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1677','临武县','200','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1678','汝城县','200','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1679','桂东县','200','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1680','安仁县','200','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1681','雁峰区','201','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1682','珠晖区','201','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1683','石鼓区','201','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1684','蒸湘区','201','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1685','南岳区','201','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1686','耒阳市','201','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1687','常宁市','201','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1688','衡阳县','201','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1689','衡南县','201','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1690','衡山县','201','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1691','衡东县','201','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1692','祁东县','201','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1693','鹤城区','202','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1694','靖州','202','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1695','麻阳','202','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1696','通道','202','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1697','新晃','202','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1698','芷江','202','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1699','沅陵县','202','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1700','辰溪县','202','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1701','溆浦县','202','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1702','中方县','202','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1703','会同县','202','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1704','洪江市','202','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1705','娄星区','203','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1706','冷水江市','203','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1707','涟源市','203','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1708','双峰县','203','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1709','新化县','203','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1710','城步','204','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1711','双清区','204','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1712','大祥区','204','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1713','北塔区','204','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1714','武冈市','204','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1715','邵东县','204','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1716','新邵县','204','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1717','邵阳县','204','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1718','隆回县','204','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1719','洞口县','204','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1720','绥宁县','204','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1721','新宁县','204','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1722','岳塘区','205','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1723','雨湖区','205','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1724','湘乡市','205','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1725','韶山市','205','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1726','湘潭县','205','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1727','吉首市','206','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1728','泸溪县','206','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1729','凤凰县','206','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1730','花垣县','206','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1731','保靖县','206','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1732','古丈县','206','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1733','永顺县','206','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1734','龙山县','206','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1735','赫山区','207','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1736','资阳区','207','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1737','沅江市','207','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1738','南县','207','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1739','桃江县','207','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1740','安化县','207','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1741','江华','208','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1742','冷水滩区','208','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1743','零陵区','208','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1744','祁阳县','208','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1745','东安县','208','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1746','双牌县','208','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1747','道县','208','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1748','江永县','208','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1749','宁远县','208','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1750','蓝山县','208','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1751','新田县','208','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1752','岳阳楼区','209','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1753','君山区','209','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1754','云溪区','209','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1755','汨罗市','209','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1756','临湘市','209','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1757','岳阳县','209','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1758','华容县','209','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1759','湘阴县','209','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1760','平江县','209','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1761','天元区','210','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1762','荷塘区','210','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1763','芦淞区','210','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1764','石峰区','210','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1765','醴陵市','210','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1766','株洲县','210','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1767','攸县','210','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1768','茶陵县','210','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1769','炎陵县','210','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1770','朝阳区','211','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1771','宽城区','211','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1772','二道区','211','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1773','南关区','211','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1774','绿园区','211','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1775','双阳区','211','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1776','净月潭开发区','211','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1777','高新技术开发区','211','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1778','经济技术开发区','211','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1779','汽车产业开发区','211','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1780','德惠市','211','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1781','九台市','211','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1782','榆树市','211','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1783','农安县','211','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1784','船营区','212','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1785','昌邑区','212','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1786','龙潭区','212','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1787','丰满区','212','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1788','蛟河市','212','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1789','桦甸市','212','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1790','舒兰市','212','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1791','磐石市','212','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1792','永吉县','212','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1793','洮北区','213','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1794','洮南市','213','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1795','大安市','213','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1796','镇赉县','213','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1797','通榆县','213','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1798','江源区','214','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1799','八道江区','214','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1800','长白','214','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1801','临江市','214','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1802','抚松县','214','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1803','靖宇县','214','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1804','龙山区','215','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1805','西安区','215','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1806','东丰县','215','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1807','东辽县','215','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1808','铁西区','216','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1809','铁东区','216','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1810','伊通','216','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1811','公主岭市','216','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1812','双辽市','216','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1813','梨树县','216','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1814','前郭尔罗斯','217','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1815','宁江区','217','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1816','长岭县','217','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1817','乾安县','217','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1818','扶余县','217','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1819','东昌区','218','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1820','二道江区','218','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1821','梅河口市','218','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1822','集安市','218','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1823','通化县','218','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1824','辉南县','218','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1825','柳河县','218','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1826','延吉市','219','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1827','图们市','219','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1828','敦化市','219','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1829','珲春市','219','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1830','龙井市','219','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1831','和龙市','219','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1832','安图县','219','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1833','汪清县','219','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1834','玄武区','220','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1835','鼓楼区','220','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1836','白下区','220','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1837','建邺区','220','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1838','秦淮区','220','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1839','雨花台区','220','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1840','下关区','220','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1841','栖霞区','220','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1842','浦口区','220','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1843','江宁区','220','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1844','六合区','220','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1845','溧水县','220','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1846','高淳县','220','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1847','沧浪区','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1848','金阊区','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1849','平江区','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1850','虎丘区','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1851','吴中区','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1852','相城区','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1853','园区','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1854','新区','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1855','常熟市','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1856','张家港市','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1857','昆山市','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1858','巴城镇','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1859','周市镇','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1860','陆家镇','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1861','花桥镇','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1862','淀山湖镇','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1863','张浦镇','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1864','周庄镇','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1865','千灯镇','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1866','锦溪镇','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1867','开发区','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1868','吴江市','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1869','太仓市','221','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1870','崇安区','222','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1871','北塘区','222','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1872','南长区','222','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1873','锡山区','222','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1874','惠山区','222','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1875','滨湖区','222','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1876','新区','222','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1877','江阴市','222','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1878','宜兴市','222','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1879','天宁区','223','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1880','钟楼区','223','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1881','戚墅堰区','223','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1882','郊区','223','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1883','新北区','223','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1884','武进区','223','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1885','溧阳市','223','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1886','金坛市','223','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1887','清河区','224','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1888','清浦区','224','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1889','楚州区','224','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1890','淮阴区','224','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1891','涟水县','224','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1892','洪泽县','224','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1893','盱眙县','224','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1894','金湖县','224','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1895','新浦区','225','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1896','连云区','225','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1897','海州区','225','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1898','赣榆县','225','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1899','东海县','225','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1900','灌云县','225','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1901','灌南县','225','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1902','崇川区','226','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1903','港闸区','226','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1904','经济开发区','226','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1905','启东市','226','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1906','如皋市','226','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1907','通州市','226','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1908','海门市','226','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1909','海安县','226','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1910','如东县','226','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1911','宿城区','227','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1912','宿豫区','227','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1913','宿豫县','227','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1914','沭阳县','227','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1915','泗阳县','227','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1916','泗洪县','227','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1917','海陵区','228','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1918','高港区','228','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1919','兴化市','228','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1920','靖江市','228','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1921','泰兴市','228','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1922','姜堰市','228','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1923','云龙区','229','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1924','鼓楼区','229','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1925','九里区','229','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1926','贾汪区','229','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1927','泉山区','229','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1928','新沂市','229','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1929','邳州市','229','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1930','丰县','229','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1931','沛县','229','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1932','铜山县','229','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1933','睢宁县','229','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1934','城区','230','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1935','亭湖区','230','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1936','盐都区','230','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1937','盐都县','230','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1938','东台市','230','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1939','大丰市','230','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1940','响水县','230','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1941','滨海县','230','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1942','阜宁县','230','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1943','射阳县','230','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1944','建湖县','230','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1945','广陵区','231','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1946','维扬区','231','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1947','邗江区','231','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1948','仪征市','231','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1949','高邮市','231','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1950','江都市','231','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1951','宝应县','231','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1952','京口区','232','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1953','润州区','232','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1954','丹徒区','232','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1955','丹阳市','232','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1956','扬中市','232','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1957','句容市','232','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1958','东湖区','233','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1959','西湖区','233','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1960','青云谱区','233','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1961','湾里区','233','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1962','青山湖区','233','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1963','红谷滩新区','233','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1964','昌北区','233','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1965','高新区','233','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1966','南昌县','233','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1967','新建县','233','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1968','安义县','233','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1969','进贤县','233','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1970','临川区','234','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1971','南城县','234','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1972','黎川县','234','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1973','南丰县','234','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1974','崇仁县','234','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1975','乐安县','234','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1976','宜黄县','234','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1977','金溪县','234','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1978','资溪县','234','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1979','东乡县','234','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1980','广昌县','234','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1981','章贡区','235','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1982','于都县','235','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1983','瑞金市','235','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1984','南康市','235','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1985','赣县','235','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1986','信丰县','235','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1987','大余县','235','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1988','上犹县','235','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1989','崇义县','235','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1990','安远县','235','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1991','龙南县','235','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1992','定南县','235','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1993','全南县','235','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1994','宁都县','235','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1995','兴国县','235','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1996','会昌县','235','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1997','寻乌县','235','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1998','石城县','235','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('1999','安福县','236','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2000','吉州区','236','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2001','青原区','236','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2002','井冈山市','236','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2003','吉安县','236','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2004','吉水县','236','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2005','峡江县','236','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2006','新干县','236','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2007','永丰县','236','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2008','泰和县','236','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2009','遂川县','236','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2010','万安县','236','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2011','永新县','236','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2012','珠山区','237','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2013','昌江区','237','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2014','乐平市','237','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2015','浮梁县','237','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2016','浔阳区','238','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2017','庐山区','238','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2018','瑞昌市','238','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2019','九江县','238','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2020','武宁县','238','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2021','修水县','238','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2022','永修县','238','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2023','德安县','238','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2024','星子县','238','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2025','都昌县','238','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2026','湖口县','238','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2027','彭泽县','238','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2028','安源区','239','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2029','湘东区','239','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2030','莲花县','239','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2031','芦溪县','239','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2032','上栗县','239','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2033','信州区','240','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2034','德兴市','240','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2035','上饶县','240','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2036','广丰县','240','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2037','玉山县','240','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2038','铅山县','240','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2039','横峰县','240','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2040','弋阳县','240','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2041','余干县','240','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2042','波阳县','240','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2043','万年县','240','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2044','婺源县','240','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2045','渝水区','241','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2046','分宜县','241','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2047','袁州区','242','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2048','丰城市','242','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2049','樟树市','242','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2050','高安市','242','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2051','奉新县','242','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2052','万载县','242','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2053','上高县','242','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2054','宜丰县','242','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2055','靖安县','242','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2056','铜鼓县','242','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2057','月湖区','243','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2058','贵溪市','243','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2059','余江县','243','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2060','沈河区','244','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2061','皇姑区','244','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2062','和平区','244','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2063','大东区','244','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2064','铁西区','244','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2065','苏家屯区','244','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2066','东陵区','244','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2067','沈北新区','244','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2068','于洪区','244','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2069','浑南新区','244','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2070','新民市','244','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2071','辽中县','244','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2072','康平县','244','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2073','法库县','244','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2074','西岗区','245','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2075','中山区','245','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2076','沙河口区','245','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2077','甘井子区','245','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2078','旅顺口区','245','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2079','金州区','245','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2080','开发区','245','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2081','瓦房店市','245','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2082','普兰店市','245','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2083','庄河市','245','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2084','长海县','245','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2085','铁东区','246','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2086','铁西区','246','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2087','立山区','246','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2088','千山区','246','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2089','岫岩','246','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2090','海城市','246','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2091','台安县','246','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2092','本溪','247','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2093','平山区','247','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2094','明山区','247','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2095','溪湖区','247','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2096','南芬区','247','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2097','桓仁','247','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2098','双塔区','248','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2099','龙城区','248','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2100','喀喇沁左翼蒙古族自治县','248','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2101','北票市','248','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2102','凌源市','248','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2103','朝阳县','248','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2104','建平县','248','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2105','振兴区','249','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2106','元宝区','249','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2107','振安区','249','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2108','宽甸','249','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2109','东港市','249','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2110','凤城市','249','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2111','顺城区','250','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2112','新抚区','250','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2113','东洲区','250','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2114','望花区','250','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2115','清原','250','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2116','新宾','250','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2117','抚顺县','250','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2118','阜新','251','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2119','海州区','251','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2120','新邱区','251','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2121','太平区','251','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2122','清河门区','251','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2123','细河区','251','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2124','彰武县','251','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2125','龙港区','252','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2126','南票区','252','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2127','连山区','252','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2128','兴城市','252','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2129','绥中县','252','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2130','建昌县','252','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2131','太和区','253','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2132','古塔区','253','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2133','凌河区','253','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2134','凌海市','253','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2135','北镇市','253','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2136','黑山县','253','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2137','义县','253','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2138','白塔区','254','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2139','文圣区','254','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2140','宏伟区','254','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2141','太子河区','254','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2142','弓长岭区','254','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2143','灯塔市','254','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2144','辽阳县','254','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2145','双台子区','255','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2146','兴隆台区','255','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2147','大洼县','255','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2148','盘山县','255','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2149','银州区','256','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2150','清河区','256','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2151','调兵山市','256','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2152','开原市','256','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2153','铁岭县','256','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2154','西丰县','256','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2155','昌图县','256','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2156','站前区','257','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2157','西市区','257','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2158','鲅鱼圈区','257','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2159','老边区','257','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2160','盖州市','257','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2161','大石桥市','257','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2162','回民区','258','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2163','玉泉区','258','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2164','新城区','258','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2165','赛罕区','258','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2166','清水河县','258','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2167','土默特左旗','258','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2168','托克托县','258','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2169','和林格尔县','258','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2170','武川县','258','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2171','阿拉善左旗','259','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2172','阿拉善右旗','259','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2173','额济纳旗','259','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2174','临河区','260','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2175','五原县','260','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2176','磴口县','260','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2177','乌拉特前旗','260','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2178','乌拉特中旗','260','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2179','乌拉特后旗','260','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2180','杭锦后旗','260','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2181','昆都仑区','261','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2182','青山区','261','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2183','东河区','261','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2184','九原区','261','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2185','石拐区','261','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2186','白云矿区','261','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2187','土默特右旗','261','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2188','固阳县','261','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2189','达尔罕茂明安联合旗','261','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2190','红山区','262','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2191','元宝山区','262','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2192','松山区','262','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2193','阿鲁科尔沁旗','262','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2194','巴林左旗','262','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2195','巴林右旗','262','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2196','林西县','262','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2197','克什克腾旗','262','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2198','翁牛特旗','262','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2199','喀喇沁旗','262','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2200','宁城县','262','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2201','敖汉旗','262','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2202','东胜区','263','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2203','达拉特旗','263','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2204','准格尔旗','263','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2205','鄂托克前旗','263','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2206','鄂托克旗','263','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2207','杭锦旗','263','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2208','乌审旗','263','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2209','伊金霍洛旗','263','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2210','海拉尔区','264','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2211','莫力达瓦','264','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2212','满洲里市','264','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2213','牙克石市','264','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2214','扎兰屯市','264','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2215','额尔古纳市','264','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2216','根河市','264','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2217','阿荣旗','264','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2218','鄂伦春自治旗','264','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2219','鄂温克族自治旗','264','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2220','陈巴尔虎旗','264','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2221','新巴尔虎左旗','264','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2222','新巴尔虎右旗','264','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2223','科尔沁区','265','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2224','霍林郭勒市','265','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2225','科尔沁左翼中旗','265','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2226','科尔沁左翼后旗','265','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2227','开鲁县','265','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2228','库伦旗','265','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2229','奈曼旗','265','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2230','扎鲁特旗','265','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2231','海勃湾区','266','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2232','乌达区','266','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2233','海南区','266','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2234','化德县','267','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2235','集宁区','267','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2236','丰镇市','267','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2237','卓资县','267','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2238','商都县','267','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2239','兴和县','267','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2240','凉城县','267','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2241','察哈尔右翼前旗','267','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2242','察哈尔右翼中旗','267','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2243','察哈尔右翼后旗','267','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2244','四子王旗','267','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2245','二连浩特市','268','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2246','锡林浩特市','268','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2247','阿巴嘎旗','268','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2248','苏尼特左旗','268','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2249','苏尼特右旗','268','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2250','东乌珠穆沁旗','268','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2251','西乌珠穆沁旗','268','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2252','太仆寺旗','268','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2253','镶黄旗','268','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2254','正镶白旗','268','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2255','正蓝旗','268','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2256','多伦县','268','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2257','乌兰浩特市','269','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2258','阿尔山市','269','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2259','科尔沁右翼前旗','269','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2260','科尔沁右翼中旗','269','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2261','扎赉特旗','269','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2262','突泉县','269','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2263','西夏区','270','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2264','金凤区','270','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2265','兴庆区','270','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2266','灵武市','270','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2267','永宁县','270','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2268','贺兰县','270','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2269','原州区','271','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2270','海原县','271','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2271','西吉县','271','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2272','隆德县','271','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2273','泾源县','271','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2274','彭阳县','271','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2275','惠农县','272','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2276','大武口区','272','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2277','惠农区','272','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2278','陶乐县','272','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2279','平罗县','272','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2280','利通区','273','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2281','中卫县','273','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2282','青铜峡市','273','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2283','中宁县','273','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2284','盐池县','273','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2285','同心县','273','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2286','沙坡头区','274','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2287','海原县','274','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2288','中宁县','274','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2289','城中区','275','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2290','城东区','275','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2291','城西区','275','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2292','城北区','275','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2293','湟中县','275','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2294','湟源县','275','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2295','大通','275','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2296','玛沁县','276','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2297','班玛县','276','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2298','甘德县','276','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2299','达日县','276','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2300','久治县','276','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2301','玛多县','276','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2302','海晏县','277','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2303','祁连县','277','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2304','刚察县','277','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2305','门源','277','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2306','平安县','278','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2307','乐都县','278','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2308','民和','278','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2309','互助','278','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2310','化隆','278','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2311','循化','278','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2312','共和县','279','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2313','同德县','279','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2314','贵德县','279','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2315','兴海县','279','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2316','贵南县','279','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2317','德令哈市','280','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2318','格尔木市','280','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2319','乌兰县','280','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2320','都兰县','280','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2321','天峻县','280','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2322','同仁县','281','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2323','尖扎县','281','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2324','泽库县','281','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2325','河南蒙古族自治县','281','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2326','玉树县','282','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2327','杂多县','282','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2328','称多县','282','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2329','治多县','282','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2330','囊谦县','282','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2331','曲麻莱县','282','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2332','市中区','283','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2333','历下区','283','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2334','天桥区','283','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2335','槐荫区','283','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2336','历城区','283','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2337','长清区','283','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2338','章丘市','283','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2339','平阴县','283','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2340','济阳县','283','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2341','商河县','283','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2342','市南区','284','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2343','市北区','284','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2344','城阳区','284','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2345','四方区','284','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2346','李沧区','284','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2347','黄岛区','284','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2348','崂山区','284','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2349','胶州市','284','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2350','即墨市','284','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2351','平度市','284','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2352','胶南市','284','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2353','莱西市','284','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2354','滨城区','285','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2355','惠民县','285','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2356','阳信县','285','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2357','无棣县','285','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2358','沾化县','285','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2359','博兴县','285','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2360','邹平县','285','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2361','德城区','286','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2362','陵县','286','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2363','乐陵市','286','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2364','禹城市','286','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2365','宁津县','286','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2366','庆云县','286','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2367','临邑县','286','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2368','齐河县','286','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2369','平原县','286','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2370','夏津县','286','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2371','武城县','286','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2372','东营区','287','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2373','河口区','287','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2374','垦利县','287','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2375','利津县','287','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2376','广饶县','287','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2377','牡丹区','288','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2378','曹县','288','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2379','单县','288','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2380','成武县','288','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2381','巨野县','288','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2382','郓城县','288','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2383','鄄城县','288','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2384','定陶县','288','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2385','东明县','288','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2386','市中区','289','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2387','任城区','289','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2388','曲阜市','289','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2389','兖州市','289','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2390','邹城市','289','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2391','微山县','289','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2392','鱼台县','289','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2393','金乡县','289','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2394','嘉祥县','289','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2395','汶上县','289','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2396','泗水县','289','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2397','梁山县','289','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2398','莱城区','290','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2399','钢城区','290','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2400','东昌府区','291','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2401','临清市','291','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2402','阳谷县','291','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2403','莘县','291','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2404','茌平县','291','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2405','东阿县','291','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2406','冠县','291','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2407','高唐县','291','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2408','兰山区','292','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2409','罗庄区','292','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2410','河东区','292','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2411','沂南县','292','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2412','郯城县','292','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2413','沂水县','292','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2414','苍山县','292','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2415','费县','292','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2416','平邑县','292','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2417','莒南县','292','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2418','蒙阴县','292','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2419','临沭县','292','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2420','东港区','293','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2421','岚山区','293','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2422','五莲县','293','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2423','莒县','293','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2424','泰山区','294','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2425','岱岳区','294','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2426','新泰市','294','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2427','肥城市','294','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2428','宁阳县','294','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2429','东平县','294','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2430','荣成市','295','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2431','乳山市','295','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2432','环翠区','295','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2433','文登市','295','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2434','潍城区','296','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2435','寒亭区','296','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2436','坊子区','296','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2437','奎文区','296','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2438','青州市','296','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2439','诸城市','296','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2440','寿光市','296','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2441','安丘市','296','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2442','高密市','296','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2443','昌邑市','296','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2444','临朐县','296','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2445','昌乐县','296','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2446','芝罘区','297','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2447','福山区','297','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2448','牟平区','297','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2449','莱山区','297','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2450','开发区','297','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2451','龙口市','297','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2452','莱阳市','297','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2453','莱州市','297','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2454','蓬莱市','297','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2455','招远市','297','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2456','栖霞市','297','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2457','海阳市','297','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2458','长岛县','297','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2459','市中区','298','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2460','山亭区','298','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2461','峄城区','298','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2462','台儿庄区','298','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2463','薛城区','298','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2464','滕州市','298','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2465','张店区','299','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2466','临淄区','299','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2467','淄川区','299','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2468','博山区','299','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2469','周村区','299','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2470','桓台县','299','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2471','高青县','299','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2472','沂源县','299','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2473','杏花岭区','300','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2474','小店区','300','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2475','迎泽区','300','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2476','尖草坪区','300','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2477','万柏林区','300','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2478','晋源区','300','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2479','高新开发区','300','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2480','民营经济开发区','300','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2481','经济技术开发区','300','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2482','清徐县','300','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2483','阳曲县','300','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2484','娄烦县','300','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2485','古交市','300','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2486','城区','301','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2487','郊区','301','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2488','沁县','301','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2489','潞城市','301','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2490','长治县','301','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2491','襄垣县','301','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2492','屯留县','301','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2493','平顺县','301','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2494','黎城县','301','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2495','壶关县','301','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2496','长子县','301','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2497','武乡县','301','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2498','沁源县','301','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2499','城区','302','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2500','矿区','302','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2501','南郊区','302','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2502','新荣区','302','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2503','阳高县','302','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2504','天镇县','302','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2505','广灵县','302','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2506','灵丘县','302','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2507','浑源县','302','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2508','左云县','302','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2509','大同县','302','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2510','城区','303','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2511','高平市','303','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2512','沁水县','303','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2513','阳城县','303','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2514','陵川县','303','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2515','泽州县','303','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2516','榆次区','304','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2517','介休市','304','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2518','榆社县','304','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2519','左权县','304','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2520','和顺县','304','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2521','昔阳县','304','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2522','寿阳县','304','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2523','太谷县','304','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2524','祁县','304','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2525','平遥县','304','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2526','灵石县','304','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2527','尧都区','305','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2528','侯马市','305','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2529','霍州市','305','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2530','曲沃县','305','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2531','翼城县','305','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2532','襄汾县','305','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2533','洪洞县','305','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2534','吉县','305','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2535','安泽县','305','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2536','浮山县','305','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2537','古县','305','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2538','乡宁县','305','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2539','大宁县','305','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2540','隰县','305','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2541','永和县','305','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2542','蒲县','305','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2543','汾西县','305','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2544','离石市','306','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2545','离石区','306','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2546','孝义市','306','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2547','汾阳市','306','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2548','文水县','306','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2549','交城县','306','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2550','兴县','306','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2551','临县','306','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2552','柳林县','306','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2553','石楼县','306','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2554','岚县','306','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2555','方山县','306','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2556','中阳县','306','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2557','交口县','306','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2558','朔城区','307','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2559','平鲁区','307','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2560','山阴县','307','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2561','应县','307','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2562','右玉县','307','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2563','怀仁县','307','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2564','忻府区','308','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2565','原平市','308','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2566','定襄县','308','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2567','五台县','308','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2568','代县','308','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2569','繁峙县','308','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2570','宁武县','308','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2571','静乐县','308','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2572','神池县','308','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2573','五寨县','308','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2574','岢岚县','308','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2575','河曲县','308','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2576','保德县','308','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2577','偏关县','308','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2578','城区','309','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2579','矿区','309','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2580','郊区','309','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2581','平定县','309','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2582','盂县','309','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2583','盐湖区','310','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2584','永济市','310','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2585','河津市','310','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2586','临猗县','310','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2587','万荣县','310','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2588','闻喜县','310','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2589','稷山县','310','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2590','新绛县','310','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2591','绛县','310','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2592','垣曲县','310','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2593','夏县','310','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2594','平陆县','310','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2595','芮城县','310','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2596','莲湖区','311','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2597','新城区','311','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2598','碑林区','311','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2599','雁塔区','311','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2600','灞桥区','311','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2601','未央区','311','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2602','阎良区','311','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2603','临潼区','311','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2604','长安区','311','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2605','蓝田县','311','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2606','周至县','311','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2607','户县','311','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2608','高陵县','311','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2609','汉滨区','312','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2610','汉阴县','312','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2611','石泉县','312','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2612','宁陕县','312','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2613','紫阳县','312','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2614','岚皋县','312','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2615','平利县','312','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2616','镇坪县','312','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2617','旬阳县','312','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2618','白河县','312','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2619','陈仓区','313','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2620','渭滨区','313','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2621','金台区','313','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2622','凤翔县','313','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2623','岐山县','313','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2624','扶风县','313','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2625','眉县','313','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2626','陇县','313','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2627','千阳县','313','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2628','麟游县','313','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2629','凤县','313','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2630','太白县','313','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2631','汉台区','314','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2632','南郑县','314','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2633','城固县','314','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2634','洋县','314','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2635','西乡县','314','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2636','勉县','314','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2637','宁强县','314','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2638','略阳县','314','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2639','镇巴县','314','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2640','留坝县','314','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2641','佛坪县','314','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2642','商州区','315','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2643','洛南县','315','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2644','丹凤县','315','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2645','商南县','315','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2646','山阳县','315','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2647','镇安县','315','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2648','柞水县','315','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2649','耀州区','316','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2650','王益区','316','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2651','印台区','316','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2652','宜君县','316','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2653','临渭区','317','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2654','韩城市','317','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2655','华阴市','317','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2656','华县','317','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2657','潼关县','317','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2658','大荔县','317','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2659','合阳县','317','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2660','澄城县','317','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2661','蒲城县','317','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2662','白水县','317','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2663','富平县','317','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2664','秦都区','318','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2665','渭城区','318','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2666','杨陵区','318','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2667','兴平市','318','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2668','三原县','318','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2669','泾阳县','318','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2670','乾县','318','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2671','礼泉县','318','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2672','永寿县','318','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2673','彬县','318','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2674','长武县','318','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2675','旬邑县','318','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2676','淳化县','318','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2677','武功县','318','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2678','吴起县','319','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2679','宝塔区','319','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2680','延长县','319','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2681','延川县','319','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2682','子长县','319','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2683','安塞县','319','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2684','志丹县','319','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2685','甘泉县','319','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2686','富县','319','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2687','洛川县','319','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2688','宜川县','319','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2689','黄龙县','319','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2690','黄陵县','319','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2691','榆阳区','320','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2692','神木县','320','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2693','府谷县','320','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2694','横山县','320','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2695','靖边县','320','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2696','定边县','320','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2697','绥德县','320','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2698','米脂县','320','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2699','佳县','320','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2700','吴堡县','320','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2701','清涧县','320','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2702','子洲县','320','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2703','长宁区','321','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2704','闸北区','321','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2705','闵行区','321','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2706','徐汇区','321','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2707','浦东新区','321','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2708','杨浦区','321','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2709','普陀区','321','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2710','静安区','321','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2711','卢湾区','321','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2712','虹口区','321','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2713','黄浦区','321','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2714','南汇区','321','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2715','松江区','321','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2716','嘉定区','321','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2717','宝山区','321','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2718','青浦区','321','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2719','金山区','321','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2720','奉贤区','321','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2721','崇明县','321','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2722','青羊区','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2723','锦江区','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2724','金牛区','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2725','武侯区','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2726','成华区','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2727','龙泉驿区','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2728','青白江区','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2729','新都区','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2730','温江区','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2731','高新区','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2732','高新西区','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2733','都江堰市','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2734','彭州市','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2735','邛崃市','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2736','崇州市','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2737','金堂县','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2738','双流县','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2739','郫县','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2740','大邑县','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2741','蒲江县','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2742','新津县','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2743','都江堰市','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2744','彭州市','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2745','邛崃市','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2746','崇州市','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2747','金堂县','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2748','双流县','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2749','郫县','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2750','大邑县','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2751','蒲江县','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2752','新津县','322','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2753','涪城区','323','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2754','游仙区','323','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2755','江油市','323','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2756','盐亭县','323','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2757','三台县','323','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2758','平武县','323','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2759','安县','323','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2760','梓潼县','323','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2761','北川县','323','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2762','马尔康县','324','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2763','汶川县','324','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2764','理县','324','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2765','茂县','324','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2766','松潘县','324','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2767','九寨沟县','324','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2768','金川县','324','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2769','小金县','324','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2770','黑水县','324','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2771','壤塘县','324','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2772','阿坝县','324','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2773','若尔盖县','324','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2774','红原县','324','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2775','巴州区','325','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2776','通江县','325','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2777','南江县','325','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2778','平昌县','325','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2779','通川区','326','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2780','万源市','326','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2781','达县','326','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2782','宣汉县','326','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2783','开江县','326','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2784','大竹县','326','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2785','渠县','326','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2786','旌阳区','327','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2787','广汉市','327','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2788','什邡市','327','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2789','绵竹市','327','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2790','罗江县','327','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2791','中江县','327','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2792','康定县','328','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2793','丹巴县','328','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2794','泸定县','328','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2795','炉霍县','328','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2796','九龙县','328','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2797','甘孜县','328','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2798','雅江县','328','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2799','新龙县','328','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2800','道孚县','328','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2801','白玉县','328','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2802','理塘县','328','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2803','德格县','328','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2804','乡城县','328','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2805','石渠县','328','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2806','稻城县','328','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2807','色达县','328','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2808','巴塘县','328','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2809','得荣县','328','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2810','广安区','329','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2811','华蓥市','329','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2812','岳池县','329','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2813','武胜县','329','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2814','邻水县','329','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2815','利州区','330','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2816','元坝区','330','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2817','朝天区','330','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2818','旺苍县','330','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2819','青川县','330','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2820','剑阁县','330','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2821','苍溪县','330','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2822','峨眉山市','331','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2823','乐山市','331','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2824','犍为县','331','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2825','井研县','331','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2826','夹江县','331','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2827','沐川县','331','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2828','峨边','331','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2829','马边','331','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2830','西昌市','332','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2831','盐源县','332','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2832','德昌县','332','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2833','会理县','332','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2834','会东县','332','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2835','宁南县','332','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2836','普格县','332','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2837','布拖县','332','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2838','金阳县','332','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2839','昭觉县','332','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2840','喜德县','332','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2841','冕宁县','332','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2842','越西县','332','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2843','甘洛县','332','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2844','美姑县','332','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2845','雷波县','332','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2846','木里','332','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2847','东坡区','333','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2848','仁寿县','333','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2849','彭山县','333','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2850','洪雅县','333','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2851','丹棱县','333','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2852','青神县','333','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2853','阆中市','334','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2854','南部县','334','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2855','营山县','334','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2856','蓬安县','334','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2857','仪陇县','334','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2858','顺庆区','334','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2859','高坪区','334','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2860','嘉陵区','334','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2861','西充县','334','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2862','市中区','335','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2863','东兴区','335','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2864','威远县','335','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2865','资中县','335','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2866','隆昌县','335','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2867','东  区','336','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2868','西  区','336','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2869','仁和区','336','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2870','米易县','336','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2871','盐边县','336','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2872','船山区','337','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2873','安居区','337','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2874','蓬溪县','337','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2875','射洪县','337','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2876','大英县','337','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2877','雨城区','338','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2878','名山县','338','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2879','荥经县','338','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2880','汉源县','338','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2881','石棉县','338','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2882','天全县','338','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2883','芦山县','338','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2884','宝兴县','338','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2885','翠屏区','339','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2886','宜宾县','339','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2887','南溪县','339','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2888','江安县','339','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2889','长宁县','339','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2890','高县','339','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2891','珙县','339','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2892','筠连县','339','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2893','兴文县','339','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2894','屏山县','339','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2895','雁江区','340','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2896','简阳市','340','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2897','安岳县','340','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2898','乐至县','340','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2899','大安区','341','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2900','自流井区','341','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2901','贡井区','341','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2902','沿滩区','341','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2903','荣县','341','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2904','富顺县','341','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2905','江阳区','342','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2906','纳溪区','342','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2907','龙马潭区','342','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2908','泸县','342','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2909','合江县','342','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2910','叙永县','342','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2911','古蔺县','342','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2912','和平区','343','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2913','河西区','343','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2914','南开区','343','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2915','河北区','343','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2916','河东区','343','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2917','红桥区','343','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2918','东丽区','343','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2919','津南区','343','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2920','西青区','343','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2921','北辰区','343','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2922','塘沽区','343','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2923','汉沽区','343','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2924','大港区','343','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2925','武清区','343','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2926','宝坻区','343','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2927','经济开发区','343','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2928','宁河县','343','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2929','静海县','343','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2930','蓟县','343','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2931','城关区','344','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2932','林周县','344','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2933','当雄县','344','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2934','尼木县','344','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2935','曲水县','344','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2936','堆龙德庆县','344','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2937','达孜县','344','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2938','墨竹工卡县','344','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2939','噶尔县','345','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2940','普兰县','345','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2941','札达县','345','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2942','日土县','345','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2943','革吉县','345','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2944','改则县','345','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2945','措勤县','345','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2946','昌都县','346','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2947','江达县','346','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2948','贡觉县','346','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2949','类乌齐县','346','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2950','丁青县','346','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2951','察雅县','346','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2952','八宿县','346','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2953','左贡县','346','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2954','芒康县','346','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2955','洛隆县','346','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2956','边坝县','346','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2957','林芝县','347','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2958','工布江达县','347','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2959','米林县','347','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2960','墨脱县','347','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2961','波密县','347','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2962','察隅县','347','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2963','朗县','347','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2964','那曲县','348','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2965','嘉黎县','348','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2966','比如县','348','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2967','聂荣县','348','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2968','安多县','348','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2969','申扎县','348','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2970','索县','348','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2971','班戈县','348','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2972','巴青县','348','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2973','尼玛县','348','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2974','日喀则市','349','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2975','南木林县','349','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2976','江孜县','349','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2977','定日县','349','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2978','萨迦县','349','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2979','拉孜县','349','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2980','昂仁县','349','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2981','谢通门县','349','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2982','白朗县','349','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2983','仁布县','349','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2984','康马县','349','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2985','定结县','349','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2986','仲巴县','349','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2987','亚东县','349','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2988','吉隆县','349','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2989','聂拉木县','349','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2990','萨嘎县','349','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2991','岗巴县','349','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2992','乃东县','350','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2993','扎囊县','350','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2994','贡嘎县','350','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2995','桑日县','350','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2996','琼结县','350','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2997','曲松县','350','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2998','措美县','350','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('2999','洛扎县','350','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3000','加查县','350','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3001','隆子县','350','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3002','错那县','350','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3003','浪卡子县','350','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3004','天山区','351','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3005','沙依巴克区','351','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3006','新市区','351','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3007','水磨沟区','351','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3008','头屯河区','351','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3009','达坂城区','351','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3010','米东区','351','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3011','乌鲁木齐县','351','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3012','阿克苏市','352','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3013','温宿县','352','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3014','库车县','352','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3015','沙雅县','352','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3016','新和县','352','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3017','拜城县','352','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3018','乌什县','352','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3019','阿瓦提县','352','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3020','柯坪县','352','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3021','阿拉尔市','353','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3022','库尔勒市','354','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3023','轮台县','354','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3024','尉犁县','354','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3025','若羌县','354','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3026','且末县','354','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3027','焉耆','354','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3028','和静县','354','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3029','和硕县','354','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3030','博湖县','354','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3031','博乐市','355','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3032','精河县','355','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3033','温泉县','355','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3034','呼图壁县','356','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3035','米泉市','356','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3036','昌吉市','356','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3037','阜康市','356','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3038','玛纳斯县','356','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3039','奇台县','356','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3040','吉木萨尔县','356','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3041','木垒','356','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3042','哈密市','357','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3043','伊吾县','357','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3044','巴里坤','357','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3045','和田市','358','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3046','和田县','358','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3047','墨玉县','358','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3048','皮山县','358','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3049','洛浦县','358','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3050','策勒县','358','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3051','于田县','358','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3052','民丰县','358','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3053','喀什市','359','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3054','疏附县','359','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3055','疏勒县','359','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3056','英吉沙县','359','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3057','泽普县','359','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3058','莎车县','359','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3059','叶城县','359','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3060','麦盖提县','359','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3061','岳普湖县','359','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3062','伽师县','359','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3063','巴楚县','359','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3064','塔什库尔干','359','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3065','克拉玛依市','360','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3066','阿图什市','361','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3067','阿克陶县','361','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3068','阿合奇县','361','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3069','乌恰县','361','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3070','石河子市','362','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3071','图木舒克市','363','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3072','吐鲁番市','364','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3073','鄯善县','364','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3074','托克逊县','364','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3075','五家渠市','365','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3076','阿勒泰市','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3077','布克赛尔','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3078','伊宁市','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3079','布尔津县','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3080','奎屯市','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3081','乌苏市','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3082','额敏县','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3083','富蕴县','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3084','伊宁县','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3085','福海县','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3086','霍城县','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3087','沙湾县','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3088','巩留县','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3089','哈巴河县','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3090','托里县','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3091','青河县','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3092','新源县','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3093','裕民县','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3094','和布克赛尔','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3095','吉木乃县','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3096','昭苏县','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3097','特克斯县','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3098','尼勒克县','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3099','察布查尔','366','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3100','盘龙区','367','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3101','五华区','367','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3102','官渡区','367','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3103','西山区','367','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3104','东川区','367','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3105','安宁市','367','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3106','呈贡县','367','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3107','晋宁县','367','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3108','富民县','367','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3109','宜良县','367','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3110','嵩明县','367','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3111','石林县','367','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3112','禄劝','367','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3113','寻甸','367','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3114','兰坪','368','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3115','泸水县','368','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3116','福贡县','368','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3117','贡山','368','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3118','宁洱','369','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3119','思茅区','369','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3120','墨江','369','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3121','景东','369','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3122','景谷','369','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3123','镇沅','369','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3124','江城','369','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3125','孟连','369','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3126','澜沧','369','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3127','西盟','369','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3128','古城区','370','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3129','宁蒗','370','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3130','玉龙','370','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3131','永胜县','370','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3132','华坪县','370','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3133','隆阳区','371','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3134','施甸县','371','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3135','腾冲县','371','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3136','龙陵县','371','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3137','昌宁县','371','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3138','楚雄市','372','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3139','双柏县','372','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3140','牟定县','372','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3141','南华县','372','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3142','姚安县','372','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3143','大姚县','372','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3144','永仁县','372','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3145','元谋县','372','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3146','武定县','372','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3147','禄丰县','372','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3148','大理市','373','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3149','祥云县','373','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3150','宾川县','373','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3151','弥渡县','373','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3152','永平县','373','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3153','云龙县','373','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3154','洱源县','373','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3155','剑川县','373','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3156','鹤庆县','373','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3157','漾濞','373','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3158','南涧','373','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3159','巍山','373','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3160','潞西市','374','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3161','瑞丽市','374','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3162','梁河县','374','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3163','盈江县','374','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3164','陇川县','374','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3165','香格里拉县','375','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3166','德钦县','375','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3167','维西','375','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3168','泸西县','376','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3169','蒙自县','376','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3170','个旧市','376','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3171','开远市','376','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3172','绿春县','376','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3173','建水县','376','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3174','石屏县','376','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3175','弥勒县','376','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3176','元阳县','376','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3177','红河县','376','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3178','金平','376','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3179','河口','376','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3180','屏边','376','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3181','临翔区','377','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3182','凤庆县','377','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3183','云县','377','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3184','永德县','377','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3185','镇康县','377','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3186','双江','377','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3187','耿马','377','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3188','沧源','377','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3189','麒麟区','378','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3190','宣威市','378','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3191','马龙县','378','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3192','陆良县','378','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3193','师宗县','378','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3194','罗平县','378','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3195','富源县','378','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3196','会泽县','378','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3197','沾益县','378','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3198','文山县','379','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3199','砚山县','379','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3200','西畴县','379','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3201','麻栗坡县','379','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3202','马关县','379','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3203','丘北县','379','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3204','广南县','379','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3205','富宁县','379','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3206','景洪市','380','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3207','勐海县','380','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3208','勐腊县','380','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3209','红塔区','381','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3210','江川县','381','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3211','澄江县','381','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3212','通海县','381','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3213','华宁县','381','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3214','易门县','381','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3215','峨山','381','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3216','新平','381','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3217','元江','381','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3218','昭阳区','382','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3219','鲁甸县','382','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3220','巧家县','382','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3221','盐津县','382','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3222','大关县','382','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3223','永善县','382','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3224','绥江县','382','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3225','镇雄县','382','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3226','彝良县','382','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3227','威信县','382','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3228','水富县','382','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3229','西湖区','383','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3230','上城区','383','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3231','下城区','383','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3232','拱墅区','383','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3233','滨江区','383','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3234','江干区','383','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3235','萧山区','383','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3236','余杭区','383','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3237','市郊','383','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3238','建德市','383','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3239','富阳市','383','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3240','临安市','383','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3241','桐庐县','383','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3242','淳安县','383','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3243','吴兴区','384','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3244','南浔区','384','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3245','德清县','384','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3246','长兴县','384','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3247','安吉县','384','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3248','南湖区','385','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3249','秀洲区','385','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3250','海宁市','385','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3251','嘉善县','385','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3252','平湖市','385','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3253','桐乡市','385','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3254','海盐县','385','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3255','婺城区','386','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3256','金东区','386','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3257','兰溪市','386','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3258','市区','386','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3259','佛堂镇','386','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3260','上溪镇','386','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3261','义乌市','386','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3262','大陈镇','386','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3263','苏溪镇','386','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3264','赤岸镇','386','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3265','东阳市','386','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3266','永康市','386','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3267','武义县','386','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3268','浦江县','386','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3269','磐安县','386','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3270','莲都区','387','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3271','龙泉市','387','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3272','青田县','387','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3273','缙云县','387','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3274','遂昌县','387','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3275','松阳县','387','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3276','云和县','387','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3277','庆元县','387','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3278','景宁','387','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3279','海曙区','388','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3280','江东区','388','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3281','江北区','388','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3282','镇海区','388','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3283','北仑区','388','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3284','鄞州区','388','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3285','余姚市','388','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3286','慈溪市','388','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3287','奉化市','388','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3288','象山县','388','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3289','宁海县','388','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3290','越城区','389','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3291','上虞市','389','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3292','嵊州市','389','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3293','绍兴县','389','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3294','新昌县','389','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3295','诸暨市','389','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3296','椒江区','390','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3297','黄岩区','390','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3298','路桥区','390','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3299','温岭市','390','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3300','临海市','390','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3301','玉环县','390','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3302','三门县','390','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3303','天台县','390','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3304','仙居县','390','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3305','鹿城区','391','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3306','龙湾区','391','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3307','瓯海区','391','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3308','瑞安市','391','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3309','乐清市','391','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3310','洞头县','391','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3311','永嘉县','391','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3312','平阳县','391','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3313','苍南县','391','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3314','文成县','391','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3315','泰顺县','391','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3316','定海区','392','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3317','普陀区','392','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3318','岱山县','392','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3319','嵊泗县','392','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3320','衢江市','393','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3321','江山市','393','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3322','常山县','393','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3323','开化县','393','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3324','龙游县','393','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3325','合川区','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3326','江津区','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3327','南川区','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3328','永川区','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3329','南岸区','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3330','渝北区','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3331','万盛区','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3332','大渡口区','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3333','万州区','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3334','北碚区','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3335','沙坪坝区','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3336','巴南区','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3337','涪陵区','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3338','江北区','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3339','九龙坡区','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3340','渝中区','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3341','黔江开发区','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3342','长寿区','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3343','双桥区','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3344','綦江县','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3345','潼南县','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3346','铜梁县','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3347','大足县','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3348','荣昌县','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3349','璧山县','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3350','垫江县','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3351','武隆县','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3352','丰都县','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3353','城口县','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3354','梁平县','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3355','开县','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3356','巫溪县','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3357','巫山县','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3358','奉节县','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3359','云阳县','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3360','忠县','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3361','石柱','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3362','彭水','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3363','酉阳','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3364','秀山','394','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3365','沙田区','395','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3366','东区','395','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3367','观塘区','395','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3368','黄大仙区','395','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3369','九龙城区','395','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3370','屯门区','395','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3371','葵青区','395','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3372','元朗区','395','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3373','深水埗区','395','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3374','西贡区','395','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3375','大埔区','395','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3376','湾仔区','395','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3377','油尖旺区','395','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3378','北区','395','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3379','南区','395','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3380','荃湾区','395','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3381','中西区','395','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3382','离岛区','395','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3383','澳门','396','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3384','台北','397','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3385','高雄','397','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3386','基隆','397','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3387','台中','397','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3388','台南','397','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3389','新竹','397','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3390','嘉义','397','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3391','宜兰县','397','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3392','桃园县','397','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3393','苗栗县','397','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3394','彰化县','397','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3395','南投县','397','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3396','云林县','397','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3397','屏东县','397','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3398','台东县','397','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3399','花莲县','397','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3400','澎湖县','397','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3401','合肥','3','0-1-3-3401','3','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3402','庐阳区','3401','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3403','瑶海区','3401','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3404','蜀山区','3401','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3405','包河区','3401','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3406','长丰县','3401','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3407','肥东县','3401','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3408','肥西县','3401','3','0','0');
INSERT INTO cms_area ( `id`, `name`, `up_id`, `path`, `level`, `update_time` ) VALUES  ('3409','柯城市','393','3','0','0');
DROP TABLE IF EXISTS `cms_awards`;
CREATE TABLE `cms_awards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` varchar(512) DEFAULT NULL COMMENT '标题',
  `cat_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `rank_id` int(11) NOT NULL COMMENT '级别ID',
  `year_id` int(11) NOT NULL DEFAULT '0' COMMENT '年度ID',
  `partic_id` varchar(512) DEFAULT NULL COMMENT '参与人',
  `teacher_id` int(11) NOT NULL DEFAULT '0' COMMENT '指导老师ID',
  `tea_phone` varchar(128) DEFAULT NULL COMMENT '指导老师手机号',
  `thumb` varchar(512) DEFAULT NULL COMMENT '荣誉证书',
  `img` varchar(512) DEFAULT NULL COMMENT '相关照片',
  `info` varchar(512) DEFAULT NULL COMMENT '备注',
  `isshow` tinyint(1) NOT NULL DEFAULT '1' COMMENT '显示 默认1显示 0不显示',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `examine` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审核状态 默认1审核中 2审核通过 3审核未通过',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 默认1显示 0隐藏',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_awards ( `id`, `mid`, `title`, `cat_id`, `rank_id`, `year_id`, `partic_id`, `teacher_id`, `tea_phone`, `thumb`, `img`, `info`, `isshow`, `sort`, `examine`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','0','关于对某运动规律的绘画','4','5','11',',2,','1','2147483647','/Uploads/image/20170725/20170725162158_82377.png',',/Source/kindeditor/php/../attached/image/20170725/20170725102311_31195.png,/Source/kindeditor/php/../attached/image/20170725/20170725102311_63421.png,','由**省举办的关于对物理运动规律的诠释，进一步提高了大家对此规律的认知','1','0','1','1','2','1500971066','1501059597');
DROP TABLE IF EXISTS `cms_card`;
CREATE TABLE `cms_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `bank_open` varchar(512) DEFAULT NULL COMMENT '开户行',
  `bank_name` varchar(512) DEFAULT NULL COMMENT '银行名称',
  `bank_card` varchar(512) DEFAULT NULL COMMENT '银行卡号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 默认1显示 0隐藏',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_card ( `id`, `mid`, `bank_open`, `bank_name`, `bank_card`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','1','北京工商银行望京支行','工商银行','1234567891234567892','1','2','1500000000','1500969517');
DROP TABLE IF EXISTS `cms_cirattr`;
CREATE TABLE `cms_cirattr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(512) DEFAULT NULL COMMENT '栏目名称',
  `up_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级id',
  `path` varchar(512) DEFAULT NULL COMMENT '栏目路径',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 默认1显示 0隐藏',
  `admin_id` int(11) DEFAULT NULL COMMENT '添加管理员id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_cirattr ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','项目级别','0','0','0','1','2','1500970371','1500970371');
INSERT INTO cms_cirattr ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('2','获奖年度','0','0','0','1','2','1500970383','1500970383');
INSERT INTO cms_cirattr ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('4','国家级','1','0-1','0','1','2','1500970440','1500970440');
INSERT INTO cms_cirattr ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('5','省级','1','0-1','0','1','2','1500970448','1500970448');
INSERT INTO cms_cirattr ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('6','市级','1','0-1','0','1','2','1500970458','1500970458');
INSERT INTO cms_cirattr ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('7','2010年-2011年','2','0-2','0','1','2','1500970475','1500970475');
INSERT INTO cms_cirattr ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('8','2011年-2012年','2','0-2','0','1','2','1500970490','1500970490');
INSERT INTO cms_cirattr ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('9','2012年-2013年','2','0-2','0','1','2','1500970504','1500970504');
INSERT INTO cms_cirattr ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('10','2013年-2014年','2','0-2','0','1','2','1500970516','1500970525');
INSERT INTO cms_cirattr ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('11','2014年-2015年','2','0-2','0','1','2','1500970540','1500970540');
INSERT INTO cms_cirattr ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('12','2015年-2016年','2','0-2','0','1','2','1500970556','1500970556');
DROP TABLE IF EXISTS `cms_circat`;
CREATE TABLE `cms_circat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(512) DEFAULT NULL COMMENT '栏目名称',
  `up_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级id',
  `path` varchar(512) DEFAULT NULL COMMENT '栏目路径',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 默认1显示 0隐藏',
  `admin_id` int(11) DEFAULT NULL COMMENT '添加管理员id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_circat ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','活动','0','0','0','1','2','1500970232','1500970232');
INSERT INTO cms_circat ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('2','项目','0','0','0','1','2','1500970241','1500970241');
INSERT INTO cms_circat ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('3','竞赛','0','0','0','1','2','1500970248','1500970248');
INSERT INTO cms_circat ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('4','物理竞赛','3','0-3','0','1','2','1500970263','1500970263');
INSERT INTO cms_circat ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('5','化学竞赛','3','0-3','0','1','2','1500970272','1500970272');
INSERT INTO cms_circat ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('6','人文项目','2','0-2','0','1','2','1500970288','1500970288');
INSERT INTO cms_circat ( `id`, `catname`, `up_id`, `path`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('7','地理项目','2','0-2','0','1','2','1500970302','1500970302');
DROP TABLE IF EXISTS `cms_circle`;
CREATE TABLE `cms_circle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `info` varchar(512) DEFAULT NULL COMMENT '简介',
  `cat_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级ID',
  `rank_id` int(11) NOT NULL DEFAULT '0' COMMENT '级别ID',
  `thumb` varchar(512) DEFAULT NULL COMMENT '缩略图',
  `nums` varchar(512) DEFAULT NULL COMMENT '限定人数',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `files` varchar(512) DEFAULT NULL COMMENT '附件',
  `content` text COMMENT '内容',
  `flag` varchar(512) DEFAULT NULL COMMENT '属性',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 默认1显示 0隐藏',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_circle ( `id`, `title`, `info`, `cat_id`, `rank_id`, `thumb`, `nums`, `start_time`, `end_time`, `files`, `content`, `flag`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','关于对自然资源的消耗绘画','','6','4','/Uploads/image/20170725/20170725161754_69826.png','20','1501254327','1501281027','/Source/kindeditor/attached/file/20170725/20170725101809_31508.docx','<p>
	<span style=\"font-family:\'Microsoft YaHei\', \'Segoe UI\', \'lucida grande\', \'lucida sans unicode\', lucida, helvetica, \'Hiragino Sans GB\', sans-serif;background-color:#FFFFFF;\">近年来主持的科研项目有：校博士后基金——兔皮肤病原真菌的免疫机制研究；校博士基金——水产动物产气荚膜梭菌毒素型及致病性性研究； 参加的科研项目有：国家自然科学基金——动物舍微生物气溶胶传播模式研究（2006.1～2008.1）；</span> 
</p>
<p style=\"text-align:center;\">
	<span style=\"font-family:\'Microsoft YaHei\', \'Segoe UI\', \'lucida grande\', \'lucida sans unicode\', lucida, helvetica, \'Hiragino Sans GB\', sans-serif;background-color:#FFFFFF;\"><img src=\"/Source/kindeditor/attached/image/20170725/20170725101852_55151.png\" alt=\"\" /><br />
</span> 
</p>
<p style=\"text-align:left;\">
	<span style=\"font-family:\'Microsoft YaHei\', \'Segoe UI\', \'lucida grande\', \'lucida sans unicode\', lucida, helvetica, \'Hiragino Sans GB\', sans-serif;background-color:#FFFFFF;\"><span style=\"font-family:\'Microsoft YaHei\', \'Segoe UI\', \'lucida grande\', \'lucida sans unicode\', lucida, helvetica, \'Hiragino Sans GB\', sans-serif;background-color:#FFFFFF;\">近年来主持的科研项目有：校博士后基金——兔皮肤病原真菌的免疫机制研究；校博士基金——水产动物产气荚膜梭菌毒素型及致病性性研究； 参加的科研项目有：国家自然科学基金——动物舍微生物气溶胶传播模式研究（2006.1～2008.1）；</span><br />
</span> 
</p>',',r,','0','1','2','1500970694','1501143404');
DROP TABLE IF EXISTS `cms_collect`;
CREATE TABLE `cms_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL COMMENT '关联ID',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '关联ID类型 1为活动 2为文库 3为作品 4为软件 5为视频直播 6为视频录播',
  `cat_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `uid` int(11) NOT NULL COMMENT '收藏人用户ID',
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '活动ID',
  `mid` int(11) NOT NULL DEFAULT '0' COMMENT '评论人ID',
  `content` text COMMENT '评论内容',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评论分类 0默认 1线下活动 2直播 3录播',
  `status` tinyint(1) DEFAULT '0' COMMENT '查看状态 默认0未查看 1已查看',
  `isshow` int(1) DEFAULT '1' COMMENT '评论 0不显示 1显示',
  `admin_id` int(11) DEFAULT '0' COMMENT '管理员ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=MyISAM DEFAULT CHARSET='utf8';
INSERT INTO cms_comment ( `id`, `aid`, `mid`, `content`, `type`, `status`, `isshow`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','1','1','这个真不错，大家可以都过来看看','1','0','1','2','1501048181','1501049326');
INSERT INTO cms_comment ( `id`, `aid`, `mid`, `content`, `type`, `status`, `isshow`, `admin_id`, `create_time`, `update_time` ) VALUES  ('2','1','2','哈哈哈','3','0','1','2','1501048181','1501056171');
INSERT INTO cms_comment ( `id`, `aid`, `mid`, `content`, `type`, `status`, `isshow`, `admin_id`, `create_time`, `update_time` ) VALUES  ('3','1','2','哈哈哈，这个也非常不错的','2','0','1','2','1501048181','1501055760');
DROP TABLE IF EXISTS `cms_comment_reply`;
CREATE TABLE `cms_comment_reply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '评论ID',
  `mid` int(11) NOT NULL DEFAULT '0' COMMENT '评论人ID',
  `rid` int(11) NOT NULL DEFAULT '0' COMMENT '被回复的回复ID',
  `content` text COMMENT '评论内容',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '查看状态 默认0未查看 1查看',
  `isshow` int(1) NOT NULL DEFAULT '1' COMMENT '评论 0不显示 1显示',
  `admin_id` int(11) DEFAULT '0' COMMENT '管理员ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=MyISAM DEFAULT CHARSET='utf8';
INSERT INTO cms_comment_reply ( `id`, `cid`, `mid`, `rid`, `content`, `status`, `isshow`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','1','2','0','给灌点水，支持','0','0','2','1501048181','1501055095');
DROP TABLE IF EXISTS `cms_config`;
CREATE TABLE `cms_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '字段名',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '分组',
  `cfg` varchar(200) NOT NULL COMMENT '字段名称',
  `content` text NOT NULL COMMENT '内容',
  `description` varchar(200) NOT NULL COMMENT '描述',
  `input` varchar(50) NOT NULL DEFAULT 'text' COMMENT '字段类型',
  `info` varchar(400) NOT NULL COMMENT '多选项',
  `isshow` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1显示 0 隐藏',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `optime` int(11) NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cfg` (`cfg`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('1','网站标题','1','title','江西财经大学','','text','','1','1','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('2','网站域名','6','domain','','','text','','1','2','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('3','关键词','6','keywords','','','text','','1','3','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('4','描述','6','description','','','text','','1','4','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('5','版权信息','6','footer','','','text','','1','5','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('8','网站状态','1','status','1','','bool','','1','8','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('9','提示语','6','tip','网站维护中','网站关闭的提示语','text','','1','9','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('10','微信二维码','6','wem','/Uploads/image/20170517/20170517182641_49647.jpeg','','image','','1','24','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('11','备案信息','6','benan','','','text','','1','5','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('15','百度地图描述','2','baidu_content','','','text','','1','18','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('17','地址','6','address','北京市朝阳区顺白路12号比目鱼创业园','','text','','1','17','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('18','电话','6','phone','010-5605-0496','','text','','1','18','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('20','邮箱','6','email','8432727628@bimfree.com','','text','','1','20','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('21','QQ客服','6','code','530088618','','text','','1','21','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('23','SEO标题','6','seotitle','','','text','','1','2','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('24','缩略图','3','thumb','/Uploads/image/20170428/20170428115132_19306.jpg','图片不存在时默认显示的图片','image','','1','23','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('25','TOKEN','3','weixin_token','','微信后台填写的TOKEN','text','','1','24','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('26','appid','3','weixin_appid','','微信appid','text','','1','25','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('27','secret','3','weixin_secret','','微信secret','text','','1','26','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('28','短信功能','4','sms_is','0','是否开启短信功能','bool','','1','27','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('29','短信帐号','4','sms_user','','短信帐号','text','','1','28','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('30','短信密码','4','sms_password','','短信密码','text','','1','29','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('32','邮件服务器端口','5','SMTP_PORT','465','邮件服务器端口','text','','1','31','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('33','邮件服务器地址','5','SMTP_HOST','','邮件服务器地址','text','','1','32','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('34','邮件用户名','5','SMTP_USER','','邮箱用户名','text','','1','33','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('35','邮件密码','5','SMTP_PASS','','邮箱密码','text','','1','34','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('36','是否启用ssl','5','SMTP_SSL','1','启用ssl','bool','','1','35','1501047405');
INSERT INTO cms_config ( `id`, `name`, `type`, `cfg`, `content`, `description`, `input`, `info`, `isshow`, `sort`, `optime` ) VALUES  ('38','百度地图APK','2','baidu_apk','','','text','','1','18','1501047405');
DROP TABLE IF EXISTS `cms_content`;
CREATE TABLE `cms_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `onclick` varchar(11) DEFAULT NULL COMMENT '点击量',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 默认1显示 0隐藏',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_content ( `id`, `title`, `content`, `onclick`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','校园介绍','<div id=\"3d23597f-a653-d1c5-4f0b-ce5c12078f22\" class=\"component component-TextArea\" style=\"font-family:\'Microsoft YaHei\', \'Segoe UI\', \'lucida grande\', \'lucida sans unicode\', lucida, helvetica, \'Hiragino Sans GB\', sans-serif;font-size:14px;padding:0px;background-color:#FFFFFF;\">
	<div class=\"Border\" style=\"padding:0px;background-color:rgba(255, 255, 255, 0);\">
		<div style=\"font-size:13px;color:#434343;\">
			<div>
				<p>
					<span>
					<p class=\"MsoNormal\">
						1<span>、在商品列表页面、购物车、浏览记录、我的关注或首页商品展示区点击商品图片、名称，进入商品详情页面。</span>
					</p>
					<p class=\"MsoNormal\">
						2<span>、配送范围：配送范围首次进入默认为</span><span>ip</span><span>地址定位的三级地址，如果用户选择过三级地址（该界面或者购物车界面或商品列表界面），则默认为上次选择的地址，用户可以进行修改。</span>
					</p>
					<p class=\"MsoNormal\">
						3<span>、库存查询：同时调用京东“商品区域购买限制查询”，和京东“批量获取库存接口”对商品存货状况进行查询，如果区域购买受限制，提示“该地区暂时缺货”；如果京东返回</span><span>33</span><span>和</span><span>40</span><span>，提示“有货”，如果库存少于</span><span>5</span><span>时，显示库存数字；如果京东返回</span><span>39</span><span>，提示“</span><span>在途，预计</span>2-6天后发货”；如果京东返回<span>36</span><span>，提示“</span>预定（商品到货后发货，现在可下单）”；如果返回<span>34</span><span>，提示“无货”。</span>
					</p>
					<p class=\"MsoNormal\">
						4<span>、用户选择库存数量，如果商品库存数量小于等于</span><span>5</span><span>时，用户选择大于</span><span>5</span><span>个时，提示“您选择的商品库存只有 &nbsp;件（具体几件：京东接口会给）！”，同时把商品数量自动调为 件。用户选择大于等于</span><span>200</span><span>个时，根据京东商品数量限制，提示“您购买的商品超过了</span><span>200</span><span>件！”</span>
					</p>
					<p class=\"MsoNormal\">
						5<span>、显示商品价格和可返积分，商品价格显示的是售价，可返积分根据后台数据库显示。</span>
					</p>
					<p class=\"MsoNormal\">
						6<span>、用户点击【立即购买】，直接进入结算页，点击【加入购物车】，商品加入购物车中，打开新页签</span><span>---</span><span>加入购物车成功页面，下面是猜你喜欢。</span><span>猜你喜欢显示该商品所在二级分类靠前的</span>8<span>个商品。</span>
					</p>
					<p class=\"MsoNormal\">
						7<span>、图片：图片默认显示主图，鼠标移入小图或者点击小图，进行大图切换，鼠标如果移入大图，显示原图。如果图片超过</span><span>5</span><span>个以上，点击向左、向右按钮可显示更多图片。</span>
					</p>
					<p class=\"MsoNormal\">
						8<span>、页面左下方，相关分类显示商品分类（三级分类，默认选中所在第三级分类，）；显示“购买此商品的用户也购买了”，显示该商品所在第二级别分类销量前五商品。</span>
					</p>
					<p class=\"MsoNormal\">
						9<span>、商品介绍和包装及参数直接取京东商品详细信息接口的</span><span>html</span><span>生成。</span>
					</p>
					<p class=\"MsoNormal\">
						10<span>、商品评价显示商品总的好评度、中评度、差评度。并显示评价明细，包括：用户名、评价星级、时间和内容。</span>
					</p>
					<p class=\"MsoNormal\">
						11<span>、对于已下架商品：点击订单中的已下架商品，商品界面显示“此商品已下柜，非常抱歉！”，同时不显示价格、数量、配送地址、购买、加入购物车按钮等信息。</span>
					</p>
					<p class=\"MsoNormal\">
						13<span>、显示参加的活动。点击可以进入参加活动所有商品的查询列表界面。</span>
					</p>
					<p class=\"MsoNormal\">
						14<span>、点击“我要关注</span>”,<span>提示关注成功。点击查看我的关注，进入到用户中心</span><span>-</span><span>我的关注。</span>
					</p>
					<p class=\"MsoNormal\">
						15<span>、如果商品设置为不可使用优惠券，前台在立即购买和加入购物车下增加“温馨提示：该商品不支持使用红包”</span><b></b>
					</p>
</span>
				</p>
			</div>
		</div>
	</div>
</div>
<div id=\"c769d56a-cd26-316a-ca2c-263b2f994aa7\" class=\"component component-TextArea\" style=\"font-family:\'Microsoft YaHei\', \'Segoe UI\', \'lucida grande\', \'lucida sans unicode\', lucida, helvetica, \'Hiragino Sans GB\', sans-serif;font-size:14px;padding:0px;background-color:#FFFFFF;\">
	<div class=\"Border\" style=\"padding:0px;background-color:rgba(255, 255, 255, 0);\">
		<div style=\"font-size:13px;color:#434343;\">
			<p>
				<br />
			</p>
		</div>
	</div>
</div>','','1','2','1501470860','1501471973');
DROP TABLE IF EXISTS `cms_flash`;
CREATE TABLE `cms_flash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `url` varchar(255) NOT NULL DEFAULT '0' COMMENT '录播链接',
  `rank_id` int(11) NOT NULL DEFAULT '0' COMMENT '级别ID',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `img` text COMMENT '多图',
  `address` varchar(255) DEFAULT NULL COMMENT '活动具体地址',
  `start_time` int(11) DEFAULT '0' COMMENT '活动开始时间',
  `end_time` int(11) DEFAULT '0' COMMENT '结束时间',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活动费用',
  `content` text COMMENT '活动内容',
  `approval_id` int(11) NOT NULL DEFAULT '0' COMMENT '审批机构',
  `approver_id` int(11) NOT NULL DEFAULT '0' COMMENT '审批人',
  `apply_is` tinyint(1) NOT NULL DEFAULT '0' COMMENT '报名是否需要审核 默认0不审核 1审核',
  `examine` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审核状态 默认1审核中 2审核通过 3审核未通过',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 默认1显示 0隐藏',
  `admin_id` int(11) DEFAULT '0' COMMENT '管理员ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_flash ( `id`, `mid`, `title`, `url`, `rank_id`, `thumb`, `img`, `address`, `start_time`, `end_time`, `money`, `content`, `approval_id`, `approver_id`, `apply_is`, `examine`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','0','关于对物理运动规律的认知2','http://www.ibangoo.com','3','/Uploads/image/20170725/20170725160810_52171.png',',/Source/kindeditor/php/../attached/image/20170726/20170726054934_87428.png,/Source/kindeditor/php/../attached/image/20170726/20170726055415_96525.png,/Source/kindeditor/php/../attached/image/20170726/20170726055415_37850.png,','','1501228519','1501295116','0.00','<p class=\"op_exactqa_detail_s_prop c-gap-bottom-small\" style=\"text-align:center;font-size:1.07em;font-weight:bold;color:#999999;font-family:arial;background-color:#FFFFFF;\">
	<span style=\"color:#000000;\">             黄鹤楼送孟浩然之广陵</span>
</p>
<p class=\"op_exactqa_detail_s_author\" style=\"text-align:center;color:#333333;font-family:arial;font-size:13px;background-color:#FFFFFF;\">
	                作者：李白
</p>
<div class=\"op_exactqa_detail_s_answer\" style=\"color:#333333;font-family:arial;font-size:13px;background-color:#FFFFFF;\">
	<div style=\"text-align:center;\">
		<span style=\"font-family:\'font-size:1.54em;line-height:1.5;\">    故人西辞黄鹤楼，烟花三月下扬州。</span>
	</div>
<span style=\"font-family:\"font-size:1.54em;\">
	<div style=\"text-align:center;\">
		<span style=\"line-height:1.5;color:#000000;\">     孤帆远影碧空尽</span><span style=\"line-height:1.5;color:#000000;\">，</span><span style=\"line-height:1.5;color:#000000;\">唯见长江天际流。</span>
	</div>
</span>
</div>','2','6','1','1','2','1','2','1501040991','1501060644');
INSERT INTO cms_flash ( `id`, `mid`, `title`, `url`, `rank_id`, `thumb`, `img`, `address`, `start_time`, `end_time`, `money`, `content`, `approval_id`, `approver_id`, `apply_is`, `examine`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('2','0','测试直播','0','3','','','','1501757418','1501899918','0.00','<h2 style=\"text-align:center;color:#8D061F;font-weight:normal;font-family:sans-serif, console, \'Hiragino Sans GB\', \'WenQuanYi Micro Hei\', SimSun;\">
	<div id=\"3d23597f-a653-d1c5-4f0b-ce5c12078f22\" class=\"component component-TextArea\" style=\"font-family:\'Microsoft YaHei\', \'Segoe UI\', \'lucida grande\', \'lucida sans unicode\', lucida, helvetica, \'Hiragino Sans GB\', sans-serif;font-size:14px;padding:0px;background-color:#FFFFFF;\">
		<div class=\"Border\" style=\"padding:0px;background-color:rgba(255, 255, 255, 0);\">
			<div style=\"font-size:13px;color:#434343;\">
				<div>
					<p style=\"text-align:left;\">
						<span>窗外，桂 花暗香浮动，梧桐疏影摇曳，宛如金秋的寒露落在盛夏的花朵上，一切看起来如此随然。时光荏苒，岁月沧桑，时间如白驹过隙般从指尖匆匆流过，留下的只是仓促和茫然。身处喧嚣的世界，一个人独在幽居，即使身边有太多的纷杂，只要在心里种菊，也会收获...</span>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div id=\"c769d56a-cd26-316a-ca2c-263b2f994aa7\" class=\"component component-TextArea\" style=\"font-family:\'Microsoft YaHei\', \'Segoe UI\', \'lucida grande\', \'lucida sans unicode\', lucida, helvetica, \'Hiragino Sans GB\', sans-serif;font-size:14px;padding:0px;background-color:#FFFFFF;\">
		<div class=\"Border\" style=\"padding:0px;background-color:rgba(255, 255, 255, 0);\">
			<div style=\"font-size:13px;color:#434343;\">
				<div>
					<p style=\"text-align:left;\">
						<span>窗外，桂 花暗香浮动，梧桐疏影摇曳，宛如金秋的寒露落在盛夏的花朵上，一切看起来如此随然。时光荏苒，岁月沧桑，时间如白驹过隙般从指尖匆匆流过，留下的只是仓促和茫然。身处喧嚣的世界，一个人独在幽居，即使身边有太多的纷杂，只要在心里种菊，也会收获...</span>
					</p>
				</div>
			</div>
		</div>
	</div>
</h2>
<p style=\"text-align:center;color:dimgrey;font-family:sans-serif, console, \'Hiragino Sans GB\', \'WenQuanYi Micro Hei\', SimSun;\">
	<span style=\"font-size:14px;line-height:1.5;\"></span> 
</p>','1','4','1','1','0','1','2','1501059432','1501470803');
DROP TABLE IF EXISTS `cms_flashrec`;
CREATE TABLE `cms_flashrec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT '0' COMMENT '会员ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `url` varchar(255) NOT NULL DEFAULT '0' COMMENT '录播链接',
  `rank_id` int(11) NOT NULL DEFAULT '0' COMMENT '级别ID',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `img` text COMMENT '多图',
  `onclick` int(11) NOT NULL DEFAULT '0' COMMENT '观看量',
  `address` varchar(255) DEFAULT NULL COMMENT '活动具体地址',
  `start_time` int(11) DEFAULT '0' COMMENT '活动开始时间',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活动费用',
  `content` text COMMENT '活动内容',
  `approval_id` int(11) NOT NULL DEFAULT '0' COMMENT '审批机构',
  `approver_id` int(11) NOT NULL DEFAULT '0' COMMENT '审批人',
  `apply_is` tinyint(1) NOT NULL DEFAULT '0' COMMENT '报名是否需要审核 默认0不审核 1审核',
  `examine` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审核状态 默认1审核中 2审核通过 3审核未通过',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 默认1显示 0隐藏',
  `admin_id` int(11) DEFAULT '0' COMMENT '管理员ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_flashrec ( `id`, `mid`, `title`, `url`, `rank_id`, `thumb`, `img`, `onclick`, `address`, `start_time`, `money`, `content`, `approval_id`, `approver_id`, `apply_is`, `examine`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','0','关于对物理运动规律的认知四人','http://www.ibangoo.com','3','/Uploads/image/20170725/20170725160810_52171.png',',/Source/kindeditor/php/../attached/image/20170726/20170726054934_87428.png,/Source/kindeditor/php/../attached/image/20170726/20170726055415_96525.png,/Source/kindeditor/php/../attached/image/20170726/20170726055415_37850.png,','0','','1500782119','0.00','<p class=\"op_exactqa_detail_s_prop c-gap-bottom-small\" style=\"text-align:center;font-size:1.07em;font-weight:bold;color:#999999;font-family:arial;background-color:#FFFFFF;\">
	<span style=\"color:#000000;\">             黄鹤楼送孟浩然之广陵</span>
</p>
<p class=\"op_exactqa_detail_s_author\" style=\"text-align:center;color:#333333;font-family:arial;font-size:13px;background-color:#FFFFFF;\">
	                作者：李白
</p>
<div class=\"op_exactqa_detail_s_answer\" style=\"color:#333333;font-family:arial;font-size:13px;background-color:#FFFFFF;\">
	<div style=\"text-align:center;\">
		<span style=\"font-family:\'font-size:1.54em;line-height:1.5;\">    故人西辞黄鹤楼，烟花三月下扬州。</span>
	</div>
<span style=\"font-family:\"font-size:1.54em;\">
	<div style=\"text-align:center;\">
		<span style=\"line-height:1.5;color:#000000;\">     孤帆远影碧空尽</span><span style=\"line-height:1.5;color:#000000;\">，</span><span style=\"line-height:1.5;color:#000000;\">唯见长江天际流。</span>
	</div>
</span>
</div>','2','6','1','1','0','1','2','1501040991','1501053230');
DROP TABLE IF EXISTS `cms_links`;
CREATE TABLE `cms_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '名称',
  `admin_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL COMMENT '链接地址',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `sort` int(11) NOT NULL COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 显示 0隐藏',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
DROP TABLE IF EXISTS `cms_mail`;
CREATE TABLE `cms_mail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT '0' COMMENT '接收人ID',
  `send_type` int(1) NOT NULL DEFAULT '0' COMMENT '发送方式 默认0普通发送 群发1',
  `content` text COMMENT '发送内容',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1已查看 0未查看',
  `isshow` int(1) NOT NULL DEFAULT '1' COMMENT '是否显示 1显示 0不显示',
  `admin_id` int(11) DEFAULT '0' COMMENT '管理员ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=MyISAM DEFAULT CHARSET='utf8';
INSERT INTO cms_mail ( `id`, `mid`, `send_type`, `content`, `title`, `status`, `isshow`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','1','1','这个真心不错','系统消息','0','1','2','1501127476','1501127476');
INSERT INTO cms_mail ( `id`, `mid`, `send_type`, `content`, `title`, `status`, `isshow`, `admin_id`, `create_time`, `update_time` ) VALUES  ('2','2','1','这个真心不错','系统消息','0','1','2','1501127476','1501127476');
DROP TABLE IF EXISTS `cms_member`;
CREATE TABLE `cms_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(128) DEFAULT NULL COMMENT '手机号',
  `username` varchar(128) DEFAULT NULL COMMENT '姓名',
  `password` varchar(512) DEFAULT NULL,
  `sign` varchar(512) DEFAULT NULL COMMENT '标识码',
  `student_id` varchar(512) DEFAULT NULL COMMENT '学号',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别 默认0 1男 2女',
  `thumb` varchar(512) DEFAULT NULL COMMENT '头像',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `grade` int(11) NOT NULL DEFAULT '0' COMMENT '我的学分',
  `worker_id` varchar(512) DEFAULT NULL COMMENT '职工号',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户类型 默认1学生 2教师',
  `college` varchar(512) DEFAULT NULL COMMENT '学院',
  `specialty` varchar(512) DEFAULT NULL COMMENT '专业',
  `class` varchar(512) DEFAULT NULL COMMENT '班级',
  `teacher` varchar(512) DEFAULT NULL COMMENT '班主任',
  `position` varchar(512) DEFAULT NULL COMMENT '职位',
  `organ` varchar(512) DEFAULT NULL COMMENT '机构',
  `email` varchar(512) DEFAULT NULL COMMENT '邮箱',
  `info` varchar(512) DEFAULT NULL COMMENT '简介',
  `unionid` varchar(512) DEFAULT NULL COMMENT '微信id',
  `content` varchar(512) DEFAULT NULL COMMENT '内容',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户状态 默认1启用 0禁用',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_member ( `id`, `phone`, `username`, `password`, `sign`, `student_id`, `sex`, `thumb`, `balance`, `grade`, `worker_id`, `type`, `college`, `specialty`, `class`, `teacher`, `position`, `organ`, `email`, `info`, `unionid`, `content`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','18810393755','张宁','d7ca9b12b043d9471f977a1a15b6f211','79801','','1','','0.00','0','','1','','','','','','','','','','','1','2','1500968901','1501471294');
INSERT INTO cms_member ( `id`, `phone`, `username`, `password`, `sign`, `student_id`, `sex`, `thumb`, `balance`, `grade`, `worker_id`, `type`, `college`, `specialty`, `class`, `teacher`, `position`, `organ`, `email`, `info`, `unionid`, `content`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('2','18810393754','王明','9da21eb484dc5a1b49d71f7549ae175f','75070','','1','','0.00','0','','1','','','','','','','','','','','1','2','1500969272','1500969886');
DROP TABLE IF EXISTS `cms_message`;
CREATE TABLE `cms_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `content` varchar(512) DEFAULT NULL COMMENT '反馈内容',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 默认0未查看 1已查看',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_message ( `id`, `mid`, `content`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','1','你们的这个功能用着太方便了','1','0','1500000000','1500000000');
DROP TABLE IF EXISTS `cms_news`;
CREATE TABLE `cms_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(512) DEFAULT NULL COMMENT '标题',
  `cat_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `author` varchar(512) DEFAULT NULL COMMENT '来源',
  `info` varchar(512) DEFAULT NULL COMMENT '简介',
  `thumb` varchar(512) DEFAULT NULL COMMENT '缩略图',
  `content` text COMMENT '内容',
  `flag` varchar(512) DEFAULT NULL COMMENT '属性',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 默认1显示 0隐藏',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_news ( `id`, `title`, `cat_id`, `author`, `info`, `thumb`, `content`, `flag`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','一本实现了AR互动特效的书','1','头条','人工智能已经成为近年来越来越热的话题，它代表了我们一直倡导的未来生活方式','/Uploads/image/20170725/20170725160810_52171.png','',',h,','0','1','2','1500970093','1500970093');
DROP TABLE IF EXISTS `cms_newscat`;
CREATE TABLE `cms_newscat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(512) DEFAULT NULL COMMENT '分类名称',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 默认1显示 0隐藏',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_newscat ( `id`, `catname`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','行业新闻','0','1','2','1500969916','1500969916');
INSERT INTO cms_newscat ( `id`, `catname`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('2','校园公告','0','1','2','1500969924','1500969924');
INSERT INTO cms_newscat ( `id`, `catname`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('3','社会','0','1','2','1500969932','1500969932');
DROP TABLE IF EXISTS `cms_order`;
CREATE TABLE `cms_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` varchar(255) DEFAULT NULL COMMENT '订单编号或流水号',
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '活动或课程ID',
  `mid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单类型 0默认 1为线下活动 2为直播 3为录播',
  `pay_way` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付方式 1微信 2支付宝 3为余额支付',
  `wxcode` varchar(255) DEFAULT NULL COMMENT '微信交易单号',
  `alicode` varchar(255) DEFAULT NULL COMMENT '支付宝交易单号',
  `pay_is` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态 0未支付 1已支付 2为无需支付',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '订单状态 0未处理 1已处理',
  `isshow` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示 0不显示 1显示',
  `paytime` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `admin_id` int(11) DEFAULT '0' COMMENT '管理员ID',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_order ( `id`, `oid`, `aid`, `mid`, `money`, `type`, `pay_way`, `wxcode`, `alicode`, `pay_is`, `status`, `isshow`, `paytime`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','12345678901','1','1','0.00','1','0','','','2','0','1','0','0','1500000000','1500000000');
DROP TABLE IF EXISTS `cms_shortmessage`;
CREATE TABLE `cms_shortmessage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `codes` int(11) NOT NULL COMMENT '手机验证码',
  `type` tinyint(1) DEFAULT '0' COMMENT '类型 1为绑定手机号 2为登陆 3为绑定银行卡',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
DROP TABLE IF EXISTS `cms_student`;
CREATE TABLE `cms_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) DEFAULT NULL COMMENT '姓名',
  `student_id` varchar(128) DEFAULT NULL COMMENT '学号',
  `info` varchar(512) DEFAULT NULL COMMENT '简介',
  `thumb` varchar(512) DEFAULT NULL COMMENT '头像',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 默认1显示 0隐藏',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_student ( `id`, `username`, `student_id`, `info`, `thumb`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','王琳','1234567890','孤帆远影碧空尽，唯见长江天际流','/Uploads/image/20170725/20170725160056_66365.jpg','0','1','2','1500969660','1500969869');
INSERT INTO cms_student ( `id`, `username`, `student_id`, `info`, `thumb`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('2','张明','1234567891','两岸猿声啼不住，轻舟已过万重山','/Uploads/image/20170725/20170725160135_74259.jpg','0','0','2','1500969695','1501222450');
INSERT INTO cms_student ( `id`, `username`, `student_id`, `info`, `thumb`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('7','方婷','1234567892','','','0','1','0','1501212242','0');
INSERT INTO cms_student ( `id`, `username`, `student_id`, `info`, `thumb`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('8','李辉','123456783','','','0','0','0','1501212242','1501222452');
INSERT INTO cms_student ( `id`, `username`, `student_id`, `info`, `thumb`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('10','刘强','123456784','','','0','1','0','1501212557','0');
INSERT INTO cms_student ( `id`, `username`, `student_id`, `info`, `thumb`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('11','邓辉','123456785','','','0','1','0','1501212557','0');
INSERT INTO cms_student ( `id`, `username`, `student_id`, `info`, `thumb`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('12','王清','123456','','','0','1','0','1501225646','0');
INSERT INTO cms_student ( `id`, `username`, `student_id`, `info`, `thumb`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('13','王清林','123456','','','0','1','0','1501226007','0');
DROP TABLE IF EXISTS `cms_teacher`;
CREATE TABLE `cms_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) DEFAULT NULL COMMENT '姓名',
  `worker_id` varchar(128) DEFAULT NULL COMMENT '职工号',
  `technical` varchar(512) DEFAULT NULL COMMENT '职称',
  `info` varchar(512) DEFAULT NULL COMMENT '简介',
  `thumb` varchar(512) DEFAULT NULL COMMENT '头像',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 默认1显示 0隐藏',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
INSERT INTO cms_teacher ( `id`, `username`, `worker_id`, `technical`, `info`, `thumb`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('1','张庆','1234567891','金融系讲师','姑苏城外寒山寺，夜半钟声到客船','/Uploads/image/20170725/20170725160056_66365.jpg','0','1','2','1500969723','1501139685');
INSERT INTO cms_teacher ( `id`, `username`, `worker_id`, `technical`, `info`, `thumb`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('2','李玲','1234567892','物理系高级讲师','床前明月光，疑是地上霜','/Uploads/image/20170725/20170725160227_22216.png','0','1','2','1500969761','1501139703');
INSERT INTO cms_teacher ( `id`, `username`, `worker_id`, `technical`, `info`, `thumb`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('3','武勒','1234567893','金融系讲师','','','0','1','0','1501225009','0');
INSERT INTO cms_teacher ( `id`, `username`, `worker_id`, `technical`, `info`, `thumb`, `sort`, `status`, `admin_id`, `create_time`, `update_time` ) VALUES  ('4','唐昕','1234567894','物理系高级讲师','','','0','1','0','1501225009','0');
DROP TABLE IF EXISTS `cms_thumbs_up`;
CREATE TABLE `cms_thumbs_up` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL COMMENT '关联ID',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '关联ID类型 1为活动 2为文库 3为作品 4为资讯 5为视频直播 6为视频录播 7为软件',
  `uid` int(11) NOT NULL COMMENT '点赞人用户ID',
  `sort` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET='utf8';
