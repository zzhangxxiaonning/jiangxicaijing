<?php
namespace Sysadmin\Controller;
use Think\Controller;
class AwardsController extends CommonController {
	public function __construct(){
		parent::__construct();
	}
    public function rec_index(){
		create_up_url(U('rec_index'),'Awards');
        $cat_name = '获奖荣誉';
		$_db = M('Awards');
		$map = array();
		$is_service = 0;
		
		/*栏目*/
		$cat_id = I('get.cat_id','-1');
		if($cat_id>0){
			$map['cat_id'] = array('eq',$cat_id);
			$is_service++;
		}

        /*级别*/
        $rank_id = I('get.rank_id','-1');
        if($rank_id>0){
            $map['rank_id'] = array('eq',$rank_id);
            $is_service++;
        }

		/*状态*/
		$status = I('get.status','-1');
		if($status>=0){
			$map['status'] = array('eq',$status);
			$is_service++;
		}

        /*审核状态*/
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
            if($v['mid']){
                $name = $this -> mem_name(M('Member'),$v['mid']);
                $lists[$m]['mid_name'] = $name['username']?$name['username']:$name['phone'];
            }else{
                $lists[$m]['mid_name'] = $this -> admin_name($v['admin_id']);
            }
		}

		$this->assign('lists',$lists);
		$this->assign('page',$show);
		
		/*栏目分类*/
		$cat_lists = M('Circat')->field('id,catname as name')->where(array('up_id'=>array('neq',0),'status'=>array('neq',0)))->cache(60,true)->select();
		$this->assign('cat_lists',$cat_lists);

        /*级别*/
        $rank_lists = M('Cirattr')->field('id,catname as name')->where(array('up_id'=>array('eq',1),'status'=>array('neq',0)))->cache(60,true)->select();
        $this->assign('rank_lists',$rank_lists);
		
		$menu_show[0] = 'Circle';
		$menu_show[1] = 'rec_index';
		$this->assign('menu_show',$menu_show);
        $this->assign('cat_name',$cat_name);
		
        $this->display('index');

		// echo M("Category")->getLastSql();
    }
	public function rec_add(){
		$cat_name = '添加获奖荣誉';
		if(IS_POST){
			
			$_db = D('Awards');
//			if(I('post.cat_id') == 0){
//				$this->error("请选择获奖类型");
//			}
			$datas = $_db->where(array('title'=>array('eq',I('post.title'))))->count();
			if($datas){
				$this->error("该标题已存在");
			}else{
				
				if(!$_db->create()){
					$this->error($_db->getError().'');
				}else{
                    //多图处理
                    if($img = I('post.img')){
                        $_db->img=Array2String($img);
                    }
                    //参与人
                    if($partics = I('post.partic_id')){
                        $partics = array_unique($partics);
                        $_db->partic_id=Array2String($partics);
                    }
					$lastid = $_db->add();
					if($lastid){
						$this->inserlog('创客获奖荣誉：'.I('post.title').',ID:'.$lastid.' 添加成功','Awards');
						$this->success("获奖荣誉：".I('post.title')."添加成功",get_up_url(U('rec_index'),'Awards'));
					}else{
						$this->error("获奖荣誉：".I('post.title')."添加失败");
					}
				}
			}	
			
			
		}else{
			$this->assign('cat_name',$cat_name);
            //取出所有一级分类
            $cat_lists = M('Circat')->where(array('up_id'=>array('eq',0),'status'=>array('eq',1)))->order('sort asc,id asc')->select();
            $this->assign('cat_lists',$cat_lists);

            //级别
            $rank_list = M('Cirattr')->where(array('up_id'=>array('eq',1),'status'=>array('eq',1)))->order('sort desc,id asc')->select();
            $this->assign('rank_list',$rank_list);

            //年度
            $year_list = M('Cirattr')->where(array('up_id'=>array('eq',2),'status'=>array('eq',1)))->order('sort desc,id asc')->select();
            $this->assign('year_list',$year_list);

            //导师
            $teacher_list = M('Teacher')->where(array('status'=>array('eq',1)))->order('sort desc,id asc')->select();
            $this->assign('teacher_list',$teacher_list);

			$menu_show[0] = 'Circle';
			$menu_show[1] = 'rec_add';
			$this->assign('menu_show',$menu_show);
			$info['status'] = 1;
			$this->assign('info',$info);

			$this->display('info');
			// dump($cat_lists);
		}
    }
	public function rec_edit(){
		$cat_name = '编辑获奖荣誉';
		$_db = D('Awards');
		if(IS_POST){
			$id = I('post.id',0);
			$map['id'] = array('eq',$id);
			if($_POST['cat_id'] == 0){
				$this->error("请选择获奖类型");
			}
			
			$datas = $_db->where(array('id'=>array('neq',$id),'title'=>array('eq',I('post.title'))))->count();
			if($datas){
				$this->error("该标题已存在");
			}else{
				$_POST['update_time'] = time();
				if(!$_db->create($_POST)){
					$this->error($_db->getError().'');
				}else{
                    //多图处理
                    if($img = I('post.img')){
                        $_db->img=Array2String($img);
                    }
                    //参与人
                    if($partics = I('post.partic_id')){
                        $partics = array_unique($partics);
                        $_db->partic_id=Array2String($partics);
                    }
					$ret = $_db->where($map)->save();
					if($ret){
						
						$this->inserlog('创客获奖荣誉：'.I('post.title').',ID:'.$id.' 编辑成功','Awards');
						$this->success("获奖荣誉：".I('post.title')."编辑成功",get_up_url(U('rec_index'),'Awards'));
					}else{
						$this->error("获奖荣誉：".I('post.title')."编辑失败");
					}
				}
			}
		}else{
			$map['id'] = array('eq',I('get.id'));
			$info = $_db->where($map)->find();
            if($info['mid']){
                $name = $this -> mem_name(M('Member'),$info['mid']);
                $info['mid_name'] = $name['username']?$name['username']:$name['phone'];
            }else{
                $info['mid_name'] = $this -> admin_name($info['admin_id']);
            }

            //取出当前一级分类
            $map_['id'] = array('eq',$info['cat_id']);
            $cat = M('Circat') -> where($map_) -> find();
            $info['cat_cat_id'] = $cat['up_id'];

			$this->assign('info',$info);
			$this->assign('cat_name',$cat_name);



            //取出所有一级分类
            $cat_lists = M('Circat')->where(array('up_id'=>array('eq',0),'status'=>array('eq',1)))->order('sort asc,id asc')->select();
            $this->assign('cat_lists',$cat_lists);

            //取出所有二级分类
            $cat_list = M('Circat')->where(array('up_id'=>array('neq',0),'status'=>array('eq',1)))->order('sort desc,id asc')->select();
            $this->assign('cat_list',$cat_list);

            //级别
            $rank_list = M('Cirattr')->where(array('up_id'=>array('eq',1),'status'=>array('eq',1)))->order('sort desc,id asc')->select();
            $this->assign('rank_list',$rank_list);

            //年度
            $year_list = M('Cirattr')->where(array('up_id'=>array('eq',2),'status'=>array('eq',1)))->order('sort desc,id asc')->select();
            $this->assign('year_list',$year_list);

            //导师
            $teacher_list = M('Teacher')->where(array('status'=>array('eq',1)))->order('sort desc,id asc')->select();
            $this->assign('teacher_list',$teacher_list);

            $img=String2Array($info['img']);
            $this->assign('img',$img);

            $partic=String2Array($info['partic_id']);
            $arr = array();
            foreach($partic as $a=>$v){
                $name = $this->mem_name(M('Member'),$v);
                if($name['username']){
                    $arr[$a]['username'] = $name['username'];
                }else{
                    $arr[$a]['username'] = $name['phone'];
                }
                $arr[$a]['id'] = $name['id'];
            }
            $this->assign('arrs',$arr);

			$menu_show[0] = 'Circle';
			$menu_show[1] = 'rec_edit';
			$this->assign('menu_show',$menu_show);
			$this->display('info');
//            dump($info);
		}
    }
	public function del_index(){
		if(IS_GET){
			$id = I('get.id',0);
			$m_admin['id'] = array('eq',$id);
			$info = M('Awards')->where($m_admin)->find();
//			$ret = M('Flashrec')->where($m_admin)->limit(1)->delete();
            $sql = "DELETE FROM cms_awards WHERE id = ".$id;
            $ret = M('Awards')->execute($sql);
			if($ret){
				$json['status'] = '1';
				$this->inserlog('创客获奖荣誉：'.$info['title'].',ID:'.$id.' 删除成功','Awards');
				$json['info']	= '获奖荣誉：'.$info['title'].' 删除成功';
			}else{
				$json['status'] = '0';
				$json['info']	= '获奖荣誉：'.$info['title'].' 删除失败';
			}
			echo json_encode($json);exit;
		}
	}

	
	/*
	 * 更新排序
	 */
	public function sortlists(){
		$News=M('Awards');
		if(IS_POST){
		
			foreach(I('sort') as $k=>$v){
				$News->where('id='.$k)->setField('sort',$v);
				$string .= $k.',';
			}
			$this->success("修改排序成功",get_up_url(U('rec_index'),'Awards'));
		}else{
			$this->error("修改排序失败");
		}
	
	}
	
	/*
	 * 修改内容状态
	 */
	public function editnav(){
		//create_up_url(U('index'),'Newscat');
		$Awards=M('Awards');
		if(IS_GET){
			
			$id = I('id');
			$map['id']=array('eq',$id);
			$data=$Awards->where($map)->find();
			$saveda['status'] = $data['status']==1?0:1;
			$saveda['update_time'] = time();
			$lastid=$Awards->where($map)->save($saveda);
			if($lastid){
				$this->inserlog('创客获奖荣誉：'.$data['title'].',ID:'.$id.' 修改状态成功','Awards');
				$this->success("修改状态成功",get_up_url(U('rec_index'),'Awards'));
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
                if($v['username']){
                    $datas[$a]['username'] = $v['username'];
                }else{
                    $datas[$a]['username'] = $v['phone'];
                }
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