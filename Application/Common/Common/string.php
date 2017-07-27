<?php
/**
 * 字符串验证
 * 尉强 2015-10-14 * 
 * 
 * 字符串清除所有空格
 * trimAll($string)
 * 
 * 数组 gb2312 转 utf8  无返回值
 * gb2312ToUtf8(& $string)
 * 
 * 汉字反转
 * str_reverse($string)
 * 
 * 把一个字符串的中间部分用星号隐藏掉
 * replace_with_stars($str,$char='*')
 * 
 * 随机生成字符串
 * randCode($length=5,$type=0)
 * 
 * 截取字符串长度，过滤所有HTML格式
 * sub_str($data,$len,$tail='...',$strip='')
 * 
 * 统计字utf-8符串长度，一个汉字算两个字节
 * utf8_len($str)
 * 
 * 返回正整数，如果非正整数返回0
 * numberval($num)
 * 
 * 转化数值格式 100.00
 * price($price)
 * 
 * 改进htmlspecialchars
 * newhtmlspecialchars($string,$quotes=ENT_QUOTES)
 * 
 * 改进htmlspecialchars_decode
 * newhtmlspecialchars_decode($string,$quotes=ENT_QUOTES)
 * 
 * 数组的key为数组的id
 * ArrayKey(& $arr)
 * 
 * 格式化字节大小
 * format_bytes($size, $delimiter = '') 
 * 
 * 数组转化成字符串
 * Array2String($arr,$tb=',')
 * 
 * 字符串转化成数组
 * String2Array($word,$tb=',')
 * 
 * 改进array_filter 删除数组中的空值
 * new_arrayfilter(& $arr)
 * 
 * Xml 转 数组, 不包括根键
 * xmltoarray($xml)
 * 
 * Xml 转 数组, 包括根键
 * xml_to_array($xml)
 * 
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
 * Xml 转 数组, 不包括根键
**/
function xmltoarray($xml){
	$arr = xml_to_array($xml);
	$key = array_keys($arr);
	return $arr[$key[0]];
}
/**
 * Xml 转 数组, 包括根键
**/
function xml_to_array($xml){
	$reg = "/<(\\w+)[^>]*?>([\\x00-\\xFF]*?)<\\/\\1>/";
	if(preg_match_all($reg, $xml, $matches)){
		$count = count($matches[0]);
		$arr = array();
		for($i = 0; $i < $count; $i++){
			$key = $matches[1][$i];
			$val = xml_to_array( $matches[2][$i] );  // 递归
			if(array_key_exists($key, $arr)){
				if(is_array($arr[$key])){
					if(!array_key_exists(0,$arr[$key])){
						$arr[$key] = array($arr[$key]);
					}
				}else{
					$arr[$key] = array($arr[$key]);
				}
				$arr[$key][] = $val;
			}else{
				$arr[$key] = $val;
			}
		}
		return $arr;
	}else{
		return $xml;
	}
}
/**
 * 改进array_filter 删除数组中的空值
 * 无返回值
**/
function new_arrayfilter(& $arr){
	if(is_array($arr)){
		foreach( $arr as $k=>$v){
			if(!is_array($v)){
				if(empty($v)) unset($arr[$k]);
			}else{
				new_arrayfilter($arr[$k]);
			}
		}
	}
}
/**
 * 数组转化成字符串
 * $arr 数组
 * $tb 间隔符
**/
function Array2String($arr,$tb=','){
	$data=$tb;
	if(is_array($arr)){
		$data .=implode($tb,$arr);
		$data.=$tb;
	}
	return $data;
}
/**
 * 字符串转化成数组
 * $word 字符串
 * $tb 间隔符
**/
function String2Array($word,$tb=','){
	$all=explode($tb,$word);
	new_arrayfilter($all);
	$all = array_values($all);
	return $all;
}
/**
 * 格式化字节大小
 * @param  number $size      字节数
 * @param  string $delimiter 数字和单位分隔符
 * @return string            格式化后的带单位的大小
 */
function format_bytes($size,$delimiter=''){
    $units = array('B', 'KB', 'MB', 'GB', 'TB', 'PB');
    for ($i = 0; $size >= 1024 && $i < 5; $i++) $size /= 1024;
    return round($size, 2) . $delimiter . $units[$i];
}

/**
 * 数组的key为数组的id
**/
function ArrayKey(& $arr){
	if(is_array($arr)){
		foreach($arr as $k=>$v){
			$new_arr[$v['id']]=$v;
		}
		$arr=$new_arr;
	}
}
/**
 * 改进htmlspecialchars
 * $quotes:ENT_COMPAT、ENT_QUOTES、ENT_NOQUOTES
**/
function newhtmlspecialchars($string,$quotes=ENT_QUOTES){
	if(!is_array($string)) return htmlspecialchars($string,$quotes);
	foreach($string as $key => $val) $string[$key] = newhtmlspecialchars($val,$quotes);
	return $string;
}
/**
 * 改进htmlspecialchars_decode
 * $quotes:ENT_COMPAT、ENT_QUOTES、ENT_NOQUOTES
 * 改进 添加get_magic_quotes_gpc判断自动清除反斜线
**/
function newhtmlspecialchars_decode($string,$quotes=ENT_QUOTES){
	if (get_magic_quotes_gpc()){
		if(!is_array($string)) return stripslashes(htmlspecialchars_decode($string,$quotes));
		foreach($string as $key => $val) $string[$key] = stripslashes(newhtmlspecialchars_decode($val,$quotes));
		
	}else{
		if(!is_array($string)) return htmlspecialchars_decode($string,$quotes);
		foreach($string as $key => $val) $string[$key] = newhtmlspecialchars_decode($val,$quotes);
	}
	return $string;
}
/**
 * 转化数值格式
 * 100.00
**/
function price($price){
	return sprintf("%.0f",$price);
}

/**
 * 返回正整数，如果非正整数返回0
 * @param type $num
 * @return type
 */
function numberval($num){
    if(!is_numeric($num)) return 0;
	$num = (int)$num;
    if(is_int($num) && $num>=0){
        return $num;
    }else{
        return 0;
    }
}
/**
 * 截取字符串长度，过滤所有HTML格式
 * @param string $str 字符串
 * @param int $len 长度
 * @param string $tail 尾巴跟的字符
**/
function sub_str($data,$len,$tail='...',$strip=''){
	$qian=array(" ","　","\t","\n","\r");
	$data = str_replace($qian, '', $data);  
			
    $data = strip_tags($data, $strip);
    $str = $data;
    for( $i=0; $i<$len; $i++ ) {
        $temp_str = substr($str,0,1);
        if(ord($temp_str) > 127) {
            $i++;
            if( $i<$len ) {
                $new_str[] = substr($str,0,3);
                $str = substr($str,3);
            }
        }else{
            $new_str[] = substr($str,0,1);
            $str = substr($str,1);
        }
    }
    $str = join($new_str);
    if(utf8_len($data)>$len) $str .= $tail;
    return $str;
}
/**
 * 统计字utf-8符串长度，一个汉字算两个字节
 * @param type $str 字符串
 * @return int 长度
**/
function utf8_len($str){
	$count = 0;
	$str = iconv('utf-8','gbk',$str);
	$num = strlen($str);
	for($i=0;$i<$num;$i++){
		if(ord(substr($str,$i+1,1))>127){
			$count++;$i++;
		}
	}
	$str = iconv('gbk','utf-8',$str);
	$total = mb_strlen($str,'utf8');
	$number = ($total-$count)+($count*2);
	return $number;
}
/**
 * 随机生成字符串
**/
function randCode($length=5,$type=0){
	$arr = array(1 => "0123456789", 2 => "abcdefghijklmnopqrstuvwxyz", 3 => "ABCDEFGHIJKLMNOPQRSTUVWXYZ", 4 => "~@#$%^&*(){$public}[]|");
	if ($type == 0){
		array_pop($arr);
		$string = implode("", $arr);
	}elseif($type == "-1"){
		$string = implode("", $arr);
	}else{
		$string = $arr[$type];
	}
	$count = strlen($string) - 1;
	$code = '';
	for($i = 0; $i < $length; $i++){
		$code .= $string[rand(0, $count)];
	}
	return $code;
}
/**
 * 把一个字符串的中间部分用星号隐藏掉
**/
function replace_with_stars($str,$char='*'){
	if(preg_match('/[\x{4e00}-\x{9fa5}]/u', $str)){
		$len=mb_strlen($str,'UTF-8');
		if($len<3)
			return $str;
		elseif($len<5)
			$slen=1;
		elseif($len<7)
			$slen=2;
		elseif($len<9)
			$slen=3;
		elseif($len<13)
			$slen=4;
		elseif($len<16)
			$slen=5;
		elseif($len<19)
			$slen=6;
		else
			$slen=7;
		$pos=($len-$slen)%2==0?(($len-$slen)/2):(intval(($len-$slen)/2)+1);
		$rt=mb_substr($str,0, $pos,'UTF-8').str_repeat($char, $slen).mb_substr($str, -1*($len-($pos+$slen)),$len,'UTF-8');
		return $rt;
	}else{
		$len=strlen($str);
		if($len<5)
			return $str;
		elseif($len<7)
			$slen=2;
		elseif($len<9)
			$slen=3;
		elseif($len<13)
			$slen=4;
		else
			$slen=5;
		$pos=($len-$slen)%2==0?(($len-$slen)/2):(intval(($len-$slen)/2)+1);
		$rt=substr($str,0, $pos).str_repeat($char, $slen).substr($str, -1*($len-($pos+$slen)));
		return $rt;
	}
	//if($len)
}
/**
 * 字符串清除所有空格
**/
function trimAll($string){
	$string = trim($string);// 首先去掉头尾空格
	$string = str_replace('　','',$string);
	$string = preg_replace('/\s(?=\s)/','',$string);// 接着去掉两个空格以上的
	$string = preg_replace('/[\n\r\t]/','',$string);// 最后将非空格替换为一个空格
	return $string;
}
/**
 * 数组 gb2312 转 utf8
**/
function gb2312ToUtf8(& $string){     
	if (!is_array($string)){
		$string = iconv('GB2312', 'UTF-8//IGNORE', $string);
	}else{
		foreach ($string as $k=>$v){
			gb2312ToUtf8($string[$k]);
		}
	}
}
/**
 * 汉字反转
**/
function str_reverse($string){
	preg_match_all('/./us', $string, $array);
	return implode('', array_reverse($array[0]));
}
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
function replace_with_stars2($str,$char='*'){
	if(preg_match('/[\x{4e00}-\x{9fa5}]/u', $str)){
		$len=mb_strlen($str,'UTF-8');
		if($len<3)
			return $str;
		elseif($len<5)
			$slen=1;
		elseif($len<7)
			$slen=2;
		elseif($len<9)
			$slen=3;
		elseif($len<13)
			$slen=4;
		elseif($len<16)
			$slen=5;
		elseif($len<19)
			$slen=6;
		else
			$slen=7;
		$pos=($len-$slen)%2==0?(($len-$slen)/2):(intval(($len-$slen)/2)+1);
		$rt=mb_substr($str,0, $pos,'UTF-8').str_repeat($char, $slen).mb_substr($str, -1*($len-($pos+$slen)),$len,'UTF-8');
		return $rt;
	}else{
		$len=strlen($str);
		if($len<5)
			return $str;
		elseif($len<7)
			$slen=2;
		elseif($len<9)
			$slen=3;
		elseif($len<13)
			$slen=4;
		else
			$slen=5;
		$pos=($len-$slen)%2==0?(($len-$slen)/2):(intval(($len-$slen)/2)+1);
		$rt=substr($str,0, $pos).str_repeat($char, $slen).substr($str, -1*($len-($pos+$slen)));
		return $rt;
	}
	//if($len)
}
?>
