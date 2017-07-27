<?php
namespace Sysadmin\Controller;
use Think\Controller;
class PublicController extends Controller{
	public function __construct(){
		parent::__construct();
		header('Content-Type:text/html; charset=utf-8');
		if(cookie('ADMIN_ID') > 0){
			$this->redirect('Index/index');
			exit;
		}
		$this->assign('public',APP_URL.SOURCE_PATH.'system/');
	}
    public function index(){
        $this->display();
    }
	public function onlogin(){


		if(IS_POST){

			// $verify = I('post.verify','');
			$username = I('post.username','');
			$password = I('post.password','');
			// if(!check_verify($verify)){
                // $this->error('验证码输入错误！');
            // }
			if(!$username){
                $this->error('用户名不能为空！');
            }
			if(!$password){
                $this->error('密码不能为空！');
            }

			$_db = M('Admin');
			$map_admin['username'] = array('eq',$username);

//			$meber_info = $_db->where($map_admin)->field('id,username,password,name,role_id,login_time,login_ip,sign,status')->find();
			$meber_info = $_db->where($map_admin)->find();
//            echo M()->getLastSql();
//            dump($meber_info);
            if((md5($password.$meber_info['sign']) != $meber_info['password']) || !$meber_info){

				$this->inserlog($username,$password,'用户名或密码错误！');
				$this->error('用户名或密码错误！');
			}

			if($meber_info['status'] == 0){
				$this->inserlog($username,'','用户名或密码错误！');
				$this->error('该账户已经被禁用！');
			}

			cookie('ADMIN_ID',$meber_info['id']);
			cookie('ADMIN_USERNAME',$meber_info['username']);
			cookie('ADMIN_ROLE_ID',$meber_info['role_id']);
			cookie('ADMIN_LOGIN_IP',$meber_info['login_ip']);
			cookie('ADMIN_LOGIN_TIME',$meber_info['login_time']);
//            dump($meber_info);exit;
			$this->inserlog($username,'','登录成功！');
			//$this->success('登录成功！', U('Index/index'));

			$this->redirect('Index/index', array());
		}else{
			$this->redirect('Public/index');
		}
	}
	public function verify(){
        $verify = new \COM\Verify();
        $verify->entry(1);
    }
	private function inserlog($username,$password,$info){


	    if(cookie('ADMIN_ID')){
	        $map['id'] = array('eq',cookie('ADMIN_ID'));
            $infos = M('Admin') -> where($map) -> find();
        }
		$add_data['type']		=	'login';
		$add_data['ip_address']	=	get_client_ip();
		$add_data['info']		=	'用户名：'.$username.';密码：'.$password.'; '.$info;
		$add_data['admin_id']	=	'0';
		$add_data['admin_name']	=	$infos['username'];
		$add_data['create_time']=	time();

		M('AdminLogs')->add($add_data);
	}
	public function _empty(){
        $this->redirect('/404');
    }
}