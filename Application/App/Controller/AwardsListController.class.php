<?php
namespace App\Controller;
use Think\Controller;
class AwardsListController extends CommonController {
    public function __construct(){
        parent::__construct();
    }

    /*
     * 获奖荣誉列表
     * rank      项目级别
     * year      获奖年度
     * teacher   指导老师
     *
     * 科研项目
     * */
    public function index(){

        $rank = I('post.rank',0);
        $year = I('post.year',0);
        $teacher = I('post.teacher',0);
        if($rank){
            $map['rank_id'] = array('eq',$rank);
        }
        if($year){
            $map['year_id'] = array('eq',$year);
        }
        if($teacher){
            $map['teacher_id'] = array('eq',$teacher);
        }

        $map['status'] = array('eq',1);
        $map['isshow'] = array('eq',1);
        $map['examine'] = array('eq',2);
        $info=_Listt(M('Awards'),$map,'id,mid,title,cat_id,rank_id,year_id,teacher_id,partic_id,thumb','sort desc,id desc',5);

        if($info){

            foreach($info['listinfo'] as $a=>$v){
                $info['listinfo'][$a]['cat_name'] = $this->cat_name(M('Circat'),$v['cat_id']); //分类名称
                $info['listinfo'][$a]['rank_name'] = $this->cat_name(M('Cirattr'),$v['rank_id']);//级别名称
                $info['listinfo'][$a]['year_name'] = $this->cat_name(M('Cirattr'),$v['year_id']);//年度名称
                $info['listinfo'][$a]['teahcer_name'] = $this->teacher_name($v['teacher_id']);//指导老师名称

                $name = $this->mem_name($v['mid']);//主持人
                $info['listinfo'][$a]['mid_name'] = $name['username']?$name['username']:$name['phone'];

                $partic = explode(',',trim($v['partic_id']));
                $partic_names = array();
                foreach($partic as $aa=>$vv){
                    $name_ = $this->mem_name($vv);
                    $partic_names[$aa] = $name_['username']?$name_['username']:$name_['phone'];
                }
                $info['listinfo'][$a]['partic_name'] = implode(',',array_filter($partic_names));
                $info['listinfo'][$a]['thumb'] = C('BASE_URL').$v['thumb'];
            }

            $json['retcode'] = '0';
            $data = array(
                'info' => $info['listinfo'],
                'ranks' => $this->ranks(),
                'years' => $this->years(),
                'teachers' => $this->teachers(),
            );

            $json['data'] = $data;
        }else{
            $json['retcode'] = '-3';
            $json['errmsg'] = '数据不存在';
        }

        $this->ajaxReturn($json);
	}

	protected function ranks(){

        $Cirattr = M('Cirattr');

        $map['up_id'] = array('eq',1);
        $map['status'] = array('eq',1);
        $data = _Selects($Cirattr,$map,'id,catname','sort desc,id desc');
        return $data;
    }

    protected function years(){

        $Cirattr = M('Cirattr');

        $map['up_id'] = array('eq',2);
        $map['status'] = array('eq',1);
        $data = _Selects($Cirattr,$map,'id,catname','sort desc,id desc');
        return $data;
    }

    protected function teachers(){

        $Teacher = M('Teacher');

        $map['status'] = array('eq',1);
        $data = _Selects($Teacher,$map,'id,username');
        return $data;
    }



}