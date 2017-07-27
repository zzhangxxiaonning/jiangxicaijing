<?php
/**
 * 字符串验证
 * 尉强 2015-10-14 * 
 * 
 * 判断是否URL
 * isUrl($string)
 * 
 * 判断是否为有限数值，正负小数
 * isSignificance($string)
 * 
 * 检查是否为手机号
 * isMobile($string)
 * 
 * 检查是否为邮箱地址
 * isEmail($string)
 * 
 * 检查是否为银行卡号
 * isBankcard($string)
 *
 * 检查是否为身份证号
 * isIdcard($string)
 * 
 * 检查是否为汉字
 * isChinese($string)
 * 
 * 检查是否为姓名
 * isCardName($string)
 * 
 * 检查密码是否合法
 * isPassword($string)
 * 
 * 检查用户名是否合法
 * isUsername($string)
 * 
**/
/**
 * 判断是否URL
**/
function isUrl($string){	
	// $zz='/http:\/\/[\w.]+[\w\/]*[\w.]*\??[\w=&\+\%]*/is';
	$zz = getConfigName('url','zz');
	if(preg_match($zz,$string)){
		return true;
	}else{    
		return false;
	}
}
/**
 * 判断是否为有限数值，正负小数
**/
function isSignificance($string){
	// $zz='/^(-?[0-9]+)(\.[0-9]+)?$/';
	$zz = getConfigName('numerical','zz');
	if(preg_match($zz,$string)){  
		return true;
	}else{    
		return false;
	}
}
/**
 * 检查是否为手机号
**/
function isMobile($string){
	// $zz='/^1[3|5|7|8]{1}[0-9]{9}$/';
	$zz = getConfigName('mobile','zz');
	if(preg_match($zz,$string)){  
		return true;
	}else{    
		return false;
	}
}
/**
 * 检查是否为邮箱地址
**/
function isEmail($string){
	// $zz='/\w+@(\w|\d)+\.\w{2,3}/i';
	$zz = getConfigName('email','zz');
	if(preg_match($zz,$string)){  
		return true;
	}else{    
		return false;
	}
}
/**
 * 检查是否银行卡号
**/
function isBankcard($string){
	$leng = strlen($string);
	if($leng<16 && $leng>19){
		return false;
	}
	$zz='/^\d*$/';
	if(preg_match($zz,$string)){
		return true;
	}else{
		return false;
	}
}
/**
 * 检查是否为汉字
**/
function isChinese($string){
	// $zz='/^[\x{4e00}-\x{9fa5}]{1,15}/u';
	$zz = getConfigName('chinese','zz');
	if(preg_match($zz,$string)){
		return true;
	}else{
		return false;
	}
}
/**
 * 检查是否为姓名
**/
function isCardName($string){
	// $zz='/^[\x{4e00}-\x{9fa5}]{2,15}/u';
	$zz = getConfigName('chinesename','zz');
	if(preg_match($zz,$string)){
		return true;
	}else{
		return false;
	}
}
/**
 * 检查是否为身份证号
**/
function isIdcard($string){
	// $zz = '/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/';
	$zz = getConfigName('idcard','zz');
	if(preg_match($zz,$string)){
		return true;
	}else{
		return false;
	}
}
/**
 * 检查密码是否合法
**/
function isPassword($string){
	// $zz='/^.{6,}$/';
	$zz = getConfigName('password','zz');
	if(preg_match($zz,$string)){
		return true;
	}else{
		return false;
	}
}
function isUsername($string){
	// $zz='/^[a-zA-Z0-9\._]+$/';
	$zz = getConfigName('username','zz');
	if(preg_match($zz,$string)){
		$leng = strlen($string);
		if($leng>5){
			return true;
		}else{
			return false;
		}
	}else{
		return false;
	}
}
?>
