<?php
include_once './src/Qiniu/Config.php';
include_once './src/Qiniu/Auth.php';

    function getQiniuToken(){

        $bucket = 'bim-images';//空间名
        $accessKey = 'IlTChH4IU_ExEdrSaB7fKUqhPZ8V1hUryVB1tah1';//公钥
        $secretKey = 'w3qYLb-ZHTDaMnNcjSeE3bsqqdQx3h7GCmLJ2Vd-';//私钥

        $auth = new Auth($accessKey,$secretKey);
        return $auth->uploadToken($bucket);
    }

    //注意返回的是json格式
    echo json_encode(array('status'=>'success','token'=>getQiniuToken()));
?>
