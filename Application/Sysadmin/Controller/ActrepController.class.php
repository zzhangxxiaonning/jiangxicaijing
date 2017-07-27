<?php
namespace Sysadmin\Controller;
use Think\Controller;
class ActrepController extends CommonController {
	public function __construct(){
		parent::__construct();
	}
    public function rep_index(){
		create_up_url(U('rep_index'),'Actrep');
		$cat_name = '举报管理';
		$_db = M('Actrep');
		$map = array();
		$is_service = 0;
		/*处理状态*/
		$status = I('get.status','-1');
		if($status>=0){
			$map['status'] = array('eq',$status);
			$is_service++;
		}

		/*标题*/
		$name = I('get.name','');
		if($name){
			$map_uid['username|phone'] = array('like','%'.$name.'%');
            $mems = M("Member") -> where($map_uid) -> select();

            $str = '';
            foreach($mems as $aa=>$vv){
                $str .= $vv['id'].',';
            }
//            dump($str);
            $str = rtrim($str,',');
            $map['mid'] = array('in',$str);

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

		/*
		 * 管理员名称
		 * 
		 */
		foreach($lists as $m=>$v){
            $name = $this->mem_name(M('Member'),$v['mid']);
			$lists[$m]['username'] = $name['username']?$name['username']:$name['phone'];

            switch($v['type']){
                case 1;
                    $news_data = M("Activity")->where(array('id'=>array('eq',$v['aid'])))->find();
                    break;
                case 2;
                    $news_data = M("Flash")->where(array('id'=>array('eq',$v['aid'])))->find();
                    break;
                case 3;
                    $news_data = M("Flashrec")->where(array('id'=>array('eq',$v['aid'])))->find();
                    break;
            }
            $lists[$m]['title'] = $news_data['title'];

            if($v['type'] == 1){
                $lists[$m]['type_name'] = '线下活动';
            }
            elseif($v['type'] == 2){
                $lists[$m]['type_name'] = '直播';
            }
            elseif($v['type'] == 3){
                $lists[$m]['type_name'] = '录播';
            }

            /*修改所有举报内容状态*/
            $mapwarn['id'] = array('eq',$v['id']);
            $datawarn['warn'] = 1;
            $_db->where($mapwarn)->data($datawarn)->save();
		}
		
		$this->assign('lists',$lists);
		$this->assign('page',$show);
		
		$menu_show[0] = 'Activity';
		$menu_show[1] = 'rep_index';
		$this->assign('menu_show',$menu_show);
		$this->assign('cat_name',$cat_name);

        $this->display('index');
//		 dump($lists);
    }
	
	public function rep_edit(){
		$cat_name = '查看举报';
		$_db = D('Actrep');
        $map['id'] = array('eq',I('get.id'));

        $data['status'] = 1;
        $_db->where($map)->save($data);

        $info = $_db->where($map)->find();

        $name = $this->mem_name(M('Member'),$info['mid']);
        $info['username'] = $name['username']?$name['username']:$name['phone'];

        switch($info['type']){
            case 1;
                $news_data = M("Activity")->where(array('id'=>array('eq',$info['aid'])))->find();
                break;
            case 2;
                $news_data = M("Flash")->where(array('id'=>array('eq',$info['aid'])))->find();
                break;
            case 3;
                $news_data = M("Flashrec")->where(array('id'=>array('eq',$info['aid'])))->find();
                break;
        }
        $info['title'] = $news_data['title'];


        $this->assign('info',$info);
        $this->assign('cat_name',$cat_name);

        $menu_show[0] = 'Activity';
        $menu_show[1] = 'rep_index';
        $this->assign('menu_show',$menu_show);
        $this->display('info');

    }
	public function del_index(){
		if(IS_GET){
			$id = I('get.id',0);

            $map['id'] = array('eq',$id);
            $data = M('Actrep') -> where($map) -> find();

            $name = $this->mem_name(M('Member'),$data['mid']);
            $info['username'] = $name['username']?$name['username']:$name['phone'];

			$ret = M('Actrep')->where($map)->limit(1)->delete();
//            $sql = "DELETE FROM cms_message WHERE id = ".$id;
//            $ret = M('Message')->execute($sql);
			if($ret){
				$json['status'] = '1';
				$this->inserlog('活动举报人：'.$info['username'].'的举报内容,ID:'.$id.' 删除成功','Actrep');
				$json['info']	= '举报人：'.$info['username'].'的举报内容 删除成功';
			}else{
				$json['status'] = '0';
				$json['info']	= '举报人：'.$info['username'].'的举报内容 删除失败';
			}
			echo json_encode($json);exit;
		}
	}

	
	/*
	 * 修改内容状态
	 */
	public function editnav(){
		//create_up_url(U('index'),'Newscat');
		$News=M('Actrep');
		if(IS_GET){
			
			$id = I('id');
			$map['id']=array('eq',$id);
			$data=$News->where($map)->find();

            $name = $this->mem_name(M('Member'),$data['mid']);
            $info['username'] = $name['username']?$name['username']:$name['phone'];

			$saveda['status'] = $data['status']==1?0:1;
			$saveda['update_time'] = time();
			$lastid=$News->where($map)->save($saveda);
			if($lastid){
				$this->inserlog('活动举报人：'.$info['username'].'的举报内容,ID:'.$id.' 修改状态成功','Actrep');
				$this->success("修改状态成功",get_up_url(U('rep_index'),'Actrep'));
			}else{
				$this->error("修改状态失败");
			}
			
		}
	}
	
	
}