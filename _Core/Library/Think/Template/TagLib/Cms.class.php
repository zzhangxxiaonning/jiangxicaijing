<?php
namespace Think\Template\TagLib;
use Think\Template\TagLib;
class Cms extends TagLib{
	protected $tags = array(
		// attr 标签允许添加的属性值
		// close 是否闭合 （0 不闭合 1 闭合）
		'list'	=> array('attr'=>'id,key,page,num,order,where','close'=>'1'),
		'ad'	=> array('attr'=>'id,key,limit,order,cat_id','close'=>'1'),
        'newscat'    => array('attr'=>'id,key,limit,order','close'=>'1'),
        'activitycat'    => array('attr'=>'id,key,limit,order','close'=>'1'),
        'pages'    => array('attr'=>'id,key,cat_id,limit,order','close'=>'1'),
	);
    public function _pages($tag,$content){
        $id    =    $tag['id'];

        $key   =    !empty($tag['key'])?$tag['key']:'i';

        $cat_id   =    !empty($tag['cat_id'])?$tag['cat_id']:'1';
        if($cat_id == 3){
            $m = 'Service';
        }elseif($cat_id == 2){
            $m = 'Support';
        }elseif($cat_id == 4){
            $m = 'Investment';
        }elseif($cat_id == 5){
            $m = 'Recruit';
        }elseif($cat_id == 6){
            $m = 'Contact';
        }elseif($cat_id == 7){
            $m = 'Map';
        }else{ 
            $m = 'About';
        }


        
        $limit  = $tag['limit'] > 0 ? $tag['limit'] : 10;

        $order = $tag['order'] ? $tag['order'] : 'sort desc,id desc';

        $field = "id,title,type,url";
        $parseStr   =   '<?php ';

        $parseStr  .=   ' $mmap["cat_id"] = array("eq",'.$cat_id.'); ';
        $parseStr  .=   ' $_cms_lists = M("Page")->where($mmap)->field("'.$field.'")->order("'.$order.'")->limit("'.$limit.'")->select();';
        $parseStr  .=   ' if(is_array($_cms_lists)){ ';
        $parseStr  .=   '   foreach($_cms_lists as $k=>$v){ ';
        $parseStr  .=   '       if($v["type"] == 1){ $_cms_lists[$k]["url"] = $v["url"]; }else{ $_cms_lists[$k]["url"] = U("'.$m.'/index",array("id"=>$v["id"])); } ';
        $parseStr  .=   '   } ';               
        $parseStr  .=   ' } ';
        $parseStr  .=   ' if(is_array($_cms_lists)): foreach($_cms_lists as $'.$key.'=>$'.$id.'): ?>';
        $parseStr  .=   ' ';
        $parseStr  .=   $this->tpl->parse($content);
        $parseStr  .=   '<?php endforeach; endif; ?>';

        if(!empty($parseStr)) {
            return $parseStr;
        }
        return '';
    }
    public function _activitycat($tag,$content){
        $id    =    $tag['id'];
        $key   =    !empty($tag['key'])?$tag['key']:'i';
        
        $limit  = $tag['limit'] > 0 ? $tag['limit'] : 10;
        $order = $tag['order'] ? $tag['order'] : 'sort desc,id desc';

        $field = "id,catname,banner";
        
        $parseStr   =   '<?php ';


        $parseStr  .=   ' $_cms_lists = M("ActivityCat")->field("'.$field.'")->order("'.$order.'")->limit("'.$limit.'")->select();';
        
        $parseStr  .=   ' if(is_array($_cms_lists)): foreach($_cms_lists as $'.$key.'=>$'.$id.'): ?>';
        $parseStr  .=   $this->tpl->parse($content);
        $parseStr  .=   '<?php endforeach; endif; ?>';

        if(!empty($parseStr)) {
            return $parseStr;
        }
        return '';
    }
    public function _newscat($tag,$content){
        $id    =    $tag['id'];
        $key   =    !empty($tag['key'])?$tag['key']:'i';
        
        $limit  = $tag['limit'] > 0 ? $tag['limit'] : 10;
        $order = $tag['order'] ? $tag['order'] : 'sort desc,id desc';

        $field = "id,catname,banner";
        
        $parseStr   =   '<?php ';


        $parseStr  .=   ' $_cms_lists = M("NewsCat")->field("'.$field.'")->order("'.$order.'")->limit("'.$limit.'")->select();';
        
        $parseStr  .=   ' if(is_array($_cms_lists)): foreach($_cms_lists as $'.$key.'=>$'.$id.'): ?>';
        $parseStr  .=   $this->tpl->parse($content);
        $parseStr  .=   '<?php endforeach; endif; ?>';

        if(!empty($parseStr)) {
            return $parseStr;
        }
        return '';
    }
	public function _list($tag,$content){
		$id    =    $tag['id'];
		$key   =    !empty($tag['key'])?$tag['key']:'i';
		$page = $tag['page'] > 0 ? $tag['page'] : 1;
		$num  = $tag['num'] > 0 ? $tag['num'] : 10;
		$order = $tag['order'] ? $tag['order'] : 'id desc';
		$where = $tag['where'] ? $tag['where'] : array();
		
        $parseStr   =   '<?php ';

        $parseStr  .=   '$_cms_lists = M("Admin")->field($field)->where($where)->order($order)->page($page.",".$num)->select();';
        
        $parseStr  .=   'if(is_array($_cms_lists)): foreach($_cms_lists as $'.$key.'=>$'.$id.'): ?>';
        $parseStr  .=   $this->tpl->parse($content);
        $parseStr  .=   '<?php endforeach; endif; ?>';

        if(!empty($parseStr)) {
            return $parseStr;
        }
        return '';
	}
	public function _ad($tag,$content){
		$time = time();
		$id    =    $tag['id'];
		$key   =    !empty($tag['key'])?$tag['key']:'i';
		
		$cat_id=    $tag['cat_id'] > 0 ? $tag['cat_id'] : 0;
		$limit  = $tag['limit'] > 0 ? $tag['limit'] : 10;
		$order = $tag['order'] ? $tag['order'] : 'sort desc,id desc';

		$field = "id,name,url,target,image";
		
        $parseStr   =   '<?php ';

        $parseStr  .=   ' $where["status"] = array("eq",1);';
        if($cat_id>0){
      	  $parseStr  .=   ' $where["cat_id"] = array("eq",'.$cat_id.');';
        }
        $parseStr  .=   ' $where["_string"] = " 
        	(start_time IS NULL AND end_time IS NULL) or 
        	(start_time = 0 AND end_time = 0) or 
        	(start_time = 0 AND end_time > '.$time.') or 
        	(start_time IS NULL AND end_time > '.$time.') or 
        	(start_time < '.$time.' AND end_time = 0) or
        	(start_time < '.$time.' AND end_time  IS NULL) or  
        	(start_time < '.$time.' AND end_time > '.$time.') ";';

        $parseStr  .=   ' $_cms_lists = M("Ad")->field("'.$field.'")->where($where)->order("'.$order.'")->limit("'.$limit.'")->select();';
        
        $parseStr  .=   ' if(is_array($_cms_lists)): foreach($_cms_lists as $'.$key.'=>$'.$id.'): ?>';
        $parseStr  .=   $this->tpl->parse($content);
        $parseStr  .=   '<?php endforeach; endif; ?>';

        if(!empty($parseStr)) {
            return $parseStr;
        }
        return '';
	}
















}

?> 