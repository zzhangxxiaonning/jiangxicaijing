<?php
namespace Sysadmin\Controller;
use Think\Controller;
class TeacherController extends CommonController {
	public function __construct(){
		parent::__construct();
	}
	
	/*用户*/
    public function tea_index(){
		create_up_url(U('tea_index'),'Teacher');
		$_db = M('Teacher');
		$map = array();
		$is_service = 0;
		$name = I('get.name','');
		if($name){
			$map['username|worker_id'] = array('like','%'.$name.'%');
			$is_service++;
		}

        $technical = I('get.technical','');
		if($technical){
            $map['technical'] = array('like','%'.$technical.'%');
            $is_service++;
        }

        $status = I('get.status','-1');
        if($status>0){
            $map['status'] = array('eq',$status);
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
		
		$sort = 'id desc';
		$this->assign('is_service',$is_service);

		$page_num = 10;
		$p = I('get.p',1);
		$count	= $_db->where($map)->count();
		$Page	= new \Common\Other\Page($count,$page_num);		
		$show	= $Page->show();
		$lists = $_db->where($map)->page($p.','.$page_num)->order($sort)->select();
		$menu_show[0] = 'Member';
		$menu_show[1] = 'tea_index';
		$this->assign('menu_show',$menu_show);
		$this->assign('lists',$lists);
		$this->assign('page',$show);
		
		
        $this->display('index');
    }
	
	public function tea_add(){
		$cat_name = '添加教师';
		$_db = D('Teacher');
		if(IS_POST){

			$datas_worker = $_db->where(array('worker_id'=>array('eq',I('post.worker_id'))))->count();
			if($datas_worker){
				$this->error("该工号已存在！");
			}

			if(!$_db->create()){
				$this->error($_db->getError().'');
			}else{

				$ret = $_db->add();
				
				if($ret){
					$this->inserlog('教师：'.I('post.username').',ID:'.$ret.' 添加成功','Teacher');
					$this->success("教师：".I('post.username')."添加成功",get_up_url(U('tea_index'),'Teacher'));
				}else{
					$this->error("教师：".I('post.username')."添加失败");
				}
			}
			
		}else{
			$this->assign('cat_name',$cat_name);
			
			$menu_show[0] = 'Member';
			$menu_show[1] = 'tea_add';
			$this->assign('menu_show',$menu_show);
			
			$this->display('info');
		}
    }
	
	public function tea_edit(){
		$cat_name = '编辑教师';
		$_db = D('Teacher');
		if(IS_POST){
			$id = I('post.id',0);
			$map['id'] = array('eq',$id);

            if(I('post.worker_id')){
                $datas_worker = $_db->where(array('id'=>array('neq',$id),'worker_id'=>array('eq',I('post.worker_id'))))->count();
                if($datas_worker){
                    $this->error("该工号已存在！");
                }
            }

			$_POST['update_time'] = time();
			if(!$_db->create($_POST)){
				$this->error($_db->getError().'');
			}else{
				
				$ret = $_db->where($map)->save();
				if($ret){
					$this->inserlog('教师：'.I('post.username').',ID:'.$id.' 编辑成功','Teacher');
					
					$this->success("教师：".I('post.username')."编辑成功",get_up_url(U('tea_index'),'Teacher'));
				}else{
					$this->error("教师：".I('post.username')."编辑失败");
				}
			}
			
		}else{
			$map['id'] = array('eq',I('get.id'));
			$info = $_db->where($map)->find();
			$this->assign('info',$info);
			$this->assign('cat_name',$cat_name);
			
			$menu_show[0] = 'Member';
			$menu_show[1] = 'tea_edit';
			$this->assign('menu_show',$menu_show);
			
			$this->display('info');
		}
    }

	public function del_index(){
		if(IS_GET){
			$id = I('get.id',0);
			
			$m_admin['id'] = array('eq',$id);
			$data = M('Teacher')->where($m_admin)->find();
//			$ret = M('Member')->where($m_admin)->limit(1)->delete();
            $sql = "DELETE FROM cms_teacher WHERE id = ".$id;
            $ret = M('Teacher')->execute($sql);
			
			if($ret){
				$json['status'] = '1';
				$json['info']	= '教师：'.$data['username'].' 删除成功';
				$this->inserlog('教师：'.$data['username'].',ID:'.$id.' 删除成功','Teacher');
			}else{
				$json['status'] = '0';
				$json['info']	= '教师：'.$data['username'].' 删除失败';
			}
			echo json_encode($json);exit;
		}
	}
	
	/*
	 * 修改内容状态
	 */
	public function editnav(){
		//create_up_url(U('index'),'Newscat');
		$News=M('Teacher');
		if(IS_GET){
			
			$id = I('id');
			$map['id']=array('eq',$id);
			$data=$News->where($map)->find();
			$saveda['status'] = $data['status']==1?0:1;
			$saveda['update_time'] = time();
			$lastid=$News->where($map)->save($saveda);
			if($lastid){
				$this->inserlog('教师：'.$data['username'].',ID:'.$id.' 修改状态成功','Teacher');
				$this->success("修改状态成功",get_up_url(U('tea_index'),'Teacher'));
			}else{
				$this->error("修改状态失败");
			}
			
		}
	}
	
}