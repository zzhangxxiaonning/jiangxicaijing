<?php
/**
 * 路由配置文件
**/
return array(
	'URL_ROUTER_ON'		=>	true,
	'URL_ROUTE_RULES'	=>	array(
		'News/:tid\d/:p\d'	=>	'News/lists',
		'news/:tid\d/:p\d'	=>	'News/lists',
		
		'News/:tid\d'	=>	'News/lists',
		'news/:tid\d'	=>	'News/lists',
		
		'News/content/:p\d'	=>	'News/content',
		'news/content/:p\d'	=>	'News/content',
	),
);
?>