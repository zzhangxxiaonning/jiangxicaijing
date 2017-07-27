<?php
namespace Sysadmin\Model;
use Think\Model;
Class AdminModel extends Model{
	public $sign = '';
	public function __construct() {
		parent::__construct();
		$this->sign	= randCode(5);
	}
	//自动验证
	protected  $_validate =array(
		array('username','require','登录名不能为空',0,'',3),
		array('username','','登录名已经存在！',0,'unique',1),
		array('password','require','密码不能为空',0,'',1),
		array('password','/^.{5,}$/','密码必须5位数以上',0,'regex',1),		
		array('password2','password','两次密码不一致',0,'confirm',3),
		array('name','require','名称必须填写',0,'',3),
	);
	//自动完成
	protected $_auto = array (
    	array('create_time','time',1,'function'),	//创建时间
    	array('update_time','time',3,'function'),	//编辑时间
		array('login_time','',1),					//登录时间
		array('login_ip','',1),  					//登录IP
		array('sign','GetSign',1,'callback'),		//密码加密随机字符串
		array('password','md5sign',1,'callback'),	//密码加密	
    	array('admin_id','GetAdmin',1,'callback'),
	);
	// protected function GETip(){
		// return $_SERVER['REMOTE_ADDR'];
	// }
	protected function GetAdmin(){
		return cookie('ADMIN_ID');
	}
	protected function GetSign(){
		return $this->sign;
	}
	protected function md5sign($password){
		return md5($password.$this->sign);
	}
   
}

?>