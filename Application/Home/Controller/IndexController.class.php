<?php
namespace Home\Controller;
use Think\Controller;
vendor('WxPayPubHelper.WxPayPubHelper');
class IndexController extends CommonController {
    public function __construct(){
        parent::__construct();

//        $url_go = explode('.html',$_SERVER['REQUEST_URI']);
//        cookie('url_go',$url_go[0]);
    }


    public function index(){

        $wap_go = I('get.url_go');
        F('wap_go',$wap_go);


        if ($this->isMobile3()) {

            $this->redirect("Wap/Index");//是手机重定向到手机端

        }else {
            $url_go = explode('.html',$_SERVER['REQUEST_URI']);
            cookie('url_go',$url_go[0]);

            $articles  = C('articles');
            $flashs    = C('flashs');
            $lecturers = C('lecturers');

            $articles  = str_split($articles);
            $flashs    = str_split($flashs);
            $lecturers = str_split($lecturers);
            $this -> assign("articles",$articles);
            $this -> assign("flashs",$flashs);
            $this -> assign("lecturers",$lecturers);
//            dump('123');
//            dump($_SESSION);
            if(!$this->MEMBER_ID){
                $DIR = 'register';
            }else{
//                 if(cookie('url_go')){
//                     $this -> redirect(cookie('url_go'));
//                 }else{
                $DIR = 'index';
//                 }
            }
        }




		$this->display($DIR);
	}

	/*
	 * 注册
	 * 首先扫码，得到code和用户授权的用户信息
	 * 判断是否已经扫码过，如果没有扫过就重新添加新的用户信息
	 * 如果扫过，判断是否有扫码支付交易单号，如果有跳到登陆页面，如果没有
	 * 扫码支付
	 * */
    public function register(){

        $Member = M('Member');

        $is_pay = I('is_pay',0);
        $code= I('get.code');

        if($code){
            $data = wechat($code);//扫码登陆（二维码）

            $map_openid['unionid'] = array('eq',$data['unionid']);
            $mem_openid = _Finds($Member,$map_openid,'');
            if($mem_openid){

                if($mem_openid['transaction_id']){
                    $json['status'] = 1;
                    $json['url'] = U('Index/index');

                    $time = time();
                    $data_['session_time'] = $time;
                    $Member -> where($map_openid) -> save($data_);
                    session('memberid',$mem_openid['id']);
                    session('time',$time);
//                        F(time().'_',cookie('url_go'));
                    if(cookie('url_go')){
                        $this -> redirect(cookie('url_go'),array(),0,'页面跳转中...');
                        cookie('url_go',null);
                    }else{
                        $this -> redirect('Index/index',array(),0,'页面跳转中...');
                    }

//                    }

                }else{
                    $this -> redirect('Index/registers',array('id'=>$mem_openid['id']),0,'页面跳转中...');
                }

            }else{
                $data['create_time'] = time();
                $info =$Member -> add($data);

                if($info){
                    $this -> redirect('Index/registers',array('id'=>$info),0,'页面跳转中...');
                }else{
                    $this -> error('请重新扫码注册！');
                }
            }
            exit;
        }


        if($is_pay){
            $code_url = urlencode(session('code_url'));
            $this -> assign('is_pay',$is_pay);
            $this -> assign('code_url',$code_url);
        }

        $this -> display();
    }

    //会员注册扫码支付
    public function registers(){

        //使用统一支付接口
        $unifiedOrder = new \UnifiedOrder_pub();
        //设置统一支付接口参数
        //设置必填参数
        $unifiedOrder->setParameter("body","BIM注册");//商品描述
        //自定义订单号，此处仅作举例
        $id = I('get.id');
        $timeStamp = time();
        $total_fee = C('register_money')*100;
        $out_trade_no = C('WxPay.pub.config.APPID')."$timeStamp";
        $unifiedOrder->setParameter("out_trade_no",I('get.id'));//商户订单号(扫码登陆和扫码支付关联用的id)
        $unifiedOrder->setParameter("total_fee",$total_fee);//总金额
        $unifiedOrder->setParameter("notify_url", 'http://'.$_SERVER['HTTP_HOST'].'/Index/notify');//通知地址
        $unifiedOrder->setParameter("trade_type","NATIVE");//交易类型
        //非必填参数，商户可根据实际情况选填
        //$unifiedOrder->setParameter("sub_mch_id","XXXX");//子商户号
        //$unifiedOrder->setParameter("device_info","XXXX");//设备号
        $unifiedOrder->setParameter("attach",$id);//附加数据
        $unifiedOrder->setParameter("time_start",date("YmdHis"));//交易起始时间
        $unifiedOrder->setParameter("time_expire",date("YmdHis", time() + 1000));//交易结束时间
        $unifiedOrder->setParameter("goods_tag","test");//商品标记
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
//        $this->assign('code_url',$code_url);
        session('code_url',$code_url);
//        dump(session('code_url'));
        $this -> redirect('Index/register',array('is_pay'=>$id),0,'页面跳转中...');
//        $this->display();
    }

    //注册扫码支付回调数据处理
    public function notify()
    {

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
            if ($notify->data["return_code"] == "FAIL") {
                //此处应该更新一下订单状态，商户自行增删操作
//                log_result($log_name,"【通信出错】:\n".$xml."\n");

                $this->error("1");
            }
            elseif($notify->data["result_code"] == "FAIL"){
                //此处应该更新一下订单状态，商户自行增删操作
//                log_result($log_name,"【业务出错】:\n".$xml."\n");

                $this->error("失败2");
            }
            else{
                //此处应该更新一下订单状态，商户自行增删操作
//                log_result($log_name,"【支付成功】:\n".$xml."\n");
                //将支付的相关数据插入用户会员表
                $map_pay['id'] = array('eq',$notify->data['attach']);
                $data['pay_time']    = strtotime($notify->data['time_end']); //时间
                $data['transaction_id'] = $notify->data['transaction_id']; //交易单号
//                F(time().'_data',$notify->data['attach'].'-'.$data['pay_time'].'-'.$data['transaction_id']);
                $info = M('Member')->where($map_pay)->save($data);

                //添加订单表
                $map_count['uid'] = array('eq',$notify->data['attach']);
                $map_count['wxcode'] = array('eq',$notify->data['transaction_id']);
                $order_count = M('Order') -> where($map_count) -> count();
                if(!$order_count){
                    $data_order['uid'] = $notify->data['attach'];
                    $data_order['oid'] = create_oid();
                    $data_order['type'] = 5;
                    $data_order['money'] = C('register_money');
                    $data_order['pay_way'] = 1;
                    $data_order['wxcode'] = $notify->data['transaction_id'];
                    $data_order['pay_is'] = 1;
                    $data_order['paytime'] = strtotime($notify->data['time_end']);
                    $data_order['create_time'] = strtotime($notify->data['time_end']);
                    M('Order')->add($data_order);

                    //发送站内信
                    $arr['mem_id'] = $notify->data['attach'];
                    $arr['type']    = 4;

                    $arr['content'] ="您已经成为BIM协作平台会员，请您欣赏";
                    $arr['create_time'] = time();
                    M('mail') -> add($arr);

                }

            }

        }
    }



}