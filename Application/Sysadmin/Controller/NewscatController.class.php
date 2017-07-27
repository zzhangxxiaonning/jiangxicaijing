<?php
namespace Sysadmin\Controller;
use Think\Controller;
class NewscatController extends CommonController {
	public function __construct(){
		parent::__construct();
	}
    public function act_index(){
		create_up_url(U('index'),'Newscat');
		$cat_name = '资讯分类';
		$_db = M('Newscat');
		$map = array();
		$page_num = 10;
		$p = I('get.p',1);
		$count	= $_db->where($map)->count();
		$Page	= new \Common\Other\Page($count,$page_num);		
		$show	= $Page->show();
		$lists = $_db->where($map)->page($p.','.$page_num)->order('id desc')->select();
		
		/*管理员名称*/
		foreach($lists as $m=>$v){
			$lists[$m]['admin_name'] = $this->admin_name($v['admin_id']);
		}
		$this->assign('lists',$lists);
		$this->assign('page',$show);
		
		$menu_show[0] = 'News';
		$menu_show[1] = 'act_index';
		$this->assign('menu_show',$menu_show);
		$this->assign('cat_name',$cat_name);
        $this->display('index');
		
    }
	


/**
 * 添加 - 活动分类
 * 
**/
	public function act_add(){
		$cat_name = '资讯分类 - 添加';
		$_db = D('Newscat');
		if(IS_POST){
			
			$datas = $_db->where(array('catname'=>array('eq',I('post.catname'))))->count();
			if($datas){
				$this->error("该分类已存在！");
			}else{
				if(!$_db->create()){
					$this->error($_db->getError().'');
				}else{
					
					$lastid = $_db->add();
					if($lastid){
						$this->inserlog('资讯分类：'.I('post.catname').',ID:'.$lastid.' 添加成功','Newscat');
						$this->success("添加分类:".I('post.catname')."成功",get_up_url(U('act_index'),'Newscat'));
					}else{
						$this->error("添加分类失败");
					}
				}
			}
		}else{
			$this->assign('cat_name',$cat_name);
			
			$menu_show[0] = 'News';
			$menu_show[1] = 'act_add';
			$this->assign('menu_show',$menu_show);
			$this->display('info');
		}
    }
/**
 * 编辑 - 栏目分类
 * 
**/
	public function act_edit(){
		$cat_name = '资讯分类 - 编辑';
		$_db = D('Newscat');
		if(IS_POST){
			$id = I('post.id',0);
			$map['id'] = array('eq',$id);
			$data = $_db->where($map)->find();
			$datas = $_db->where(array('id'=>array('neq',$id),'catname'=>array('eq',I('post.catname'))))->count();
			
			if($datas){
				$this->error("该分类已存在！");
			}else{
				$_POST['update_time'] = time();
				if(!$_db->create($_POST)){
					$this->error($_db->getError().'');
				}else{
					$ret = $_db->where($map)->save();
					if($ret){
						$this->inserlog('资讯分类：'.$data['catname'].',ID:'.$id.' 编辑成功','Newscat');
						$this->success("编辑分类:".$data['catname']."成功",get_up_url(U('act_index'),'Newscat'));
					}else{
						$this->error("编辑分类失败");
					}
				}
			}	
			
		}else{
			$map['id'] = array('eq',I('get.id'));
			$info = $_db->where($map)->find();
			$this->assign('info',$info);
			
			$this->assign('cat_name',$cat_name);
			
			$menu_show[0] = 'News';
			$menu_show[1] = 'act_edit';
			$this->assign('menu_show',$menu_show);
			
			$this->display('info');
			
		}
    }
	
	/*
	 * 修改栏目状态
	 */
	public function editnav(){
		
		$Category=M('Newscat');
		if(IS_GET){
			//$id = I('id',1);
			$id = I('id');
			$map['id']=array('eq',$id);
			$data=$Category->where($map)->find();
			$saveda['status'] = $data['status']==1?0:1;
			$saveda['update_time'] = time();
			$lastid=$Category->where($map)->save($saveda);
			if($lastid){
				$this->inserlog('资讯分类：'.$data['catname'].',ID:'.$id.' 修改状态成功','Newscat');
				$this->success("修改状态成功",get_up_url(U('act_index'),'Newscat'));
			}else{
				$this->error("修改状态失败");
			}
			
		}
	}
	
	/*
	 * 更新排序
	 */
	public function sortlists(){
		$Category=M('Newscat');
		if(IS_POST){
		
			foreach(I('sort') as $k=>$v){
				$Category->where('id='.$k)->setField('sort',$v);
				$string .= $k.',';
			}
			$this->inserlog('资讯分类修改排序成功','Newscat');
			$this->success("修改排序成功",get_up_url(U('act_index'),'Newscat'));
		}else{
			$this->error("修改排序失败");
		}
	
		
	}
	
	
/**
 * 删除分类
 * 请先清空该分类下的活动
 * 
**/
	public function act_del(){
		$Category=M('Newscat');
		if(IS_GET){
			$id = I('get.id',0);
			$m_admin['id'] = array('eq',$id);
			$info = $Category->where($m_admin)->field('id,catname')->find();
			/* 分类下活动必须为空 */
			$coun_admin = M('News')->where(array('cat_id'=>array('eq',$id)))->count();

			if($coun_admin > 0){
				$json['status'] = '-2';
				$json['info']	= '该分类下资讯不为空，请先清空资讯后再删除此分类！';
				echo json_encode($json);exit;
			}

            $sql = "DELETE FROM cms_newscat WHERE id = ".$id;
            $ret = $Category->execute($sql);

//			$ret = $Category->where($m_admin)->limit(1)->delete();
//            $ret = $Category->execute("commit");
            F(time().'_del',$ret);
			if($ret){
				$json['status'] = '1';
				$json['info']	= '分类:'.$info['catname'].' 删除成功';
				$this->inserlog('资讯分类：'.$info['catname'].',ID:'.$id.' 删除成功','Newscat');
				
			}else{
				$json['status'] = '0';
				$json['info']	= '分类:'.$info['catname'].' 删除失败';
			}
			echo json_encode($json);exit;
		}
	}
	
}