<?php
namespace Sysadmin\Model;
use Think\Model;
Class CirattrModel extends Model{
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

    private $icon = array('│', '├ ', '└ ');  //格式化的字符
    /*******
     *$cid 上级id
     *$is 是否显示但前id
     *$condition  筛选条件 必须是数组
     *$orderby	排序字符串
     *$space	默认为空
     *
     *******/
    public function getList( $cid = 0, $space = "",$orderby = 'sort asc,id asc',$condition = NULL,$is=0) {
        if($is==0 && $cid!=0){
            $a=M('Cirattr')->field('id,up_id,path,catname')->where('id='.$cid)->select();
            foreach($a as $k=>$v){
                $a[$k]['tname']=$v['catname'];
            }
            $all=$this->search_List($cid,$space='&nbsp;',$orderby,$condition);
            $all=array_merge($a,$all);
        }else{
            $all=$this->search_List($cid,$space,$orderby,$condition);
        }
        return $all;
    }


    /*
    *$condition 查询条件（数组）
    *orderby 排序方式
    *cid 顶级id
    */
    private function search_List($cid = 0, $space = "",$orderby = 'sort asc,id asc',$condition = NULL) {
        $childs = $this->getChild($cid,$orderby,$condition);//查询该栏目下面的所有子栏目
        $n = count($childs);
        if($n){//有子栏目
            $m=1;
            for($i=0;$i<$n;$i++){
                if($n==$m){//只有一个子栏目/最后一个栏目
                    $pre = $this->icon[2];
                }else{
                    $pre = $this->icon[1];
                    $pad = $space ? $this->icon[0] : "";
                }
                $childs[$i]['tname']=($space ? $space.$pre : "").$childs[$i]['catname'];
                $cat_all[]=$childs[$i];
                $cat_bbb=$this->search_List($childs[$i]['id'], $space.$pad."&nbsp;",$orderby,$condition); //递归下一级分类
                //return $cat_bbb;
                if(count($cat_bbb)){//包含子栏目 合并
                    $cat_all=array_merge($cat_all,$cat_bbb);
                }
                $m++;
            }
            return $cat_all;
        }else{
            return array();;
        }
    }
    public function getChild($fid=0,$orderby = 'sort asc,id asc',$condition) {
        $condition['up_id']=array('eq',$fid);
        $childs=M('Cirattr')->field('id,up_id,path,catname')->where($condition)->order($orderby)->select();
        return $childs;
    }
}

?>