<?php
namespace Sysadmin\Controller;
use Think\Controller;
/*
 * 订单--充值提现
 *
 */
class Order4Controller extends CommonController {
	public function __construct(){
		parent::__construct();


	}
    

    public function index4(){
        $this -> assign('cat_name','充值提现');

        create_up_url(U('index4'),'Order');
        $_db = M('Order');
        $map = array();
        $is_service = 0;

        $status = I('get.status','-1');
        if($status>=0){
            $map['status'] = array('eq',$status);
            $is_service++;
        }
        $name = I('get.name','');
        if($name){
            $map['oid'] = array('like','%'.$name.'%');
            $is_service++;
        }
        /*支付状态*/
        $pay_is = I('get.pay_is','-1');
        if($pay_is>=0){
            $map['pay_is'] = array('eq',$pay_is);
            $is_service++;
        }

        /*交易类型*/
        $pre = I('get.pre','-1');
        if($pre>=0){
            $map['pre'] = array('eq',$pre);
            $is_service++;
        }

        /*处理状态*/
        $status = I('get.status','-1');
        if($status>=0){
            $map['status'] = array('eq',$status);
            $is_service++;
        }

        /*显示状态*/
        $isshow = I('get.isshow','-1');
        if($isshow>=0){
            $map['isshow'] = array('eq',$isshow);
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
        $map['type'] = array('eq',4);
        $this->assign('is_service',$is_service);
//		dump($map);
        $page_num = 10;
        $p = I('get.p',1);
        $count	= $_db->where($map)->count();
        $Page	= new \Common\Other\Page($count,$page_num);
        $show	= $Page->show();
        $lists = $_db->where($map)->page($p.','.$page_num)->order('id desc')->select();
//		echo M()->getLastSql();
        /*管理员名称*/
        foreach($lists as $m=>$v){
            $lists[$m]['admin_name'] = $this->admin_name($v['admin_id']);

            $nickname = $this->mem_name(M('Member'),$v['uid']);
            $lists[$m]['nickname'] = $nickname?$nickname:'会员ID：'.$v['uid'];//个人报名人名称

            $lists[$m]['nickname'] = $this->mem_name(M('Member'),$v['uid']);//个人报名人名称
            if($v['uid_type'] == 2) {  //小组报名人员
                if ($v['team']) {
                    $arr_mem = explode(',', $v['team']);
                    $arr_nickname = array();
                    foreach ($arr_mem as $mm => $vv) {
                        array_push($arr_nickname, $this->mem_name(M('Member'), $vv));
                    }
                    $lists[$m]['team_nickname'] = implode($arr_nickname, ',');
                }
            }

        }
        $this->assign('lists',$lists);
        $this->assign('page',$show);

        $menu_show[0] = 'Order';
        $menu_show[1] = 'index4';
        $this->assign('menu_show',$menu_show);

        $this->display();
    }


	
	/*
	 * 修改内容状态
	 */
	public function editnav(){
		//create_up_url(U('index'),'Newscat');

		$News=M('Order');
		$Member=M('Member');
		if(IS_GET){
			
			$id = I('get.id');
			$map['id']=array('eq',$id);
			$data=$News->where($map)->find();
			$saveda['status'] = $data['status']==1?0:1;
			$saveda['update_time'] = time();

            $map_u['id'] = array('eq',$data['uid']);

            $info = $Member -> where($map_u) -> find();
            if($data['pre']  == 1){
                $data_['balance'] = $info['balance'] + $data['money'];
            }elseif($data['pre'] == 2){
                $data_['balance'] = $info['balance'] - $data['money'];
            }

            $Member -> where($map_u) -> save($data_);

			$lastid=$News->where($map)->save($saveda);
			if($lastid){
			    $this->inserlog('充值提现订单ID:' . $id . ' 修改处理状态成功', 'Order');

				$this->success("修改处理状态成功",get_up_url(U('index4'),'Order'));
			}else{
				$this->error("修改处理状态失败");
			}
			
		}
	}

    /*
     * 修改显示状态
     */
    public function editshow(){
        //create_up_url(U('index'),'Newscat');

        $News=M('Order');
        if(IS_GET){

            $id = I('get.id');

            $map['id']=array('eq',$id);
            $data=$News->where($map)->find();
            $saveda['isshow'] = $data['isshow']==1?0:1;
            $saveda['update_time'] = time();

            $lastid=$News->where($map)->save($saveda);
            if($lastid){
                $this->inserlog('充值提现订单ID:' . $id . ' 修改显示状态成功', 'Order');

                $this->success("修改显示状态成功",get_up_url(U('index4'),'Order'));
            }else{
                $this->error("修改显示状态失败");
            }

        }
    }
}