<?php
namespace App\Controller;
use Think\Controller;
class CircleController extends CommonController {
    public function __construct(){
        parent::__construct();
    }

    /*
     * 科研项目详情页
     *
     * */
    public function index(){

        $id = I('post.id',0);
        $mid = I('post.mid',0);
        $time = time();

        $map['id'] = array('eq',$id);
        $map['status'] = array('eq',1);
        $info=_Finds(M('Circle'),$map,'id,title,info,cat_id,rank_id,thumb,start_time,end_time,nums,content,files,create_time');
        if($info){
            $info['cat_name'] = $this->cat_name(M('Circat'),$info['cat_id']); //分类名称
            $info['rank_name'] = $this->cat_name(M('Cirattr'),$info['rank_id']);//级别名称

            $info['start_time'] = date('Y-m-d H:i',$info['start_time']);
            $info['end_time'] = date('Y-m-d H:i',$info['end_time']);
            $info['create_time'] = date('Y-m-d H:i',$info['create_time']);
            $info['thumb'] = C('BASE_URL').$info['thumb'];
            $info['files'] = C('BASE_URL').$info['files'];

            $map_ord['aid'] = array('eq',$info['id']);
            $map_ord['type'] = array('eq',1);
            $map_ord['pay_is'] = array('neq',0);
            $info['order_count'] = _Numbers(M('Order'),$map_ord); //报名数

            $map_col['aid'] = array('eq',$info['id']);
            $map_col['type'] = array('eq',1);
            $info['order_count'] = _Numbers(M('Collect'),$map_col); //收藏数
            if($mid){
                $map_col['mid'] = array('eq',$mid);
                $info['is_collect'] = _Numbers(M('Collect'),$map_col)?1:0;//是否收藏

                $map_col['pay_is'] = array('neq',0);
                $info['is_order'] = _Numbers(M('Order'),$map_col)?1:0;//是否已报名
            }


            //活动标签
            $data = flag($info['start_time'],$time,$info['end_time']);
            $info['flag_code'] = $data['flag_code'];
            $info['flag'] = $data['flag'];

            $json['retcode'] = '0';
            $data = array(
                'info' => $info,
            );

            $json['data'] = $data;
        }else{
            $json['retcode'] = '-3';
            $json['errmsg'] = '数据不存在';
        }

        $this->ajaxReturn($json);

	}

	/*
	 *
	 * 发送邮件
	 * 下载科研项目申请书
	 * ios设备需要发送邮件
	 * */
	public function send_circle_file(){

	    $id = I('post.id',0);   //科研项目ID
        $mid = I('post.mid',0); //用户ID
        $email = I('post.email',0); //收件人邮箱

        if($email){
            if(isEmail($email)){
                $map['id'] = array('eq',$id);
                $info = _Finds(M('Circle'),$map,'');

                $title = '申请书下载';
                $content = '请下载'.$info['title'].'的科研项目<a href="'.C('BASE_URL').$info['files'].'" target="_blank">申请书</a>';

                $send = sendMail($email,$title,$content);
                if($send){
                    $json['retcode'] = '100';
                    $json['sucmsg'] = '邮件发送成功';

                    $data['mid'] = $mid;
                    $data['email'] = $email;
                    $data['title'] = $title;
                    $data['content'] = $content;
                    $data['create_time'] = time();
                    M('Send') -> add($data);

                }else{
                    $json['retcode'] = '101';
                    $json['errmsg'] = '邮件发送失败';
                }

            }else{
                $json['retcode'] = '102';
                $json['errmsg'] = '邮箱格式不正确';

            }
        }else{
            $json['retcode'] = '103';
            $json['errmsg'] = '请输入邮箱';
        }

        $this -> ajaxReturn($json);

    }



}