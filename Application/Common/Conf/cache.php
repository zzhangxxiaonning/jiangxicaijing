<?php
/**
 * 缓存配置文件
**/
return array(
	'DB_SQL_BUILD_CACHE'	=> true,
	'DB_SQL_BUILD_QUEUE'	=> 'xcache',
	'DB_SQL_BUILD_LENGTH'	=> 20,		// SQL缓存的队列长度
	'OUTPUT_ENCODE'			=> false,	// 页面压缩输出
	'SHOW_PAGE_TRACE'		=> false,	// 显示页面Trace信息
);
?>