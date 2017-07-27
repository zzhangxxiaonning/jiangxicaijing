<?php
namespace Sysadmin\Controller;
use Think\Controller;
class AdminController extends CommonController {
	public function __construct(){
		parent::__construct();
	}
	/**
	 * 管理员
	**/
    public function index(){
		$cat_name = '管理员';
		create_up_url(U('index'),'Admin');
		$_db = M('Admin');
		$map = array();
		$is_service = 0;
		$username = I('get.username','');
		if($username){
			$map['username'] = array('like','%'.$username.'%');
			$is_service++;
		}
		$role_id = I('get.role_id','-1');
		if($role_id>0){
			$map['role_id'] = array('eq',$role_id);
			$is_service++;
		}
		$status = I('get.status','-1');
		if($status>=0){
			$map['status'] = array('eq',$status);
			$is_service++;
		}

		$this->assign('is_service',$is_service);
		$page_num = 10;
		$p = I('get.p',1);
		$count	= $_db->where($map)->count();
		$Page	= new \Common\Other\Page($count,$page_num);		
		$show	= $Page->show();
		$lists = $_db->where($map)->page($p.','.$page_num)->select();
		$db_role = M('AdminRole');
		if($lists){
			foreach($lists as $k=>$v){
				$role_info = $db_role->where(array('id'=>array('eq',$v['role_id'])))->cache(60,true)->field('title as name,status')->find();
				$lists[$k]['role_name'] = $role_info['name'];
				$lists[$k]['role_status'] = $role_info['status'];
			}
		}
		$this->assign('lists',$lists);
		$this->assign('page',$show);
		
		$role_lists = $db_role->field('id,title as name')->order('sort asc,id asc')->cache(60,true)->limit(50)->select();
		$this->assign('role_lists',$role_lists);
		$menu_show[0] = 'admin';
		$menu_show[1] = 'index';
		$this->assign('menu_show',$menu_show);
		$this->assign('cat_name',$cat_name);
        $this->display();
    }
	public function add(){
		$cat_name = '添加管理员';
		if(IS_POST){
			$_db = D('Admin');
			if(!$_db->create()){
				$this->error($_db->getError().'');
			}else{
				$lastid = $_db->add();
				if($lastid){
					$this->success("管理员:".I('post.username')."添加成功",get_up_url(U('index'),'Admin'));
				}else{
					$this->error("管理员:".I('post.username')."添加失败");
				}
			}
		}else{
			$this->assign('cat_name',$cat_name);
			$role_lists = M('AdminRole')->field('id,title as name')->order('sort asc,id asc')->cache(60,true)->limit(50)->select();
			// dump($role_lists);
			$this->assign('role_lists',$role_lists);
			$menu_show[0] = 'admin';
			$menu_show[1] = 'add';
			$this->assign('menu_show',$menu_show);
			$info['status'] = 1;
			$this->assign('info',$info);
			$this->display('info');
		}
    }
	public function edit(){
		$id = I('id',0);
		$map['id'] = array('eq',$id);
		$_db = D('Admin');
		$info = $_db->where($map)->find();
		
		$cat_name = '编辑管理员['.$info['username'].']';
		if(IS_POST){
			
			$password = I('post.password');
			$password2 = I('post.password2');
			if(!$password){
				unset($_POST['password']);
				unset($_POST['password2']);
			}else{
				$_POST['sign'] = randCode(5);
				if($password != $password2){
					$this->error('两次密码不一致');
					exit;
				}
				unset($_POST['password']);
				unset($_POST['password2']);
				$_POST['password'] = md5($password.$_POST['sign']);
			}
			if(!$_db->create($_POST)){
				$this->error($_db->getError().'');
			}else{
				$ret = $_db->where($map)->save();
				if($ret){
					$this->success("编辑管理员[username:".I('post.username')."]编辑成功",get_up_url(U('index'),'Admin'));
				}else{
					$this->error("编辑管理员[username:".I('post.username')."]编辑失败");
				}
			}
			exit;
		}else{
			$this->assign('info',$info);
			$this->assign('cat_name',$cat_name);
			$role_lists = M('AdminRole')->field('id,title as name')->order('sort asc,id asc')->cache(60,true)->limit(50)->select();
			$this->assign('role_lists',$role_lists);

			$menu_show[0] = 'admin';
			$menu_show[1] = 'edit';
			$this->assign('menu_show',$menu_show);
			$this->display('info');
//            dump($role_lists);
		}
    }
	public function del_index(){
		if(IS_GET){
			$id = I('get.id',0);
			if(in_array($id,array('1',$this->admin_id))){
				$json['status'] = '-1';
				$json['info']	= '不允许删除该管理员';
				echo json_encode($json);exit;
			}
			$m_admin['id'] = array('eq',$id);
			$info = M('Admin')->where($m_admin)->field('id,username,tel,role_id,name')->find();
//			$ret = M('Admin')->where($m_admin)->limit(1)->delete();
            $sql = "DELETE FROM cms_admin WHERE id = ".$id;
            $ret = M('Admin')->execute($sql);
			if($ret){
				$json['status'] = '1';
				$json['info']	= '管理员[username：'.$info['username'].'] 删除成功';
			}else{
				$json['status'] = '0';
				$json['info']	= '管理员[username：'.$info['username'].'] 删除失败';
			}
			echo json_encode($json);exit;
		}
	}
	/**
	 * 角色管理
	**/
	public function role_lists(){
		$cat_name = '角色管理';
		create_up_url(U('role_lists'),'Admin_type');
		$_db = M('AdminRole');
		$map = array();
		$is_service = 0;
		$status = I('get.status','-1');
		if($status>0){
			$map['status'] = array('eq',$status);
			$is_service++;
		}
		$name = I('get.name','');
		if($name){
			$map['name'] = array('like','%'.$name.'%');
			$is_service++;
		}
		$this->assign('is_service',$is_service);
		$page_num = 10;
		$p = I('get.p',1);
		$count	= $_db->where($map)->count();
		$Page	= new \Common\Other\Page($count,$page_num);		
		$show	= $Page->show();
		$lists = $_db->where($map)->page($p.','.$page_num)->select();
		if($lists){
			$_db_admin = M('Admin');
			foreach($lists as $k=>$v){
				$lists[$k]['num'] = $_db_admin->where(array('role_id'=>array('eq',$v['id'])))->cache(60,true)->count();
			}
		}
		$this->assign('lists',$lists);
		$this->assign('page',$show);
		
		$menu_show[0] = 'admin';
		$menu_show[1] = 'role_lists';
		$this->assign('menu_show',$menu_show);
		$this->assign('cat_name',$cat_name);
        $this->display();
	}
	/**
	 * 添加角色
	**/
	public function role_add(){
		$cat_name = '添加角色';
		if(IS_POST){
			$_db = D('AdminRole');
			if(!$_db->create()){
				$this->error($_db->getError().'');
			}else{
				$lastid = $_db->add();
				if($lastid){
					$this->success($cat_name.":[".I('post.title')."] 成功!",get_up_url(U('role_lists'),'Admin_type'));
				}else{
					$this->error($cat_name.":[".I('post.title')."] 失败!");
				}
			}
		}else{
			$this->assign('cat_name',$cat_name);
			$menu_show[0] = 'admin';
			$menu_show[1] = 'role_add';
			$this->assign('menu_show',$menu_show);
			$info['status'] = 1;
			$this->assign('info',$info);
			$this->display('role_info');
		}
    }
	/**
	 * 编辑角色
	 * id 角色id
	**/
	public function role_edit(){
		$id = I('id');
		$_db = D('AdminRole');
		
		$map['id'] = array('eq',$id);
		$info = $_db->where($map)->find();
		
		$cat_name = '编辑角色:['.$info['title'].']';
		if(IS_POST){
			if(!$_db->create($_POST)){
				$this->error($_db->getError().'');
			}else{
				$ret = $_db->where($map)->save();
				if($ret){
					$this->success($cat_name." 成功!",get_up_url(U('role_lists'),'Admin_type'));
				}else{
					$this->error($cat_name." 失败!");
				}
			}
			exit;
		}else{
			$this->assign('info',$info);
			$this->assign('cat_name',$cat_name);
			$menu_show[0] = 'admin';
			$menu_show[1] = 'role_edit';
			$this->assign('menu_show',$menu_show);
			$this->display('role_info');
		}
    }
	
	/**
	 * 删除角色
	 * id 角色id
	**/
	public function del_role(){
		if(IS_GET){
			$id = I('get.id',0);
			if(in_array($id,array('1'))){
				$json['status'] = '-1';
				$json['info']	= '不允许删除该角色';
				echo json_encode($json);exit;
			}
			$m_admin['id'] = array('eq',$id);
//			F("aa",$id);
			$info = M('AdminRole')->where($m_admin)->find();
			$coun_admin = M('Admin')->where(array('role_id'=>array('eq',$info['id'])))->count();
			if($coun_admin > 0){
				$json['status'] = '-2';
				$json['info']	= '请先删除该角色下的管理员！';
				echo json_encode($json);exit;
			}
//			$ret = M('AdminRole')->where($m_admin)->limit(1)->delete();
            $sql = "DELETE FROM cms_admin_role WHERE id = ".$id;
            $ret = M('AdminRole')->execute($sql);
			if($ret){
				$json['status'] = '1';
				$json['info']	= '角色：'.$info['name'].' 删除成功';
			}else{
				$json['status'] = '0';
				$json['info']	= '角色：'.$info['name'].' 删除失败';
			}
			echo json_encode($json);exit;
		}
	}
	/**
	 * 功能权限设置
	 * id 角色id
	**/
	public function role_function(){
		$id = I('id',0);
		if(in_array($id,array('0','1'))){
			$this->error("该角色功能权限不允许修改!");
		}		
		
		$_db = D('AdminRole');
		$map['id'] = array('eq',$id);
		$info = $_db->where($map)->find();
		
		$cat_name = '[角色:'.$info['title'].'] 功能权限设置';
		if(IS_POST){
			$_save_data['rules'] = Array2String($_POST['rules'],',');
			$_save_data['update_time'] = time();
			$_ret = $_db->where($map)->save($_save_data);
			if($_ret){
				$this->success($cat_name." 成功!",get_up_url(U('role_lists'),'Admin_type'));
			}else{
				$this->error($cat_name." 失败!");
			}
		}else{
			$info['rules'] = String2Array($info['rules'],',');
			$this->assign('info',$info);
			$list = M('AdminRule')->where("status = 1 and type = 1")->order('sort asc,id asc')->select();
			$data_lists = array();
			if($list){
				foreach($list as $k=>$v){
					$data_lists[$v['module']]['name'] = $v['module'];
					$data_lists[$v['module']]['lists'][] = $v;
				}
			}
			$this->assign('cat_name',$cat_name);
			$this->assign('data_lists',$data_lists);
			$this->_get_name_type();
			$menu_show[0] = 'admin';
			$menu_show[1] = 'role_function';
			$this->assign('menu_show',$menu_show);
			$this->display();
		}
	}
	/**
	 * 内容权限设置
	 * id 角色id
	**/
	public function role_content(){
		$id = I('id',0);
		if(in_array($id,array('0','1'))){
			$this->error("该角色内容权限不允许修改!");
		}		
		
		$_db = D('AdminRole');
		$map['id'] = array('eq',$id);
		$info = $_db->where($map)->find();
		
		$cat_name = '[角色:'.$info['title'].'] 内容权限设置';
		if(IS_POST){
			$_save_data['rules'] = Array2String($_POST['rules'],',');
			$_save_data['update_time'] = time();
			$_ret = $_db->where($map)->save($_save_data);
			if($_ret){
				$this->success($cat_name." 成功!",get_up_url(U('role_lists'),'Admin_type'));
			}else{
				$this->error($cat_name." 失败!");
			}
		}else{
			$info['rules'] = String2Array($info['rules'],',');
			$this->assign('info',$info);
			
			// M('NewsCat')->where()
			
			$list = M('AdminRule')->where("status = 1 and type = 1")->order('sort asc,id asc')->select();
			$data_lists = array();
			if($list){
				foreach($list as $k=>$v){
					$data_lists[$v['module']]['name'] = $v['module'];
					$data_lists[$v['module']]['lists'][] = $v;
				}
			}
			$this->assign('data_lists',$data_lists);
			
			
			
			$this->assign('cat_name',$cat_name);
			$menu_show[0] = 'admin';
			$menu_show[1] = 'role_content';
			$this->assign('menu_show',$menu_show);
			$this->display();
		}
	}
	private function _get_name_type(){
		$lists = array(
				'index'     =>'控制面板',
				'config'    =>'系统管理',
				'ads'		=>'广告管理',
				'Content'	=>'单页管理',
				'Order'	    =>'订单管理',
				'Member'	=>'用户管理',
				'Message'	=>'意见反馈',
				'Comment'	=>'评论管理',
				'News'	    =>'资讯管理',
				'Circle'	=>'创客圈管理',
				'Activity'	=>'活动管理',
			);
		$this->assign('type_name',$lists);
	}
}