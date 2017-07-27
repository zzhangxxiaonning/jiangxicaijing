<?php
return array(
	/* Cookie设置 */
    'COOKIE_EXPIRE'         => 0,			// Coodie有效期
    'COOKIE_DOMAIN'         => '',			// Cookie有效域名
    'COOKIE_PATH'           => '/',			// Cookie路径
    'COOKIE_PREFIX'         => 'MyAdmin_',	// Cookie前缀 避免冲突
	'SESSION_PREFIX'        => 'MyAdmin_',	// session 前缀	
	
	'CATEGORY_TYPE'=>array(
		1=>array('id'=>'1','name'=>'内容列表','model'=>'Lists'),
		2=>array('id'=>'2','name'=>'内容单页','model'=>'Page'),
		3=>array('id'=>'3','name'=>'栏目主页','model'=>'Category'),
		4=>array('id'=>'4','name'=>'列表主页','model'=>'Lists'),
		5=>array('id'=>'5','name'=>'单页主页','model'=>'Page'),
		0=>array('id'=>'0','name'=>'外部链接','model'=>'Links'),
	),
	'CAR_FLAG'=>array(
		'd'	=> array('id'=>'d','name'=>'预约试驾'),
		// 'c'	=> array('id'=>'c','name'=>'在线订车'),
		// 'b'	=> array('id'=>'b','name'=>'预约保养'),
	),
	'MEMBER_FLAG'=>array(
		'f' => array('id'=>'f','name'=>'售后'),
		'j' => array('id'=>'j','name'=>'卖车'),
		// 's' => array('id'=>'s','name'=>'4s店'),
	),
	
);