<?php
namespace Sysadmin\Controller;
use Think\Controller;
class CommonController extends Controller{
	/* 保存禁止通过url访问的公共方法,例如定义在控制器中的工具方法 ;deny优先级高于allow*/
    static protected $deny  = array('Common','tableList','recordList');

    /* 保存允许访问的公共方法 */
    static protected $allow = array( 'login','logout','get');
	
	public $admin_id = 0;
    public function __construct(){
		parent::__construct();
		header('Content-Type:text/html; charset=utf-8');
		$this->assign('public',APP_URL.SOURCE_PATH.'system/');
		$this->assign('source',APP_URL.SOURCE_PATH.'');
		$this->admin_id = cookie('ADMIN_ID');
		$this->admin_username = cookie('ADMIN_USERNAME');
		$this->assign('admin_id',$this->admin_id);
		$this->assign('admin_username',$this->admin_username);

		if(!($this->admin_id > 0)){
			$this->redirect('Public/index', array());
			exit;
		}
		
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
		$this->_menu_lists();
		
		//检测非动态权限
		$rule = strtolower(CONTROLLER_NAME.'/'.ACTION_NAME);
		// dump($rule);
		if(!$this->checkRule($rule,array('in','1,2'))){
			// $this->error('提示:无权访问,您可能需要联系管理员为您授权!');
			$this->error('提示:无权访问,您可能需要联系管理员为您授权!');
			// echo $rule.'xx';
		}
	}
/**
 * 权限检测
 * @param string  $rule    检测的规则
 * @param string  $mode    check模式
 * @return boolean
**/
    final protected function checkRule($rule, $type=1, $mode='url'){
		// dump($type);
		if(cookie("ADMIN_ROLE_ID")==1){ 
			return true;
		}
		static $Auth = null;
		if(!$Auth){
			$Auth = new	\Think\Auth();
		}
		if(!$Auth->check($rule,$this->admin_id,$type,$mode)){
			return false;
		}
		return true;
    }
	private function _menu_lists(){
		$i = 0;
		$menu[$i]['title']	= '控制面板';
		$menu[$i]['icon']	= 'fa-home';
		$menu[$i]['url']	= U('Index/index');
		$menu[$i]['id']		= array('index');


        $i++;
        $j = 0;
        $menu[$i]['title']	= '创客圈管理';
        $menu[$i]['icon']	= 'fa-circle-o';
        $menu[$i]['url']	= 'javascript:void(0);';
        $menu[$i]['id']		= array('Circle');
        $j++;
        $menu[$i]['son'][$j]['title']	= '科研项目';
        $menu[$i]['son'][$j]['url']	= U('Circle/index');
        $menu[$i]['son'][$j]['id']	= array('index','add','edit','show');
        $j++;
        $menu[$i]['son'][$j]['title']	= '获奖荣誉';
        $menu[$i]['son'][$j]['url']	= U('Awards/rec_index');
        $menu[$i]['son'][$j]['id']	= array('rec_index','rec_add','rec_edit');
        $j++;
        $menu[$i]['son'][$j]['title']	= '项目分类';
        $menu[$i]['son'][$j]['url']	= U('Circat/act_index');
        $menu[$i]['son'][$j]['id']	= array('act_index','act_add','act_edit');
        $j++;
        $menu[$i]['son'][$j]['title']	= '创客属性';
        $menu[$i]['son'][$j]['url']	= U('Cirattr/attr_index');
        $menu[$i]['son'][$j]['id']	= array('attr_index','attr_add','attr_edit');

        $i++;
        $j = 0;
        $menu[$i]['title']	= '活动管理';
        $menu[$i]['icon']	= 'fa-calendar';
        $menu[$i]['url']	= 'javascript:void(0);';
        $menu[$i]['id']		= array('Activity');
        $j++;
        $menu[$i]['son'][$j]['title']	= '线下活动';
        $menu[$i]['son'][$j]['url']	= U('Activity/index');
        $menu[$i]['son'][$j]['id']	= array('index','add','edit');
        $j++;
        $menu[$i]['son'][$j]['title']	= '直播';
        $menu[$i]['son'][$j]['url']	= U('Flash/rec_index');
        $menu[$i]['son'][$j]['id']	= array('rec_index','rec_add','rec_edit');
        $j++;
        $menu[$i]['son'][$j]['title']	= '录播';
        $menu[$i]['son'][$j]['url']	= U('Flashrec/act_index');
        $menu[$i]['son'][$j]['id']	= array('act_index','act_add','act_edit');
        $j++;
        $menu[$i]['son'][$j]['title']	= '活动属性';
        $menu[$i]['son'][$j]['url']	= U('Actattr/attr_index');
        $menu[$i]['son'][$j]['id']	= array('attr_index','attr_add','attr_edit');
        $j++;
        $menu[$i]['son'][$j]['title']	= '活动审批人';
        $menu[$i]['son'][$j]['url']	= U('Actapp/app_index');
        $menu[$i]['son'][$j]['id']	= array('app_index','app_add','app_edit');
        $j++;
        $menu[$i]['son'][$j]['title']	= '活动举报';
        $menu[$i]['son'][$j]['url']	= U('Actrep/rep_index');
        $menu[$i]['son'][$j]['id']	= array('rep_index','rep_edit');


        $i++;
        $j = 0;
        $menu[$i]['title']	= '评论管理';
        $menu[$i]['icon']	= 'fa-comment-o';
        $menu[$i]['url']	= 'javascript:void(0);';
        $menu[$i]['id']		= array('Comment');
        $j++;
        $menu[$i]['son'][$j]['title']	= '线下活动评论';
        $menu[$i]['son'][$j]['url']	= U('Comment/index');
        $menu[$i]['son'][$j]['id']	= array('index','edit');
        $j++;
        $menu[$i]['son'][$j]['title']	= '直播评论';
        $menu[$i]['son'][$j]['url']	= U('Comfla/fla_index');
        $menu[$i]['son'][$j]['id']	= array('fla_index','fla_edit','del_com');
        $j++;
        $menu[$i]['son'][$j]['title']	= '录播评论';
        $menu[$i]['son'][$j]['url']	= U('Comrec/rec_index');
        $menu[$i]['son'][$j]['id']	= array('rec_index','rec_edit','del_com');

		
		$i++;
		$j = 0;
		$menu[$i]['title']	= '资讯管理';
		$menu[$i]['icon']	= 'fa-volume-up';
		$menu[$i]['url']	= 'javascript:void(0);';
		$menu[$i]['id']		= array('News');
		$j++;
		$menu[$i]['son'][$j]['title']	= '资讯列表';
		$menu[$i]['son'][$j]['url']	= U('News/index');
		$menu[$i]['son'][$j]['id']	= array('index','add','edit');
		$j++;
		$menu[$i]['son'][$j]['title']	= '资讯分类';
		$menu[$i]['son'][$j]['url']	= U('Newscat/act_index');
		$menu[$i]['son'][$j]['id']	= array('act_index','act_add','act_edit');

		$i++;
		$j = 0;
		$menu[$i]['title']	= '用户管理';
		$menu[$i]['icon']	= 'fa-user';
		$menu[$i]['url']	= 'javascript:void(0);';
		$menu[$i]['id']		= array('Member');
		$menu[$i]['son'][$j]['title']	= '用户列表';
		$menu[$i]['son'][$j]['url']	= U('Member/index');
		$menu[$i]['son'][$j]['id']	= array('index','add','edit');
        $j++;
        $menu[$i]['son'][$j]['title']	= '学生列表';
        $menu[$i]['son'][$j]['url']	= U('Student/stu_index');
        $menu[$i]['son'][$j]['id']	= array('stu_index','stu_add','stu_edit');
        $j++;
        $menu[$i]['son'][$j]['title']	= '教师列表';
        $menu[$i]['son'][$j]['url']	= U('Teacher/tea_index');
        $menu[$i]['son'][$j]['id']	= array('tea_index','tea_add','tea_edit');

        $i++;
        $j = 0;
        $menu[$i]['title']	= '订单管理';
        $menu[$i]['icon']	= 'fa-shopping-cart';
        $menu[$i]['url']	= 'javascript:void(0);';
        $menu[$i]['id']		= array('Order');
        $menu[$i]['son'][$j]['title']	= '线下活动';
        $menu[$i]['son'][$j]['url']	= U('Order/index');
        $menu[$i]['son'][$j]['id']	= array('index','edit');
        $j++;
        $menu[$i]['son'][$j]['title']	= '直播';
        $menu[$i]['son'][$j]['url']	= U('Order2/index2');
        $menu[$i]['son'][$j]['id']	= array('index2','edit_2');
        $j++;
        $menu[$i]['son'][$j]['title']	= '录播';
        $menu[$i]['son'][$j]['url']	= U('Order3/index3');
        $menu[$i]['son'][$j]['id']	= array('index3','edit_3');
//        $j++;
//        $menu[$i]['son'][$j]['title']	= '充值提现';
//        $menu[$i]['son'][$j]['url']	= U('Order4/index4');
//        $menu[$i]['son'][$j]['id']	= array('index4','edit_4');


		$i++;
		$j = 0;
		$menu[$i]['title']	= '单页管理';
		$menu[$i]['icon']	= 'fa-file-text';
		$menu[$i]['url']	= 'javascript:void(0);';
		$menu[$i]['id']		= array('Content');
		$menu[$i]['son'][$j]['title']	= '单页列表';
		$menu[$i]['son'][$j]['url']	= U('Content/index');
		$menu[$i]['son'][$j]['id']	= array('index','edit','add');


		$i++;
		$j = 0;
		$menu[$i]['title']	= '权限管理';
		$menu[$i]['icon']	= 'fa-unlock-alt';
		$menu[$i]['url']	= 'javascript:void(0);';
		$menu[$i]['id']		= array('admin');
		$menu[$i]['son'][$j]['title']	= '管理员管理';
		$menu[$i]['son'][$j]['url']	= U('Admin/index');
		$menu[$i]['son'][$j]['id']	= array('index','edit','add');
		$j++;
		$menu[$i]['son'][$j]['title']	= '角色管理';
		$menu[$i]['son'][$j]['url']	= U('Admin/role_lists');
		$menu[$i]['son'][$j]['id']	= array('role_lists','role_edit','role_add','role_function');

		$i++;
		$j = 0;
		$menu[$i]['title']	= '广告管理';
		$menu[$i]['icon']	= 'fa-tags';
		$menu[$i]['url']	= 'javascript:void(0);';
		$menu[$i]['id']		= array('ads');
		$menu[$i]['son'][$j]['title']	= '广告管理';
		$menu[$i]['son'][$j]['url']	= U('Ads/index');
		$menu[$i]['son'][$j]['id']	= array('index','edit','add',);
		$j++;
		$menu[$i]['son'][$j]['title']	= '广告位管理';
		$menu[$i]['son'][$j]['url']	= U('Ads/position_lists');
		$menu[$i]['son'][$j]['id']	= array('position_lists','position_edit','position_add');

		
		$i++;
		$j = 0;
		$menu[$i]['title']	= '意见反馈';
		$menu[$i]['icon']	= 'fa-pencil';
		$menu[$i]['url']	= 'javascript:void(0);';
		$menu[$i]['id']		= array('Message');
		$j++;
		$menu[$i]['son'][$j]['title']	= '反馈列表';
		$menu[$i]['son'][$j]['url']	= U('Message/index');
		$menu[$i]['son'][$j]['id']	= array('index','edit');
		
		$i++;
		$j = 0;
		$menu[$i]['title']	= '系统管理';
		$menu[$i]['icon']	= 'fa-gear';
		$menu[$i]['url']	= 'javascript:void(0);';
		$menu[$i]['id']		= array('config');
		$menu[$i]['son'][$j]['title']	= '配置管理';
		$menu[$i]['son'][$j]['url']	= U('Config/index');
		$menu[$i]['son'][$j]['id']	= array('index','edit');
        $j++;
        $menu[$i]['son'][$j]['title']	= '系统消息';
        $menu[$i]['son'][$j]['url']	= U('Mail/index_mail');
        $menu[$i]['son'][$j]['id']	= array('index_mail','add','adds','edit_mail','del_index');
        $j++;
        $menu[$i]['son'][$j]['title']	= '日志记录';
        $menu[$i]['son'][$j]['url']	= U('Record/index_record');
        $menu[$i]['son'][$j]['id']	= array('index_record');
		
		
		// $i++;
		// $menu[$i]['title']	= '退出登陆';
		// $menu[$i]['icon']	= 'fa-sign-in';
		// $menu[$i]['url']	= U('Index/onlogin');
		// $menu[$i]['id']		= array('onlogin');
        if(cookie('ADMIN_ROLE_ID') != 1){
            $map['id'] = array('eq',cookie('ADMIN_ROLE_ID'));
            $roles = M('AdminRole')->where($map)->find();
            $rules = explode(',',trim($roles['rules'],','));
            $arr = array();
            $arr_ = array();
            foreach($rules as $a=>$v){
                $map1['id'] = array('eq',$v);
                $name = M('AdminRule')->where($map1)->find();

//                $arr[$a]['id'][] = $name['module'];
                $arr[$a] = $name['module'];
                $arr_[$a] = '/Sysadmin/'.$name['name'].'.html';

            }
            $this->assign('arr',$arr);
            $this->assign('arr_',$arr_);
        }
        $this->assign('admin_role_id',cookie('ADMIN_ROLE_ID'));
		
		$this->assign('menu_lists',$menu);
	}
/**
 * 	地区联动
**/
	protected function getArea($id=0,$one=''){
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
/**
 * 去除转义方法
**/
	public function mystrip(& $data){
		if(is_array($data)){
			foreach($data as $v){
				$this->mystrip($v);
			}
		}else{
			$data = stripslashes($data);
		}
	}
	
	/*
	 * qq表情包正则验证
	 */
	protected function ubbReplace($str) {
		$str = str_replace ( ">", '<；', $str );	
		$str = str_replace ( ">", '>；', $str );
		$str = str_replace ( "\n", '>；br/>；', $str );	
		$str = preg_replace ( "[\[em_([0-9]*)\]]", "<img src=\"/Source/home/js/qqface/arclist/$1.gif\" />", $str );
		return $str;
	}

	/*记录日志*/
	protected function inserlog($info,$type){
		
		$add_data['type']		=	$type;
		$add_data['ip_address']	=	get_client_ip();
		$add_data['info']		=	$info;
		$add_data['admin_id']	=	$this->admin_id;
		$add_data['admin_name']	=	$this->admin_name($this->admin_id);
		$add_data['create_time']=	time();
		
		M('AdminLogs')->add($add_data);
	}
	
	/*管理员名称*/
	protected function admin_name($admin_id){
		
		$Admin = M("Admin");
		$map['id']		=	array('eq',$admin_id);
		$name = $Admin -> where($map) -> find();
		return $name['username'];
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
	protected function mem_name($sql,$id){
		$map['id']		=	array('eq',$id);
		$name = $sql -> where($map) -> find();
		return $name;
	}

    /*订单活动名称*/
    protected function order_name($sql,$id){
        $map['id']		=	array('eq',$id);
        $name = $sql -> where($map) -> find();
        return $name['title'];
    }


    public function pupload($type=""){
        header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
        header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
        header("Cache-Control: no-store, no-cache, must-revalidate");
        header("Cache-Control: post-check=0, pre-check=0", false);
        header("Pragma: no-cache");
        $type = empty($type)?"third":$type;
        /*
        // Support CORS
        header("Access-Control-Allow-Origin: *");
        // other CORS headers if any...
        if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
            exit; // finish preflight CORS requests here
        }
        */
        /*$targetDir = ini_get("upload_tmp_dir") . DIRECTORY_SEPARATOR . "plupload";*/
//        $targetDir = "D:/phpStudy/WWW/bim_project/Uploads/". date("Y")."/";
        $targetDir = "Uploads/". date("Y")."/".date("m")."/".date("d");
        $cleanupTargetDir = true; // Remove old files//移除旧文件
        $cleanupTargetDir = true; // Remove old files//移除旧文件
        $cleanupTargetDir = true; // Remove old files//移除旧文件
        $maxFileAge = 5 * 3600; // Temp file age in seconds

        // Create target dir如果目录不存在就创建一个
        if (!file_exists($targetDir)) {
            @mkdir($targetDir,0777,true);
        }

        // Get a file name获取传入的文件名
        if (isset($_REQUEST["name"])) {
            $fileName = $_REQUEST["name"];
        } else if (!empty($_FILES)) {
            $fileName = $_FILES["file"]["name"];
        } else {
            $fileName = uniqid("file_");
            $arr=["status"=>0,"msg"=>["code"=>100,"message"=>"没找到文件！"]];
            return $arr;

        }

        //生成文件路径
        $filePath = $targetDir . DIRECTORY_SEPARATOR . $fileName;
        // Chunking might be enabled检查是否有大文件分块上传
        $chunk = isset($_REQUEST["chunk"]) ? intval($_REQUEST["chunk"]) : 0;
        $chunks = isset($_REQUEST["chunks"]) ? intval($_REQUEST["chunks"]) : 0;//把大文件总共分成多少小块文件

        // Remove old temp files移除临时文件
        if ($cleanupTargetDir) {
            if (!is_dir($targetDir) || !$dir = opendir($targetDir)) {
                $arr=["status"=>0,"msg"=>["code"=>100,"message"=>"打开临时目录失败"]];
                return $arr;
            }

            while ( ($file = readdir($dir)) !== false ) {//遍历$targetDir目录下的所有文件
                $tmpfilePath = $targetDir . DIRECTORY_SEPARATOR . $file;

                // If temp file is current file proceed to the next（如果临时文件是当前文件，则继续进行下一个）
                if ($tmpfilePath == "{$filePath}.part") {
                    continue;
                }

                // Remove temp file if it is older than the max age and is not the current file（删除临时文件，如果它比最大年龄老，而不是当前的文件）
                if (preg_match('/\.part$/', $file) && (filemtime($tmpfilePath) < time() - $maxFileAge)) {
                    @unlink($tmpfilePath);//删除重复（文件名字相同）的文件
                }
            }
            closedir($dir);

        }

        // Open temp file打开临时文件，即（如果没有{$filePath}.part这个文件，就创建一个）
        if (!$out = @fopen("{$filePath}.part", $chunks ? "ab" : "wb")) {
            $arr=["status"=>0,"msg"=>["code"=>102,"message"=>"打开输出流失败"]];
            return $arr;
        }

        if (!empty($_FILES)) {//如果multipart为true，则走这个条件
            //is_uploaded_file() 函数判断指定的文件是否是通过 HTTP POST 上传的
            if ($_FILES["file"]["error"] || !is_uploaded_file($_FILES["file"]["tmp_name"])) {
                $arr=["status"=>0,"msg"=>["code"=>103,"message"=>"无法移动上传的文件"]];
                return $arr;
            }

            // Read binary input stream and append it to temp file读取二进制输入流并将其追加到临时文件中
            if (!$in = @fopen($_FILES["file"]["tmp_name"], "rb")) {
                $arr=["status"=>0,"msg"=>["code"=>101,"message"=>"打开输入流失败"]];
                return $arr;
            }
        } else {//如果multipart为false，则走这个条件
            if (!$in = @fopen("php://input", "rb")) {
                $arr=["status"=>0,"msg"=>["code"=>101,"message"=>"打开输入流失败"]];
                return $arr;
            }
        }

        while ($buff = fread($in, 4096)) {//循环读取，一次读取一行内容(4096代表一行)
            fwrite($out, $buff);
        }

        @fclose($out);
        @fclose($in);

        // Check if file has been uploaded检查所以分块文件是否已全部被上传
        if (!$chunks || $chunk == $chunks - 1) {
            // Strip the temp .part suffix off关闭带有临时.part后缀的文件，并重命名

            $extArr = explode(".",$filePath);
            $ext = strtolower($extArr[count($extArr)-1]);
            $fileName = date("Y")."/".date("m")."/".date("d")."/".md5(date('YmdHis') . '_' . mt_rand(100, 999)).".".$ext;

//            $fileName = "aaa.mp4";

            rename("{$filePath}.part", "Uploads/".$fileName);
//            rename("{$filePath}.part", "D:/phpStudy/WWW/bim_project/Uploads/2017/".$fileName);

            $path = $fileName;

            $arr=["status"=>1,"msg"=>["code"=>99,"message"=>"上传成功",'path'=>$path,'ext'=>$ext]];
            return $arr;
        }

    }




}