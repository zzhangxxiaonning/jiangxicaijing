-- Tea SQL Dump Program
-- 
-- DATE : 2017-07-28 18:48:50
-- Vol : 1
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
