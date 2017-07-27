<?php
/**
 * 自定义方法
 * 
 * 多条数据查询
 * Selects（）
 *
 * 单条数据查询
 * _Finds（）
 *
 * 分页（含省略号）
 * _Listt（）
 *
 * 点赞、收藏、下载量统计
 * _Numbers（）
 *
 * 计算时间差（天小时分钟秒）
 * time2string（）
 *
 * 微信扫码登陆
 * Wechat（）
 *
 *
 *
 *
 *
 *
 *
 *

**/
function get_driverorder_status($id){
	$data = C('drive_order_type');
	return $data[$id]['name'];
}

/*
 * 多条数据查询
 * $model 数据库
 * $map 查询条件
 * $field 所需数据
 * $orderby 排序方式
 *
 */
function _Selects($model,$map='',$fields='*',$orderby='sort desc,id desc',$limit=''){

	$data = $model->order($orderby)->field($fields)->where($map)->limit($limit)->select();
	return $data;
}

/*
 * 单数据查询
 * $model 数据库
 * $map 查询条件
 * $field 所需数据
 * $orderby 排序方式
 *
 */
function _Finds($model,$map='',$fields='*'){

    $data = $model->field($fields)->where($map)->find();
    return $data;
}

/*
 * 含有上下翻页和省略号
 * 调用分页shows方法
 */
function _Listt($model,$map='',$fields='*',$orderby='id desc',$listRows=10,$pageClass='Pages'){
	$listRows = $listRows?$listRows:10;
	$c_model=clone $model;
	$count = $c_model->where($map)->count('*');
	if ($count>0){
//		import('ORG.Util.'.$pageClass);
//		$Page = new Pages($count,$listRows);
        $Page	= new \Common\Other\Pages($count,$listRows);
        $show	= $Page->shows();
		$nowPage  = isset($_GET['p'])?$_GET['p']:1;
		$list = $model->order($orderby)->field($fields)->where($map)->page($nowPage.','.$Page->listRows)->select();
		//echo $model->getLastSql();
		$page = $Page->shows();
		return array('listinfo'=>$list,'page'=>$page,'result_count'=>intval($count));
	}
}

/*
 * 赞量统计
 * 点赞
 * 下载
 * 收藏
 * */
function _Numbers($model,$map=''){
    $thumbs_count = $model -> where($map)->count();
    return $thumbs_count;
}



/*
 * PHP 计算时间差（天小时分钟秒）
 */
//自定义函数：time2string($second) 输入秒数换算成多少天/多少小时/多少分/多少秒的字符串
function time2string($second){
	if($second > 0){
        $day = floor($second/(3600*24));
        $second = $second%(3600*24);//除去整天之后剩余的时间
        $hour = floor($second/3600);
        $second = $second%3600;//除去整小时之后剩余的时间
        $minute = floor($second/60);
        $second = $second%60;//除去整分钟之后剩余的时间
		$result = $day.'天'.$hour.'小时'.$minute.'分'.$second.'秒';
	}else{
        $result = '0天00小时00分00秒';
	}
   
    //返回字符串
    return $result;
}


//微信扫码登陆，获取扫描人基本信息
function wechat($code){

//	$appid = 'wx86ca1b8c72e0b055';
//	$secret = '6fa895f59391372c83c824ba747e00eb';

    $appid = 'wxe82e7c1cab9864b7';
    $secret = '0ad84f6768f5055d0cb974e5e7810b42';

	$url= "https://api.weixin.qq.com/sns/oauth2/access_token?appid=".$appid."&secret=".$secret."&code=".$code."&grant_type=authorization_code";
	$result=json_decode(curl_request($url));
	$access_token=$result->access_token;
	$openid=$result->openid;
//    F(time().'_res',$result);
	if($access_token && $openid){
		$url="https://api.weixin.qq.com/sns/userinfo?access_token=".$access_token."&openid=".$openid;
		$result1=json_decode(curl_request($url));
//        F(time().'_res1',$result1);
		$data['openid']   = $result1->openid;
		$data['nickname'] = $result1->nickname;
		if($result1->sex == 1){
			$data['sex']  = 2;
		}elseif($result1->sex == 2){
			$data['sex']  = 1;
		}else{
			$data['sex']  = 0;
		}

		$data['nickname'] = $result1->nickname;
		$data['thumb']    = $result1->headimgurl;
		$data['unionid']  = $result1->unionid;

		return $data;


	}
}	

//微信网页端，获取扫描人基本信息
function wechat_wap($code){

//	$appid = 'wx4445d003dbaff66d';
//    $secret = '04a5a76ae467edd0dfb4d6b10709c6ba';
    $appid = 'wx22cdb81eeb37aa07';
    $secret = '8b52d813cc5832600c67ad2f59e71c4c';

	$url= "https://api.weixin.qq.com/sns/oauth2/access_token?appid=".$appid."&secret=".$secret."&code=".$code."&grant_type=authorization_code";
	$result=json_decode(curl_request($url));
	$access_token=$result->access_token;
	$openid=$result->openid;
    F(time().'res',$result);
	if($access_token && $openid){
		$url="https://api.weixin.qq.com/sns/userinfo?access_token=".$access_token."&openid=".$openid;
		$result1=json_decode(curl_request($url));
        F(time().'res1',$result);
		$data['openid']   = $result1->openid;
		$data['nickname'] = $result1->nickname;
		if($result1->sex == 1){
			$data['sex']  = 2;
		}elseif($result1->sex == 2){
			$data['sex']  = 1;
		}else{
			$data['sex']  = 0;
		}

		$data['nickname'] = $result1->nickname;
		$data['thumb']    = $result1->headimgurl;
		$data['unionid']  = $result1->unionid;

		return $data;


	}
}

//获取access_token微信
function wechat_wap_access(){
	
//	$appid = 'wx4445d003dbaff66d';
//	$secret = '04a5a76ae467edd0dfb4d6b10709c6ba';
    $appid = 'wx22cdb81eeb37aa07';
    $secret = '8b52d813cc5832600c67ad2f59e71c4c';

	$url= "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=".$appid."&secret=".$secret;
	$result=json_decode(curl_request($url));
	
	$access_token=$result->access_token;
	if($access_token){
		$url="https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=".$access_token."&type=jsapi";
		$result1=json_decode(curl_request($url));

		$data['ticket']   = $result1->ticket;
		
	}	
	
	return $data;
}


//生成11位订单号
function create_oid(){
    return rand(11,99).substr(time(),-9);
}

//删除数组中的元素
function array_remove($arr, $offset){
    foreach ($arr as $k=>$v){
        if ($v === $offset){
            unset($arr[$k]);
        }

    }
    return $arr;
}

function base2img($base,$path='image',$name){
    $name = $name?$name:time().rand(1000,9999);
    $array = explode(';',$base);
    $type = 'png';
    if(is_array($array)){
        $base = str_replace('base64,', '', $array[1]);
        $type = str_replace('data:image/', '', $array[0]);
    }

    $img = base64_decode($base);

    $filename ='Uploads/'.$path.'/'; //
    if (!file_exists($filename)){
        @mkdir($filename,0755);
    }

    $file_img = './'.$filename.$name.'.'.$type;

    $a = file_put_contents($file_img,$img);
    $info_img = substr($file_img,1);
    return $info_img;
}

/*
 * 实时刷新活动是否如期举行
 * 查询所有的活动的开始时间，得到所有已结束的活动
 * 根据所有已结束的得到相对应的报名人数
 * 比较报名人数和开始人数
 * 将报名人数小于开始人数的ID生成新数组enroll_end
 * 将新数组中对应的ID的举行状态is_ing更新为0
 * 将订单表中aid和type对应新数组中ID的订单举行状态is_ing更新为0
 *
 *
 * */
function edit_is_ing($type,$model){
    //type 1 活动 type 2 云课堂
//        $Activity = M('Activity');
    $Order = M('Order');
    $time = time();
    $map_enroll['start_time'] = array('lt',$time);
    $map_enroll['status'] = array('eq',1);
    $enrolls = _Selects($model,$map_enroll,'id,title,start_time,nums_beg','');

    foreach($enrolls as $ke=>$ve){
        $map_count['aid'] = array('eq',$ve['id']);
        if($type == 1){
            $map_count['type'] = array('in',array('1','2'));
        }elseif($type == 3){
            $map_count['type'] = array('eq',$type);
        }
        $enrolls_count = $Order -> where($map_count) -> count();
        $enrolls[$ke]['enrolls_count'] = $enrolls_count;
    }

    $enroll_end = array();
    foreach($enrolls as $ke=>$ve){
        if($ve['enrolls_count'] < $ve['nums_beg']){
            $enroll_end[] = $ve;
        }
    }

    foreach($enroll_end as $ak => $av){
        $map_ing['id'] = array('eq',$av['id']);
        $data_ing['is_ing'] = 0;
        $model -> where($map_ing) -> save($data_ing);
    }

    $order_end = array();
    foreach($enroll_end as $ok => $ov){
        $map_o_ing['aid'] = array('eq',$ov['id']);
        if($type == 1){
            $map_o_ing['type'] = array('in',array('1','2'));
        }elseif($type == 3){
            $map_o_ing['type'] = array('eq',$type);
        }
        $data_o_ing['is_ing'] = 0;
        $order_id = _Selects($Order,$map_o_ing,'id,aid,type','');
        foreach($order_id as $ook => $oov){
            $map_ing['id'] = array('eq',$oov['id']);
            $data_ing['is_ing'] = 0;
            $Order -> where($map_ing) -> save($data_ing);
        }

    }

    return true;

}

/*
 * 实时会员级别购买时间
 * 得到所有购买会员级别的会员
 * 计算会员级别时间和当前时间对比
 * 小于当前时间则将会员级别改为1
 * */
function edit_member_type(){

    $Member = M('Member');

    $map['type']   = array('neq',1);
    $map['status'] = array('eq',1);
    $members = $Member -> where($map) -> field('id,nickname,type,member_age,member_ptime') -> select();
    $time = time();
    foreach($members as $a=>$v){
        $ptime = $v['member_ptime']+$v['member_age']*60*60*24*365;
        if($ptime < $time){
            $data['type'] = 1;
            $data['member_age'] = 1;
            $data['member_ptime'] = 0;
            $map_['id'] = array('eq',$v['id']);
            $Member -> where($map_) -> save($data);
        }
    }

}

/*
 * 判断是否是为微信内打开
 * */
function is_weixin(){

    if ( strpos($_SERVER['HTTP_USER_AGENT'],

            'MicroMessenger') !== false ) {

        return true;

    }else{
        return false;
    }

}

/*
* curl 请求
* url 地址
* params 参数
* method 方式 get post
* timeout 请求过期时间
*/
function curl_request($url, $params = array(), $method = 'get', $timeout=30){
    $ch = curl_init();
    curl_setopt ($ch, CURLOPT_URL, $url);
    curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    if($method == 'post') {
        curl_setopt($ch, CURLOPT_POST, 1);//post提交方式
        curl_setopt($ch, CURLOPT_POSTFIELDS, $params);
    }
    $file_contents = curl_exec($ch);
    curl_close($ch);
    return $file_contents;
}





?>