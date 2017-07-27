<?php
namespace Sysadmin\Controller;
use Think\Controller;
class MailController extends CommonController {
	public function __construct(){
		parent::__construct();
	}
    public function index_mail(){
		create_up_url(U('index_mail'),'Mail');
		$_db = M('Mail');
		$_db_mem = M('Member');
		$map = array();
		$is_service = 0;
		//接收人
        $name = I('get.name','');
        if($name){

            $map_name['username|phone'] = array('like','%'.$name.'%');
            $mems = M("Member")->where($map_name)->select();
            $str = '';
            foreach($mems as $b=>$c){
                $str .= $c['id'].',';
            }
            $str = rtrim($str,',');
            $map['mid'] = array('in',$str);
            $is_service++;
        }
		
		//标题
        $title = I('get.title','');
        if($title){
            $map['title'] = array('like','%'.$title.'%');
            $is_service++;
        }

        /*显示状态*/
        $isshow = I('get.isshow','-1');
        if($isshow>=0){
            $map['isshow'] = array('eq',$isshow);
            $is_service++;
        }

        /*查看状态*/
        $status = I('get.status','-1');
        if($status>=0){
            $map['status'] = array('eq',$status);
            $is_service++;
        }

        /*发送方式*/
        $send_type = I('get.send_type','-1');
        if($send_type>=0){
            $map['send_type'] = array('eq',$send_type);
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
		//echo M()->getLastSql();
		foreach($lists as $a=>$v){

            $lists[$a]['admin_name'] = $this->admin_name($v['admin_id']);
            $name = $this->mem_name(M('Member'),$v['mid']);
            $lists[$a]['username'] = $name['username']?$name['username']:$name['phone'];

		}
		
		//dump($lists);
		$this->assign('lists',$lists);
		$this->assign('page',$show);
		$menu_show[0] = 'config';
		$menu_show[1] = 'index_mail';
		$this->assign('menu_show',$menu_show);
		
        $this->display('index');
		
    }
	/*单独一条或多条添加站内信*/
	public function add(){
		$cat_name = '添加站内信';
		if(IS_POST){
			$_db = D('Mail');

            if(I('post.mid') == 0){
                $this->error("请选择接收人");
            }
			// if(!I('post.title')){
                // $this->error("请输入站内信标题");
            // }
            // if(!I('post.content')){
                // $this->error("请输入发送内容");
            // }

            $mem_id = array_unique(I('post.mid'));
            $time = time();
            foreach($mem_id as $b=>$v){
                $data[$b]['mid'] = $v;
				$data[$b]['title'] = I('post.title');
                $data[$b]['content'] = I('post.content');
                $data[$b]['create_time'] = $time;
                $data[$b]['update_time'] = $time;
                $data[$b]['admin_id'] = cookie('ADMIN_ID');

            }

			if(!$_db->create()){
				$this->error($_db->getError().'');
			}else{

				$lastid = $_db->addAll($data);
				if($lastid){
                    $this->inserlog('站内信ID:'.$lastid.' 添加成功','Mail');
					$this->success("站内信发送成功",get_up_url(U('index_mail'),'Mail'));
				}else{
					$this->error("站内信发送失败");
				}
			}
		}else{
			$this->assign('cat_name',$cat_name);
			$info['status'] = 1;
			$this->assign('info',$info);
			
			$menu_show[0] = 'config';
			$menu_show[1] = 'add';
			$this->assign('menu_show',$menu_show);
			$this->display('add');
			
		}
    }

	/*群发*/
	public function adds(){
		$cat_name = '群发站内信';
		if(IS_POST){
			$_db = D('Mail');
			
			// if(!I('post.title')){
                // $this->error("请输入站内信标题");
            // }
            // if(!I('post.content')){
                // $this->error("请输入发送内容");
            // }
			// dump();exit;
			$mems = M("Member")->select();
			//$arr = array();
			$str = '';
			foreach($mems as $a=>$v){
				$str .= $v['id'].',';
			}
			$str = rtrim($str,',');
			$arr = explode(',',$str);
            $time = time();
			$data = array();
			foreach($arr as $b=>$v){
				$data[$b]['mid'] = $v;
				$data[$b]['send_type'] = 1;
                $data[$b]['create_time'] = $time;
                $data[$b]['update_time'] = $time;
                $data[$b]['admin_id'] = cookie('ADMIN_ID');
                $data[$b]['title'] = I('post.title');
				$data[$b]['content'] = I('post.content');
			}
			
			if(!$_db->create()){
				$this->error($_db->getError().'');
			}else{
				$lists = $_db->addAll($data);
                if($lists){

					$this->inserlog('群发站内信成功','Mail');
					$this->success("群发成功",get_up_url(U('index_mail'),'Mail'));
				}else{
					$this->error("群发失败");
				}
			}
		}else{
			$this->assign('cat_name',$cat_name);
			$info['status'] = 1;
			$this->assign('info',$info);
			
			$menu_show[0] = 'config';
			$menu_show[1] = 'adds';
			$this->assign('menu_show',$menu_show);
			$this->display('adds');
			
		}
    }
	
	/*查看站内信*/
	public function edit_mail(){
		$cat_name = '添加站查看';
		$this->assign('cat_name',$cat_name);
		
		$Mail = M('Mail');
		$id = I('get.id',0);
		
		$map['id'] = array('eq',$id);
		$info = _Finds($Mail,$map,'');
		
		$name = $this->mem_name(M('Member'),$info['mid']);
		$info['username'] = $name['username']?$name['username']:$name['phone'];
		
		$this->assign('info',$info);
		
		$menu_show[0] = 'config';
		$menu_show[1] = 'edit_mail';
		$this->assign('menu_show',$menu_show);
		$this->display('edit');
    }
	
    /*
     * 修改显示状态
     */
    public function editnav(){
        //create_up_url(U('index'),'Newscat');
        $Mail = M('Mail');
        if(IS_GET){

            $id = I('get.id',0);
            $map['id']=array('eq',$id);
            $data=$Mail->where($map)->find();
            $saveda['isshow'] = $data['isshow']==1?0:1;
            $saveda['update_time'] = time();
            $lastid=$Mail->where($map)->save($saveda);
            if($lastid){
                $this->inserlog('站内信ID:'.$id.' 修改显示状态成功','Mail');
                $this->success("修改显示状态成功",get_up_url(U('index_mail'),'Mail'));
            }else{
                $this->error("修改显示状态失败");
            }

        }
    }
	
	public function del_index(){
        $Mail = M('Mail');

		if(IS_GET){
            $id = I('get.id',0);

            $m_admin['id'] = array('eq',$id);
            $ret = $Mail->where($m_admin)->limit(1)->delete();
			if($ret){
				$json['status'] = '1';
				$json['info']	= '删除成功';
				$this->inserlog('站内信ID:'.$id.' 删除成功','Mail');
			}else{
				$json['status'] = '0';
				$json['info']	= '删除失败';
			}
			echo json_encode($json);exit;
		}
	}
	
	/*
	 * 实时同步接收人
	 * 接收人的名称
	 * 搜索出所有的接收人
	 * 返回json
	 */
	public function mems(){

		if(IS_POST){
            $title = I('post.value');	//接收人的名称

			$map['username|phone'] = array('like','%'.$title.'%');
			$datas = M("Member")->where($map)->select();
			foreach($datas as $a=>$v){
                $datas[$a]['username'] = $v['username']?$v['username']:$v['phone'];
			}

			if($datas){
				$json['msg'] = 1;
				$json['dat'] = $datas;
			}else{
				$json['msg'] = 0;
			}
            $this->ajaxReturn($json);
		}	
	}
	
	
}