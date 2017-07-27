<?php
namespace Sysadmin\Model;
use Think\Model;
Class ActivityModel extends Model{
	public $sign = '';
	public function __construct() {
		parent::__construct();
		$this->sign	= randCode(5);
	}
	//自动验证
	protected  $_validate =array(
		array('title','require','标题不能为空',0,'',3),
		array('rank_id','require','请选择活动级别！',0,'',3),
		array('address','require','活动地址不可为空！',0,'',3),
		array('start_time,end_time','check_time_dx','结束时间需要大于开始时间！',1,'callback',3),
	);
	//自动完成
	protected $_auto = array (
    	array('create_time','time',1,'function'),	//创建时间
    	array('update_time','time',3,'function'),	//编辑时间	
		array('start_time','time_get',3,'callback'), //活动开始时间	
		array('end_time','time_get',3,'callback'),//活动结束时间
    	array('admin_id','GetAdmin',1,'callback'),
	);
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