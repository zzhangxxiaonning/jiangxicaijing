<?php
namespace Sysadmin\Controller;
use Think\Controller;
class CircleController extends CommonController {
	public function __construct(){
		parent::__construct();
	}
    public function index(){
		create_up_url(U('index'),'Circle');
		$cat_name = '科研项目';
		$_db = M('Circle');
		$map = array();
		$is_service = 0;
		
		/*作品分类*/
		$cat_id = I('get.cat_id','-1');
		if($cat_id>0){
			$map['cat_id'] = array('eq',$cat_id);
			$is_service++;
		}
		
		/*显示状态*/
		$status = I('get.status','-1');
		if($status>=0){
			$map['status'] = array('eq',$status);
			$is_service++;
		}

		
		/*标题*/
		$name = I('get.name','');
		if($name){
			$map['title'] = array('like','%'.$name.'%');
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
		 * 栏目分类名称
		 * 
		 */
		foreach($lists as $m=>$v){

			$lists[$m]['cat_name'] = $this->cat_name(M('Circat'),$v['cat_id']);
			$lists[$m]['rank_name'] = $this->cat_name(M('Cirattr'),$v['rank_id']);

            $map_app['aid'] = array('eq',$v['id']);
            $lists[$m]['apply_count'] = _Numbers(M('Apply'),$map_app);

            //推荐
            $flag=String2Array($v['flag']);
            $lists[$m]['flag'] = $flag;

		}
		
		$this->assign('lists',$lists);
		$this->assign('page',$show);
		
		/*栏目分类*/
		$cat_lists = M('Circat')->field('id,catname as name')->where(array('up_id'=>array('neq',0),'status'=>array('eq',1)))->cache(60,true)->select();
		$this->assign('cat_lists',$cat_lists);
		
		$menu_show[0] = 'Circle';
		$menu_show[1] = 'index';
		$this->assign('menu_show',$menu_show);
		$this->assign('cat_name',$cat_name);
		
		
        $this->display();
		// dump($lists);
		// echo M("Category")->getLastSql();
    }
	public function add(){
		$cat_name = '添加项目';
		if(IS_POST){
			
			$_db = D('Circle');
			if(I('post.cat_id') == 0){
				$this->error("请选择项目二级分类！");
			}
			
			$datas = $_db->where(array('title'=>array('eq',I('post.title'))))->count();
			if($datas){
				$this->error("该标题已存在！");
			}else{
				if(!$_db->create()){
					$this->error($_db->getError().'');
				}else{
                    //推荐
                    if($flag = I('post.flag')){
                        $_db->flag=Array2String($flag);
                    }
					$lastid = $_db->add();
					if($lastid){
						$this->inserlog('创客项目：'.I('post.title').',ID:'.$lastid.' 添加成功','Circle');
						$this->success("项目：".I('post.title')."添加成功",get_up_url(U('index'),'Circle'));
					}else{
						$this->error("项目：".I('post.title')."添加失败");
					}
				}
			}	
			
			
		}else{
			$this->assign('cat_name',$cat_name);

            //取出所有一级分类
            $cat_lists = M('Circat')->where(array('up_id'=>array('eq',0),'status'=>array('eq',1)))->order('sort asc,id asc')->select();
            $this->assign('cat_lists',$cat_lists);

            //项目级别
            $rank_list = M('Cirattr')->where(array('up_id'=>array('eq',1),'status'=>array('eq',1)))->order('sort desc,id asc')->select();
            $this->assign('rank_list',$rank_list);

			$menu_show[0] = 'Circle';
			$menu_show[1] = 'index';
			$this->assign('menu_show',$menu_show);
			$info['status'] = 1;
			$this->assign('info',$info);

			$this->display('info');

		}
    }
	public function edit(){
		$cat_name = '编辑项目';
		$_db = D('Circle');
		if(IS_POST){
			$id = I('post.id',0);
			$map['id'] = array('eq',$id);
			if($_POST['cat_id'] == 0){
				$this->error("请选择二级分类");
			}
            if($_POST['rank_id'] == 0){
                $this->error("请选择项目级别");
            }

			$datas = $_db->where(array('id'=>array('neq',$id),'title'=>array('eq',I('post.title'))))->count();
			if($datas){
				$this->error("该标题已存在！");
			}else{
				$_POST['update_time'] = time();
				if(!$_db->create($_POST)){
					$this->error($_db->getError().'');
				}else{
                    //推荐
                    $_db->flag=Array2String(I('post.flag'));
					$ret = $_db->where($map)->save();
					if($ret){
						
						$this->inserlog('创客项目：'.I('post.title').',ID:'.$id.' 编辑成功','Circle');
						$this->success("项目：".I('post.title')."编辑成功",get_up_url(U('index'),'Circle'));
					}else{
						$this->error("项目：".I('post.title')."编辑失败");
					}
				}
			}
		}else{
			$map['id'] = array('eq',I('get.id'));
			$info = $_db->where($map)->find();
            is_resource($info['content']) && $info['content']=stream_get_contents($info['content']);
			$this->assign('info',$info);
			$this->assign('cat_name',$cat_name);

            //取出所有一级分类
            $cat_lists = M('Circat')->where(array('up_id'=>array('eq',0),'status'=>array('eq',1)))->order('sort asc,id asc')->select();
            $this->assign('cat_lists',$cat_lists);

            //取出所有二级分类
            $cat_list = M('Circat')->where(array('up_id'=>array('neq',0),'status'=>array('eq',1)))->order('sort desc,id asc')->select();
            $this->assign('cat_list',$cat_list);

            //取出当前一级分类
            $map_['id'] = array('eq',$info['cat_id']);
            $cat = M('Circat') -> where($map_) -> find();
            $this -> assign('cat',$cat);

            //项目级别
            $rank_list = M('Cirattr')->where(array('up_id'=>array('eq',1),'status'=>array('eq',1)))->order('sort desc,id asc')->select();
            $this->assign('rank_list',$rank_list);

            //推荐
            $flag=String2Array($info['flag']);
            $this->assign('flag',$flag);

			$menu_show[0] = 'Circle';
			$menu_show[1] = 'index';
			$this->assign('menu_show',$menu_show);
			$this->display('info');
		}
    }
	public function del_index(){
		if(IS_GET){
			$id = I('get.id',0);
			$m_admin['id'] = array('eq',$id);
			
			
			$info = M('Circle')->where($m_admin)->find();
//			$ret = M('Library')->where($m_admin)->limit(1)->delete();
            $sql = "DELETE FROM cms_circle WHERE id = ".$id;
            $ret = M('Circle')->execute($sql);
			if($ret){
				$json['status'] = '1';
				$this->inserlog('创客项目：'.$info['title'].',ID:'.$id.' 删除成功','Circle');
				$json['info']	= '项目：'.$info['title'].' 删除成功';
			}else{
				$json['status'] = '0';
				$json['info']	= '项目：'.$info['title'].' 删除失败';
			}
			echo json_encode($json);exit;
		}
	}

	
	/*
	 * 更新排序
	 */
	public function sortlists(){
		$News=M('Circle');
		if(IS_POST){
		
			foreach(I('sort') as $k=>$v){
				$News->where('id='.$k)->setField('sort',$v);
				$string .= $k.',';
			}
			$this->success("修改排序成功",get_up_url(U('index'),'Circle'));
		}else{
			$this->error("修改排序失败");
		}
	
	}
	
	/*
	 * 修改内容状态
	 */
	public function editnav(){
		//create_up_url(U('index'),'Newscat');
		$News=M('Circle');
		if(IS_GET){
			
			$id = I('id');
			$map['id']=array('eq',$id);
			$data=$News->where($map)->find();
			$saveda['status'] = $data['status']==1?0:1;
			$saveda['update_time'] = time();
			$lastid=$News->where($map)->save($saveda);
			if($lastid){
				$this->inserlog('创客项目：'.$data['title'].',ID:'.$id.' 修改状态成功','Circle');
				$this->success("修改状态成功",get_up_url(U('index'),'Circle'));
			}else{
				$this->error("修改状态失败");
			}
			
		}
	}

	//异步
    public function cat_lists(){
        $Circat = M('Circat');
        if(IS_POST){
            $up_id = I('post.val');

            $map['up_id'] = array('eq',$up_id);
            $map['status'] = array('eq',1);

            $data = $Circat -> where($map) -> order('sort desc,id asc') -> select();
            if($data){
                $json['status'] = 1;
                $json['date'] = $data;
            }else{
                $json['status'] = 0;
            }

            $this -> ajaxReturn($json);
        }


    }


    /*查看科研申请*/
    public function show(){

        $cat_name = '科研申请';
        $this -> assign('cat_name',$cat_name);
        $_db = M('Apply');
        $map = array();
        $is_service = 0;

        /*显示状态*/
        $examine = I('get.examine','-1');
        if($examine>=0){
            $map['examine'] = array('eq',$examine);
            $is_service++;
        }else{
            $map['examine'] = array('neq',0);
            $is_service++;
        }


        /*标题*/
        $name = I('get.name','');
        if($name){
            $map_1['username|phone'] = array('like','%'.$name."%");
            $news_1 = M("Member")->where($map_1)->select();
            $str_1 = '';
            foreach($news_1 as $c1=>$d1){
                $str_1 .= $d1['id'].',';
            }
            $str_1 = rtrim($str_1,',');
            $map['mid'] = array('in',$str_1);
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
         * 栏目分类名称
         *
         */
        foreach($lists as $m=>$v){

            $lists[$m]['cat_name'] = $this->cat_name(M('Circat'),$v['cat_id']);
            $lists[$m]['rank_name'] = $this->cat_name(M('Cirattr'),$v['rank_id']);

            $info = sql_info(M('Circle'),$v['aid']);
            $lists[$m]['title'] = $info['title'];

            $mem = sql_info(M('Member'),$v['mid']);
            $lists[$m]['username'] = $mem['username']?$mem['username']:$mem['phone'];

            $mem = sql_info(M('Teacher'),$v['tid']);
            $lists[$m]['teacher_username'] = $mem['username'];

            if($v['examine'] == 1){
                $lists[$m]['examine_name'] = '已提交';
            }elseif($v['examine'] == 2){
                $lists[$m]['examine_name'] = '已通过';
            }elseif($v['examine'] == 3){
                $lists[$m]['examine_name'] = '已驳回';
            }


        }
        $this->assign('lists',$lists);
        $this->assign('page',$show);

        /*栏目分类*/
        $cat_lists = M('Circat')->field('id,catname as name')->where(array('up_id'=>array('neq',0),'status'=>array('eq',1)))->cache(60,true)->select();
        $this->assign('cat_lists',$cat_lists);


        $menu_show[0] = 'Circle';
        $menu_show[1] = 'show';
        $this->assign('menu_show',$menu_show);
        $this -> display();

    }

    public function edit_apply(){
        $cat_name = '查看申请';
        $_db = D('Apply');
        if(IS_POST){
            $id = I('post.id',0);
            $map['id'] = array('eq',$id);

            if(!$_db->create($_POST)){
                $this->error($_db->getError().'');
            }else{

                $ret = $_db->where($map)->save();

                //科研标题
                $info = $_db->where($map)->find();
                $infos = sql_info(M('Circle'),$info['aid']);
                if($ret){
                    $this->inserlog('科研申请：'.$infos['title'].',ID:'.$id.' 编辑成功','Apply');
                    $this->success("科研申请：".$infos['title']."编辑成功",U('Circle/show'));
                }else{
                    $this->error("科研申请：".$infos['title']."编辑失败");
                }
            }

        }else{
            $map['id'] = array('eq',I('get.id'));
            $info = $_db->where($map)->find();
            //科研标题
            $infos = sql_info(M('Circle'),$info['aid']);
            $info['title'] = $infos['title'];

            //申请人、申请人电话
            $mem = sql_info(M('Member'),$info['mid']);
            $info['mid_username'] = $mem['username']?$mem['username']:$mem['phone'];
            $info['mid_phone'] = $mem['phone'];

            //导师、导师电话
            $mem = sql_info(M('Teacher'),$info['tid']);
            $info['tid_username'] = $mem['username'];
            $info['technical'] = $mem['technical'];


            $this->assign('info',$info);
            $this->assign('cat_name',$cat_name);

            $menu_show[0] = 'Circle';
            $menu_show[1] = 'show';
            $this->assign('menu_show',$menu_show);
            $this->display();
        }
    }
    public function del_apply(){
        if(IS_GET){
            $id = I('get.id',0);
            $m_admin['id'] = array('eq',$id);

            $info = M('Apply')->where($m_admin)->find();
            //科研标题
            $infos = sql_info(M('Circle'),$info['aid']);

            //申请人
            $mem = sql_info(M('Member'),$info['mid']);
            $mem['username'] = $mem['username']?$mem['username']:$mem['phone'];

			$ret = M('Apply')->where($m_admin)->limit(1)->delete();
//            $sql = "DELETE FROM cms_circle WHERE id = ".$id;
//            $ret = M('Circle')->execute($sql);
            if($ret){
                $json['status'] = '1';
                $this->inserlog($mem['username'].'申请的科研项目：'.$infos['title'].',ID:'.$id.' 删除成功','Apply');
                $json['info']	= '科研申请删除成功';
            }else{
                $json['status'] = '0';
                $json['info']	= '科研申请删除失败';
            }
            echo json_encode($json);exit;
        }
    }


	
}