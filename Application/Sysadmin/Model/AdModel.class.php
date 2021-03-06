<?php
namespace Sysadmin\Model;
use Think\Model;
Class AdModel extends Model{
	public function __construct() {
		parent::__construct();
	}
	//自动验证
	protected  $_validate =array(
		array('name','require','广告名称不能为空',0,'',3),
		array('image','require','广告图片不能为空',0,'',3),
		array('start_time,end_time','check_time_dx','开始时间不能小于结束时间',1,'callback',3),
	);
	//自动完成
	protected $_auto = array (
    	array('create_time','time',1,'function'),	//创建时间
    	array('update_time','time',3,'function'),	//编辑时间
		array('start_time','time_get',3,'callback'),	//密码加密	
		array('end_time','time_get',3,'callback'),	//密码加密	
    	array('admin_id','GetAdmin',1,'callback'),
	);
	// protected function GETip(){
		// return $_SERVER['REMOTE_ADDR'];
	// }
	protected function GetAdmin(){
		return cookie('ADMIN_ID');
	}
	protected function time_get($time){
		if($time){
			return strtotime($time);
		}
		return null;
	}
	public function check_time_dx($data){
		if($data['start_time'] && $data['end_time']){
			if(strtotime($data['start_time']) >= strtotime($data['end_time'])){
				return false;
			}
		}
		return true;
	}
   
}

?>