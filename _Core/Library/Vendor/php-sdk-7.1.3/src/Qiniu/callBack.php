<?php
    error_reporting(0);
    //七牛回调一个base64的参数upload_ret，要先解码
    $upload_ret = base64_decode($_GET['upload_ret']);
    //将json数据转换为数组
    $upload_ret = json_decode($upload_ret,true);
    //根据情况返回json参数
    $qiniu_url = 'https://dn-lanbaidiao.qbox.me/';
    if(!$empty($upload_ret['key'])){
        echo json_encode(array('error'=>0,'url'=>$qiniu_url.$upload_ret['key']));
    }else{
        echo json_encode(array('error'=>1,'message'=>'图片上传出错！'));
    }
?>