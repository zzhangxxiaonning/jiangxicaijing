<?php
namespace App\Controller;
use Think\Controller;
class CircleListController extends CommonController {
    public function __construct(){
        parent::__construct();
    }

    /*
     * 科研项目
     * type 0或空全部 1报名中 2进行中 3往期项目
     *
     * 科研项目
     * */
    public function index(){

        $type = I('post.type',0);
        $time = time();
        if($type == 1){
            $map['start_time'] = array('gt',$time);
        }
        elseif($type == 2){
            $map['start_time'] = array('egt',$time);
            $map['end_time'] = array('elt',$time);
        }
        elseif($type == 3){
            $map['end_time'] = array('lt',$time);
        }
        $map['status'] = array('eq',1);
        $info=_Listt(M('Circle'),$map,'id,title,info,cat_id,rank_id,thumb,start_time,end_time,nums','sort desc,id desc',5);
        if($info){

            foreach($info['listinfo'] as $a=>$v){
                $info['listinfo'][$a]['cat_name'] = $this->cat_name(M('Circat'),$v['cat_id']); //分类名称
                $info['listinfo'][$a]['rank_name'] = $this->cat_name(M('Cirattr'),$v['rank_id']);//级别名称

                $info['listinfo'][$a]['start_time'] = date('Y-m-d H:i',$v['start_time']);
                $info['listinfo'][$a]['end_time'] = date('Y-m-d H:i',$v['end_time']);
                $info['listinfo'][$a]['thumb'] = C('BASE_URL').$v['thumb'];

                $map_ord['aid'] = array('eq',$v['id']);
                $map_ord['type'] = array('eq',1);
                $map_ord['pay_is'] = array('neq',0);
                $info['listinfo'][$a]['order_count'] = _Numbers(M('Order'),$map_ord); //报名数

                //活动标签
                $data = flag($v['start_time'],$time,$v['end_time']);
                $info['listinfo'][$a]['flag_code'] = $data['flag_code'];
                $info['listinfo'][$a]['flag'] = $data['flag'];
            }

            $json['retcode'] = '0';
            $data = array(
                'info' => $info['listinfo'],
            );

            $json['data'] = $data;
        }else{
            $json['retcode'] = '-3';
            $json['errmsg'] = '数据不存在';
        }

        $this->ajaxReturn($json);
	}



}