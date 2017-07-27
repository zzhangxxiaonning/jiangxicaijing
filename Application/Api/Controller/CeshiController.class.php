<?php
namespace Api\Controller;
use Think\Controller;
class CeshiController extends Controller {
	public function area_poi(){
		$p = I('p',1);
		$lists = M('MemberData')->page($p.',1')->select();
		if($lists){
			foreach($lists as $k=>$v){
				$area_address = $v['area_address'];
				$area_address = preg_replace("/ E--4/is", "", $area_address);
				// $area_address = preg_replace("/52#/is", "", $area_address);
				$area_address = preg_replace("/ 20米规划路南侧（姐勒轻工业园区）/is", "", $area_address);
				$area_address = preg_replace("/（瑞丰物流C3#-110）/is", "", $area_address);
				$area_address = preg_replace("/#/",'',$area_address);
				$area_address = preg_replace("/\s+/",'',$area_address);
				$poi = $this->_curl_zuobiao($area_address);
				$are = $this->_curl_area($poi);
				dump($are);
				dump($poi);
				$sav_da['update_time'] = time();
				$sav_da['lat'] = $poi['lat'];
				$sav_da['lng'] = $poi['lng'];
				$sav_da['province_id']	= $this->_get_data_area_name($are['sheng']);
				$sav_da['city_id'] 		= $this->_get_data_area_name($are['shi']);
				$sav_da['area_id']		= $this->_get_data_area_name($are['qu']);
				
				
				dump($sav_da);
				$aaa = M('MemberData')->where(array('id'=>array('eq',$v['id'])))->save($sav_da);
				if($aaa){
					$this->redirect('area_poi', array('p' => ($p+1)), 1, '页面跳转中...');
				}else{
					echo M()->getLastsql();exit;
				}
			}
		}
	}
	private function _curl_zuobiao($name){
		$urk = 'http://api.map.baidu.com/geocoder/v2/?address='.$name.'&output=json&ak=ByYQ9wzNaI5w8mZpfc7GuChSeYpnLZoL';
		$data = $this->_curl_get($urk);
		echo $urk;
		$json = json_decode($data,true);
		print_r($json['result']);
		if($json['status'] == 0){
			return array('lng'=>$json['result']['location']['lng'],'lat'=>$json['result']['location']['lat']);
		}else{
			echo $urk;
			echo '<br>';
			echo $data;
			exit;
		}
		
		// {"status":0,"result":{"location":{"lng":116.30815063007148,"lat":40.056890127931279},"precise":1,"confidence":80,"level":"道路"}}
	}
	private function _curl_area($poi){
		$urk = 'http://api.map.baidu.com/geocoder/v2/?location='.$poi['lat'].','.$poi['lng'].'&output=json&pois=1&ak=ByYQ9wzNaI5w8mZpfc7GuChSeYpnLZoL';
		$data = $this->_curl_get($urk);
		$json = json_decode($data,true);
		if($json['status'] == 0){
			// dump($json['result']['addressComponent']);
			return array(
				'sheng'=>$json['result']['addressComponent']['province'],
				'shi'=>$json['result']['addressComponent']['city'],
				'qu'=>$json['result']['addressComponent']['district'],
			);
			// return array('lng'=>$json['result']['location']['lng'],'lat'=>$json['result']['location']['lat']);
		}else{
			echo $urk;
			echo '<br>';
			echo $data;
			exit;
		}
		
		// {"status":0,"result":{"location":{"lng":40.05689012793136,"lat":74.00002218455095},"formatted_address":"","business":"","addressComponent":{"country":"","country_code":0,"province":"","city":"","district":"","adcode":"0","street":"","street_number":"","direction":"","distance":""},"pois":[],"poiRegions":[],"sematic_description":"","cityCode":0}}
	}
	private function _curl_get($url){
		$ch = curl_init();
		//设置选项，包括URL
		curl_setopt($ch, CURLOPT_URL,$url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		//执行并获取HTML文档内容
		$output = curl_exec($ch);
		//释放curl句柄
		curl_close($ch);
		//打印获得的数据
		return $output;
	}
    public function jingxiaoshang(){
		$p = I('p',1);
		$lists = M('Jxs')->page($p.',1')->select();
		// dump($lists);exit;
		if($lists){
			$_member = M('Member');
			$_memberdata = M('MemberData');
			foreach($lists as $k=>$v){

				$add_m['username'] = $v['sn'];
				$add_m['password'] = md5('enet360');
				$add_m['role_id'] = 1;
				$add_m['status'] = 1;
				$add_m['update_time'] = time();
				$add_m['create_time'] = time();
				
				$ret_id = $_member->add($add_m);
				if($ret_id){
					$add_d['m_id'] = $ret_id;
					$add_d['flag'] = ',j,';
					$add_d['role_id'] = '1';
					$add_d['dis_name'] = $v['name'];
					$add_d['dis_sn'] = $v['sn'];
					$add_d['tel'] = $v['tel'];
					$add_d['sales_tel'] = $v['tel'];
					$add_d['province_id'] = $this->_get_data_area_name($v['sheng']);
					$add_d['city_id'] = '';
					$add_d['area_id'] = '';
					$add_d['area_address'] = $v['address'];
					$add_d['lng'] = '';
					$add_d['lat'] = '';
					$add_d['update_time'] = time();
					
					$ret_d_id = $_memberdata->add($add_d);
					if($ret_d_id){
						$this->redirect('jingxiaoshang', array('p' => ($p+1)), 1, '页面跳转中...');
					}else{
						echo M()->getLastsql();
						
						$_member->where('id = '.$ret_id)->delete();
						exit;
					}
				}else{
					echo M()->getLastsql();exit;
				}
			}
		}
    }
	public function fuwushang(){
		$p = I('p',1);
		$lists = M('Fws')->page($p.',1')->select();
		// dump($lists);exit;
		if($lists){
			$_member = M('Member');
			$_memberdata = M('MemberData');
			foreach($lists as $k=>$v){

				$add_m['username'] = $v['sn'];
				$add_m['password'] = md5('enet360');
				$add_m['role_id'] = 2;
				$add_m['status'] = 1;
				$add_m['update_time'] = time();
				$add_m['create_time'] = time();
				
				$ret_id = $_member->add($add_m);
				if($ret_id){
					$add_d['m_id'] = $ret_id;
					$add_d['flag'] = ',f,';
					$add_d['role_id'] = '2';
					$add_d['dis_name'] = $v['name'];
					$add_d['dis_sn'] = $v['sn'];
					$add_d['tel'] = $v['tel'];
					$add_d['sales_tel'] = $v['tel'];
					$add_d['province_id'] = $this->_get_data_area_name($v['sheng']);
					$add_d['city_id'] = '';
					$add_d['area_id'] = '';
					$add_d['area_address'] = $v['address'];
					$add_d['lng'] = '';
					$add_d['lat'] = '';
					$add_d['update_time'] = time();
					
					$ret_d_id = $_memberdata->add($add_d);
					if($ret_d_id){
						$this->redirect('fuwushang', array('p' => ($p+1)), 1, '页面跳转中...');
					}else{
						echo M()->getLastsql();
						
						$_member->where('id = '.$ret_id)->delete();
						exit;
					}
				}else{
					echo M()->getLastsql();exit;
				}
			}
		}
    }
	private function _get_data_area_name($name){
		if(!$name){
			echo 'xxxx';exit;
		}
		
		$name = preg_replace("/甘孜藏族自治州/is", "甘孜", $name);
		$name = preg_replace("/西双版纳傣族自治州/is", "西双版纳", $name);
		$name = preg_replace("/文山壮族苗族自治州/is", "文山", $name);
		$name = preg_replace("/石林彝族自治县/is", "石林", $name);
		$name = preg_replace("/红河哈尼族彝族自治州/is", "红河", $name);
		$name = preg_replace("/德宏傣族景颇族自治州/is", "德宏", $name);
		$name = preg_replace("/白族自治州/is", "", $name);
		$name = preg_replace("/伊犁哈萨克自治州/is", "伊犁", $name);
		$name = preg_replace("/阿克苏地区/is", "阿克苏", $name);
		$name = preg_replace("/地区/is", "", $name);
		$name = preg_replace("/哈密地区/is", "哈密", $name);
		$name = preg_replace("/喀什地区/is", "喀什", $name);
		$name = preg_replace("/维吾尔自治区/is", "", $name);
		$name = preg_replace("/维吾尔自治区/is", "", $name);
		$name = preg_replace("/西藏自治区/is", "西藏", $name);
		$name = preg_replace("/内蒙古自治区/is", "内蒙古", $name);
		$name = preg_replace("/彝族自治州/is", "", $name);
		$name = preg_replace("/蒙古族藏族自治州/is", "", $name);
		$name = preg_replace("/回族自治区/is", "", $name);
		$name = preg_replace("/朝鲜族自治州/is", "", $name);
		$name = preg_replace("/蒙古族自治县/is", "", $name);
		$name = preg_replace("/壮族自治区/is", "", $name);
		$name = preg_replace("/碧江区/is", "铜仁市", $name);
		$name = preg_replace("/布依族苗族自治州/is", "", $name);
		$name = preg_replace("/土家族苗族自治县/is", "", $name);
		$name = preg_replace("/土家族苗族自治州/is", "", $name);
		$name = preg_replace("/苗族侗族自治州/is", "", $name);
		$name = preg_replace("/七星关区/is", "毕节市", $name);
		$name = preg_replace("/省/is", "", $name);
		$name = preg_replace("/市/is", "", $name);
		$name = preg_replace("/辖区/is", "", $name);
		$name = preg_replace("/区/is", "", $name);
		$name = preg_replace("/县/is", "", $name);
		// exit;
		$map['name'] = array('like',$name.'%');
		$in = M('Area')->where($map)->find();
		if($in){
			// echo $name.' - '.$in['id'];
			return $in['id'];
		}else{
			echo M()->getLastsql();exit;
		}
	}
	
}