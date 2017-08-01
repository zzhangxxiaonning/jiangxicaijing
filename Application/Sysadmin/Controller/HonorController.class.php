<?php
namespace Sysadmin\Controller;
use Think\Controller;
class HonorController extends CommonController {
	public function __construct(){
		parent::__construct();
	}
    public function his_index(){
		create_up_url(U('his_index'),'Honor');
		$cat_name = '获奖资讯';
		$_db = M('Honor');
		$map = array();
		$is_service = 0;

		/*状态*/
		$status = I('get.status','-1');
		if($status>=0){
			$map['status'] = array('eq',$status);
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

		
		$menu_show[0] = 'config';
		$menu_show[1] = 'his_index';
		$this->assign('menu_show',$menu_show);
		$this->assign('cat_name',$cat_name);
		
		
        $this->display('index');
//		 dump($lists);
		// echo M("Category")->getLastSql();
    }
    public function his_add(){
        $cat_name = '获奖资讯';
        if(IS_POST){

            $_db = D('Honor');

            if(!$_db->create()){
                $this->error($_db->getError().'');
            }else{

                $lastid = $_db->add();
                if($lastid){
                    $this->inserlog('获奖资讯：'.I('post.content').',ID:'.$lastid.' 添加成功','Honor');
                    $this->success("获奖资讯：".I('post.content')."添加成功",get_up_url(U('his_index'),'Honor'));
                }else{
                    $this->error("获奖资讯：".I('post.content')."添加失败");
                }
            }

        }else{
            $this->assign('cat_name',$cat_name);

            $menu_show[0] = 'config';
            $menu_show[1] = 'his_add';
            $this->assign('menu_show',$menu_show);
            $info['status'] = 1;
            $this->assign('info',$info);

            $this->display('info');
//            dump($cat_lists_arr);

        }
    }
	public function his_edit(){
		$cat_name = '获奖资讯';
		$_db = D('Honor');
		if(IS_POST){
			$id = I('post.id',0);
			$map['id'] = array('eq',$id);

            if(!$_db->create($_POST)){
                $this->error($_db->getError().'');
            }else{
                $ret = $_db->where($map)->save();
                if($ret){

                    $this->inserlog('获奖资讯：'.I('post.content').',ID:'.$id.' 编辑成功','Honor');
                    $this->success("获奖资讯：".I('post.content')."编辑成功",get_up_url(U('his_index'),'Honor'));
                }else{
                    $this->error("获奖资讯：".I('post.content')."编辑失败");
                }
            }

		}else{
			$map['id'] = array('eq',I('get.id'));
			$info = $_db->where($map)->find();

			$this->assign('info',$info);
			$this->assign('cat_name',$cat_name);

			$menu_show[0] = 'config';
			$menu_show[1] = 'his_edit';
			$this->assign('menu_show',$menu_show);
			$this->display('info');
		}
    }

    /*
	 * 修改内容状态
	 */
    public function editnav(){
        //create_up_url(U('index'),'Newscat');
        $FileHistory = M('Honor');
        if(IS_GET){

            $id = I('id');
            $map['id']=array('eq',$id);
            $data=$FileHistory->where($map)->find();
            $saveda['status'] = $data['status']==1?0:1;
            $saveda['update_time'] = time();
            $lastid=$FileHistory->where($map)->save($saveda);
            if($lastid){
                $this->inserlog('获奖资讯：'.$data['content'].',ID:'.$id.' 修改状态成功','Honor');
                $this->success("修改状态成功",get_up_url(U('his_index'),'Honor'));
            }else{
                $this->error("修改状态失败");
            }

        }
    }

    /*
	 * 更新排序
	 */
    public function sortlists(){
        $FileHistory=M('Honor');
        if(IS_POST){
            $string = '';
            foreach(I('sort') as $k=>$v){
                $FileHistory->where('id='.$k)->setField('sort',$v);
                $string .= $k.',';
            }
            $this->success("修改排序成功",get_up_url(U('his_index'),'Honor'));
        }else{
            $this->error("修改排序失败");
        }

    }

    public function his_del(){
        $FileHistory = M('Honor');
        if(IS_GET){
            $id = I('get.id',0);
            $m_admin['id'] = array('eq',$id);


            $info = $FileHistory->where($m_admin)->find();
            $ret = $FileHistory->where($m_admin)->limit(1)->delete();

            if($ret){
                $json['status'] = '1';
                $this->inserlog('获奖资讯：'.$info['content'].',ID:'.$id.' 删除成功','Honor');
                $json['info']	= '获奖资讯：'.$info['content'].' 删除成功';
            }else{
                $json['status'] = '0';
                $json['info']	= '获奖资讯：'.$info['content'].' 删除失败';
            }
            echo json_encode($json);exit;
        }
    }
}