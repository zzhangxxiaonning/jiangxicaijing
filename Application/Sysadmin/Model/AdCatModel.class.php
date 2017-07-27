<?php
namespace Sysadmin\Model;
use Think\Model;
Class AdCatModel extends Model{
	public function __construct() {
		parent::__construct();
	}
	//自动验证
	protected  $_validate =array(
		array('name','require','名称不能为空',0,'',3),
		array('name','','名称已经存在！',0,'unique',1),
	);
	//自动完成
	protected $_auto = array (
    	array('update_time','time',3,'function'),
	);
}
?>