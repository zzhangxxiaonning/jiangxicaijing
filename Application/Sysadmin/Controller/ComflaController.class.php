<?php
namespace Sysadmin\Controller;
use Think\Controller;
class ComflaController extends CommonController {
	public function __construct(){
		parent::__construct();
	}
	
	/*评论*/
    public function fla_index(){
		create_up_url(U('fla_index'),'Comfla');
		$_db = M('Comment');
		$map = array();
		$is_service = 0;

        //标题
		$name = I('get.name','');
		if($name){
            $map_1['title'] = array('like','%'.$name."%");
            $news_1 = M("Flash")->where($map_1)->select();
            $str_1 = '';
            foreach($news_1 as $c1=>$d1){
                $str_1 .= $d1['id'].',';
            }
            $str_1 = rtrim($str_1,',');
            $map['aid'] = array('in',$str_1);
			$is_service++;
		}

		//评论人
        $uid = I('get.uid','');
        if($uid){
            $map_news['username|phone'] = array('like','%'.$uid."%");
            $news = M("Member")->where($map_news)->select();
            $str = '';
            foreach($news as $c=>$d){
                $str .= $d['id'].',';
            }
            $str = rtrim($str,',');
            $map['mid'] = array('in',$str);
            $is_service++;
        }

        //查看状态
        $status = I('get.status','-1');
        if($status != -1){
            $map['status'] = array('eq',$status);
            $is_service++;
        }

		//显示状态
		$isshow = I('get.isshow','-1');
		if($isshow != -1){
			$map['isshow'] = array('eq',$isshow);
			$is_service++;
		}
		
		// dump($map);
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

		$map['type'] = array('eq',2);
        $is_service++;

		$this->assign('is_service',$is_service);
		
		$page_num = 10;
		$p = I('get.p',1);
		
		$count	= $_db->where($map)->count();
		$Page	= new \Common\Other\Page($count,$page_num);		
		$show	= $Page->show();
		$lists = $_db->where($map)->page($p.','.$page_num)->order('id desc')->select();
		
		// dump($lists);
		//dump($lists);
		foreach($lists as $a=>$v){

            $news_data = M("Flash")->where(array('id'=>array('eq',$v['aid'])))->find();
			$lists[$a]['title'] = $news_data['title'];

            $name = $this->mem_name(M('Member'),$v['mid']);
            $lists[$a]['username'] = $name['username']?$name['username']:$name['phone'];

            $map_count['cid'] = array('eq',$v['id']);
            $map_count['status'] = array('eq',0);
            $lists[$a]['count'] = M('CommentReply') -> where($map_count) -> count();
		}

		$menu_show[0] = 'Comment';
		$menu_show[1] = 'fla_index';
		$this->assign('menu_show',$menu_show);
		$this->assign('lists',$lists);
		$this->assign('page',$show);
        $this->display('index');
		
    }

	public function fla_edit(){
		$cat_name = '查看评论';
		$_db = D('Comment');
		$_db_1 = D('CommentReply');

		if(IS_POST){
			$id = I('post.id',0);
			$map['id'] = array('eq',$id);
			
			if(!$_db->create($_POST)){
				$this->error($_db->getError().'');
			}else{
				
				$ret = $_db->where($map)->save();
				if($ret){
					$this->inserlog('直播评论ID:'.$id.' 修改成功','Comment');
					$this->success("修改成功",get_up_url(U('fla_index'),'Comment'));
				}else{
					$this->error("修改失败");
				}
			}
			exit;
		}else{
            $id = I('get.id',0);
            $map['id']=array('eq',$id);
            $info=$_db->where($map)->find();

            $time = time();
            //修改评论表查看状态
//            $saveda['status'] = 1;
//            $saveda['update_time'] = $time;
//            $saveda['admin_id'] = cookie('ADMIN_ID');
//            $lastid=$_db->where($map)->save($saveda);

            //评论的回复
            $map_cr['cid'] = array('eq',$id);
//            $datas=$_db_1->where($map_cr)->select();


            $page_num = 10;
            $p = I('get.p',1);

            $count	= $_db_1->where($map_cr)->count();
            $Page	= new \Common\Other\Page($count,$page_num);
            $show	= $Page->show();
            $datas = $_db_1->where($map_cr)->page($p.','.$page_num)->order('id desc')->select();

            foreach($datas as $k=>$v){
                //修改评论回复表状态
//                $data_cr['status'] = 1;
//                $data_cr['update_time'] = $time;
//                $map_cr_1['id'] = array('eq',$v['id']);
//                $lastids = $_db_1 -> where($map_cr_1) -> save($data_cr);

                $name = $this->mem_name(M('Member'),$v['mid']);
                $datas[$k]['username'] = $name['username']?$name['username']:$name['phone'];
            }

            //标题
            $news_data = M("Flash")->where(array('id'=>array('eq',$info['aid'])))->find();
			$info['title'] = $news_data['title'];

            //评论人
            $name = $this->mem_name(M('Member'),$info['mid']);
            $info['username'] = $name['username']?$name['username']:$name['phone'];


			$this->assign('info',$info);
			$this->assign('datas',$datas);
            $this->assign('page',$show);
			$this->assign('cat_name',$cat_name);
			$menu_show[0] = 'Comment';
			$menu_show[1] = 'fla_edit';
			$this->assign('menu_show',$menu_show);
			$this->display('info');
		}
    }

    /*
     * 修改评论通过状态
     */
    public function editcom(){
        //create_up_url(U('index'),'Newscat');
        $Mail = M('Comment');
        if(IS_GET){

            $id = I('get.id',0);
            $map['id']=array('eq',$id);
            $data=$Mail->where($map)->find();
            $saveda['status'] = $data['status']==1?0:1;
            $saveda['update_time'] = time();
            $saveda['admin_id'] = cookie('ADMIN_ID');
            $lastid=$Mail->where($map)->save($saveda);
            if($lastid){
                $this->inserlog('直播评论ID:'.$id.' 修改通过状态成功','Comfla');
                $this->success("修改通过状态成功",get_up_url(U('fla_index'),'Comfla'));
            }else{
                $this->error("修改通过状态失败");
            }

        }
    }


    /*
     * 修改评论显示状态
     */
    public function editnav(){
        //create_up_url(U('index'),'Newscat');
        $Mail = M('Comment');
        if(IS_GET){

            $id = I('get.id',0);
            $map['id']=array('eq',$id);
            $data=$Mail->where($map)->find();
            $saveda['isshow'] = $data['isshow']==1?0:1;
            $saveda['update_time'] = time();
            $lastid=$Mail->where($map)->save($saveda);
            if($lastid){
                $this->inserlog('直播评论ID:'.$id.' 修改显示状态成功','Comfla');
                $this->success("修改显示状态成功",get_up_url(U('fla_index'),'Comfla'));
            }else{
                $this->error("修改显示状态失败");
            }

        }
    }

    /*
     * 修改评论回复通过状态
     */
    public function editrey(){
        //create_up_url(U('index'),'Newscat');
        $db = M('CommentReply');
        if(IS_POST){

            $id = I('post.id',0); //回复评论表ID
            $map['id']=array('eq',$id);
            $data=$db->where($map)->find();
            $saveda['status'] = $data['status']==1?0:1;
            $saveda['admin_id'] = cookie('ADMIN_ID');
            $saveda['update_time'] = time();
            $lastid=$db->where($map)->save($saveda);
            if($lastid){
                $json['status'] = 1;
                $json['info'] = '修改成功';
            }else{
                $json['status'] = 0;
                $json['info'] = '修改失败';
            }
            $this->ajaxReturn($json);
        }
    }

    /*
     * 修改回复评论显示状态
     */
    public function editnav_reply(){
        //create_up_url(U('index'),'Newscat');
        $db = M('CommentReply');
        if(IS_POST){

            $id = I('post.id',0); //回复评论表ID
            $map['id']=array('eq',$id);
            $data=$db->where($map)->find();
            $saveda['isshow'] = $data['isshow']==1?0:1;
            $saveda['admin_id'] = cookie('ADMIN_ID');
            $saveda['update_time'] = time();
            $lastid=$db->where($map)->save($saveda);
            if($lastid){
                $json['status'] = 1;
                $json['info'] = '修改成功';
            }else{
                $json['status'] = 0;
                $json['info'] = '修改失败';
            }
            $this->ajaxReturn($json);
        }
    }

    /*
     * 删除评论
     * */
    public function del_com(){
        if(IS_GET){
            $id = I('get.id',0);
            $m_admin['id'] = array('eq',$id);
            $info = M('Comment')->where($m_admin)->find();

            $name = $this->mem_name(M('Member'),$info['mid']);
            $username = $name['username']?$name['username']:$name['phone'];

            $ret = M('Comment')->where($m_admin)->limit(1)->delete();

            if($ret){
                $json['status'] = '1';
                $this->inserlog('用户'.$username.'直播评论ID:'.$id.' 删除成功','Comfla');
                $json['info']	='删除成功';
            }else{
                $json['status'] = '0';
                $json['info']	= '删除失败';
            }
            echo json_encode($json);exit;
        }
    }

    /*
     * 删除评论的回复
     * */
    public function del_rey(){
        if(IS_GET){
            $id = I('get.id',0);
            $m_admin['id'] = array('eq',$id);
            $info = M('CommentReply')->where($m_admin)->find();

            $name = $this->mem_name(M('Member'),$info['mid']);
            $username = $name['username']?$name['username']:$name['phone'];

            $ret = M('CommentReply')->where($m_admin)->limit(1)->delete();

            if($ret){
                $json['status'] = '1';
                $this->inserlog('用户'.$username.'直播评论ID:'.$id.' 删除成功','Comfla');
                $json['info']	='删除成功';
            }else{
                $json['status'] = '0';
                $json['info']	= '删除失败';
            }
            echo json_encode($json);exit;
        }
    }
}