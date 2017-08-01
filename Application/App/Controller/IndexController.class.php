<?php
namespace App\Controller;
use Think\Controller;
class IndexController extends CommonController {
    public function __construct(){
        parent::__construct();

//        $url_go = explode('.html',$_SERVER['REQUEST_URI']);
//        cookie('url_go',$url_go[0]);
    }


    public function index(){

        //轮播图
        $map_ad['status'] = array('eq',1);
        $map_ad['cat_id'] = array('eq',9);
        $ads = infos(M('Ad'),$map_ad,'sort desc,id desc','name,url,target,image');
//        dump($ads);

        //资讯
        $map_hon['status'] = array('eq',1);
        $honor = infos(M('Honor'),$map_hon,'sort desc,id desc','id,content');
//        dump($honor);





//        $data = array(
//            'ads' => $ads,
//            'honor' => $honor,
//        );
//
//        $json['retcode'] = '0';
//        $json['data'] = $data;
//        dump($json);
//        $this->ajaxReturn($json);
		$this->display();
	}

}