<?php
namespace Sysadmin\Controller;
use Think\Controller;
class CirattrController extends CommonController {
	public function __construct(){
		parent::__construct();

	}
    public function attr_index(){
		create_up_url(U('attr_index'),'Cirattr');
		$cat_name = '创客属性';
		$_db = M('Cirattr');
		$map = array();
		$map['up_id'] = array('eq',0);
	
		$lists = $_db->where($map)->order('id asc')->select();
		// dump($lists);
		//管理员名称
        if($lists){
			// $_db_car = M('Carmodel');
			foreach($lists as $k=>$v){
				$two = $_db->where(array('up_id'=>array('eq',$v['id'])))->order('id asc')->select();
				if($two){
                    foreach($two as $m=>$n){

                        $three = $_db->where(array('up_id'=>array('eq',$n['id'])))->order('id asc')->select();
                        $two[$m]['three'] = $three;
//				    $two[$m]['admin_name'] = $this->admin_name($n['admin_id']);
                    }
                }
				$lists[$k]['son'] = $two;
//                $lists[$k]['admin_name'] = $this->admin_name($v['admin_id']);
			}
		}
		$this->assign('lists',$lists);
//		$this->assign('page',$show);
		
		$menu_show[0] = 'Circle';
		$menu_show[1] = 'attr_index';
		$this->assign('menu_show',$menu_show);
		$this->assign('cat_name',$cat_name);
        $this->display('index');
//		dump($lists);
		
    }
	
	
	/*
	 * 修改栏目状态
	 */
	public function editnav(){
		//create_up_url(U('index'),'Libcat');
		$Category=M('Cirattr');
		if(IS_GET){
			//$id = I('id',1);
			$id = I('id');
			$map['id']=array('eq',$id);
			$data=$Category->where($map)->find();
			$saveda['status'] = $data['status']==1?0:1;
			$saveda['update_time'] = time();
			$lastid=$Category->where($map)->save($saveda);
			if($lastid){
				$this->inserlog('创客属性：'.$data['catname'].',ID:'.$id.' 修改状态成功','Cirattr');
				$this->success("修改属性：".$data['catname']."状态成功",get_up_url(U('attr_index'),'Cirattr'));
			}else{
				$this->error("修改状态失败");
			}
			
		}
	}
	
	/*
	 * 更新排序
	 */
	public function sortlists(){
		$Category=M('Cirattr');
		if(IS_POST){
		
			foreach(I('sort') as $k=>$v){
				$Category->where('id='.$k)->setField('sort',$v);
				$string .= $k.',';
			}
			$this->inserlog('创客属性修改排序成功','Cirattr');
			$this->success("修改排序成功",get_up_url(U('attr_index'),'Cirattr'));
		}else{
			$this->error("修改排序失败");
		}
	
		
	}

/**
 * 添加 - 栏目分类
 * 
**/
	public function attr_add(){
		$cat_name = '创客属性 - 添加';
		$_db = D('Cirattr');

        $cat_list = $_db->getList(0,'&nbsp;','');
        $this->assign('cat_list',$cat_list);

		if(IS_POST){
            $upid = I('up_id');
            if($upid == 0){
                $path = 0;
            }else{
                $m_up['id'] = array('eq',$upid);
                $up_info = $_db->field('id,path')->where($m_up)->find();
                $path = $up_info['path'].'-'.$up_info['id'];
            }
            if($_db->create()){
                $_db->path = $path;
                $lastid = $_db->add();
                if($lastid){
                    $this->inserlog('创客属性：' . $_POST['catname'] . ',ID:' . $lastid . ' 添加成功', 'Cirattr');
                    $this->success("添加属性成功", get_up_url(U('attr_index'), 'Cirattr'));
                }else{
                    $this->error("添加属性失败");
                }
            }


		}else{
			$this->assign('cat_name',$cat_name);
			$info['status'] = 1;
			$this->assign('info',$info);

//            $upid = I('id');
//            if(!($upid>0)){$upid = 0;}
            $data['upid'] = 0;
            $this->assign('data',$data);

			$menu_show[0] = 'Circle';
			$menu_show[1] = 'attr_add';
			$this->assign('menu_show',$menu_show);
			$this->display('info');
//			dump($cat_list);
		}
    }
/**
 * 编辑 - 栏目分类
 * 
**/
	public function attr_edit(){
		$cat_name = '创客属性 - 编辑';
		$_db = D('Cirattr');
        $id = I('get.id',0);
        $map['id'] = array('eq',$id);

        $cat_list = $_db->getList(0,'&nbsp;','');
        $this->assign('cat_list',$cat_list);

        $data = $_db->where($map)->find();
		if(IS_POST){

            $upid = I('up_id');
            if($upid==0){
                $path = 0;
            }else{
                $m_up['id'] = array('eq',$upid);
                $upinfo = $_db->field('id,path')->where($m_up)->find();
                $path = $upinfo['path'].'-'.$upinfo['id'];
            }
            if($_db->create()){
                if($data['up_id'] != $upid){
                    $_db->path = $path;
                }
                $info = $_db->where($map)->save();
                if($info){

                    $this->inserlog('创客属性：' . $data['catname'] . ',ID:' . $id . ' 编辑成功', 'Cirattr');
                    $this->success("编辑属性". $data['catname'] ."成功", get_up_url(U('attr_index'), 'Cirattr'));
                }else{
                    $this->error("编辑属性失败");
                }
            }

		}else{

			$this->assign('data',$data);
			$this->assign('cat_name',$cat_name);
			
			$menu_show[0] = 'Circle';
			$menu_show[1] = 'attr_edit';
			$this->assign('menu_show',$menu_show);
			
			$this->display('info');
//            dump($data);
		}
    }
/**
 * 删除属性
 * 先判断该属性是否是顶级属性
 * 是顶级属性，删除时，判断是否有子属性，有给出提示，无可删除，
 * 有二级属性，判断该属性下有无项目，有提示删除该属性下项目
 * 无，可删除
 * 返回json
**/
	public function del_position(){
		if(IS_GET){
		    $db_ = M('Cirattr');
			$id = I('get.id',0);
			$m_admin['id'] = array('eq',$id);
			$info = $db_->where($m_admin)->field('id,catname,up_id')->find();


			if($info['up_id']){
                //二级属性
                $count = $db_->where(array('up_id'=>array('eq',$info['id'])))->count();
                if($count){
                    $json['status'] = '-2';
                    $json['info']	= '该属性下有子属性，请先删除子属性再删除此属性！';
                    echo json_encode($json);exit;
                }else{
                    /*三级属性（有项目）*/
                    $coun_admin = M('Circle')->where(array('cat_id'=>array('eq',$info['id'])))->count();
                    if($coun_admin > 0){
                        $json['status'] = '-2';
                        $json['info']	= '该属性下项目不为空，请先清空后再删除此属性！';
                        echo json_encode($json);exit;
                    }
                }

            }else{
                $count = $db_ -> where(array('up_id'=>array('eq',$info['id'])))->count();
                /*该属性下有子属性*/
                if($count){
                    $json['status'] = '-2';
                    $json['info']	= '该属性下有子属性，请先删除子属性再删除此属性！';
                    echo json_encode($json);exit;

                }
            }
            //删除操作
//			$ret = $db_->where($m_admin)->limit(1)->delete();
            $sql = "DELETE FROM cms_cirattr WHERE id = ".$id;
            $ret = $db_->execute($sql);
			if($ret){
				$json['status'] = '1';
				$json['info']	= '属性:'.$info['catname'].' 删除成功';
				$this->inserlog('创客属性：'.$info['catname'].',ID:'.$id.' 删除成功','Cirattr');
				
			}else{
				$json['status'] = '0';
				$json['info']	= '属性:'.$info['catname'].' 删除失败';
			}
			echo json_encode($json);exit;
		}
	}
	
}