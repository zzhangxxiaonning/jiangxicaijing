<?php
namespace App\Controller;
use Think\Controller;
class IndexController extends CommonController {
    public function __construct(){
        parent::__construct();

    }

    //首页
    public function index(){
        //轮播图
        $map_ad['status'] = array('eq',1);
        $map_ad['cat_id'] = array('eq',9);
        $ads = infos(M('Ad'),$map_ad,'sort desc,id desc','name,url,image');

        //获奖资讯
        $map_hon['status'] = array('eq',1);
        $honor = infos(M('Honor'),$map_hon,'sort desc,id desc','id,content');

        $data = array(
            'ads' => $ads,
            'honor' => $honor,
            'circle' => $this->circle(),//科研项目
            'activity' => $this->activity(), //最新活动
            'news' => $this->news(),//热门资讯
        );

        $json['retcode'] = '0';
        $json['data'] = $data;
        $this->ajaxReturn($json);
	}

    /*
     * 科研项目
     *
     * */
	protected function circle(){
        $map_cir['status'] = array('eq',1);
        $map_cir['flag'] = array('like','%r%');
        $circle = infos(M('Circle'),$map_cir,'sort desc,id desc','id,title,thumb,info,cat_id,rank_id,start_time,end_time',5);
        foreach($circle as $a=>$v){
            $circle[$a]['cat_name'] = $this->cat_name(M('Circat'),$v['cat_id']);
            $circle[$a]['rank_name'] = $this->cat_name(M('Cirattr'),$v['rank_id']);

            $circle[$a]['start_time'] = date('Y-m-d',$v['start_time']);
            $circle[$a]['end_time'] = date('Y-m-d',$v['end_time']);
            $circle[$a]['thumb'] = C('BASE_URL').$v['thumb'];
        }
        return $circle;
    }

    /*
     * 最新活动
     *
     * */
    protected function activity(){
        $map_act['status'] = array('eq',1);
        $map_act['flag'] = array('like','%r%');
        $activity = infos(M('Activity'),$map_act,'sort desc,id desc','id,title,thumb,start_time,money',5);
        foreach($activity as $b=>$v){
            $activity[$b]['start_time'] = date('Y-m-d H:i',$v['start_time']);
            $activity[$b]['thumb'] = C('BASE_URL').$v['thumb'];
        }
        return $activity;
    }

    /*
     * 热点资讯
     *
     * */
    protected function news(){
        $map_news['status'] = array('eq',1);
        $map_news['flag'] = array('like','%r%');
        $news = infos(M('News'),$map_news,'sort desc,id desc','id,title,thumb,cat_id,author,create_time',5);
        foreach($news as $c=>$v){
            $news[$c]['cat_name'] = $this->cat_name(M('Newscat'),$v['cat_id']);
            $news[$c]['create_time'] = date('Y-m-d',$v['create_time']);
            $news[$c]['thumb'] = C('BASE_URL').$v['thumb'];

            $map_thumb['aid'] = array('eq',$v['id']);
            $news[$c]['thumb_count'] = _Numbers(M('ThumbsUp'),$map_thumb);

        }
        return $news;
    }





}