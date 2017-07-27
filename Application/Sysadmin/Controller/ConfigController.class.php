<?php
namespace Sysadmin\Controller;
use Think\Controller;
class ConfigController extends CommonController{
	public $config_type = array();
	public function __construct() {
		parent::__construct();
		$this->config_type = array(
			'1'=>array('id'=>'1','name'=>'站点配置'),
//			'2'=>array('id'=>'2','name'=>'地图配置'),
			// '3'=>array('id'=>'3','name'=>'微信配置'),
			// '4'=>array('id'=>'4','name'=>'短信配置'),
			 '5'=>array('id'=>'5','name'=>'邮件配置'),
		);
	}
/**
 * 查看编辑系统配置项
 * 同时更新配置文件config文件的内容
 * 
 * text 单行文本
 * select
 * image
 * url
 * textarea
 * bool
 * 
**/	
	public function index(){
		$where['isshow'] = array('eq',1);
		$list = M('Config')->where($where)->order('sort asc, id asc')->select();
		
		foreach($list as $k=>$v){
			if (get_magic_quotes_gpc()){
				$v['content'] = stripslashes($v['content']);
			}
			
			$k = $k+1;
			if($v['input']=='text'){	// text	单行文本
				$lists[$v['type']][$k]=$v;
				$lists[$v['type']][$k]['form']='<input 
					class="form-control form-control-inline input-medium" 
					size="16" 
					type="text" 
					name="content_'.$v['id'].'" 
					id="cfg_'.$v['id'].'"
					value="'.$v['content'].'"/>';

			}elseif($v['input']=='textarea'){	// textarea	多行文本
				$lists[$v['type']][$k]=$v;
				$lists[$v['type']][$k]['form']='<textarea 
				rows="5" 
				cols="60" 
				class="form-control" 
				name="content_'.$v['id'].'
				id="cfg_'.$v['id'].'">'.$v['content'].'</textarea>';
//				value="'.$v['content'].'">'.$v['content'].'</textarea>';
//				name="info">'.$v['content'].'</textarea>';

			}elseif($v['input']=='image'){	// image	图片
				$lists[$v['type']][$k]=$v;
				$lists[$v['type']][$k]['form']='<div class="input-group m-bot15"><input type="text" 
				class="form-control" 
				name="content_'.$v['id'].'"
				id="content_'.$v['id'].'_input"
				value="'.$v['content'].'"><span class="input-group-btn"><button class="btn btn-default enet360_upload_images" 
				var_id="content_'.$v['id'].'" type="button">上传</button></span></div><div class="fileupload fileupload-new"><div class="fileupload-new thumbnail" style="max-width: 100%; height: 150px;"><img 
				id="content_'.$v['id'].'_img"
				src="'.$v['content'].'" 
				style="max-height: 100%;" height="100%" /></div></div>';
					
			}elseif($v['input']=='bool'){	// bool	布尔(Y/N) 
				$lists[$v['type']][$k]=$v;
				$checked=$v['content'] ? $v['content'] : 0;

				$lists[$v['type']][$k]['form']='<div class="radio"><label><input 
				name="content_'.$v['id'].'"
				value="1" type="radio"  '.$this->radiobool(1,$checked).' >开启</label></div>
				<div class="radio"><label><input 
				name="content_'.$v['id'].'"
				value="0" type="radio"  '.$this->radiobool(0,$checked).' >关闭</label></div><br>';
		
			}
		}
		// dump($lists);
		$this->assign('lists',$lists);
		$menu_show[0] = 'config';
		$menu_show[1] = 'index';
		$this->assign('menu_show',$menu_show);
		$this->assign('config_type',$this->config_type);
		$this->display();	
		
	}
	public function edit(){
	    if(IS_POST){

			$System=D('Config');
			foreach($_POST as $k => $v){
				$arr_id = explode('_',$k);
				$savedata[$arr_id['0']] = $v;
				$savedata['optime'] = time();
				$map['id'] = array('eq',$arr_id['1']);
				$System->where($map)->save($savedata);
			}
			$this->ReWriteConfig();
			$this->success("系统设置修改成功",U('index'));
		}
	}
/**
 * 更新配置文件config文件的内容
**/
	private	function ReWriteConfig(){
		$Config=D('Config');
		if(!is_writeable(CONF_PATH.'sysconfig.php')){
			$this->error("配置文件".CONF_PATH."sysconfig.php'不支持写入，无法修改系统配置参数！",'__ACTION__');
		}
		$datalists=$Config->order('id asc')->select();
		foreach($datalists as $datalist){
			$data[$datalist['cfg']]=$datalist['content'];
		}
		F('sysconfig',$data,CONF_PATH);
	}
	private function radiobool($v,$t){
		if($v==$t)
			return 'checked';
		else
			return '';
	}
}
?>