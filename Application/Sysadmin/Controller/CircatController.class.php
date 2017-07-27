<?php
namespace Sysadmin\Controller;
use Think\Controller;
class CircatController extends CommonController {
	public function __construct(){
		parent::__construct();

	}
    public function act_index(){
		create_up_url(U('act_index'),'Circat');
		$cat_name = '项目分类';
		$_db = M('Circat');
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
		$menu_show[1] = 'act_index';
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
		$Category=M('Circat');
		if(IS_GET){
			//$id = I('id',1);
			$id = I('id');
			$map['id']=array('eq',$id);
			$data=$Category->where($map)->find();
			$saveda['status'] = $data['status']==1?0:1;
			$saveda['update_time'] = time();
			$lastid=$Category->where($map)->save($saveda);
			if($lastid){
				$this->inserlog('创客分类：'.$data['catname'].',ID:'.$id.' 修改状态成功','Circat');
				$this->success("修改分类：".$data['catname']."状态成功",get_up_url(U('act_index'),'Circat'));
			}else{
				$this->error("修改状态失败");
			}
			
		}
	}
	
	/*
	 * 更新排序
	 */
	public function sortlists(){
		$Category=M('Circat');
		if(IS_POST){
		
			foreach(I('sort') as $k=>$v){
				$Category->where('id='.$k)->setField('sort',$v);
				$string .= $k.',';
			}
			$this->inserlog('创客分类修改排序成功','Circat');
			$this->success("修改排序成功",get_up_url(U('act_index'),'Circat'));
		}else{
			$this->error("修改排序失败");
		}
	
		
	}

/**
 * 添加 - 栏目分类
 * 
**/
	public function act_add(){
		$cat_name = '项目分类 - 添加';
		$_db = D('Circat');

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
                    $this->inserlog('创客分类：' . $_POST['catname'] . ',ID:' . $lastid . ' 添加成功', 'Circat');
                    $this->success("添加分类成功", get_up_url(U('act_index'), 'Circat'));
                }else{
                    $this->error("添加分类失败");
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
			$menu_show[1] = 'act_add';
			$this->assign('menu_show',$menu_show);
			$this->display('info');
			dump($cat_list);
		}
    }
/**
 * 编辑 - 栏目分类
 * 
**/
	public function act_edit(){
		$cat_name = '项目分类 - 编辑';
		$_db = D('Circat');
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

                    $this->inserlog('创客分类：' . $data['catname'] . ',ID:' . $id . ' 编辑成功', 'Circat');
                    $this->success("编辑分类". $data['catname'] ."成功", get_up_url(U('index'), 'Circat'));
                }else{
                    $this->error("编辑分类失败");
                }
            }

		}else{

			$this->assign('data',$data);
			$this->assign('cat_name',$cat_name);
			
			$menu_show[0] = 'Circle';
			$menu_show[1] = 'act_edit';
			$this->assign('menu_show',$menu_show);
			
			$this->display('info');
//            dump($data);
		}
    }
/**
 * 删除分类
 * 先判断该分类是否是顶级分类
 * 是顶级分类，删除时，判断是否有子分类，有给出提示，无可删除，
 * 有二级分类，判断该分类下有无项目，有提示删除该分类下项目
 * 无，可删除
 * 返回json
**/
	public function del_position(){
		if(IS_GET){
		    $db_ = M('Circat');
			$id = I('get.id',0);
			$m_admin['id'] = array('eq',$id);
			$info = $db_->where($m_admin)->field('id,catname,up_id')->find();


			if($info['up_id']){
                //二级分类
                $count = $db_->where(array('up_id'=>array('eq',$info['id'])))->count();
                if($count){
                    $json['status'] = '-2';
                    $json['info']	= '该分类下有子分类，请先删除子分类再删除此分类！';
                    echo json_encode($json);exit;
                }else{
                    /*三级分类（有文库）*/
                    $coun_admin = M('Circle')->where(array('cat_id'=>array('eq',$info['id'])))->count();
                    if($coun_admin > 0){
                        $json['status'] = '-2';
                        $json['info']	= '该分类下文库不为空，请先清空后再删除此分类！';
                        echo json_encode($json);exit;
                    }
                }

            }else{
                $count = $db_ -> where(array('up_id'=>array('eq',$info['id'])))->count();
                /*该分类下有子分类*/
                if($count){
                    $json['status'] = '-2';
                    $json['info']	= '该分类下有子分类，请先删除子分类再删除此分类！';
                    echo json_encode($json);exit;

                }
            }
            //删除操作
//			$ret = $db_->where($m_admin)->limit(1)->delete();
            $sql = "DELETE FROM cms_circat WHERE id = ".$id;
            $ret = $db_->execute($sql);
			if($ret){
				$json['status'] = '1';
				$json['info']	= '分类:'.$info['catname'].' 删除成功';
				$this->inserlog('创客分类：'.$info['catname'].',ID:'.$id.' 删除成功','Circat');
				
			}else{
				$json['status'] = '0';
				$json['info']	= '分类:'.$info['catname'].' 删除失败';
			}
			echo json_encode($json);exit;
		}
	}
	
}