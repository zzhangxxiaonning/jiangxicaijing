<?php
namespace Home\Controller;
use Think\Controller;
vendor('WxPayPubHelper.WxPayPubHelper');
class AjaxjsonController extends CommonController{
	public function __construct() {
		parent::__construct();
	}

    //post 获取地区的联动菜单
    public function post_area(){

        if(IS_POST){

            $area= $this->getArea(I('area_id'));
            $this->ajaxReturn($area);
        }
    }



	//定时查询注册扫码支付是否支付成功，支付成功加入缓存，跳转用户中心页
	public function refresh(){

	    $id = I('post.id'); //用户ID
        $Member = M('Member');
        if(IS_POST){
            $map['id'] = array('eq',$id);
            $info = $Member -> where($map) -> find();
            if($info['transaction_id']){
                $json['status'] = 1;
                $json['info'] = '支付成功，请登录成功后进入个人中心绑定手机号登陆';
                session('memberid',$info['id']);
                if(cookie('url_go')){
                    $json['url'] = cookie('url_go').'.html';
                }else{
                    $json['url'] = U('Index/index');
                }
				$this->ajaxReturn($json);
            }

            
        }
    }
	
	//收藏
    public function collect(){

        $Collect = M('Collect');
        if(IS_POST){

            $uid = I('post.uid'); //用户ID
            $aid = I('post.aid'); //文章ID
            $type = I('post.type'); //点赞类型
            $cat_id = I('post.cat_id'); //文章分类
			
            $map['aid'] = array('eq',$aid);
            $map['type'] = array('eq',$type);
            $map['uid'] = array('eq',$uid);
            $map['cat_id'] = array('eq',$cat_id);
            $count = $Collect -> where($map) -> count();
            if($count){
                $json['status'] = 0;
                $json['info'] = '您已经收藏过';
            }else{

                $data['uid'] = $uid;
                $data['type'] = $type;
                $data['aid'] = $aid;
                $data['cat_id'] = $cat_id;
                $data['create_time'] = time();

                $info = $Collect -> add($data);
                if($info){
                    $json['status'] = 1;
                    $json['info'] = '收藏成功';

                    $map_count['aid'] = array('eq',$aid);
                    $map_count['type'] = array('eq',$type);
                    $map_count['cat_id'] = array('eq',$cat_id);
                    $count_collect = _Numbers($Collect,$map_count);//被收藏数量
                    $json['collect_count'] = $count_collect?$count_collect:0;

                }else{
                    $json['status'] = 0;
                    $json['info'] = '收藏失败';
                }
            }
            $this->ajaxReturn($json);
        }
    }



    //取消收藏
    public function cancel_collect(){

        $Collect = M('Collect');
        if(IS_POST){

            $aid = I('post.aid'); //文章ID
            $type = I('post.type'); //点赞类型
            $cat_id = I('post.cat_id'); //文章分类
            $uid = I('post.uid'); //用户ID

            $map['aid'] = array('eq',$aid);
            $map['type'] = array('eq',$type);
            $map['uid'] = array('eq',$uid);
            $map['cat_id'] = array('eq',$cat_id);

            $count = $Collect -> where($map) -> limit(1)->delete();
            if($count){
                $json['status'] = 1;
                $json['info'] = '取消成功';

                $map_count['aid'] = array('eq',$aid);
                $map_count['type'] = array('eq',$type);
                $map_count['cat_id'] = array('eq',$cat_id);
                $count_collect = _Numbers($Collect,$map_count);//被收藏数量
                $json['collect_count'] = $count_collect?$count_collect:0;
            }else{
                $json['status'] = 0;
                $json['info'] = '取消失败';
            }
            $this->ajaxReturn($json);
        }
    }

	
	//点赞
    public function thumbs(){

        $ThumbsUp = M('ThumbsUp');
        if(IS_POST){

            $uid = I('post.uid'); //用户ID
            $aid = I('post.aid'); //文章ID
            $type = I('post.type'); //点赞类型

            $map['aid'] = array('eq',$aid);
            $map['type'] = array('eq',$type);
            $map['uid'] = array('eq',$uid);
            $count = $ThumbsUp -> where($map) -> count();
            if($count){
                $json['status'] = 0;
                $json['info'] = '您已经点赞过';
            }else{

                $data['uid'] = $uid;
                $data['type'] = $type;
                $data['aid'] = $aid;
                $data['create_time'] = time();

                $info = $ThumbsUp -> add($data);
                if($info){
                    $json['status'] = 1;
                    $json['info'] = '点赞成功';

                    $map_count['aid'] = array('eq',$aid);
                    $map_count['type'] = array('eq',$type);
                    $json['thumbs_count'] = _Numbers(M('ThumbsUp'),$map_count);//被点赞数量

                }else{
                    $json['status'] = 0;
                    $json['info'] = '点赞失败';
                }
            }
            $this->ajaxReturn($json);
        }
    }

    //取消点赞
    public function cancel_thumbs(){

        $ThumbsUp = M('ThumbsUp');
        if(IS_POST){

            $aid = I('post.aid'); //文章ID
            $type = I('post.type'); //点赞类型
            $uid = I('post.uid'); //用户ID

            $map['aid'] = array('eq',$aid);
            $map['type'] = array('eq',$type);
            $map['uid'] = array('eq',$uid);
            $count = $ThumbsUp -> where($map) -> limit(1) -> delete();
            if($count){
                $json['status'] = 1;
                $json['info'] = '取消成功';

                $map_count['aid'] = array('eq',$aid);
                $map_count['type'] = array('eq',$type);
                $json['thumbs_count'] = _Numbers(M('ThumbsUp'),$map_count);//被点赞数量
            }else{
                $json['status'] = 0;
                $json['info'] = '取消失败';
            }
            $this->ajaxReturn($json);
        }
    }

    //下载
    public function down(){

        $DownHistory = M('DownHistory');
        if(IS_POST){

            $uid = I('post.uid'); //用户ID
            $aid = I('post.aid'); //文章ID
            $type = I('post.type'); //下载类型
            $cat_id = I('post.cat_id'); //文章分类

            $map['aid'] = array('eq',$aid);
            $map['type'] = array('eq',$type);
            $map['uid'] = array('eq',$uid);
            $map['cat_id'] = array('eq',$cat_id);
            $count = $DownHistory -> where($map) -> count();
            if($count){
                $json['status'] = 0;
                $json['info'] = '您已经下载过';
            }else{

                $data['uid'] = $uid;
                $data['type'] = $type;
                $data['aid'] = $aid;
                $data['cat_id'] = $cat_id;
                $data['create_time'] = time();

                $info = $DownHistory -> add($data);
                if($info){
                    $json['status'] = 1;
                    $json['info'] = '下载成功';

                    $map_count['aid'] = array('eq',$aid);
                    $map_count['type'] = array('eq',$type);
                    $map_count['cat_id'] = array('eq',$cat_id);
                    $json['down_count'] = _Numbers($DownHistory,$map_count);//被下载数量

                }else{
                    $json['status'] = 0;
                    $json['info'] = '下载失败';
                }
            }
            $this->ajaxReturn($json);
        }
    }

    //删除下载--个人中心文库
    public function del_down(){

        $DownHistory = M('DownHistory');
        if(IS_POST){

            $uid = I('post.uid'); //用户ID
            $aid = I('post.aid'); //文章ID
            $type = I('post.type'); //下载类型
            $cat_id = I('post.cat_id'); //文章分类

            $map['uid'] = array('eq',$uid);
            $map['type'] = array('eq',$type);
            $map['aid'] = array('eq',$aid);
            $map['cat_id'] = array('eq',$cat_id);

            $info = $DownHistory -> where($map) -> limit(1) -> delete();
            if($info){
                $json['status'] = 1;
                $json['info'] = '删除成功';

            }else{
                $json['status'] = 0;
                $json['info'] = '删除失败';
            }

            $this->ajaxReturn($json);
        }
    }

    //删除我的上传--个人中心文库
    public function del_lirary_my(){

        $Library = M('Library');
        if(IS_POST){

            $uid    = I('post.uid'); //用户ID
            $id     = I('post.id'); //文章ID
            $cat_id = I('post.cat_id'); //文章分类

            $map['uid']    = array('eq',$uid);
            $map['id']     = array('eq',$id);
            $map['cat_id'] = array('eq',$cat_id);

            $info = $Library -> where($map) -> limit(1) -> delete();
            if($info){
                $json['status'] = 1;
                $json['info'] = '删除成功';

            }else{
                $json['status'] = 0;
                $json['info'] = '删除失败';
            }

            $this->ajaxReturn($json);
        }
    }

    //删除我的上传--个人中心作品
    public function del_article_my(){

        $Article = M('Article');
        if(IS_POST){

            $uid    = I('post.uid'); //用户ID
            $id     = I('post.id'); //文章ID
            $cat_id = I('post.cat_id'); //文章分类

            $map['uid']    = array('eq',$uid);
            $map['id']     = array('eq',$id);
            $map['cat_id'] = array('eq',$cat_id);

            $info = $Article -> where($map) -> limit(1) -> delete();
            if($info){
                $json['status'] = 1;
                $json['info'] = '删除成功';
                $json['url'] = U('Member/article');//个人中心作品详情页

            }else{
                $json['status'] = 0;
                $json['info'] = '删除失败';
            }

            $this->ajaxReturn($json);
        }
    }

    //删除文库--个人中心收藏
    public function del_collect(){

        $Collect = M('Collect');
        if(IS_POST){

            $uid = I('post.uid'); //用户ID
            $aid = I('post.aid'); //文章ID
            $type = I('post.type'); //下载类型
            $cat_id = I('post.cat_id'); //文章分类

            $map['uid'] = array('eq',$uid);
            $map['type'] = array('eq',$type);
            $map['aid'] = array('eq',$aid);
            $map['cat_id'] = array('eq',$cat_id);

            $info = $Collect -> where($map) -> limit(1) -> delete();
            if($info){
                $json['status'] = 1;
                $json['info'] = '删除成功';

            }else{
                $json['status'] = 0;
                $json['info'] = '删除失败';
            }

            $this->ajaxReturn($json);
        }
    }

    //获取地区列表
    public function getareas(){

        $Area = M('Area');
        if(IS_POST){
            $up_id = I('post.id'); //省ID
            $map['up_id'] = array('eq',$up_id);
            $area = _Selects($Area,$map,'','id desc');
            if($area){
                $this->ajaxReturn($area);
            }
        }

    }

    //更新用户资料
    public function members(){
        $Member = M('Member');
        if(IS_POST){

            $id       = I('post.uid'); //用户ID
            $nickname = I('post.nickname'); //昵称
            $phone    = I('post.phone'); //手机号
            $sex      = I('post.sex'); //性别
            $province = I('post.province'); //性别
            $city     = I('post.city'); //性别
            $area     = I('post.area'); //性别
            $thumb    = I('post.thumb'); //头像
            $info     = I('post.info'); //介绍信息
//            echo json_encode(I('post.thumb'));exit;
            $map['id'] = array('eq',$id);
            $data['nickname']    = $nickname;
            $data['phone']       = $phone;
            $data['sex']         = $sex;
            $data['province']    = $province;
            $data['city']        = $city;
            $data['area']        = $area;
            $data['thumb']       = $thumb;
            $data['info']        = $info;
            $data['update_time'] = time();
            $info = $Member -> where($map) -> save($data);
            F('aa',M()->getLastSql());
            if($info){
                $json['status'] = 1;
                $json['info'] = '修改成功';

            }else{
                $json['status'] = 0;
                $json['info'] = '修改失败';
            }

            $this->ajaxReturn($json);
        }

    }

    /*
     * 添加校园竞赛小组组员
     * 通过手机号查找组员
     *
     * */
    public function team(){
        $Member = M('Member');
        if(IS_POST){

            $phone       = I('post.phone'); //用户手机号
            $map['phone'] = array('eq',$phone);
            $info = $Member -> where($map) -> find();
            if($info['id'] == $this->MEMBER_ID){
                $json['status'] = 0;
                $json['info'] = '不可以添加自己';
            }else{
                if($info){
                    $json['status'] = 1;
                    $json['data'] = $info;

                }else{
                    $json['status'] = 0;
                    $json['info'] = '暂无此手机号';
                }
            }

            $this->ajaxReturn($json);
        }

    }

    /*
     * 添加校园竞赛小组组员
     * 添加进订单表
     * 添加成功后给自用户发送一个站内信说明
     *
     * */
    public function teams(){
        $Order = M('Order');
        if(IS_POST){

            $id         = I('post.id'); //添加组员ID
            $aid        = I('post.aid'); //校园竞赛ID

            $map['aid'] = array('eq',$aid);
            $map['uid'] = array('eq',$this->MEMBER_ID);

            $info = $Order -> where($map) -> find();

            if($info['team']){

            }else{

            }


            if($info['team']){
                $team = explode(',',$info['team']);
                if(in_array($id,$team)){

                    $json['status'] = 0;
                    $json['info'] = '该组员已存在';
                    $this->ajaxReturn($json);exit;
                }else{
                    $data['team'] = $info['team'].','.$id;
                }

            }else{
                $data['team'] = $id;
            }

            $datas = $Order -> where($map) ->save($data);

            if($datas){
                $json['status'] = 1;
                $json['info'] = '添加成功';

                //列表页动态添加组员
                $map_g['id'] = array('eq',$id);
                $g_name = M("Member") -> where($map_g) -> find();
                $json['thumb']    = $g_name['thumb'];
                $json['id']       = $g_name['id'];
                $json['nickname'] = $g_name['nickname'];

                $arr['mem_id']  = $id;
                $arr['aid']     = $aid;
                $arr['send_id'] = $this->MEMBER_ID;
                $arr['mtype']   = 2;
                $arr['type']    = 1;

                //用户名
                $map_mem['id'] = array('eq',$this->MEMBER_ID);
                $mem = M('Member') -> where($map_mem) -> find();

                //竞赛名
                $map_act['id'] = array('eq',$aid);
                $act = M('Activity') -> where($map_act) -> find();

                $arr['content'] = $mem['nickname'].'邀请您加入水上运动小组一起参加“'.$act['title'].'”';
                $arr['create_time'] = time();
                M('Mail') -> add($arr);

            }else{
                $json['status'] = 0;
                $json['info'] = '添加失败';
            }


            $this->ajaxReturn($json);
        }

    }

    //删除组员
    public function del_team(){
        $Order = M('Order');
        if(IS_POST){

            $id         = I('post.id'); //组员ID
            $aid        = I('post.aid'); //校园竞赛ID

            $map['aid'] = array('eq',$aid);
            $map['uid'] = array('eq',$this->MEMBER_ID);

            $info = $Order -> where($map) -> find();
            $team = explode(',',trim($info['team'],','));

            $team = array_remove($team,$id);
            $data['team'] = implode(',',$team);

            $info = $Order -> where($map) -> save($data);
            if($info){
                $json['status'] = 1;
                $json['info'] = '删除成功';
            }else{
                $json['status'] = 0;
                $json['info'] = '删除失败';
            }
            $this->ajaxReturn($json);

        }

    }


    //删除作品
    public function del_img(){
        $Work = M('Work');
        if(IS_POST){

            $img         = I('post.img'); //图片地址
            $aid        = I('post.aid'); //校园竞赛ID

            $map['aid'] = array('eq',$aid);
            $map['uid'] = array('eq',$this->MEMBER_ID);

            $info = $Work -> where($map) -> find();
            $imgs = explode(',',trim($info['img'],','));

            $imgs = array_remove($imgs,$img);
            $data['img'] = implode(',',$imgs);

            $info = $Work -> where($map) -> save($data);
            if($info){
                $json['status'] = 1;
                $json['info'] = '删除成功';
            }else{
                $json['status'] = 0;
                $json['info'] = '删除失败';
            }
            $this->ajaxReturn($json);

        }

    }


    //添加作品
    public function add_img(){
        $Work = M('Work');
        if(IS_POST){

            $img         = I('post.url'); //图片地址
            $aid        = I('post.aid'); //校园竞赛ID
            $uid        = I('post.uid'); //校园竞赛ID

            $map['aid'] = array('eq',$aid);
            $map['uid'] = array('eq',$uid);

            $info = $Work -> where($map) -> find();
            if($info){
                $imgs = trim($info['img']).','.$img;
            }else{

                $data['aid'] = $aid;
                $data['uid'] = $uid;
                $datas = $Work -> add($data);
//                echo json_encode($datas);
                $imgs = $img;
            }

            $data['img'] = $imgs;
            $infos = $Work -> where($map) -> save($data);
            if($infos){
                $json['status'] = 1;
                $json['info'] = '添加成功';
            }else{
                $json['status'] = 0;
                $json['info'] = '添加失败';
            }
            $this->ajaxReturn($json);

        }

    }

    //查询已有作品
    public function act_img(){
        $Work = M('Work');
        if(IS_POST){

            $aid        = I('post.aid'); //校园竞赛ID
            $uid        = $this->MEMBER_ID; //用户ID

            $map['aid'] = array('eq',$aid);
            $map['uid'] = array('eq',$uid);

            $info = $Work -> where($map) -> find();
            if($info){
                $img = String2Array(trim($info['img'],','));
                $json['img'] = $img;
                $json['img_count'] = count($img);
            }

            $this->ajaxReturn($json);

        }

    }

    //查询已有组员
    public function act_group(){

        $Order = M('Order');
        if(IS_POST){

            $aid        = I('post.aid'); //校园竞赛ID
            $uid        = $this->MEMBER_ID; //用户ID

            $map['aid'] = array('eq',$aid);
            $map['uid'] = array('eq',$uid);
            $info = $Order -> where($map) -> find();
            //组长和组员信息
            if($info['team']){
                $guid = $info['uid'].','.trim($info['team'],',');
            }else{
                $guid = $info['uid'];
            }
            $guid_g = explode(',',$guid);

            $arr = array();
            $i = 0;
            foreach($guid_g as $a=>$v){
                $mem_name = $this->mem_name($v);
                $arr[$i]['nickname'] = $mem_name['nickname'];
                $arr[$i]['thumb']    = $mem_name['thumb'];
                $arr[$i]['id']       = $mem_name['id'];
                $i++;
            }

            $this->ajaxReturn($arr);

        }

    }

    //申请提现
    public function deposit(){
        $Order = M('Order');
        if(IS_POST){

            $uid = I('post.uid');//用户ID
            $money = I('post.money');//用户ID

            $data['uid'] = $uid;
            $data['oid'] = create_oid();
            $data['type'] = 4;
            $data['pre'] = 2;
            $data['money'] = $money;
            $data['create_time'] = time();

            $info = $Order -> add($data);
            if($info){
                $json['status'] = 1;
                $json['info'] = '提现成功';
            }else{
                $json['status'] = 0;
                $json['info'] = '提现失败';
            }
            $this->ajaxReturn($json);
        }

    }


    /*
	 * 私信提交
	 * 将post传过来的发送内容添加进数据库
	 * 返回json
	 */
    public function message(){
        $Compose = M("Compose");
        if(IS_POST){
            $data['send'] = I('post.send');
            $data['receive'] = I('post.receive');
            $data['content'] = I('post.content');
            $data['create_time'] = time();
            $info = $Compose -> add($data);
            if($info){
                $json['status'] = 1;
                $json['info'] = '发送成功';
            }else{
                $json['status'] = 0;
                $json['info'] = '发送失败';
            }
            $this->ajaxReturn($json);
        }

    }

    //删除私信
    public function del_compose(){
        $Compose = M("Compose");
        if(IS_POST){

            $receive = I('post.receive');
            $send    = I('post.send');

            $map['receive|send'] = array('eq',$receive);
            $map['send|receive'] = array('eq',$send);

            $data['send_show']    = 0;
            $data['receive_show'] = 0;
            $data['update_time'] = time();
            $info = $Compose -> where($map)-> save($data);

            if($info){
                $json['status'] = 1;
                $json['info'] = '删除成功';
                $json['url'] = U('Member/message/type/2');
            }else{
                $json['status'] = 0;
                $json['info'] = '删除失败';
            }
            $this->ajaxReturn($json);
        }

    }

    //删除站内信--单个
    public function del_mail(){
        $Mail = M("Mail");
        if(IS_POST){

            $id = I('post.id');

            $map['id'] = array('eq',$id);
            $data['isshow']    = 0;
            $info = $Mail -> where($map)-> save($data);

            if($info){
                $json['status'] = 1;
                $json['info'] = '删除成功';
                $json['url'] = U('Member/message');
            }else{
                $json['status'] = 0;
                $json['info'] = '删除失败';
            }
            $this->ajaxReturn($json);
        }

    }

    //删除站内信--多个
    public function del_mails(){
        $Mail = M("Mail");
        if(IS_POST){

            $id = I('post.id'); //站内信ID数组
            $uid    = I('post.uid');//用户ID

            $map['id'] = array('in',$id);
            $map['mem_id'] = array('eq',$uid);

            $data['isshow']    = 0;
            $info = $Mail -> where($map)-> save($data);

            if($info){
                $json['status'] = 1;
                $json['info'] = '删除成功';
            }else{
                $json['status'] = 0;
                $json['info'] = '删除失败';
            }
            $this->ajaxReturn($json);
        }

    }

    //标记已读--站内信
    public function read(){
        $Mail = M("Mail");
        if(IS_POST){

            $id = I('post.id'); //站内信ID数组
            $uid    = I('post.uid');//用户ID
            $map['id'] = array('in',$id);
            $map['mem_id'] = array('eq',$uid);

            $data['status']    = 1;
            $data['update_time'] = time();
            $info = $Mail -> where($map)-> save($data);

            if($info){
                $json['status'] = 1;
                $json['info'] = '标记成功';
            }else{
                $json['status'] = 0;
                $json['info'] = '标记失败';
            }
            $this->ajaxReturn($json);
        }

    }

    //文库分类
    public function lib_cat(){

        $Libcat = M("Libcat");
        if(IS_POST){

            $up_id = I('post.id'); //上级分类ID

            $map['up_id'] = array('eq',$up_id);
            $map['status'] = array('eq',1);
            $info = $Libcat -> where($map) -> order('sort desc,id asc') -> select();
            if($info){
                $json['status'] = 1;
                $json['date'] = $info;
            }else{
                $json['status'] = 0;
                $json['info'] = '暂无分类';
            }

            $this->ajaxReturn($json);


        }
    }

    //提交文库
    public function lib_submit(){

        $Library = M("Library");
        if(IS_POST){

            $title = I('post.title'); //标题
            $cat_id = I('post.cat_id'); //上级分类ID
            $info = I('post.info'); //描述
            $thumb = I('post.thumb'); //缩略图
            $files = I('post.files'); //文件
            $uid = I('post.uid'); //用户ID

            $data['title'] = $title;
            $data['cat_id'] = $cat_id;
            $data['info'] = $info;
            $data['thumb'] = $thumb;
            $data['files'] = $files;
            $data['uid'] = $uid;
            $data['create_time'] = time();

            $info = $Library -> add($data);
            if($info){
                $json['status'] = 1;
                $json['info'] = '提交成功，请等待审核';
                $json['url'] = U('Member/library/type/2');
            }else{
                $json['status'] = 0;
                $json['info'] = '提交失败';
            }

            $this->ajaxReturn($json);


        }


    }

    //作品上传
    public function article_sub(){

        $Article = M('Article');
        if(IS_POST){

            $uid = I('post.uid'); //用户ID
            $title = I('post.title'); //文章标题
            $type = I('post.type'); //类型
            $cat_id = I('post.cat_id'); //文章分类
            $gname = I('post.gname'); //小组名称
            $dname = I('post.dname'); //设计人员名称
            $content = I('post.content'); //内容
            $thumb = I('post.thumb'); //缩略图
            $id = I('post.id'); //作品ID
            $time = time();

            if($id){
                $map['id'] = array('neq',$id);
            }
            $map['uid'] = array('eq',$uid);
            $map['title'] = array('eq',$title);
            $map['cat_id'] = array('eq',$cat_id);
            $count = $Article -> where($map) -> count();
            if($count){
                $json['status'] = 0;
                $json['info'] = '该作品名称已经存在';
            }else{

                $data['uid'] = $uid;
                $data['type'] = $type;
                $data['title'] = $title;
                $data['cat_id'] = $cat_id;
                $data['gname'] = $gname;
                $data['dname'] = $dname;
                $data['content'] = $content;
                $data['thumb'] = $thumb;

                if($id){
                    $map_['id'] = array('eq',$id);
                    $data['examine'] = 1;
                    $data['update_time'] = $time;
                    $info = $Article -> where($map_) -> save($data);
                }else{
                    $data['create_time'] = $time;
                    $info = $Article -> add($data);
                }

                if($info){
                    $json['status'] = 1;
                    $json['info'] = '提交成功';
                }else{
                    $json['status'] = 0;
                    $json['info'] = '提交失败';
                }
            }

            $this->ajaxReturn($json);
        }
    }


    /*身份认证*/
    public function is_card(){

        $Member = M("Member");
        if(IS_POST){
            $username = I('post.username');//姓名
            $card = I('post.card');//身份证号

            $map['id']       = array('eq',$this->MEMBER_ID);
            $map['username'] = array('eq',$username);
            $map['card']     = array('eq',$card);
            $count =$Member->where($map)->count();
            if($count){
                $json['status'] = 0;
                $json['info'] = '您已经实名认证';

            }else{

                $info = is_card($username,$card);
//                echo json_encode($info);exit;
                if($info) {
                    $data['username'] = $username;
                    $data['card'] = $card;
                    $data['is_card'] = 1;

                    $map_save['id'] = array('eq', $this->MEMBER_ID);
                    $datas = $Member->where($map_save)->save($data);

                    if ($datas) {
                        $json['status'] = 1;
                        $json['info'] = '认证通过';
                        $json['url'] = U('Member/indexs');
                    } else {
                        $json['status'] = 0;
                        $json['info'] = '认证失败';
                    }
                }else{
                    $json['status'] = 0;
                    $json['info'] = '认证失败';
                }
            }

        }

        $this->ajaxReturn($json);

    }

    /*手机号登陆*/
    public function login(){

        $Member = M("Member");
        if(IS_POST){
            $phone = I('post.phone');//手机号
            $code = I('post.code');//验证码

            $map['phone'] = $phone;
            $count =$Member->where($map)->count();
            if($count){
                if(cookie('code_phone') !=  $code){
                    $json['status'] = 0;
                    $json['info'] = '验证码错误';
                }else{
                    $info = $Member->where($map)->find();
                    $time = time();

                    $data_['session_time'] = $time;
                    $Member -> where($map) -> save($data_);
                    session('memberid',$info['id']);
                    session('time',$time);
                    $json['status'] = 1;
                    if(cookie('url_go')){
                        $json['url'] = cookie('url_go');
                        cookie('url_go',null);
                    }else{
                        $json['url'] = U('Index/index');
                    }


                }
            }else{
                $json['status'] = 0;
                $json['info'] = '该手机号不存在，请先绑定手机号';
            }

        }
        $this->ajaxReturn($json);

    }

    /*绑定手机号*/
    public function bind(){

        $Member = M("Member");
        if(IS_POST){
            $phone = I('post.phone');//手机号
            $code = I('post.code');//验证码

            if(cookie('code_phone') !=  $code){
                $json['status'] = 0;
                $json['info'] = '验证码错误';

            }else{
                $map['id'] = array('eq',$this->MEMBER_ID);
                $data['phone'] = $phone;
                $data['update_time'] = time();

                $info =$Member->where($map)->save($data);
                if($info){
                    $json['status'] = 1;
                    $json['info'] = '绑定成功';
                }else{
                    $json['status'] = 0;
                    $json['info'] = '绑定失败';
                }

            }

        }
        $this->ajaxReturn($json);

    }

    /*绑定银行卡号*/
    public function bind_bank(){

        $Member = M("Member");
        if(IS_POST){
            $username = I('post.username');//姓名
            $card = I('post.card');//身份证号
            $phone = I('post.phone');//手机号
            $bankcard = I('post.bankcard');//银行卡号
            $code = I('post.code');//验证码

            if(cookie('code_phone') !=  $code){
                $json['status'] = 0;
                $json['info'] = '验证码错误';

            }else{

                $info = is_bank_card($username,$bankcard,$phone,$card);
                if($info){
                    $map['id'] = array('eq',$this->MEMBER_ID);
                    $data['bank_card'] = $bankcard;
                    $data['update_time'] = time();
                    $datas =$Member->where($map)->save($data);
                    if($datas){
                        $json['status'] = 1;
                        $json['info'] = '添加成功';
                    }else{
                        $json['status'] = 01;
                        $json['info'] = '添加失败';
                    }
                }else{
                    $json['status'] = 0;
                    $json['info'] = '绑定卡号错误';
                }
            }

        }
        $this->ajaxReturn($json);

    }

    /*发送手机验证码*/
    public function captcha(){

        $Member = M('Member');
        if(IS_POST){
            $mobile=I('post.phone'); //手机号
            $type=I('post.type'); //验证类型

            $map['phone'] = array('eq',$mobile);
            $count = $Member->where($map)->count();

            if($type == 1){ //绑定手机号
                if($count){
                    $json['status'] = 0;
                    $json['info'] = '该手机号已存在';
                }else{
                    $json['status'] = 1;
//                    $randnums = '111111';
                    $randnums = rand(10000,99999);

                    cookie('code_phone',$randnums,120);
                    short_message($mobile,$randnums);
                    add_code($mobile,$randnums,$type);
                }
            }
            else if($type == 2){//	登陆

                if(!$count){
                    $json['status'] = 0;
                    $json['info'] = '该手机号不存在，请先绑定手机号';
                }else{
                    $json['status'] = 1;
//                    $randnums = '111111';
                    $randnums = rand(10000,99999);

                    cookie('code_phone',$randnums,120);
                    short_message($mobile,$randnums);
                    add_code($mobile,$randnums,$type);
                }


            }
            else if($type == 3){//	绑定银行卡

                $json['status'] = 1;
//                $randnums = '111111';
                    $randnums = rand(10000,99999);

                cookie('code_phone',$randnums,120);
                short_message($mobile,$randnums);
                add_code($mobile,$randnums,$type);

            }
//            echo json_encode($json);exit;


            $this->ajaxReturn($json);
        }
    }

    //微信二维码
    public function wx(){

        $Order = M('Order');
        if(IS_POST){
            $aid     = I('post.aid'); //活动ID
            $type    = I('post.type'); //活动类型
            $group_name = I('post.group_name'); //小组名称
            $uid_name = I('post.uid_name'); //联系人
            $uid_phone = I('post.uid_phone'); //联系方式
            $pay_money = I('post.pay_money'); //支付金额
            $is_group = I('post.is_group'); //活动方式
            $member_age = I('post.member_age'); //会员年限

            $uid = $this->MEMBER_ID;

            $map['aid'] = array('eq',$aid);
            $map['type'] = array('eq',$type);
            $map['uid'] = array('eq',$uid);

            if($type == 6){
                $datas['pay_is'] = false;
            }else{
                $datas = $Order -> where($map) -> find();
            }


            if($datas['pay_is']){
                $json['status'] = 0;
                $json['info'] = '您已经报名';
            }else{
                if(!$type == 6){
                    $map_is['oid'] = array('eq',$datas['oid']);
                    $Order -> where($map) ->limit(1) -> delete();
                }

                $oid = create_oid();

                $data['uid'] = $uid;
                $data['oid'] = $oid;
                $data['type'] = $type;
                if($type == 1 || $type == 2 || $type == 3){
                    $data['aid'] = $aid;
                    $data['group_name'] = $group_name;
                    $data['uid_name'] = $uid_name;
                    $data['uid_phone'] = $uid_phone;
                    $data['uid_type'] = $is_group?2:1;
                }elseif($type == 6){
                    $data['content'] = $member_age;
                }

                $data['money'] = $pay_money;
                $data['create_time'] = time();

                $info = $Order -> add($data);
//            echo json_encode($info);exit;
                if($info){
                    $json['status'] = 1;
                    //使用统一支付接口
                    $unifiedOrder = new \UnifiedOrder_pub();
                    //设置统一支付接口参数
                    //设置必填参数
                    if($type == 1 || $type == 2){
                        $unifiedOrder->setParameter("body","活动报名");//商品描述
                    }elseif($type == 3){
                        $unifiedOrder->setParameter("body","课堂视频报名");//商品描述
                    }elseif($type == 6){
                        $unifiedOrder->setParameter("body","会员升级");//商品描述
                    }


                    //自定义订单号，此处仅作举例
                    $timeStamp = time();
                    $total_fee = $pay_money*100;
                    $out_trade_no = C('WxPay.pub.config.APPID')."$timeStamp";
                    $unifiedOrder->setParameter("out_trade_no",$oid);//商户订单号(扫码登陆和扫码支付关联用的id)
                    $unifiedOrder->setParameter("total_fee",$total_fee);//总金额
                    $unifiedOrder->setParameter("notify_url", 'http://'.$_SERVER['HTTP_HOST'].'/Ajaxjson/notify');//通知地址
                    $unifiedOrder->setParameter("trade_type","NATIVE");//交易类型
                    //非必填参数，商户可根据实际情况选填
                    //$unifiedOrder->setParameter("sub_mch_id","XXXX");//子商户号
                    //$unifiedOrder->setParameter("device_info","XXXX");//活动类型
                    $unifiedOrder->setParameter("attach",$info);//附加数据
                    $unifiedOrder->setParameter("time_start",date("YmdHis"));//交易起始时间
                    $unifiedOrder->setParameter("time_expire",date("YmdHis", time() + 1000));//交易结束时间
//            $unifiedOrder->setParameter("goods_tag","test");//商品标记
//         $unifiedOrder->setParameter("openid","19405");//用户标识
//        $unifiedOrder->setParameter("product_id",I('get.id'));//扫码登陆和扫码支付关联用的id
                    //获取统一支付接口结果
                    $unifiedOrderResult = $unifiedOrder->getResult();

                    //商户根据实际情况设置相应的处理流程
                    if ($unifiedOrderResult["return_code"] == "FAIL")
                    {
                        //商户自行增加处理流程
                        echo "通信出错：".$unifiedOrderResult['return_msg']."<br>";
                    }
                    elseif($unifiedOrderResult["result_code"] == "FAIL")
                    {
                        //商户自行增加处理流程
                        echo "错误代码：".$unifiedOrderResult['err_code']."<br>";
                        echo "错误代码描述：".$unifiedOrderResult['err_code_des']."<br>";
                    }
                    elseif($unifiedOrderResult["code_url"] != NULL)
                    {
                        //从统一支付接口获取到code_url
                        $code_url = $unifiedOrderResult["code_url"];
                        //商户自行增加处理流程
                        //......
                    }
                    $json['info'] = $code_url;
                    $json['id'] = $info;
                }else{
                    $json['status'] = 0;
                    $json['info'] = '请重新报名参加';
                }
            }

            $this->ajaxReturn($json);
        }

    }

    //免费报名
    public function free_pay(){

        $Order = M('Order');
        if(IS_POST){
            $aid     = I('post.aid'); //活动ID
            $type    = I('post.type'); //活动类型
            $group_name = I('post.group_name'); //小组名称
            $uid_name = I('post.uid_name'); //联系人
            $uid_phone = I('post.uid_phone'); //联系方式
            $money = I('post.pay_money'); //支付金额
            $is_group = I('post.is_group'); //活动方式

            $map['aid'] = array('eq',$aid);
            $map['type'] = array('eq',$type);
            $map['uid'] = array('eq',$this->MEMBER_ID);
            $count = $Order -> where($map) -> count();
            if($count){
                $json['status'] = 0;
                $json['info'] = '您已经报名此活动';
            }else{

                $oid = create_oid();

                $data['aid'] = $aid;
                $data['uid'] = $this->MEMBER_ID;
                $data['oid'] = $oid;
                $data['type'] = $type;
                $data['group_name'] = $group_name;
                $data['uid_name'] = $uid_name;
                $data['uid_phone'] = $uid_phone;
                $data['pay_is'] = 2;

                $data['money'] = $money;
                $data['uid_type'] = $is_group?2:1;
                $data['create_time'] = time();
                $info = $Order -> add($data);

                if($info){
                    $json['status'] = 1;
                    $json['info'] = '报名成功';

                    $map['id'] = array('eq',$info);
                    $datas = $Order -> where($map) -> find();
                    //发送站内信
                    $arr['aid']     = $datas['aid'];
                    $arr['mem_id'] = $datas['uid'];
                    $arr['mtype']   = 1;
                    $arr['type']    = $type;
                    if($type == 3){ //课堂视频
                        $map_flash['id'] = array('eq',$datas['aid']);
                        $act = M('Flash') -> where($map_flash) -> find();
                        $time = date("Y-m-d",$act['start_time']);

                        $arr['content'] ="您报名的“".$act['title']."”在".$time."开始直播，请记得准时参加";
                        $json['url'] = U('Flash/index/id/'.$aid);
                    }elseif($type == 1 || $type == 2){ //活动
//活动名
                        $map_act['id'] = array('eq',$datas['aid']);
                        $act = M('Activity') -> where($map_act) -> find();
                        $time = date("Y-m-d",$act['start_time']);

                        $arr['content'] ="您报名的“".$act['title']."”在".$time."开始，请记得准时参加";
                        $json['url'] = U('Member/activity/type/'.$type);

                    }

                    $arr['create_time'] = time();
                    M('mail') -> add($arr);

                }else{
                    $json['status'] = 0;
                    $json['info'] = '报名失败';
                }
            }

            $this->ajaxReturn($json);
        }

    }

    //余额支付
    public function yue_pay(){

        $Order = M('Order');
        $Member = M('Member');
        if(IS_POST){
            $aid     = I('post.aid'); //活动ID
            $type    = I('post.type'); //活动类型
            $group_name = I('post.group_name'); //小组名称
            $uid_name = I('post.uid_name'); //联系人
            $uid_phone = I('post.uid_phone'); //联系方式
            $money = I('post.pay_money'); //支付金额
            $is_group = I('post.is_group'); //活动方式

            $map['aid'] = array('eq',$aid);
            $map['type'] = array('eq',$type);
            $map['uid'] = array('eq',$this->MEMBER_ID);
            $count = $Order -> where($map) -> count();
            if($count){
                $json['status'] = 0;
                $json['info'] = '您已经报名此活动';
            }else{

                $Member -> where(array('id'=>array('eq',$this->MEMBER_ID)))->setInc('balance','-'.$money);

                $oid = create_oid();

                $data['aid'] = $aid;
                $data['uid'] = $this->MEMBER_ID;
                $data['oid'] = $oid;
                $data['type'] = $type;
                $data['group_name'] = $group_name;
                $data['uid_name'] = $uid_name;
                $data['uid_phone'] = $uid_phone;
                $data['pay_way'] = 3;
                $data['pay_is'] = 1;
                $data['pre'] = 2;

                $data['money'] = $money;
                $data['uid_type'] = $is_group?2:1;
                $data['create_time'] = time();
                $info = $Order -> add($data);

                if($info){
                    $json['status'] = 1;
                    $json['info'] = '报名成功';

                    $map['id'] = array('eq',$info);
                    $datas = $Order -> where($map) -> find();
                    //发送站内信
                    $arr['aid']     = $datas['aid'];
                    $arr['mem_id'] = $datas['uid'];
                    $arr['mtype']   = 1;
                    $arr['type']    = $type;
                    if($type == 3){ //课堂视频
                        $map_flash['id'] = array('eq',$datas['aid']);
                        $act = M('Flash') -> where($map_flash) -> find();
                        $time = date("Y-m-d",$act['start_time']);

                        $arr['content'] ="您报名的“".$act['title']."”在".$time."开始直播，请记得准时参加";
                        $json['url'] = U('Flash/index/id/'.$aid);
                    }elseif($type == 1 || $type == 2){ //活动
//活动名
                        $map_act['id'] = array('eq',$datas['aid']);
                        $act = M('Activity') -> where($map_act) -> find();
                        $time = date("Y-m-d",$act['start_time']);

                        $arr['content'] ="您报名的“".$act['title']."”在".$time."开始，请记得准时参加";
                        $json['url'] = U('Member/activity/type/'.$type);

                    }

                    $arr['create_time'] = time();
                    M('mail') -> add($arr);

                }else{
                    $json['status'] = 0;
                    $json['info'] = '报名失败';
                }
            }

            $this->ajaxReturn($json);
        }

    }

    //会员升级余额支付
    public function yue_pay_mem(){

        $Order = M('Order');
        $Member = M('Member');
        if(IS_POST){
            $uid        = I('post.uid'); //会员ID
            $type       = I('post.type'); //订单类型
            $member_age = I('post.member_age'); //会员年限
            $money      = I('post.pay_money'); //支付金额
            $time = time();

            $Member -> where(array('id'=>array('eq',$this->MEMBER_ID)))->setInc('balance','-'.$money);
            //添加订单
            $oid = create_oid();
            $data['uid'] = $uid;
            $data['oid'] = $oid;
            $data['type'] = $type;
            $data['content'] = $member_age;
            $data['pay_way'] = 3;
            $data['pay_is'] = 1;
            $data['pre'] = 2;
            $data['money'] = $money;
            $data['paytime'] = $time;
            $data['create_time'] = $time;
            $info = $Order -> add($data);

            $map['id'] = array('eq',$info);
            $datas = $Order -> where($map) -> find();
            //发送站内信
            $arr['mem_id'] = $datas['uid'];
            $arr['mtype']   = 1;
            $arr['type']    = $type;

            $times = date("Y-m-d H:i",$time);
            $arr['content'] ="您".$times."申请的".$member_age."年会员升级，申请成功";

            $arr['create_time'] = $time;
            M('mail') -> add($arr);

            //修改会员年限信息
            $data_mem['type'] = 2;
            $data_mem['member_age'] = $member_age;
            $data_mem['member_ptime'] = $time;
            $map_mem['id'] = array('eq',$uid);
            $data = $Member -> where($map_mem) -> save($data_mem);
            if($data){
                $json['status'] = 1;
                $json['info'] = '升级成功';
                $json['url'] = U('Member/index');
            }else{
                $json['status'] = 0;
                $json['info'] = '升级失败';
            }

            $this->ajaxReturn($json);
        }

    }


    //注册扫码支付回调数据处理
    public function notify(){
//        F('123','123');
        //使用通用通知接口
        $notify = new \Notify_pub();
        $notify = new \Wxpay_server_pub();

        //存储微信的回调
        if ( $_SERVER['REQUEST_METHOD'] === 'POST' ){

            $xml = trim(file_get_contents('php://input'));
        }
//        F(time().'_xml',$xml);

        $notify->saveData($xml);

        //验证签名，并回应微信。
        //对后台通知交互时，如果微信收到商户的应答不是成功或超时，微信认为通知失败，
        //微信会通过一定的策略（如30分钟共8次）定期重新发起通知，
        //尽可能提高通知的成功率，但微信不保证通知最终能成功。
        if($notify->checkSign() == FALSE){
            $notify->setReturnParameter("return_code","FAIL");//返回状态码
            $notify->setReturnParameter("return_msg","签名失败");//返回信息
        }else{
            $notify->setReturnParameter("return_code","SUCCESS");//设置返回码
        }
        $returnXml = $notify->returnXml();
//        echo $returnXml;

        if($notify->checkSign())
        {
            if ($notify->data["return_code"] == "SUCCESS") {
                //将支付的相关数据插入用户会员表

                $map_pay['id'] = array('eq',$notify->data['attach']);

                $datas = M('Order') -> where($map_pay) -> find();
                if($datas['pay_is']){
                    exit;
                }else{
                    $data['paytime']    = strtotime($notify->data['time_end']); //时间
                    $data['wxcode'] = $notify->data['transaction_id']; //交易单号
                    $data['pay_way'] = 1;
                    $data['pay_is'] = 1;
                    M('Order') -> where($map_pay) -> save($data);

//                F('datas',$datas);
                    //发送站内信
                    $arr['aid']     = $datas['aid'];
                    $arr['mem_id'] = $datas['uid'];
                    $arr['mtype']   = 1;
                    $arr['type']    = $datas['type'];

                    if($datas['type'] == 1 || $datas['type'] == 2){
//活动名
                        $map_act['id'] = array('eq',$datas['aid']);
                        $act = M('Activity') -> where($map_act) -> find();
                        $time = date("Y-m-d",$act['start_time']);

                        $arr['content'] ="您报名的“".$act['title']."”在".$time."开始，请记得准时参加";
                    }elseif($datas['type'] == 3){ //课堂视频
                        $map_flash['id'] = array('eq',$datas['aid']);
                        $act = M('Flash') -> where($map_flash) -> find();
                        $time = date("Y-m-d",$act['start_time']);

                        $arr['content'] ="您报名的“".$act['title']."”在".$time."开始直播，请记得准时参加";
                    }elseif($datas['type'] == 6){//会员升级

                        $arr['content'] ="您".date('Y-m-d H:i:s',strtotime($notify->data['time_end']))."申请的".$datas['content']."年会员升级，申请成功";
                        //修改会员年限信息
                        $data_mem['type'] = 2;
                        $data_mem['member_age'] = $datas['content'];
                        $data_mem['member_ptime'] = strtotime($notify->data['time_end']);
                        $map_mem['id'] = array('eq',$datas['uid']);
                        $data = M('Member') -> where($map_mem) -> save($data_mem);
                    }
                    $arr['create_time'] = time();
                    M('mail') -> add($arr);
                }
            }
            elseif($notify->data["result_code"] == "FAIL"){

                $map_pay['id'] = array('eq',$notify->data['attach']);
                M('Order') -> where($map_pay) -> limit(1) -> delete();
            }

        }
    }

    //支付宝支付时判断是否已经报名
    public function is_pay_zfb(){

        $aid = I('post.aid'); //活动ID
        $type = I('post.type'); //订单类型
        $uid = I('post.uid'); //用户ID
        $Order = M('Order');
        if(IS_POST){
            $map['aid'] = array('eq',$aid);
            $map['type'] = array('eq',$type);
            $map['uid'] = array('eq',$uid);
            $map['pay_is'] = array('eq',1);
            $count = $Order -> where($map) -> count();
            if($count){
                $json['status'] = 1;
                $json['info'] = '您已经报名此活动';
            }else{
                $json['status'] = 0;
            }

            $this->ajaxReturn($json);
        }

    }

    //刷新是否支付完成活动报名
    public function is_pay(){

        $id = I('post.id'); //用户ID
        $Order = M('Order');
        if(IS_POST){
            $map['id'] = array('eq',$id);
            $info = $Order -> where($map) -> find();
            if($info['pay_is']){
                $json['status'] = 1;
                $json['info'] = '支付成功';
//                session('memberid',$info['id']);
                if($info['type'] == 1 || $info['type'] == 2){//活动
                    $json['url'] = U('Member/activity');
                }elseif($info['type'] == 3){//云课堂
                    $json['url'] = U('Flash/index/id/'.$info['aid']);
                }elseif($info['type'] == 6){ //会员升级
                    $json['url'] = U('Member/index');
                }
                $this->ajaxReturn($json);
            }


        }

    }

    //提交反馈
    public function fankui(){

        $Message = M('Message');


        if(IS_POST){
            $content = I('post.content'); //反馈内容
            $phone = I('post.phone'); //联系方式
            $uid = $this->MEMBER_ID;

            $data['phone'] = $phone;
            $data['content'] = $content;
            $data['uid'] = $uid;
            $data['create_time'] = time();
            $info = $Message -> add($data);
            if($info){
                $json['status'] = 1;
                $json['info'] = '提交成功';

            }else{
                $json['status'] = 0;
                $json['info'] = '提交失败';
            }

            $this->ajaxReturn($json);
        }

    }

    //我的活动--删除订单
    public function order_del(){

        $Order = M('Order');
        if(IS_POST){
            $id = I('post.id'); //订单ID

            $uid = $this->MEMBER_ID;

            $map['id'] = array('eq',$id);
            $map['uid'] = array('eq',$uid);

            $info = $Order -> where($map)->limit(1)->delete();

            if($info){
                $json['status'] = 1;
                $json['info'] = '删除成功';
            }else{
                $json['status'] = 1;
                $json['info'] = '删除失败';
            }

            $this->ajaxReturn($json);
        }

    }

    //退出
    public function out(){

        // $Member = M('Member');
        // $map['id'] = array('eq',$this->MEMBER_ID);
        // $data['session_id'] = '';

        // $info = $Member -> where($map) -> save($data);
//        F(time(),M()->getLastSql());
        // if($info){
            session('memberid',NULL);
//            cookie('unionid',null);
            if(session('memberid')){
                $json['status'] = 0;
                $json['info'] = '退出失败';
            }else{
                $json['status'] = 1;
                $json['info'] = '退出成功';
                $json['url'] = U('Index/register');
            }
        // }else{
            // $json['status'] = 0;
            // $json['info'] = '退出失败';
        // }

        $this->ajaxReturn($json);
    }

}
?>