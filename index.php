<?php
// 应用入口文件

// 检测PHP环境
if(version_compare(PHP_VERSION,'5.3.0','<'))  die('require PHP > 5.3.0 !');
$url = $_SERVER['SERVER_NAME'];
$url .= $_SERVER['SERVER_PORT'] == '80' ? '' : ':'.$_SERVER['SERVER_PORT'];
define('APP_URL', 'http://'.$url);
define('APP_PATH','./Application/');
define('APP_DEBUG',true);
define('RUNTIME_PATH','./Runtime/');
define('SOURCE_PATH','/Source/');
define('UPLOADS_PATH','/');
define('BUILD_DIR_SECURE', true);
define('DIR_SECURE_FILENAME', 'index.html');
define('DIR_SECURE_CONTENT', 'deney Access!');
// 引入ThinkPHP入口文件
require './_Core/ThinkPHP.php';