-- Tea SQL Dump Program
-- 
-- DATE : 2017-07-28 18:51:51
-- Vol : 1
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
