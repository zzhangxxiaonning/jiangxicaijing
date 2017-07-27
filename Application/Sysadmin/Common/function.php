<?php
/**
 * 自定义方法
 * 
 * 
 * 
**/

function _get_area_name($id){
	$_data = M('Area')->where(array('id'=>array('eq',$id)))->cache(120,true)->field('name')->find();
	return $_data['name']?$_data['name']:'其他';
}
function create_up_url($url,$t=''){
	$d_url = ($_SERVER["REQUEST_SCHEME"]?$_SERVER["REQUEST_SCHEME"]:'http').'://'.$_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
	/*$up_url = $_SERVER['HTTP_REFERER'];
	if($up_url != $d_url){
		if($up_url){
			$url = $up_url;
		}
		cookie('referer',$url);
	}*/
	cookie('referer'.$t,$d_url?$d_url:$url);
	return cookie('referer'.$t);
}
function get_up_url($url,$t=''){
	return cookie('referer'.$t)?cookie('referer'.$t):$url;
}
?>
