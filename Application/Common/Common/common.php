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
 *
 * 得到表信息
 * sql_info()
 *
 * 生成订单号
 * create_oid()
 *
 * 删除数据元素
 * array_remove()
 *
 * base64转
 * base2img()
 *
 * url请求
 * curl_request()
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
 * 获取所有的表信息
 * */
function infos($model,$map='',$order='id desc',$field='*',$limit=5){
    $data = $model -> field($field) -> where($map) -> order($order) -> limit($limit) -> select();
    return $data;

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

/*得到表信息*/
function sql_info($sql,$id){
    $map['id']		=	array('eq',$id);
    $info = $sql -> where($map) -> find();
    return $info;
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