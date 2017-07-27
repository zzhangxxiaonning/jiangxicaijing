<?php
namespace Sysadmin\Controller;
use Think\Controller;
class LinksController extends CommonController {
	public function __construct(){
		parent::__construct();
	}
    public function index(){
		create_up_url(U('index'),'Links');
		$cat_name = '友情链接管理';
		$_db = M('Links');
		$map = array();
		$is_service = 0;
		/*显示状态*/
		$status = I('get.status','-1');
		if($status>=0){
			$map['status'] = array('eq',$status);
			$is_service++;
		}
		
		
		/*标题*/
		$name = I('get.name','');
		if($name){
			$map['title'] = array('like','%'.$name.'%');
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
			$lists[$m]['admin_name'] = $this->admin_name($v['admin_id']);
		}
		
		$this->assign('lists',$lists);
		$this->assign('page',$show);
		
		$menu_show[0] = 'Expert';
		$menu_show[1] = 'index';
		$this->assign('menu_show',$menu_show);
		$this->assign('cat_name',$cat_name);
		
		
        $this->display();
		// dump($lists);
		// echo M("Category")->getLastSql();
    }
	public function add(){
		$cat_name = '添加链接';
		if(IS_POST){
			
			$_db = D('Links');
			
			$datas = $_db->where(array('title'=>array('eq',I('post.title'))))->count();
			if($datas){
				$this->error("该名称已存在！");
			}else{
				if(!$_db->create()){
					$this->error($_db->getError().'');
				}else{
					
					$lastid = $_db->add();
					if($lastid){
						$this->inserlog('链接：'.I('post.title').',ID:'.$lastid.' 添加成功','Links');
						$this->success("链接：".I('post.title')."添加成功",get_up_url(U('index'),'Links'));
					}else{
						$this->error("链接：".I('post.title')."添加失败");
					}
				}
			}	
		}else{
			$this->assign('cat_name',$cat_name);
			
			$menu_show[0] = 'Links';
			$menu_show[1] = 'add';
			$this->assign('menu_show',$menu_show);
			$info['status'] = 1;
			$this->assign('info',$info);

			$this->display('info');
			// dump($cat_lists);
		}
    }
	public function edit(){
		$cat_name = '编辑链接';
		$_db = D('Links');
		if(IS_POST){
			$id = I('post.id',0);
			$map['id'] = array('eq',$id);
			
			$datas = $_db->where(array('id'=>array('neq',$id),'title'=>array('eq',I('post.title'))))->count();
			if($datas){
				$this->error("该名称已存在！");
			}else{
				$_POST['update_time'] = time();
				if(!$_db->create($_POST)){
					$this->error($_db->getError().'');
				}else{
					
					$ret = $_db->where($map)->save();
					if($ret){
						
						$this->inserlog('链接：'.I('post.title').',ID:'.$id.' 编辑成功','Links');
						$this->success("链接：".I('post.title')."编辑成功",get_up_url(U('index'),'Links'));
					}else{
						$this->error("链接：".I('post.title')."编辑失败");
					}
				}
			}
		}else{
			$map['id'] = array('eq',I('get.id'));
			$info = $_db->where($map)->find();
			$this->assign('info',$info);
			$this->assign('cat_name',$cat_name);
		
			$menu_show[0] = 'Links';
			$menu_show[1] = 'edit';
			$this->assign('menu_show',$menu_show);
			$this->display('info');
		}
    }
	public function del_index(){
		if(IS_GET){
			$id = I('get.id',0);
			$m_admin['id'] = array('eq',$id);
			
			
			$info = M('Links')->where($m_admin)->find();
			$ret = M('Links')->where($m_admin)->limit(1)->delete();
			
			if($ret){
				$json['status'] = '1';
				$this->inserlog('链接：'.$info['title'].',ID:'.$id.' 删除成功','Links');
				$json['info']	= '链接：'.$info['title'].' 删除成功';
			}else{
				$json['status'] = '0';
				$json['info']	= '链接：'.$info['title'].' 删除失败';
			}
			echo json_encode($json);exit;
		}
	}

	
	/*
	 * 更新排序
	 */
	public function sortlists(){
		$News=M('Links');
		if(IS_POST){
		
			foreach(I('sort') as $k=>$v){
				$News->where('id='.$k)->setField('sort',$v);
				$string .= $k.',';
			}
			$this->success("修改排序成功",get_up_url(U('index'),'Links'));
		}else{
			$this->error("修改排序失败");
		}
	
	}
	
	/*
	 * 修改内容状态
	 */
	public function editnav(){
		//create_up_url(U('index'),'Newscat');
		$News=M('Links');
		if(IS_GET){
			
			$id = I('id');
			$map['id']=array('eq',$id);
			$data=$News->where($map)->find();
			$saveda['status'] = $data['status']==1?0:1;
			$saveda['update_time'] = time();
			$lastid=$News->where($map)->save($saveda);
			if($lastid){
				$this->inserlog('链接：'.$data['title'].',ID:'.$id.' 修改状态成功','Links');
				$this->success("修改状态成功",get_up_url(U('index'),'Links'));
			}else{
				$this->error("修改状态失败");
			}
			
		}
	}
	
	
}