<?php
namespace Api\Controller;
use Think\Controller;
class AreaController extends Controller {
    public function province_list(){
		$_type = I('get.type',1);
		$enet_lists = S('ENET360_PROVINCE_LISTS'.$_type);
		if(!$enet_lists){
			$this->_get_create_cache($_type);
			$enet_lists = S('ENET360_PROVINCE_LISTS'.$_type);
		}
		echo "var Province=".json_encode($enet_lists);
    }
	public function city_list(){
		$_type = I('get.type',1);
		$enet_lists = S('ENET360_CITY_LISTS'.$_type);
		if(!$enet_lists){
			$this->_get_create_cache($_type);
			$enet_lists = S('ENET360_CITY_LISTS'.$_type);
		}
		echo "var City=".json_encode($enet_lists);
	}
	public function district_list(){
		$_type = I('get.type',1);
		$enet_lists = S('ENET360_DISTRICT_LISTS'.$_type);
		if(!$enet_lists){
			$this->_get_create_cache($_type);
			$enet_lists = S('ENET360_DISTRICT_LISTS'.$_type);
		}
		/*
		if($enet_lists){
			echo "var District = new Array();";
			foreach($enet_lists as $k=>$v){
				echo "District[".$v['Id']."]=".json_encode($v).";";
			}
		}else{
			echo "var District=";
		}
		*/
		echo "var District=".json_encode($enet_lists).";";
	}
	/**
	 * 经销商服务商查询
	 * _type = 1 经销商
	 * _type = 2 服务商
	**/
	private function _get_create_cache($_type = 1){
		$d_type_array = M('MemberType')->cache(true,120)->field('id,name')->limit(20)->select();
		ArrayKey($d_type_array);
		$map['up_id'] = array('eq',1);
		$_db_area = M('Area');
		$lists = $_db_area->field('id,name')->where($map)->limit(100)->select();
		$enet_lists = array();
		$enet_city_lists = array();
		$enet_district_lists = array();
		if($lists){
			$_db_member = M('MemberData');
			if($_type == 1){
				$_map['role_id'] = array('eq',1);
				$_map['flag'] = array('like','%,j,%');
				$_map_['role_id'] = array('eq',1);
				$_map_['flag'] = array('like','%,j,%');
			}elseif($_type == 2){
				$_map['role_id'] = array('eq',2);
				$_map['flag'] = array('like','%,f,%');
				$_map_['role_id'] = array('eq',2);
				$_map_['flag'] = array('like','%,f,%');
			}
			foreach($lists as $k=>$v){
				$count = 0;
				$_map['province_id'] = array('eq',$v['id']);
				$c_lists = $_db_member->where($_map)->select();
				if(count($c_lists)>0){
					$enet_lists[] = array(
						'ProID'	=>	$v['id'],
						'ProName'	=>	$v['name'],
						'ProRemark'	=>	'省份',
						'count'	=>	count($c_lists)
					);
					
					// 经销商
					foreach($c_lists as $key=>$val){
						$enet_district_lists[] = array(
							"Id"		=>	$val['id'],
							"DealerSN"	=>	$val['dis_sn'],
							"DisName"	=>	$val['dis_name'],
							"CityID"	=>	$val['city_id'],
							"Tel"		=>	$val['tel'],
							"Sales_tel"	=>	$val['sales_tel'],
							"open_service"	=>	1,
							"Lng"		=>	$val['lng'],
							"Lat"		=>	$val['lat'],
							"Address"	=>	$val['area_address'],
							"Dealer_type"	=>	$val['role_id'],
							"DisSort"	=>	$d_type_array[$val['role_id']]['name']
						);
					}
					// 市
					$city_map['up_id'] = array('eq',$v['id']);
					$city_lists = $_db_area->field('id,name')->where($city_map)->limit(100)->select();
					if($city_lists){
						foreach($city_lists as $kk=>$vv){
							$city_count = 0;
							$_map_['city_id'] = array('eq',$vv['id']);
							$d_count = $_db_member->where($_map_)->count();
							if($d_count){
								$enet_city_lists[] = array(
									'ProID'	=>	$v['id'],
									'CityName'	=>	$vv['name'],
									'CityID'	=>	$vv['id'],
									'num'	=>	$d_count,
								);
							}else{
								unset($city_lists[$kk]);
							}
						}
					}
					
				}else{
					unset($lists[$k]);
				}
			}
		}
		S('ENET360_PROVINCE_LISTS'.$_type,$enet_lists,120);
		S('ENET360_CITY_LISTS'.$_type,$enet_city_lists,120);
		S('ENET360_DISTRICT_LISTS'.$_type,$enet_district_lists,120);
	}
}