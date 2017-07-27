<?php
namespace Sysadmin\Controller;
use Think\Controller;
class RecordController extends CommonController {
	public function __construct(){
		parent::__construct();
	}
    public function index_record(){
		create_up_url(U('index_record'),'Record');
		$_db = M('AdminLogs');
		
		$map = array();
		$is_service = 0;
		$name = I('get.name','');
		if($name){
			$map_n['username'] = array('like','%'.$name.'%');
			
			$data_news = M("Admin")->where($map_n)->select();
			$str_news = ''; 
			foreach($data_news as $a_n=>$v_n){
				$str_news .= $v_n['id'].',';
			}
			$str_news = rtrim($str_news,',');
			$map['admin_id'] = array('in',$str_news);
			$is_service++;
		}
		
		
		$start_time = I('get.start_time','');
		$end_time = I('get.end_time','');
		if($start_time && $end_time){
			$start = strtotime($start_time);
			$end = strtotime($end_time);
			$map['create_time'] = array('BETWEEN',array($start,$end));
			$is_service++;
		}elseif(!$start_time && $end_time){
			$end = strtotime($end_time);
			$map['create_time'] = array('ELT',$end);
			$is_service++;
		}elseif($start_time && !$end_time){
			$start = strtotime($start_time);
			$map['create_time'] = array('EGT',$start);
			$is_service++;
		}
		$this->assign('is_service',$is_service);
		
		$page_num = 10;
		$p = I('get.p',1);
		
		$count	= $_db->where($map)->count();
		$Page	= new \Common\Other\Page($count,$page_num);		
		$show	= $Page->show();
		$lists = $_db->where($map)->page($p.','.$page_num)->order('id desc')->select();
		//echo M()->getLastSql();
		foreach($lists as $a=>$v){
			$mem_info = M("Admin")->where(array('id'=>array('eq',$v['admin_id'])))->cache(60,true)->find();
			$lists[$a]['username'] = $mem_info['username'];//用户名名称
		}
		
		
		
		//dump($lists);
		$this->assign('lists',$lists);
//		$this->assign('lists_attr',$lists_attr);
		$this->assign('page',$show);
		$menu_show[0] = 'config';
		$menu_show[1] = 'index_record';
		$this->assign('menu_show',$menu_show);
		
        $this->display('index');
		// dump($lists);
    }

	
	public function del_index(){
		if(IS_GET){
			$id = I('get.id',0);
			$m_admin['id'] = array('eq',$id);
			
			$ret = M('AdminLogs')->where($m_admin)->limit(1)->delete();
			
			if($ret){
				$json['status'] = '1';
				$json['info']	= '删除成功';
				
				$this->inserlog('记录ID:'.$id.'删除成功','system');
				
			}else{
				$json['status'] = '0';
				$json['info']	= '删除失败';
			}
			echo json_encode($json);exit;
		}
	}
	private function _insert_cat_news($id,$flag){
		$map['article_id'] = array('eq',$id);
		$map['type'] = array('eq',2);
		$ret_id = M('CarmodelNews')->where($map)->delete();
		$add_all_data = array();
		foreach($flag as $k=>$v){
			$add_all_data[] = array(
				'article_id' => $id,
				'type' => '2',
				'status' => '1',
				'update_time' => time(),
				'car_id' => $v
			);
		}
		M('CarmodelNews')->addAll($add_all_data);
	}
	private function _get_car_news($id){
		$map['article_id'] = array('eq',$id);
		$map['type'] = array('eq',2);
		$lists = M('CarmodelNews')->where($map)->field('car_id')->select();
		$array_lists = array();
		if($lists){
			foreach($lists as$k=>$v){
				$array_lists[] = $v['car_id'];
			}
		}
		return $array_lists;
	}
	private function _insert_position_news($id,$flag){
		$map['article_id'] = array('eq',$id);
		$map['type'] = array('eq','2');
		$ret_id = M('PositionLists')->where($map)->delete();
		$add_all_data = array();
		foreach($flag as $k=>$v){
			$add_all_data[] = array(
				'article_id' => $id,
				'flag' => $v,
				'status' => '1',
				'update_time' => time(),
				'type' => '2'
			);
		}
		M('PositionLists')->addAll($add_all_data);
	}
	private function _get_position_news($id){
		$map['article_id'] = array('eq',$id);
		$map['type'] = array('eq','2');
		$lists = M('PositionLists')->where($map)->field('flag')->select();
		$array_lists = array();
		if($lists){
			foreach($lists as$k=>$v){
				$array_lists[] = $v['flag'];
			}
		}
		return $array_lists;
	}
	
	
	
}