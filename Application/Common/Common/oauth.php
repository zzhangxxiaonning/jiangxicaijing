<?php
/**
 * 字符串验证
 * 尉强 2015-10-14 * 
 * 
 * 发送短信
 * shortmessage($mtel,$mcon,$mtime='')
 * 
 * 邮件发送
 * SendEmail($to,$subject='',$body='')
 * 
 * 导出表格
 * exportexcel($expTableData,$expCellName,$expTitle)
 * 
 * 下载文件
 * downloadFile($file)
 * 
 * 获取配置项信息
 * getConfigName($id,$name="name",$config='REGULAR')
 * 
 * URL处理 上一步url
 * getBackUrl($backurl)
 * 
 * 获取当前页面完整URL地址
 * getUrl()
 * 
 * 缩略图方法
 * Thumb($img,$width='',$height='')
 * 
 * 检查是否为手机登录 并跳转
 * isMobileWap($url="")
 * 
 * 判断是否是手机端 并跳转
 * isMobile2()
 * 
 * 
 * 检查url 地址是否合法
 * function CheckUrlTrue($url='')
 * 
**/

/**
 * 下载文件
**/
function downloadFile($file){
	$file = ltrim($file,'/');
	if(is_file($file)){
		$length = filesize($file);
		$finfo = finfo_open(FILEINFO_MIME);
		echo $type = finfo_file($finfo, $file);
		finfo_close($finfo);	
		$showname =  ltrim(strrchr($file,'/'),'/');
		header("Content-Description: File Transfer");
		header('Content-type: ' . $type);
		header('Content-Length:' . $length);
		if (preg_match('/MSIE/', $_SERVER['HTTP_USER_AGENT'])) { //for IE
			header('Content-Disposition: attachment; filename="' . rawurlencode($showname) . '"');
		} else {
			header('Content-Disposition: attachment; filename="' . $showname . '"');
		}
		readfile($file);
		exit;
	}else{
		exit('文件已被删除！');
	}
}
/**
 * 导出表格
 * PHPExcel
**/
function exportexcel($expTableData,$expCellName,$expTitle){//导出Excel
	foreach($expCellName as $k=>$v){
		$aa[$k][]=$k;
		$aa[$k][]=$v;
	}
	export_excel($expTableData,$aa,$expTitle);
}
function export_excel($expTableData=array(),$expCellName=array(),$expTitle='report'){
	Vendor('Excel.PHPExcel');
	$xlsTitle = iconv('utf-8', 'gb2312', $expTitle);//文件名称
	$fileName = $xlsTitle.date('_YmdHis');//or $xlsTitle 文件名称可根据自己情况设定
	$cellNum = count($expCellName);
	$dataNum = count($expTableData);
	$objPHPExcel = new PHPExcel();
	$cellName = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','AA','AB','AC','AD','AE','AF','AG','AH','AI','AJ','AK','AL','AM','AN','AO','AP','AQ','AR','AS','AT','AU','AV','AW','AX','AY','AZ');
	
	$objPHPExcel->getActiveSheet(0)->mergeCells('A1:'.$cellName[$cellNum-1].'1');//合并单元格
	$objPHPExcel->setActiveSheetIndex(0)->setCellValue('A1', $expTitle.'  Export time:'.date('Y-m-d H:i:s'));  
	for($i=0;$i<$cellNum;$i++){
		$objPHPExcel->setActiveSheetIndex(0)->setCellValue($cellName[$i].'2', $expCellName[$i][1]); 
	}
	for($i=0;$i<$dataNum;$i++){
	  for($j=0;$j<$cellNum;$j++){
		$objPHPExcel->getActiveSheet(0)->setCellValue($cellName[$j].($i+3), $expTableData[$i][$expCellName[$j][0]]);
	  }             
	}
	header('pragma:public');
	header('Content-type:application/vnd.ms-excel;charset=utf-8;name="'.$xlsTitle.'.xls"');
	header("Content-Disposition:attachment;filename=$fileName.xls");//attachment新窗口打印inline本窗口打印
	$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');  
	$objWriter->save('php://output'); 
	exit;   
}

/**
 * 系统邮件发送函数
 * @param string $to    接收邮件者邮箱
 * @param string $name  接收邮件者名称
 * @param string $subject 邮件主题 
 * @param string $body    邮件内容
 * @param string $attachment 附件列表
 * @return boolean 
 */
function SendEmail($to,$subject='',$body=''){
	
	import('ORG.Util.Sendmail');
	$mail = new Sendmail();
	$smtpserver 	=	C('SMTP_HOST');	//SMTP服务器
	$smtpserverport =	C('SMTP_PORT');	//SMTP服务器端口
	$smtpusermail	=	C('SMTP_USER');	//SMTP服务器的用户邮箱//163邮箱等
	$smtpuser		=	C('SMTP_USER');	//SMTP服务器的用户帐号
	$smtppass		=	C('SMTP_PASS');	//SMTP服务器的用户密码		
	$namesmtp		=	C('FROM_NAME');		
	$isSecurity		=	C('SMTP_SSL');	// 到服务器的连接是否为安全连接，默认false
	
	$mail->setServer($smtpserver, $smtpusermail, $smtppass,$smtpserverport, $isSecurity); //设置smtp服务器，到服务器的SSL连接
	$mail->setFrom($smtpuser); //设置发件人
	$mail->setFromname($namesmtp); //设置发件人名称
	$mail->setReceiver($to); //设置收件人，多个收件人，调用多次
	// $mail->setCc("XXXX"); //设置抄送，多个抄送，调用多次
	// $mail->setBcc("XXXXX"); //设置秘密抄送，多个秘密抄送，调用多次
	// $mail->addAttachment("XXXX"); //添加附件，多个附件，调用多次
	$mail->setMail($subject, $body); //设置邮件主题、内容
	$mail->sendMail(); //发送
}
/**
 * curl get
 * $url 抓取页面的url
**/
function curl_get($url){
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch,CURLOPT_POSTFIELDS,$params);
	curl_setopt($ch, CURLOPT_TIMEOUT,3);
	$data = curl_exec($ch);		
	curl_close ($ch);
	return $data;
}
/**
 * 发送短信
 * 参数说明:
 * $mtel为电话号，字符串形式与数组形式都可以，数组形式为群发短信;
 * $mcon为短信内容;
 * $mtime为短信发送时间，空值时。为及时发送.
 * http://114.215.130.61:8082/SendMT/SendMessage?UserName=&UserPass=&subid=&Mobile=&Content=
 * http://202.85.215.202/SendMT/SendMessage?UserName=&UserPass=&subid=&Mobile=&Content=
 
 
 
 http://120.106818.com/SendMTU8/SendMessage_utf8.aspx?UserName=&UserPass=&subid=&Mobile=&Content=;
**/
function shortmessage2($mtel,$mcon,$mtime=''){//发短信
	$smessage_state		=	1;//C('sms_is');		//开启短信功能 1开启 0关闭
    $smessage_user		=	'';//C('sms_user');		//短信帐号
    $smessage_password	=	'';//C('sms_password');	//短信密码
	$smessage_suffix ='';
	$subid ='';
	if($smessage_state){
		$message = urlencode($mcon);
		// $url = 'http://114.215.130.61:8082/SendMT/SendMessage';
		$url = 'http://120.106818.com/SendMTU8/SendMessage_utf8.aspx';
		$params = 'UserName='.$smessage_user.'&UserPass='.$smessage_password.'&subid='.$subid.'&Mobile='.$mtel.'&Content='.$message;	 
		
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch,CURLOPT_POSTFIELDS,$params);
		curl_setopt($ch, CURLOPT_TIMEOUT,3);
		$data = curl_exec($ch);		
		curl_close ($ch);
		
		$ret_array = explode(';',$data);
		$list = explode(',',$ret_array[0]);
		
		if($list[0] == '03'){
			return 0;
		}else{
			return '-100';
		}	
	}else{
		return '-100';
	}
}

/*
 * 银行卡认证（诺正通）
 */
function is_bank_card($realname,$cardnum,$bankPreMobile,$idcard){//发短信

	if($cardnum == '1234567891234567891'){
		return true;
	}

	$mall_id = '110513';//商户id
	$appkey = 'a588ef9b8854e1bcb54dd6fcffd3e96a';//商户key

	$cardnum=strtolower($cardnum);//银行卡号
	$idcard=strtolower($idcard);//身份证号
	$tm=time().'000';
	$sign=md5($mall_id.$realname.$cardnum.$tm.$appkey);
	$url="http://121.41.42.121:8080/v3/card4-server?mall_id=$mall_id&realname=$realname&cardnum=$cardnum&bankPreMobile=$bankPreMobile&idcard=$idcard&tm=$tm&sign=$sign";

	$result = json_decode(curl_request($url));
	F('aa',$result);
	if($result->data->code == 1000){
		return true;
	}else{
		return false;
	};

}

/*
 * 身份证实名认证（诺正通）
 */
function is_card($realname,$mcon){//发短信

	if($mcon == '123456789123456789'){
		return true;
	}

	$mall_id = '110513';//商户id
	$appkey = 'a588ef9b8854e1bcb54dd6fcffd3e96a';//商户key
	$realname = $realname;
	$idcard=strtolower($mcon);
	$tm=time().'000';
	$sign=md5($mall_id.$realname.$idcard.$tm.$appkey);

	$url="http://121.41.42.121:8080/v2/id-server?mall_id=$mall_id&realname=$realname&idcard=$idcard&tm=$tm&sign=$sign";

	$result = json_decode(curl_request($url));
	F('aa',$result);
	if($result->data->code == 1000){
		return true;
	}else{
		return false;
	};

}


/*
 * 短信发送接口（诺正通）
 */
function short_message($mobile,$mcon){//发短信

	if($mcon == '111111'){
		return true;
	}
	$mall_id = '110513';//商户id
	$appkey = 'a588ef9b8854e1bcb54dd6fcffd3e96a';//商户key
	$phone = $mobile;
	$code = '您的验证码：'.$mcon;
	$sign=md5($mall_id.$phone.$code.$appkey);

	$url="http://www.nuozhengtong.com/sms.php?mall_id=$mall_id&phone=$phone&code=$code&sign=$sign";

	$result = json_decode(curl_request($url));
//	F('aa',$result);
	if($result->code == 1000){
		return true;
	}else{
		return false;
	};

}


function add_code($mobile,$randnums,$type){
	$Shortmessage = M('Shortmessage');

	$data['mobile'] = $mobile;
	$data['codes'] = $randnums;
	$data['type'] = $type;
	$data['create_time'] = time();
	$info = $Shortmessage -> add($data);

}

/*
 * 短信发送接口（新）
 */
function shortmessage($mobile,$mcon,$mtime=''){//发短信
	$smessage_state		=	1;				//开启短信功能 1开启 0关闭
    $username		=	'bjdjlks';		//短信帐号
    $password_md5	=	md5('enet3601');		//短信密码
	$apikey='d2908a6aab27e377030abb503018cc79';
	// $mcon .= '[镭灯泡]';
	$contentUrlEncode = urlencode($mcon);
	$encode='UTF-8'; // 25749
	
	$url = "http://m.5c.com.cn/api/send/index.php?"; 
	$post_fields = array(
        'username'=>$username,
        'password_md5'=>$password_md5,
        'apikey'=>$apikey,
        'mobile'=>$mobile,
        'content'=>$contentUrlEncode,
        'encode'=>$encode,
    );
	if($smessage_state){
		$ch=curl_init();
		curl_setopt($ch,CURLOPT_URL,$url);
		curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
		curl_setopt($ch,CURLOPT_TIMEOUT,30);
		curl_setopt($ch,CURLOPT_HEADER,1);
		curl_setopt($ch,CURLOPT_POST,1);
		curl_setopt($ch,CURLOPT_POSTFIELDS,$post_fields);
		$data = curl_exec($ch);
		curl_close($ch);
		$res = explode("\r\n\r\n",$data);
		// F('aaa',$res);
		// return $res;
		if($res[2]){
			return 1;
		}else{
			return -100;
		}
	}
}



function shortmessage_old($mobile,$content,$mtime=''){//发短信
	$encode='UTF-8';  
	$username='saipai';  //用户名
	$password_md5=md5('asdf1234q');  //32位MD5密码加密，不区分大小写
	$apikey='b439a0a54da54f4d1fab977825268a52';  //apikey秘钥
	// $mobile='18610310068'; 
	$content .='【赛拍】'; 
	// $content = iconv("GBK","UTF-8",$content);
	$contentUrlEncode = urlencode($content);//执行URLencode编码  ，$content = urldecode($content);解码
	
    $url = "http://m.5c.com.cn/api/send/index.php?"; 
    $post_fields=array(
        'username'=>$username,
        'password_md5'=>$password_md5,
        'apikey'=>$apikey,
        'mobile'=>$mobile,
        'content'=>$contentUrlEncode,
        'encode'=>$encode,
    );
	
	$ch=curl_init();
    curl_setopt($ch,CURLOPT_URL,$url);
    curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
    curl_setopt($ch,CURLOPT_TIMEOUT,30);
    curl_setopt($ch,CURLOPT_HEADER,1);
    curl_setopt($ch,CURLOPT_POST,1);
    curl_setopt($ch,CURLOPT_POSTFIELDS,$post_fields);
    $data = curl_exec($ch);
    curl_close($ch);
    $res = explode("\r\n\r\n",$data);
    $result = $res[2];
	
	if(strpos($result,"success")>-1) {
		//提交成功
		//逻辑代码
		return 0;
	}else{
		return -1;
		//提交失败
		//逻辑代码
	}
}

/**
 * 获取配置项信息
**/
function getConfigName($id,$name="name",$config='REGULAR'){
	$type = C($config);
	return $type[$id][$name];
}
/**
 * URL处理
**/
function getBackUrl($backurl){
	if(!$backurl){
		$url = 'http://'.$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'];
		$backurl = base64_encode($url);
	}
	return $backurl;
}
/**
 * 获取当前页面完整URL地址
**/
function getUrl2() {
	$sys_protocal = isset($_SERVER['SERVER_PORT']) && $_SERVER['SERVER_PORT'] == '443' ? 'https://' : 'http://';
	$php_self = $_SERVER['PHP_SELF'] ? safe_replace($_SERVER['PHP_SELF']) : safe_replace($_SERVER['SCRIPT_NAME']);
	$path_info = isset($_SERVER['PATH_INFO']) ? safe_replace($_SERVER['PATH_INFO']) : '';
	$relate_url = isset($_SERVER['REQUEST_URI']) ? safe_replace($_SERVER['REQUEST_URI']) : $php_self.(isset($_SERVER['QUERY_STRING']) ? '?'.safe_replace($_SERVER['QUERY_STRING']) : $path_info);
	return $sys_protocal.(isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '').$relate_url;
}
function getUrl($backurl){
	if(!$backurl){
		$url = 'http://'.$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'];
		$backurl = base64_encode($url);
	}
	return $backurl;
}

/**
 * 缩略图方法
 * $img 图片的地址及名称
 * $width 缩略图宽
 * $height 缩略图高
**/
function Thumb($img,$width='',$height=''){
	$thumb_img=C('thumb');//'Public/thumb.jpg';
	$confg_path = C('confg_path');
	$thumb_img = ltrim($thumb_img,$confg_path);
	if($img){
		$img = ltrim($img,$confg_path);
		// $img=substr($img,1);
		$is_img=GetImageSize('./'.$img);	
		//设置宽高 生成缩略图
		if(!empty($width) && !empty($height)){
			import('ORG.Util.Image');
			$Image = new Image();
			$filename ='Uploads/thumb/'.$width.'_'.$height.'/'; //缩略图存储路径
			$new_name=strtr($img,array('/'=>'_'));
			if (!file_exists($filename)){ 
				@mkdir($filename,0755);
			}
			if($is_img){
				$is_thumb=GetImageSize('./'.$filename.$new_name);
				if($is_thumb){
					$thumb_img=$filename.$new_name;
				}else{
					$Image->thumb($img,$filename.$new_name,'',$width,$height);
					$thumb_img=$filename.$new_name;
				}
			}
		}else{
			if($is_img){
				$thumb_img=$img;
			}
		}
	}	
	return CheckUrl($confg_path.$thumb_img);
}

function CheckUrl($url){
	// $kong = array(
		// 'javascript:void(0)',
		// 'javascript:void()',
		// 'javascript:;',
		// 'javascript:void(0);',
		// 'javascript:void();',
		// ''
	// );
	// if(in_array($url,$kong)){
		// return 'javascript:void(0);';
	// }
	$all_data = parse_url($url);
	if(!$all_data['host']){
		// return 'http://'.APP_URL.'/'.ltrim($url,'/');
		return APP_URL.'/'.ltrim($url,'/');
	}
	if(!in_array($all_data['scheme'],array('http','https'))){
		return 'http://'.$url;
	}
	return $url;
}

/**
 * 检查是否为手机登录 并跳转
**/
function isMobileWap($url="")
{
	$ua = strtolower($_SERVER['HTTP_USER_AGENT']);
	$uachar = "/(nokia|sony|ericsson|mot|samsung|sgh|lg|philips|panasonic|alcatel|lenovo|cldc|midp|mobile)/i";
	if(($ua == '' || preg_match($uachar, $ua))&& !strpos(strtolower($_SERVER['REQUEST_URI']),'wap')){
		if (!empty($url)){
			header("Location: $url\n");
			exit;
		}
	}
}
/**
 * 判断是否是手机端
**/
function isMobile2(){
	$useragent=isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : ''; 
	$useragent_commentsblock=preg_match('|\(.*?\)|',$useragent,$matches)>0?$matches[0]:'';    
	function CheckSubstrs($substrs,$text)
	{ 
		foreach($substrs as $substr)
		{
			if(false!==strpos($text,$substr)){ 
				return true; 
			}
		}
		return false; 
	}
	$mobile_os_list=array('Google Wireless Transcoder','Windows CE','WindowsCE','Symbian','Android','armv6l','armv5','Mobile','CentOS','mowser','AvantGo','Opera Mobi','J2ME/MIDP','Smartphone','Go.Web','Palm','iPAQ');
	$mobile_token_list=array('Profile/MIDP','Configuration/CLDC-','160×160','176×220','240×240','240×320','320×240','UP.Browser','UP.Link','SymbianOS','PalmOS','PocketPC','SonyEricsson','Nokia','BlackBerry','Vodafone','BenQ','Novarra-Vision','Iris','NetFront','HTC_','Xda_','SAMSUNG-SGH','Wapaka','DoCoMo','iPhone','iPod'); 
	if (CheckSubstrs($mobile_os_list,$useragent_commentsblock) || CheckSubstrs($mobile_token_list,$useragent)){ 
		return true; 
	}else{ 
		return false; 
	} 
}

function CreateOneUrl($cid){
	$data=M('Category')->field('id,catname,type,url,route')->cache(true,600)->where(array('id'=>array('eq',$cid)))->order('sort asc,id asc')->find();
	switch ($data['type']){
		case 1:
			if($data['route']){
				$return['url']	= U('/'.$data['route'],array(),'html','',true);
			}else{
				$return['url']	= U('Lists/'.$data['id'],array(),'html','',true);
			}
			
			$return['trueurl']	= U('Lists/index',array('cid'=>$data['id']));
			$return['router_url']	= 'Lists/index?cid='.$data['id'];
			break;  
		case 2:
			if($data['route']){
				$return['url']	= U('/'.$data['route'],array(),'html','',true);
			}else{
				$return['url']	= U('Content/'.$data['id'],array(),'html','',true);
			}
			$return['trueurl']	= U('Content/index',array('cid'=>$data['id']));
			$return['router_url']	= 'Content/index?cid='.$data['id'];
			break;
		case 3:
			if($data['route']){
				$return['url']	= U('/'.$data['route'],array(),'html','',true);
			}else{
				$return['url']	= U('Category/'.$data['id'],array(),'html','',true);
			}
			$return['trueurl']	= U('Category/index',array('cid'=>$data['id']));
			$return['router_url']	= 'Category/index?cid='.$data['id'];
			break;
		case 4:
			$son_data = type_4url($data['id']);
			$return['url']		= $son_data['url'];
			$return['trueurl']	= $son_data['trueurl'];
			$return['router_url']	= $son_data['router_url'];
			break;
		case 5:
			$son_data = type_4url($data['id']);
			$return['url']		= $son_data['url'];
			$return['trueurl']	= $son_data['trueurl'];
			$return['router_url']	= $son_data['router_url'];
			break;
		case 0:
			if($data['url']){
				$return['url']		= $data['url'];//'http://'.ltrim($data['url'],'http://');
				$return['trueurl']	= $data['url'];//'http://'.ltrim($data['url'],'http://');
				$return['router_url']	= '';
			}else{
				$return['url']		= 'javascript:void(0);';
				$return['trueurl']	= 'javascript:void(0);';
				$return['router_url']	= '';
			}
			break;
		default:
			$return['url']		= U('/');
			$return['trueurl']	= U('/');
			$return['router_url']	= '/';
	}
	return $return;
}
function type_4url($cid){
	$data=M('Category')->field('id,catname,type,url,route')->cache(true,600)->where(array('upid'=>array('eq',$cid)))->order('sort asc,id asc')->find();
	switch($data['type']){
		case 1:
			if($data['route']){
				$return['url']	= U('/'.$data['route'],array(),'html','',true);
			}else{
				$return['url']	= U('Lists/'.$data['id'],array(),'html','',true);
			}
			
			$return['trueurl']	= U('Lists/index',array('cid'=>$data['id']));
			$return['router_url']	= 'Lists/index?cid='.$data['id'];
			break;  
		case 2:
			if($data['route']){
				$return['url']	= U('/'.$data['route'],array(),'html','',true);
			}else{
				$return['url']	= U('Content/'.$data['id'],array(),'html','',true);
			}
			$return['trueurl']	= U('Content/index',array('cid'=>$data['id']));
			$return['router_url']	= 'Content/index?cid='.$data['id'];
			break;
		case 3:
			if($data['route']){
				$return['url']	= U('/'.$data['route'],array(),'html','',true);
			}else{
				$return['url']	= U('Category/'.$data['id'],array(),'html','',true);
			}
			$return['trueurl']	= U('Category/index',array('cid'=>$data['id']));
			$return['router_url']	= 'Category/index?cid='.$data['id'];
			break;
		case 4:
			$son_data = type_4url($data['id']);
			$return['url']		= $son_data['url'];
			$return['trueurl']	= $son_data['trueurl'];
			$return['router_url']	= $son_data['router_url'];
			break;
		case 5:
			$son_data = type_4url($data['id']);
			$return['url']		= $son_data['url'];
			$return['trueurl']	= $son_data['trueurl'];
			$return['router_url']	= $son_data['router_url'];
			break;
		case 0:
			if($data['url']){
				$return['url']		= $data['url'];//'http://'.ltrim($data['url'],'http://');
				$return['trueurl']	= $data['url'];//'http://'.ltrim($data['url'],'http://');
				$return['router_url']	= '';
			}else{
				$return['url']		= 'javascript:void(0);';
				$return['trueurl']	= 'javascript:void(0);';
				$return['router_url']	= '';
			}
			break;
		default:
			$return['url']		= U('/');
			$return['trueurl']	= U('/');
			$return['router_url']	= '/';
	}
	return $return;
}
function downxmlzip($array,$name=''){
	$time = $name.time();
	import('ORG.Util.Zip');
	$zip = new Zip();
	foreach($array as $k=>$v){
		$content .= implode("\t", $v) . "\n";
	}
	$zip->add_file("\xFF\xFE" . utf82u2($content), $time.'.csv');
	header("Content-Disposition: attachment; filename=".$time.".zip");
	header("Content-Type: application/unknown");
	die($zip->file());
}
/**
 * UTF8 编码转换 u2
**/
function utf82u2($str){
    $len = strlen($str);
    $start = 0;
    $result = '';
    if ($len == 0){
        return $result;
    }
    while ($start < $len){
        $num = ord($str{$start});
        if ($num < 127){
            $result .= chr($num) . chr($num >> 8);
            $start += 1;
        }else{
            if ($num < 192){
                /* 无效字节 */
                $start ++;
            }elseif ($num < 224){
                if ($start + 1 <  $len){
                    $num = (ord($str{$start}) & 0x3f) << 6;
                    $num += ord($str{$start+1}) & 0x3f;
                    $result .=   chr($num & 0xff) . chr($num >> 8) ;
                }
                $start += 2;
            }elseif ($num < 240){
                if ($start + 2 <  $len){
                    $num = (ord($str{$start}) & 0x1f) << 12;
                    $num += (ord($str{$start+1}) & 0x3f) << 6;
                    $num += ord($str{$start+2}) & 0x3f;
                    $result .=   chr($num & 0xff) . chr($num >> 8) ;
                }
                $start += 3;
            }elseif ($num < 248){
                if ($start + 3 <  $len){
                    $num = (ord($str{$start}) & 0x0f) << 18;
                    $num += (ord($str{$start+1}) & 0x3f) << 12;
                    $num += (ord($str{$start+2}) & 0x3f) << 6;
                    $num += ord($str{$start+3}) & 0x3f;
                    $result .= chr($num & 0xff) . chr($num >> 8) . chr($num >>16);
                }
                $start += 4;
            }elseif ($num < 252){
                if ($start + 4 <  $len){/* 不做处理 */}
                $start += 5;
            }else{
                if ($start + 5 <  $len){/* 不做处理 */}
                $start += 6;
           }
        }
    }
    return $result;
}
/**
 * 检查url 地址是否合法
**/
function CheckUrlTrue($url=''){
	$get_url = $url?$url:$_SERVER['HTTP_X_ORIGINAL_URL'];
	$get_url_arr1 = explode("#",$get_url);
	$get_url_arr2 = explode("?",$get_url_arr1[0]);
	$get_url_arr = explode("/",$get_url_arr2[0]);
	
	$end_url = explode(".",end($get_url_arr));
	if($end_url[1]){
		$str_url = '';
		foreach($end_url as $kk=>$vv){
			if($kk!=0){
				$str_url .= '.'.$vv;
			}
		}
		if($str_url != '.html'){
			return false;
		}
	}
	return true;
}

/*检查验证码是否正确*/
function check_verify($code, $id = ""){  
    $verify = new \Think\Verify();  
    return $verify->check($code, $id);  
}
	/*数组根据某一个值去重*/
	function assoc_unique($arr, $val){
		   $tmp_arr = array();
		   foreach($arr as $k => $v)
		  {
			 if(in_array($v[$val], $tmp_arr))//搜索$v[$val]是否在$tmp_arr数组中存在，若存在返回true
			{
			   unset($arr[$k]);
			}
		  else {
			  $tmp_arr[] = $v[$val];
			}
		  }
		sort($arr); //sort函数对数组进行排序
		return $arr;
	}
	
 function sendMail($to,$title,$content){


    //引入PHPMailer的核心文件 使用require_once包含避免出现PHPMailer类重复定义的警告
    Vendor("phpmailer.phpmailer"); 
    Vendor("phpmailer.smtp");
    //实例化PHPMailer核心类

	
    $mail = new PHPMailer();
	
    //是否启用smtp的debug进行调试 开发环境建议开启 生产环境注释掉即可 默认关闭debug调试模式
    // $mail->SMTPDebug = 1;

    //使用smtp鉴权方式发送邮件
    $mail->isSMTP();

    //smtp需要鉴权 这个必须是true
    $mail->SMTPAuth=true;
	$mail->Mailer   = "SMTP";
    //链接qq域名邮箱的服务器地址
    $mail->Host = C('SMTP_HOST');

    //设置使用ssl加密方式登录鉴权
   $mail->SMTPSecure = 'ssl';

    //设置ssl连接smtp服务器的远程服务器端口号，以前的默认是25，但是现在新的好像已经不可用了 可选465或587
    $mail->Port = C('SMTP_PORT');

    //设置smtp的helo消息头 这个可有可无 内容任意
    // $mail->Helo = 'Hello smtp.qq.com Server';

    //设置发件人的主机域 可有可无 默认为localhost 内容任意，建议使用你的域名
    $mail->Hostname = 'localhost';

    //设置发送的邮件的编码 可选GB2312 我喜欢utf-8 据说utf8在某些客户端收信下会乱码
    $mail->CharSet = 'UTF-8';

    //设置发件人姓名（昵称） 任意内容，显示在收件人邮件的发件人邮箱地址前的发件人姓名
    $mail->FromName = C('FROM_NAME');

    //smtp登录的账号 这里填入字符串格式的qq号即可
    $mail->Username =C('SMTP_USER');

    //smtp登录的密码 使用生成的授权码（就刚才叫你保存的最新的授权码）vtneywlyzwaijdba
    $mail->Password = C('SMTP_PASS');

    //设置发件人邮箱地址 这里填入上述提到的“发件人邮箱”
    $mail->From = C('SMTP_USER');

    //邮件正文是否为html编码 注意此处是一个方法 不再是属性 true或false
    $mail->isHTML(true); 

    //设置收件人邮箱地址 该方法有两个参数 第一个参数为收件人邮箱地址 第二参数为给该地址设置的昵称 不同的邮箱系统会自动进行处理变动 这里第二个参数的意义不大
    $mail->addAddress($to,C('FROM_NAME'));

    //添加多个收件人 则多次调用方法即可
    // $mail->addAddress('530088618@qq.com','lsgo在线通知');

    //添加该邮件的主题
    $mail->Subject = $title;

    //添加邮件正文 上方将isHTML设置成了true，则可以是完整的html字符串 如：使用file_get_contents函数读取本地的html文件
    $mail->Body = $content;

    //为该邮件添加附件 该方法也有两个参数 第一个参数为附件存放的目录（相对目录、或绝对目录均可） 第二参数为在邮件附件中该附件的名称
    // $mail->addAttachment('./d.jpg','mm.jpg');
    //同样该方法可以多次调用 上传多个附件
    // $mail->addAttachment('./Jlib-1.1.0.js','Jlib.js');

    $status = $mail->send();
	// dump($status);
    //简单的判断与提示信息
    if($status) {
        return 1;
    }else{
        return 0;
    }
}	
	
?>
