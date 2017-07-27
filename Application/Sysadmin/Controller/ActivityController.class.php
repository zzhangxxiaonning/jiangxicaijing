<?php
namespace Sysadmin\Controller;
use Think\Controller;
class ActivityController extends CommonController {
	public function __construct(){
		parent::__construct();
	}
    public function index(){
		create_up_url(U('index'),'Activity');
		$cat_name = '活动管理';
		$_db = M('Activity');
		$map = array();
		$is_service = 0;
		
		/*级别*/
		$rank_id = I('get.rank_id','-1');
		if($rank_id>0){
			$map['rank_id'] = array('eq',$rank_id);
			$is_service++;
		}
		
		/*显示状态*/
		$status = I('get.status','-1');
		if($status>=0){
			$map['status'] = array('eq',$status);
			$is_service++;
		}
        /*审核*/
        $examine = I('get.examine','-1');
        if($examine>0){
            $map['examine'] = array('eq',$examine);
            $is_service++;
        }
		/*标题*/
		$name = I('get.name','');
		if($name){
			$map['title'] = array('like','%'.$name.'%');
			$is_service++;
		}

		/*活动状态*/
        $times = I('get.time','-1');
        if($times>0){
            $time = time();
            switch($times){
                case 1: //报名中
                    $map['start_time'] = array('gt',$time);
                    break;
                case 2: //进行中
                    $map['start_time'] = array('lt',$time);
                    $map['end_time'] = array('gt',$time);
                    break;
                case 3: //已结束
                    $map['end_time'] = array('lt',$time);
                    break;
            }
            $is_service++;
        }


        /*作者*/
        $author = I('get.author','');
        if($author){
            $map_['username|phone'] = array('like','%'.$author.'%');
            $map_['status'] = array('eq',1);
            $mems = M('Member') -> where($map_) -> select();
            $str = '';
            foreach($mems as $c=>$d){
                $str .= $d['id'].',';
            }
            $str = rtrim($str,',');
            if($str){
                $map['mid'] = array('in',$str);
            }else{
                $map__['username'] = array('like','%'.$author.'%');
                $mems_ = M('Admin') -> where($map__) -> select();
                $str_ = '';
                foreach($mems_ as $cc=>$dd){
                    $str_ .= $dd['id'].',';
                }
                $str_ = rtrim($str_,',');
                if($str_){
                    $map['admin_id'] = array('in',$str_);
                }
            }
            $is_service++;
        }
//		dump($map);
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
		 * 栏目分类名称
		 * 
		 */
		foreach($lists as $m=>$v){
			$lists[$m]['rank_name'] = $this->cat_name(M('Actattr'),$v['rank_id']);

            $time = time();
            if($v['start_time'] > $time ){
                $flag_time = '报名中……';
            }elseif($v['start_time'] <= $time && $v['end_time'] >= $time){
                $flag_time = '进行中……';
            }elseif($v['end_time'] < $time){
                $flag_time = '已结束';
            }
            $lists[$m]['flag_time'] = $flag_time;

            if($v['mid']){

                $name = $this->mem_name(M('Member'),$v['mid']);
                $lists[$m]['admin_name']  = $name['username']?$name['username']:$name['phone'];
            }else{
                $lists[$m]['admin_name'] = $this->admin_name($v['admin_id']);
            }

		}
		
		$this->assign('lists',$lists);
		$this->assign('page',$show);
		
		/*级别*/
		$rank_lists = M('Actattr')->field('id,catname as name')->where(array('up_id'=>array('neq',0),'status'=>array('eq',1)))->cache(60,true)->select();
		$this->assign('rank_lists',$rank_lists);
		
		$menu_show[0] = 'Activity';
		$menu_show[1] = 'index';
		$this->assign('menu_show',$menu_show);
		$this->assign('cat_name',$cat_name);
		
		
        $this->display();
		// dump($lists);
		// echo M("Category")->getLastSql();
    }
	public function add(){
		$cat_name = '添加';
		if(IS_POST){
			
			$_db = D('Activity');
			
			$datas = $_db->where(array('title'=>array('eq',I('post.title'))))->count();
			if($datas){
				$this->error("该标题已存在！");
			}else{
				if(!$_db->create()){
					$this->error($_db->getError().'');
				}else{
                    //多图处理
                    if($img = I('post.img')){
                        $_db->img=Array2String($img);
                    }
					$lastid = $_db->add();
					if($lastid){
						$this->inserlog('线下活动：'.I('post.title').',ID:'.$lastid.' 添加成功','Activity');
						$this->success("线下活动：".I('post.title')."添加成功",get_up_url(U('index'),'Activity'));
					}else{
						$this->error("线下活动：".I('post.title')."添加失败");
					}
				}
			}	
			
			
		}else{
			$this->assign('cat_name',$cat_name);

            //级别
            $rank_list = M('Actattr')->where(array('up_id'=>array('eq',1),'status'=>array('eq',1)))->order('sort desc,id asc')->select();
            $this->assign('rank_list',$rank_list);

            //机构
            $app_list = M('Actapp')->where(array('up_id'=>array('eq',0),'status'=>array('eq',1)))->order('sort desc,id asc')->select();
            $this->assign('app_list',$app_list);

			$menu_show[0] = 'Activity';
			$menu_show[1] = 'index';
			$this->assign('menu_show',$menu_show);
			$info['status'] = 1;
			$this->assign('info',$info);

			$this->display('info');

		}
    }
	public function edit(){
		$cat_name = '编辑';
		$_db = D('Activity');
		if(IS_POST){
			$id = I('post.id',0);
			$map['id'] = array('eq',$id);
//            F(time().'_1',$_POST);
			$datas = $_db->where(array('id'=>array('neq',$id),'title'=>array('eq',I('post.title'))))->count();
			if($datas){
				$this->error("该标题已存在！");
			}else{
				$_POST['update_time'] = time();
				if(!$_db->create($_POST)){
					$this->error($_db->getError().'');
				}else{
                    //多图处理
                    if($img = I('post.img')){
                        $_db->img=Array2String($img);
                    }
					$ret = $_db->where($map)->save();
					if($ret){
						
						$this->inserlog('线下活动：'.I('post.title').',ID:'.$id.' 编辑成功','Activity');
						$this->success("线下活动：".I('post.title')."编辑成功",get_up_url(U('index'),'Activity'));
					}else{
						$this->error("线下活动：".I('post.title')."编辑失败");
					}
				}
			}
		}else{
			$map['id'] = array('eq',I('get.id'));
			$info = $_db->where($map)->find();
//            is_resource($info['content']) && $info['content']=stream_get_contents($info['content']);
            $info['approver_name'] = $this->cat_name(M('Actapp'),$info['approver_id']);


			$this->assign('info',$info);
			$this->assign('cat_name',$cat_name);


            //级别
            $rank_list = M('Actattr')->where(array('up_id'=>array('eq',1),'status'=>array('eq',1)))->order('sort desc,id asc')->select();
            $this->assign('rank_list',$rank_list);

            $img=String2Array($info['img']);
            $this->assign('img',$img);

            //机构
            $app_list = M('Actapp')->where(array('up_id'=>array('eq',0),'status'=>array('eq',1)))->order('sort desc,id asc')->select();
            $this->assign('app_list',$app_list);


			$menu_show[0] = 'Activity';
			$menu_show[1] = 'index';
			$this->assign('menu_show',$menu_show);
			$this->display('info');
		}
    }
	public function del_index(){
		if(IS_GET){
			$id = I('get.id',0);
			$m_admin['id'] = array('eq',$id);
			
			
			$info = M('Activity')->where($m_admin)->find();
			$ret = M('Activity')->where($m_admin)->limit(1)->delete();
//            $sql = "DELETE FROM cms_circle WHERE id = ".$id;
//            $ret = M('Circle')->execute($sql);
			if($ret){
				$json['status'] = '1';
				$this->inserlog('线下活动：'.$info['title'].',ID:'.$id.' 删除成功','Activity');
				$json['info']	= '线下活动：'.$info['title'].' 删除成功';
			}else{
				$json['status'] = '0';
				$json['info']	= '线下活动：'.$info['title'].' 删除失败';
			}
			echo json_encode($json);exit;
		}
	}

	
	/*
	 * 更新排序
	 */
	public function sortlists(){
		$News=M('Activity');
		if(IS_POST){
		
			foreach(I('sort') as $k=>$v){
				$News->where('id='.$k)->setField('sort',$v);
				$string .= $k.',';
			}
			$this->success("修改排序成功",get_up_url(U('index'),'Activity'));
		}else{
			$this->error("修改排序失败");
		}
	
	}
	
	/*
	 * 修改内容状态
	 */
	public function editnav(){
		//create_up_url(U('index'),'Newscat');
		$News=M('Activity');
		if(IS_GET){
			
			$id = I('id');
			$map['id']=array('eq',$id);
			$data=$News->where($map)->find();
			$saveda['status'] = $data['status']==1?0:1;
			$saveda['update_time'] = time();
			$lastid=$News->where($map)->save($saveda);
			if($lastid){
				$this->inserlog('线下活动：'.$data['title'].',ID:'.$id.' 修改状态成功','Activity');
				$this->success("修改状态成功",get_up_url(U('index'),'Activity'));
			}else{
				$this->error("修改状态失败");
			}
			
		}
	}

	/*
	 * 获得当前审批机构对应的审批人
	 * */
    public function approver(){
        $Actapp = M('Actapp');
        if(IS_POST){
            $id = I('post.val',0);
            $map['up_id'] = array('eq',$id);
            $map['status'] = array('eq',1);
            $data = $Actapp -> where($map) -> find();
            if($data){
                $json['status'] = 1;
                $json['approver_id'] = $data['id'];
                $json['approver_name'] = $data['catname'];
            }else{
                $json['status'] = 1;
                $json['info'] = '网络异常';
            }
            $this -> ajaxReturn($json);

        }




    }
	
	
}