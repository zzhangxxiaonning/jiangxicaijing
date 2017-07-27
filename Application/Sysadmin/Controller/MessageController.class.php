<?php
namespace Sysadmin\Controller;
use Think\Controller;
class MessageController extends CommonController {
	public function __construct(){
		parent::__construct();
	}
    public function index(){
		create_up_url(U('index'),'Message');
		$cat_name = '意见反馈管理';
		$_db = M('Message');
		$map = array();
		$is_service = 0;
		/*处理状态*/
		$status = I('get.status','-1');
		if($status>=0){
			$map['status'] = array('eq',$status);
			$is_service++;
		}
		
		
		/*标题*/
		$name = I('get.name','');
		if($name){
			$map_uid['username'] = array('like','%'.$name.'%');
            $mems = M("Member") -> where($map_uid) -> select();

            $str = '';
            foreach($mems as $aa=>$vv){
                $str .= $vv['id'].',';
            }
//            dump($str);
            $str = rtrim($str,',');
            $map['mid'] = array('in',$str);

			$is_service++;
		}
		
		/*时间起始*/
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
		/*
		 * 管理员名称
		 * 
		 */
		foreach($lists as $m=>$v){
//			$lists[$m]['username'] = $this->mem_name(M('Member'),$v['uid']);

		}
		
		$this->assign('lists',$lists);
		$this->assign('page',$show);
		
		$menu_show[0] = 'Message';
		$menu_show[1] = 'index';
		$this->assign('menu_show',$menu_show);
		$this->assign('cat_name',$cat_name);
		
		
        $this->display();
//		 dump($lists);
		// echo M("Category")->getLastSql();
    }
	
	public function edit(){
		$cat_name = '查看意见';
		$_db = D('Message');
        $map['id'] = array('eq',I('get.id'));

        $data['status'] = 1;
        $_db->where($map)->save($data);

        $info = $_db->where($map)->find();
        $this->assign('info',$info);
        $this->assign('cat_name',$cat_name);

        $menu_show[0] = 'Message';
        $menu_show[1] = 'index';
        $this->assign('menu_show',$menu_show);
        $this->display('info');

    }
	public function del_index(){
		if(IS_GET){
			$id = I('get.id',0);
			$m_admin['id'] = array('eq',$id);

			$info = M('Message')->where($m_admin)->find();
            $map['id'] = array('eq',$info['mid']);
            $data = M('Member') -> where($map) -> find();
//			$ret = M('Message')->where($m_admin)->limit(1)->delete();
            $sql = "DELETE FROM cms_message WHERE id = ".$id;
            $ret = M('Message')->execute($sql);
			if($ret){
				$json['status'] = '1';
				$this->inserlog('用户：'.$data['username'].',意见ID:'.$id.' 删除成功','Message');
				$json['info']	= '用户：'.$data['username'].'意见 删除成功';
			}else{
				$json['status'] = '0';
				$json['info']	= '用户：'.$data['username'].'意见 删除失败';
			}
			echo json_encode($json);exit;
		}
	}

	
	/*
	 * 修改内容状态
	 */
	public function editnav(){
		//create_up_url(U('index'),'Newscat');
		$News=M('Message');
		if(IS_GET){
			
			$id = I('id');
			$map['id']=array('eq',$id);
			$data=$News->where($map)->find();
			$saveda['status'] = $data['status']==1?0:1;
			$saveda['update_time'] = time();
			$lastid=$News->where($map)->save($saveda);
			if($lastid){
				$this->inserlog('联系人：'.$data['contacts'].'意见,ID:'.$id.' 修改状态成功','Message');
				$this->success("修改状态成功",get_up_url(U('index'),'Message'));
			}else{
				$this->error("修改状态失败");
			}
			
		}
	}
	
	
}