<?php
namespace Sysadmin\Model;
use Think\Model;
Class ActappModel extends Model{
	public $sign = '';
	public function __construct() {
		parent::__construct();
		$this->sign	= randCode(5);
	}
	//自动验证
	protected  $_validate =array(
		array('catname','require','名称不能为空',0,'',3),
	);
	//自动完成
	protected $_auto = array (
    	array('create_time','time',1,'function'),	//创建时间
    	array('update_time','time',3,'function'),	//编辑时间	
    	array('admin_id','GetAdmin',1,'callback'),
	);
	// protected function GETip(){
		// return $_SERVER['REMOTE_ADDR'];
	// }
	protected function GetAdmin(){
		return cookie('ADMIN_ID');
	}

    public function getLists($cid=0){
		$Actapp = M('Actapp');
		
		if($cid){
			$map1['id'] = array('eq',$cid);
			$data1 = $Actapp -> where($map1) -> find();
			$map2['id'] = array('eq',$data1['up_id']);
			$data2 = $Actapp -> where($map2) -> find();
			if($data2){
				$data[0]['id'] = $data2['id'];
				$data[0]['tname'] = $data2['catname'];
			}
			$map['id'] = array('neq',$cid);
		}
		
		$map['up_id'] = array('eq',0);
		$map['status'] = array('eq',1);
		$data_list = $Actapp -> where($map) -> select();
		$cat_list = array();
		foreach($data_list as $a=>$v){
			$map_['up_id'] = array('eq',$v['id']);
			$map_['status'] = array('eq',1);
			$count = $Actapp -> where($map_) -> count();
			if(!$count){
				$cat_list[$a]['id'] = $v['id'];
				$cat_list[$a]['tname'] = $v['catname'];
			}
		}
		
		// dump($cat_list);
		// dump($data);
		if($data){
			$cat_list = array_merge($cat_list,$data);
		}
		
		return $cat_list;
	}
}

?>