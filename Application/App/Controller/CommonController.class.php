<?php
namespace App\Controller;
use Think\Controller;
class CommonController extends Controller {
	public $member_id = 0;
    public function __construct(){
		parent::__construct();
		header('Content-Type:text/html; charset=utf-8');
		$this->assign('public',APP_URL.SOURCE_PATH.'home/');
		$this->assign('source',APP_URL.SOURCE_PATH.'');
	
		$versionnumber = '?var='.time();//版本号 测试阶段
		$this->assign('versionnumber',$versionnumber);
		if (get_magic_quotes_gpc()){
			$this->mystrip($_POST);
			$this->mystrip($_GET);
		}
		foreach ($_GET as $k=>$v){
			if(!is_array($v)){
				if(!mb_check_encoding($v,'utf-8')){
					$_GET[$k] = iconv('gbk', 'utf-8', $v);
				}
			}else{
				foreach($_GET['_URL_'] as $key=>$value){
					if(!mb_check_encoding($value,'utf-8')){
						$_GET['_URL_'][$key] = iconv('gbk', 'utf-8', $value);
					}
				}
			}
		}

        //网站开关状态
        $config = M('Config');
        $condata = $config -> where(array('id'=>array('eq',8))) -> find();
        if($condata['content'] != 1){
            echo C('tip');
            exit;
        }


        
	}




    /**

     * 获取上，下一条信息

     * @param $tp 1下一条，2上一条

     * @param $model 模型

     * @param $order 排序

     * @param $field 字段

     * @param $where 条件

     * @param $id 当前信息id

     **/

    protected function _next($type,$where,$id,$order='sort desc,id desc',$field='id,title,cat_id,thumb'){
        if($type == 1){
            $model = D('News');
        }else if($type == 2){
            $model = D('Article');
        }

        $data=$model->where($where)->field($field)->order($order)->select();
        foreach($data as $k => $v){
            if($id == $v['id']){
                $cont['prve']=$data[$k+1];
                $cont['next']=$data[$k-1];
            }
        }
        // dump($cont);
        foreach($cont as $k=>$v){
            // dump($v);
            if($v){

                $dada[$k]=$v;

                if($type == 1){
                    $dada[$k]['url']=U('/News/index',array('id'=>$v['id']));
                }else if($type == 2){
                    $dada[$k]['url']=U('/Article/index',array('id'=>$v['id']));
                }




            }else{
                $dada[$k]=$v;
                $dada[$k]['title']='无';
                $dada[$k]['url']='javascript::';
            }
        }
        return $dada;
    }


    /*栏目分类名称*/
    protected function cat_name($sql,$id){
        $map['id']		=	array('eq',$id);
        $name = $sql -> where($map) -> find();
        return $name['catname'];
    }

    /*省市区名称*/
    protected function area_name($sql,$id){
        $map['id']		=	array('eq',$id);
        $name = $sql -> where($map) -> find();
        return $name['name'];
    }

    /*会员名称*/
    protected function mem_name($id){
        $map['id']		=	array('eq',$id);
        $name = M('Member') -> where($map) -> find();
        return $name;
    }

    /**
     * 	地区联动
     **/
    protected function getArea($id,$one=''){
        F('abc',$id);
        if($id>0){
            $list=$this->getAreaList($id);
        }else{
            $list=null;
        }

        $data='<option value="0">请选择</option>';
        if(is_array($list)){
            foreach($list as $k=>$v){
                if($v['id']==$one){
                    $selected='selected';
                }else{
                    $selected='';
                }
                $data .='<option value="'.$v['id'].'" '.$selected.'>'.$v['name'].'</option>';

            }
        }
        return $data;
    }


    /**
     * 地区数组
     **/
    protected function getAreaList($id=0){

        $list=M('Area')->where('up_id='.$id)->order('id asc')->select();

        return $list;
    }

    //判断客户端
    public function isMobile3(){        // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
        if (isset ($_SERVER['HTTP_X_WAP_PROFILE'])){
            return true;            //此条摘自TPM智能切换模板引擎，适合TPM开发
        }
        if(isset ($_SERVER['HTTP_CLIENT']) &&'PhoneClient'==$_SERVER['HTTP_CLIENT']) {
            return true;        //如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
        }
        if (isset ($_SERVER['HTTP_VIA'])){            //找不到为flase,否则为true
            return stristr($_SERVER['HTTP_VIA'], 'wap') ? true : false;        //判断手机发送的客户端标志,兼容性有待提高
        }
        if (isset ($_SERVER['HTTP_USER_AGENT'])){
            $clientkeywords = array(
                'nokia','sony','ericsson','mot','samsung','htc','sgh','lg','sharp','sie-','philips','panasonic','alcatel','lenovo','iphone','ipod','blackberry','meizu','android','netfront','symbian','ucweb','windowsce','palm','operamini','operamobi','openwave','nexusone','cldc','midp','wap','mobile'
            );            //从HTTP_USER_AGENT中查找手机浏览器的关键字
            if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
                return true;
            }
        }      //协议法，因为有可能不准确，放到最后判断
        if (isset ($_SERVER['HTTP_ACCEPT'])) {            // 如果只支持wml并且不支持html那一定是移动设备            //如果支持wml和html但是wml在html之前则是移动设备
            if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html')))) {
                return true;
            }
        }
        return false;
    }


}