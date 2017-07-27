<?php
namespace Sysadmin\Controller;
use Think\Controller;
class AjaxjsonController extends CommonController{
	public function __construct() {
		parent::__construct();
	}
	//post 获取地区的联动菜单
	public function post_area(){
		if(IS_POST){
			echo $area=$this->getArea(I('post.area_id'));
		}
	}

    /*
     * 定时查询有无新的视频举报
     */
    public function report() {

        // 实例化自定义的模型类
        $Actrep = M("Actrep");
        $map['warn'] = array('eq',0);
        $cou = $Actrep->where($map)->count();
        // dump($cou);
        if($cou>0){
            $json['status'] = 1;
            $json['info']   = '您有新的举报消息，请及时查看';
            $json['url']    = U('Actrep/rep_index');

        }else{
            $json['status'] = 0;
        }
        $this -> ajaxReturn($json);
    }
}
?>