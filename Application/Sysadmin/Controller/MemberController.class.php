<?php
namespace Sysadmin\Controller;
use Think\Controller;
class MemberController extends CommonController {
	public function __construct(){
		parent::__construct();
	}
	
	/*用户*/
    public function index(){
		create_up_url(U('index'),'Member');
		$_db = M('Member');
		$map = array();
		$is_service = 0;
		$name = I('get.name','');
		if($name){
			$map['username|phone'] = array('like','%'.$name.'%');
			$is_service++;
		}

        $type = I('get.type','-1');
        if($type>0){
            $map['type'] = array('eq',$type);
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
		/*时间排序*/
		$time_sort = I('get.time_sort','');
		$impact_sort = I('get.impact_sort','');
		if($time_sort == 1){
			$sort = 'create_time asc';
			$is_service++;
		}else if($time_sort == 2){
			$sort = 'create_time desc';
			$is_service++;
		}
		$this->assign('is_service',$is_service);

		$page_num = 10;
		$p = I('get.p',1);
		$map['transaction_id'] = array('neq',0);
		$map['pay_time'] = array('neq',0);
		$count	= $_db->where($map)->count();
		$Page	= new \Common\Other\Page($count,$page_num);		
		$show	= $Page->show();
		$lists = $_db->where($map)->page($p.','.$page_num)->order($sort)->select();
		$menu_show[0] = 'Member';
		$menu_show[1] = 'index';
		$this->assign('menu_show',$menu_show);
		$this->assign('lists',$lists);
		$this->assign('page',$show);
		
		
        $this->display();
    }
	
	public function add(){
		$cat_name = '添加用户';
		$_db = D('Member');
		if(IS_POST){

			$datas_phone = $_db->where(array('phone'=>array('eq',I('post.phone'))))->count();
			if($datas_phone){
				$this->error("该手机号已存在！");
			}
            $rand = rand(11111,99999);
            $_POST['password'] = md5(md5(I('post.password')).$rand);
            $_POST['sign'] = $rand;
			if(!$_db->create()){
				$this->error($_db->getError().'');
			}else{

				$ret = $_db->add();
				
				if($ret){
					$this->inserlog('用户手机号：'.I('post.phone').',ID:'.$ret.' 添加成功','Member');
					$this->success("用户手机号：".I('post.phone')."添加成功",get_up_url(U('index'),'Member'));
				}else{
					$this->error("用户：".I('post.phone')."添加失败");
				}
			}
			
		}else{
			$this->assign('cat_name',$cat_name);
			
			$menu_show[0] = 'Member';
			$menu_show[1] = 'add';
			$this->assign('menu_show',$menu_show);
			
			$this->display();
		}
    }
	
	public function edit(){
		$cat_name = '编辑用户';
		$_db = D('Member');
		if(IS_POST){
			$id = I('post.id',0);
			$map['id'] = array('eq',$id);

            if(I('post.username')){
                $datas_username = $_db->where(array('id'=>array('neq',$id),'username'=>array('eq',I('post.username'))))->count();
                if($datas_username){
                    $this->error("该用户名已存在！");
                }
            }

			if(I('post.phone')){
                $datas_phone = $_db->where(array('id'=>array('neq',$id),'phone'=>array('eq',I('post.phone'))))->count();
                if($datas_phone){
                    $this->error("该手机号已存在！");
                }
            }

            if(I('post.password')){
                $rand = rand(11111,99999);
                $_POST['password'] = md5(md5(I('post.password')).$rand);
                $_POST['sign'] = $rand;
            }else{
                unset($_POST['password']);
            }

			$_POST['update_time'] = time();
			if(!$_db->create($_POST)){
				$this->error($_db->getError().'');
			}else{
				
				$ret = $_db->where($map)->save();
				if($ret){
					$this->inserlog('用户：'.I('post.username').',ID:'.$id.' 编辑成功','Member');
					
					$this->success("用户：".I('post.username')."编辑成功",get_up_url(U('index'),'Member'));
				}else{
					$this->error("用户：".I('post.username')."编辑失败");
				}
			}
			
		}else{
			$map['id'] = array('eq',I('get.id'));
			$info = $_db->where($map)->find();
			$this->assign('info',$info);
			$this->assign('cat_name',$cat_name);
			
			/*省市区三级联动*/
//			$sheng = $this->getArea(1,$info['province']?$info['province']:0);
//			$shi = $this->getArea($info['province']?$info['province']:0,$info['city']?$info['city']:0);
//			$qu = $this->getArea($info['city']?$info['city']:0,$info['area']?$info['area']:0);
//			$this->assign('sheng',$sheng);
//			$this->assign('shi',$shi);
//			$this->assign('qu',$qu);
			
			$menu_show[0] = 'Member';
			$menu_show[1] = 'edit';
			$this->assign('menu_show',$menu_show);
			
			$this->display('info');
		}
    }

    public function card(){
        $cat_name = '银行卡';
        $_db = M('Card');
        if(IS_POST){
            $id = I('post.id',0);
            $map['id'] = array('eq',$id);
            $data = $_db->where($map)->find();

            $map_['id'] = array('eq',$data['mid']);
            $data_mem = M('Member')->where($map_)->find();

            if(I('post.bank_card')){
                $datas_bank_card = $_db->where(array('id'=>array('neq',$id),'bank_card'=>array('eq',I('post.bank_card'))))->count();
                if($datas_bank_card){
                    $this->error("该卡号已存在！");
                }
            }

            unset($_POST['username']);
            $_POST['admin_id'] = cookie('ADMIN_ID');
            $_POST['update_time'] = time();
            if(!$_db->create($_POST)){
                $this->error($_db->getError().'');
            }else{

                $ret = $_db->where($map)->save();
                if($ret){
                    $this->inserlog('用户：'.$data_mem['username'].'银行卡ID：'.$id.'编辑成功','Member');

                    $this->success('用户：'.$data_mem['username'].'银行卡编辑成功',get_up_url(U('index'),'Member'));
                }else{
                    $this->error('用户：'.$data_mem['username'].'银行卡编辑失败');
                }
            }

        }else{
            $map['id'] = array('eq',I('get.id'));
            $map_['mid'] = array('eq',I('get.id'));
            $data = M('Member')->where($map)->find();
            $info = $_db->where($map_)->find();
            $this->assign('data',$data);
            $this->assign('info',$info);
            $this->assign('cat_name',$cat_name);

            $menu_show[0] = 'Member';
            $menu_show[1] = 'edit';
            $this->assign('menu_show',$menu_show);

            $this->display();
        }
    }

	public function del_index(){
		if(IS_GET){
			$id = I('get.id',0);
			
			$m_admin['id'] = array('eq',$id);
			$data = M('Member')->where($m_admin)->find();
//			$ret = M('Member')->where($m_admin)->limit(1)->delete();
            $sql = "DELETE FROM cms_member WHERE id = ".$id;
            $ret = M('Member')->execute($sql);
			
			if($ret){
				$json['status'] = '1';
				$json['info']	= '用户：'.$data['username'].' 删除成功';
				$this->inserlog('用户：'.$data['username'].',ID:'.$id.' 删除成功','member');
			}else{
				$json['status'] = '0';
				$json['info']	= '用户：'.$data['username'].' 删除失败';
			}
			echo json_encode($json);exit;
		}
	}
	
	/*
	 * 修改内容状态
	 */
	public function editnav(){
		//create_up_url(U('index'),'Newscat');
		$News=M('Member');
		if(IS_GET){
			
			$id = I('id');
			$map['id']=array('eq',$id);
			$data=$News->where($map)->find();
			$saveda['status'] = $data['status']==1?0:1;
			$saveda['update_time'] = time();
			$lastid=$News->where($map)->save($saveda);
			if($lastid){
				$this->inserlog('用户：'.$data['username'].',ID:'.$id.' 修改状态成功','Member');
				$this->success("修改状态成功",get_up_url(U('index'),'Member'));
			}else{
				$this->error("修改状态失败");
			}
			
		}
	}
	
}