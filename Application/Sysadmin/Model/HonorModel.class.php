<?php
namespace Sysadmin\Model;
use Think\Model;
Class HonorModel extends Model{
	public $sign = '';
	public function __construct() {
		parent::__construct();
		$this->sign	= randCode(5);
	}
	//自动验证
	protected  $_validate =array(
		array('content','require','请填写资讯内容',0,'',3),
	);
	//自动完成
	protected $_auto = array (
    	array('create_time','time',1,'function'),	//创建时间
    	array('update_time','time',3,'function'),	//编辑时间	
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
   
}

?>