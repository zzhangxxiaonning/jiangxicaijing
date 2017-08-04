<?php
$sysconfig = F('sysconfig','',CONF_PATH);
$config = array(
	/** 其他自定义配置项 
	 * db			数据库配置;
	 * sysconfig	系统后台配置
	 * cache		缓存配置
	**/
	'LOAD_EXT_CONFIG'	=>	'db,cache,type,route',
	'LOAD_EXT_FILE'	=>	'common,string,oauth',
	'MODULE_ALLOW_LIST' => array('App','Home','Sysadmin','Api'),
	'URL_PATHINFO_FETCH' => '2',
	'URL_MODEL'	=>	2,
	// 'TMPL_EXCEPTION_FILE'	=> '404.html',
    'TMPL_CACHE_ON' => false,//禁止模板编译缓存
    'HTML_CACHE_ON' => false,//禁止静态缓存
    'BASE_URL'      => 'http://jiangxicaijing_tp.com',//域名
    /*验证条件*/
    'REGULAR'       => '/\w+@(\w|\d)+\.\w{2,3}/i',


);
return array_merge($config,$sysconfig);