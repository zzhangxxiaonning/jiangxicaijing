<?php
namespace Sysadmin\Controller;
use Think\Controller;
class IndexController extends CommonController {
    public function index(){
		$menu_show[0] = 'index';
        $menu_show[1] = 'index';
		$this->assign('menu_show',$menu_show);
        $this->display();
    }
	public function clear_cache(){
		$this->deletecache();
		$this->success('系统缓存清除成功！<script>window.close();top.topManager.closePage();</script>');  
	}
    public function onlogin(){
        cookie('ADMIN_ID',null);
        cookie('ADMIN_LOGIN_IP',null);
        cookie('ADMIN_LOGIN_TIME',null);
        $this->redirect('Public/index', array());
    }
/**
 * 清除缓存
**/
	protected function deletecache(){
		//清文件缓存
		$dirs = array(RUNTIME_PATH);
		if(file_exists(RUNTIME_PATH)){
			@mkdir(RUNTIME_PATH,0777,true);
			//清理缓存
			foreach($dirs as $value) {
				$this->rmdirr($value);
			}
		}
	}
/**
 * 循环删除缓存文件
**/
	protected function rmdirr($dirname){
		if(!file_exists($dirname)){
			return false;
		}
		if(is_file($dirname) || is_link($dirname)){
			return unlink($dirname);
		}
		$dir = dir($dirname);
		if($dir){
			while(false !== $entry = $dir->read()){
				if($entry == '.' || $entry == '..') {
					continue;
				}
				//递归
				$this->rmdirr($dirname . DIRECTORY_SEPARATOR . $entry);
			}
		}
		$dir->close();
		return rmdir($dirname);
	}
}