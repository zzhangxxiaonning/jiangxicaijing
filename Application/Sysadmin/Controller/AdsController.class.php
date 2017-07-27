<?php
namespace Sysadmin\Controller;
use Think\Controller;
class AdsController extends CommonController {
	public function __construct(){
		parent::__construct();
	}
    public function index(){
		create_up_url(U('index'),'Ads');
		// dump($_SERVER);
		// echo get_up_url(U('index'),'Ads');
		$_db = M('Ad');
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
			$map['name'] = array('like','%'.$name.'%');
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
		if($lists){
			$db_role = M('AdCat');
			foreach($lists as $k=>$v){
				$role_info = $db_role->where(array('id'=>array('eq',$v['cat_id'])))->cache(60,true)->field('name')->find();
				$lists[$k]['cat_name'] = $role_info['name'];
			}
		}
		$this->assign('lists',$lists);
		$this->assign('page',$show);
		
		$cat_lists = M('AdCat')->field('id,name')->order('id desc')->cache(60,true)->limit(50)->select();
		$this->assign('cat_lists',$cat_lists);
		$menu_show[0] = 'ads';
		$menu_show[1] = 'index';
		$this->assign('menu_show',$menu_show);
        $this->display();
    }
	public function add(){
		$cat_name = '添加广告';
		if(IS_POST){
			$_db = D('Ad');
			if(!$_db->create()){
				$this->error($_db->getError().'');
			}else{
				$lastid = $_db->add();
				if($lastid){
					$this->inserlog('广告：'.I('post.name').',ID:'.$lastid.' 添加成功','ads');
					$this->success("广告:".I('post.name')."添加成功",get_up_url(U('index'),'Ads'));
				}else{
					$this->error("广告:".I('post.name')."添加失败");
				}
			}
		}else{
			$this->assign('cat_name',$cat_name);
			$adcat_lists = M('AdCat')->field('id,name,size_info')->order('sort asc,id asc')->cache(60,true)->limit(50)->select();
			$this->assign('adcat_lists',$adcat_lists);
			$menu_show[0] = 'ads';
			$menu_show[1] = 'add';
			$this->assign('menu_show',$menu_show);
			$info['status'] = 1;
			$this->assign('info',$info);
			$this->display('info');
		}
    }
	public function edit(){
		$cat_name = '编辑广告';
		$_db = D('Ad');
		if(IS_POST){
			$id = I('post.id',0);
			$map['id'] = array('eq',$id);
			if(!$_db->create($_POST)){
				$this->error($_db->getError().'');
			}else{
				$ret = $_db->where($map)->save();
				if($ret){
					$this->inserlog('广告：'.I('post.name').',ID:'.$id.' 编辑成功','ads');
					$this->success("广告:".I('post.name')."编辑成功",get_up_url(U('index'),'Ads'));
				}else{
					$this->error("广告:".I('post.name')."编辑失败");
				}
			}
			exit;
		}else{
			$map['id'] = array('eq',I('get.id'));
			$info = $_db->where($map)->find();
			$this->assign('info',$info);
			$this->assign('cat_name',$cat_name);
			$adcat_lists = M('AdCat')->field('id,name,size_info')->order('sort asc,id asc')->cache(60,true)->limit(50)->select();
			$this->assign('adcat_lists',$adcat_lists);
			$menu_show[0] = 'ads';
			$menu_show[1] = 'edit';
			$this->assign('menu_show',$menu_show);
			$this->display('info');
		}
    }
	public function del_index(){
		if(IS_GET){
			$id = I('get.id',0);
			$m_admin['id'] = array('eq',$id);
			$info = M('Ad')->where($m_admin)->field('*')->find();
//			$ret = M('Ad')->where($m_admin)->limit(1)->delete();
            $sql = "DELETE FROM cms_ad WHERE id = ".$id;
            $ret = M('Ad')->execute($sql);
			if($ret){
				$json['status'] = '1';
				$json['info']	= '广告:'.$info['name'].' 删除成功';
				$this->inserlog('广告：'.$info['name'].',ID:'.$info['id'].' 添加成功','ads');
			}else{
				$json['status'] = '0';
				$json['info']	= '广告:'.$info['name'].' 删除失败';
			}
			echo json_encode($json);exit;
		}
	}
/**
 * 列表 - 广告位
 * 通过广告位名称进行模糊搜索
 * 
**/
	public function position_lists(){
		create_up_url(U('position_lists'),'Ads_type');
		$_db = M('AdCat');
		$map = array();
		$is_service = 0;
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
		$lists = $_db->where($map)->page($p.','.$page_num)->order('id desc')->select();
		if($lists){
			$_db_ad = M('Ad');
			$time = time();
			foreach($lists as $k=>$v){
				//$lists[$k]['num'] = $_db_admin->where(array('role_id'=>array('eq',$v['id'])))->cache(60,true)->count();
				$_map_ad = array();
				$_map_ad['cat_id'] = array('eq',$v['id']);
				$lists[$k]['num'] = $_db_ad->where($_map_ad)->count();
				
				$_map_ad['status'] = array('eq',1);
				$_map_ad["_string"] = " 
					(start_time IS NULL AND end_time IS NULL) or 
					(start_time = 0 AND end_time = 0) or 
					(start_time = 0 AND end_time > ".$time.") or 
					(start_time IS NULL AND end_time > ".$time.") or 
					(start_time < ".$time." AND end_time = 0) or
					(start_time < ".$time." AND end_time  IS NULL) or  
					(start_time < ".$time." AND end_time > ".$time.") ";
				$lists[$k]['num_true'] = $_db_ad->where($_map_ad)->count();
			}
		}
		$this->assign('lists',$lists);
		$this->assign('page',$show);
		
		$menu_show[0] = 'ads';
		$menu_show[1] = 'position_lists';
		$this->assign('menu_show',$menu_show);
        $this->display();
	}
/**
 * 添加 - 广告位
 * 
**/
	public function position_add(){
		$cat_name = '添加广告位';
		if(IS_POST){
			$_db = D('AdCat');
			if(!$_db->create()){
				$this->error($_db->getError().'');
			}else{
				$lastid = $_db->add();
				if($lastid){
					$this->inserlog('广告位：'.I('post.name').',ID:'.$lastid.' 添加成功','ads');
					$this->success("广告位:".I('post.name')."添加成功",get_up_url(U('position_lists'),'Ads_type'));
				}else{
					$this->error("广告位:".I('post.name')."添加失败");
				}
			}
		}else{
			$this->assign('cat_name',$cat_name);
			$menu_show[0] = 'ads';
			$menu_show[1] = 'position_add';
			$this->assign('menu_show',$menu_show);
			$info['status'] = 1;
			$this->assign('info',$info);
			$this->display('position_info');
		}
    }
/**
 * 编辑 - 广告位
 * 
**/
	public function position_edit(){
		$cat_name = '编辑广告位';
		$_db = D('AdCat');
		if(IS_POST){
			$id = I('post.id',0);
			$map['id'] = array('eq',$id);
			if(!$_db->create($_POST)){
				$this->error($_db->getError().'');
			}else{
				$ret = $_db->where($map)->save();
				if($ret){
					$this->inserlog('广告位：'.I('post.name').',ID:'.$id.' 编辑成功','ads');
					$this->success("广告位:".I('post.name')."编辑成功",get_up_url(U('position_lists'),'Ads_type'));
				}else{
					$this->error("广告位:".I('post.name')."编辑失败");
				}
			}
			exit;
		}else{
			$map['id'] = array('eq',I('get.id'));
			$info = $_db->where($map)->find();
			$this->assign('info',$info);
			$this->assign('cat_name',$cat_name);
			$menu_show[0] = 'ads';
			$menu_show[1] = 'position_edit';
			$this->assign('menu_show',$menu_show);
			$this->display('position_info');
		}
    }
/**
 * 删除 - 广告位
 * 该广告位下的广告必须为空否则无法删除
 * 
**/
	public function del_position(){
		if(IS_GET){
			$id = I('get.id',0);
			$m_admin['id'] = array('eq',$id);
			$info = M('AdCat')->where($m_admin)->field('id,name')->find();
			/* 广告位广告必须为空 */
			$coun_admin = M('Ad')->where(array('cat_id'=>array('eq',$info['id'])))->count();
			if($coun_admin > 0){
				$json['status'] = '-2';
				$json['info']	= '该广告下面广告不为空，请先清空广告在删除广告位！';
				echo json_encode($json);exit;
			}
//			$ret = M('AdCat')->where($m_admin)->limit(1)->delete();
            $sql = "DELETE FROM cms_ad_cat WHERE id = ".$id;
            $ret = M('AdCat')->execute($sql);


			if($ret){
				$json['status'] = '1';
				$json['info']	= '广告位：'.$info['name'].' 删除成功';
				$this->inserlog('广告位：'.$info['name'].',ID:'.$info['id'].' 删除成功','ads');
			}else{
				$json['status'] = '0';
				$json['info']	= '广告位：'.$info['name'].' 删除失败';
			}
			echo json_encode($json);exit;
		}
	}
	// private function inserlog($info,$type){
		// $add_data['type']		=	$type;
		// $add_data['ip_address']	=	get_client_ip();
		// $add_data['info']		=	$info;
		// $add_data['admin_id']	=	$this->admin_id;
		// $add_data['create_time']=	time();
		
		// M('AdminLogs')->add($add_data);
	// }

    /*
	 * 修改内容状态
	 */
    public function editnav(){
        //create_up_url(U('index'),'Newscat');
        $Ads=M('Ad');
        if(IS_GET){

            $id = I('id');
            $map['id']=array('eq',$id);
            $data=$Ads->where($map)->find();
            $saveda['status'] = $data['status']==1?0:1;
            $saveda['update_time'] = time();
            $lastid=$Ads->where($map)->save($saveda);
            if($lastid){
                $this->inserlog('广告：'.$data['name'].',ID:'.$id.' 修改状态成功','Ads');
                $this->success("修改状态成功",get_up_url(U('index'),'Ads'));
            }else{
                $this->error("修改状态失败");
            }

        }
    }


}