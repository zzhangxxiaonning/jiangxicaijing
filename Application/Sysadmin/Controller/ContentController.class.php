<?php
namespace Sysadmin\Controller;
use Think\Controller;
class ContentController extends CommonController {
	public function __construct(){
		parent::__construct();
	}
    public function index(){
		create_up_url(U('index'),'Content');
		$_db = M('Content');
		$map = array();
		$is_service = 0;
		$cat_id = I('get.cat_id','-1');
		if($cat_id>0){
			$map['cat_id'] = array('eq',$cat_id);
			$is_service++;
		}
		$status = I('get.status','-1');
		if($status>=0){
			$map['status'] = array('eq',$status);
			$is_service++;
		}
		$name = I('get.name','');
		if($name){
			$map['title'] = array('like','%'.$name.'%');
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
		if($tel){
			$map['tel'] = array('like','%'.$tel.'%');
			$is_service++;
		}
		if($email){
			$map['email'] = array('like','%'.$email.'%');
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
		
		$menu_show[0] = 'Content';
		$menu_show[1] = 'index';
		$this->assign('menu_show',$menu_show);
        $this->display();
		// dump($lists);
    }
	public function add(){
		$cat_name = '添加单页';
		if(IS_POST){
			$_db = D('Content');

			if(!$_db->create()){
				$this->error($_db->getError().'');
			}else{
				$lastid = $_db->add();
				if($lastid){
					$this->inserlog('单页：'.I('post.title').',ID:'.$lastid.' 添加成功','Content');
					$this->success("单页：".I('post.title')."添加成功",get_up_url(U('index'),'Content'));
				}else{
					$this->error("单页：".I('post.title')."添加失败");
				}
			}
		}else{
			$this->assign('cat_name',$cat_name);

			$info['status'] = 1;
			$this->assign('info',$info);
			
			$menu_show[0] = 'Content';
			$menu_show[1] = 'add';
			$this->assign('menu_show',$menu_show);
			
			$this->display('info');
		}
    }
	public function edit(){
		$cat_name = '编辑文章';
		$_db = D('Content');
		if(IS_POST){
			$id = I('post.id',0);
			$map['id'] = array('eq',$id);

			$_POST['update_time'] = time();
			if(!$_db->create($_POST)){
				$this->error($_db->getError().'');
			}else{
				$_db->flag=Array2String(I('post.flag'));
				
				$ret = $_db->where($map)->save();
				if($ret){
					$this->inserlog('单页：'.I('post.title').',ID:'.$id.' 编辑成功','Content');
					$this->success("单页：".I('post.title')."编辑成功",get_up_url(U('index'),'Content'));
				}else{
					$this->error("单页：".I('post.title')."编辑失败");
				}
			}
			exit;
		}else{
			$map['id'] = array('eq',I('get.id'));
			$info = $_db->where($map)->find();
            is_resource($info['content']) && $info['content']=stream_get_contents($info['content']);
			$this->assign('info',$info);
			$this->assign('cat_name',$cat_name);
			
			$menu_show[0] = 'Content';
			$menu_show[1] = 'edit';
			$this->assign('menu_show',$menu_show);
			
			$this->display('info');
		}
    }
	public function del_index(){
		if(IS_GET){
			$id = I('get.id',0);
			$m_admin['id'] = array('eq',$id);
			$info = M('Content')->where($m_admin)->find();
			$ret = M('Content')->where($m_admin)->limit(1)->delete();
			
			if($ret){
				
				$this->inserlog('单页：'.$info['title'].',ID:'.$id.' 删除成功','Content');
				$json['status'] = '1';
				$json['info']	= '单页：'.$info['title'].' 删除成功';
			}else{
				$json['status'] = '0';
				$json['info']	= '单页：'.$info['title'].' 删除失败';
				
			}
			echo json_encode($json);exit;
			
		}
	}

	
	/*
	 * 更新排序
	 */
	public function sortlists(){
		$Content=M('Content');
		if(IS_POST){
		
			foreach(I('sort') as $k=>$v){
				$Content->where('id='.$k)->setField('sort',$v);
				$string .= $k.',';
			}
			$this->inserlog('单页修改排序成功','Content');
			$this->success("修改排序成功",get_up_url(U('index'),'Content'));
		}else{
			$this->error("修改排序失败");
		}
	
		
	}
	
	/*
	 * 修改栏目状态
	 */
	public function editnav(){
		//create_up_url(U('index'),'Newscat');
		$Content=M('Content');
		if(IS_GET){
			//$id = I('id',1);
			$id = I('id');
			$map['id']=array('eq',$id);
			$data=$Content->where($map)->find();
			$saveda['status'] = $data['status']==1?0:1;
			$saveda['update_time'] = time();
			$lastid=$Content->where($map)->save($saveda);
			if($lastid){
				$this->inserlog('单页：'.$data['title'].',ID:'.$id.' 修改状态成功','Content');
				$this->success("修改状态成功",get_up_url(U('index'),'Content'));
			}else{
				$this->error("修改状态失败");
			}
			
		}
	}
	
}