<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta name="author" content="Enet360">
	<!-- <link rel="shortcut icon" href="#" type="image/png"> -->
	<link rel="shortcut icon" href="/favicon.ico"/>
    <link rel="bookmark" href="/favicon.ico"/>
	<title><?php echo C('title');?> - 管理系统</title>

	<!--icheck-->
	<link href="<?php echo ($public); ?>js/iCheck/skins/minimal/minimal.css<?php echo ($versionnumber); ?>" rel="stylesheet">
	<link href="<?php echo ($public); ?>js/iCheck/skins/square/square.css<?php echo ($versionnumber); ?>" rel="stylesheet">
	<link href="<?php echo ($public); ?>js/iCheck/skins/square/red.css<?php echo ($versionnumber); ?>" rel="stylesheet">
	<link href="<?php echo ($public); ?>js/iCheck/skins/square/blue.css<?php echo ($versionnumber); ?>" rel="stylesheet">

	<!--dashboard calendar-->
	<link href="<?php echo ($public); ?>css/clndr.css<?php echo ($versionnumber); ?>" rel="stylesheet">

	<!--Morris Chart CSS -->
	<link rel="stylesheet" href="<?php echo ($public); ?>js/morris-chart/morris.css<?php echo ($versionnumber); ?>">

	<!--common-->
	<link href="<?php echo ($public); ?>css/style.css<?php echo ($versionnumber); ?>" rel="stylesheet">
	<link href="<?php echo ($public); ?>css/style-responsive.css<?php echo ($versionnumber); ?>" rel="stylesheet">


	<style>
		table td{
			 word-wrap: break-word;
			word-break: break-all;
		}
	</style>

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="<?php echo ($public); ?>js/html5shiv.js<?php echo ($versionnumber); ?>"></script>
	<script src="<?php echo ($public); ?>js/respond.min.js<?php echo ($versionnumber); ?>"></script>
	<![endif]-->
<!--external css-->
  <link rel="stylesheet" type="text/css" href="<?php echo ($public); ?>js/fuelux/css/tree-style.css<?php echo ($versionnumber); ?>" />
</head>

<body class="sticky-header">

<section>
    <!-- left side start-->
    <!-- left side start-->
<div class="left-side sticky-left-side">

	<!--logo and iconic logo start-->
	<div class="logo" >
		<a href="<?php echo U('Index/index');?>" style="margin: 5px 0 0 40px;"><img src="<?php echo ($public); ?>images/logo.png" alt=""></a>
	</div>
	    
	<div class="logo-icon text-center">
		<a href="<?php echo U('Index/index');?>"><img src="<?php echo ($public); ?>images/logo_icon.png" alt=""></a>
	</div>
	<!--logo and iconic logo end-->

	<div class="left-side-inner">
		<!--sidebar nav start-->
		<ul class="nav nav-pills nav-stacked custom-nav">
<?php if(is_array($menu_lists)): $i = 0; $__LIST__ = $menu_lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; if(is_array($vo["id"])): $i = 0; $__LIST__ = $vo["id"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$void): $mod = ($i % 2 );++$i; if($arr != null): if(in_array($void,$arr)): if(!empty($vo["son"])): ?><li class="menu-list <?php if(in_array($menu_show['0'],$vo['id'])): ?>nav-active<?php endif; ?>">
			<a href="<?php echo ($vo["url"]); ?>"><i class="fa <?php echo ($vo["icon"]); ?>"></i> <span><?php echo ($vo["title"]); ?></span></a>
			<ul class="sub-menu-list">
				<?php if(is_array($vo["son"])): $i = 0; $__LIST__ = $vo["son"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vd): $mod = ($i % 2 );++$i; if($arr_ != null): if(in_array($vd['url'],$arr_)): ?><li class=" <?php if(in_array($menu_show['0'],$vo['id']) and in_array($menu_show['1'],$vd['id'])): ?>active<?php endif; ?>"><a href="<?php echo ($vd["url"]); ?>"><?php echo ($vd["title"]); ?></a></li><?php endif; ?>
					<?php else: ?>
					<li class=" <?php if(in_array($menu_show['0'],$vo['id']) and in_array($menu_show['1'],$vd['id'])): ?>active<?php endif; ?>"><a href="<?php echo ($vd["url"]); ?>"><?php echo ($vd["title"]); ?></a></li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
		</ul>
		</li>

		<?php else: ?>
		<li class=" <?php if(in_array($menu_show[0],$vo['id'])): ?>active<?php endif; ?>">
		<a href="<?php echo ($vo["url"]); ?>"><i class="fa <?php echo ($vo["icon"]); ?>"></i> <span><?php echo ($vo["title"]); ?></span></a>
		</li><?php endif; endif; ?>
		<?php else: ?>
		<?php if(!empty($vo["son"])): ?><li class="menu-list <?php if(in_array($menu_show['0'],$vo['id'])): ?>nav-active<?php endif; ?>">
			<a href="<?php echo ($vo["url"]); ?>"><i class="fa <?php echo ($vo["icon"]); ?>"></i> <span><?php echo ($vo["title"]); ?></span></a>
			<ul class="sub-menu-list">
				<?php if(is_array($vo["son"])): $i = 0; $__LIST__ = $vo["son"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vd): $mod = ($i % 2 );++$i; if($arr_ != null): if(in_array($vd['url'],$arr_)): ?><li class=" <?php if(in_array($menu_show['0'],$vo['id']) and in_array($menu_show['1'],$vd['id'])): ?>active<?php endif; ?>"><a href="<?php echo ($vd["url"]); ?>"><?php echo ($vd["title"]); ?></a></li><?php endif; ?>
					<?php else: ?>
					<li class=" <?php if(in_array($menu_show['0'],$vo['id']) and in_array($menu_show['1'],$vd['id'])): ?>active<?php endif; ?>"><a href="<?php echo ($vd["url"]); ?>"><?php echo ($vd["title"]); ?></a></li><?php endif; endforeach; endif; else: echo "" ;endif; ?>
			</ul>
			</li>

			<?php else: ?>
			<li class=" <?php if(in_array($menu_show[0],$vo['id'])): ?>active<?php endif; ?>">
			<a href="<?php echo ($vo["url"]); ?>"><i class="fa <?php echo ($vo["icon"]); ?>"></i> <span><?php echo ($vo["title"]); ?></span></a>
			</li><?php endif; endif; endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>

		</ul>
		<!--sidebar nav end-->

	</div>
</div>
<!-- left side end-->
    
    <!-- main content start-->
    <div class="main-content" >

        <!-- header section start-->
        <!-- header section start-->
<div class="header-section">

	<!--toggle button start-->
	<a class="toggle-btn"><i class="fa fa-bars"></i></a>
	<a class="toggle-btn" href="<?php echo U('/Index/index');?>" style="width:auto;" target="_blank">网站首页</a>
	<a class="toggle-btn" href="<?php echo U('Index/clear_cache');?>" style="width:auto;" target="_blank">缓存清理</a>
	<!--toggle button end-->
	<!--notification menu start -->
	<div class="menu-right">
		<ul class="notification-menu">
			<li>
				<a href="javascript:void(0);" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
					<!--img src="<?php echo ($public); ?>images/photos/user-avatar.png" alt="" /-->
					<?php echo ($admin_username); ?>
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu dropdown-menu-usermenu pull-right">
					<!--li><a href="<?php echo U('Index/profile');?>"><i class="fa fa-user"></i> 个人资料</a></li-->
					<li><a href="<?php echo U('Index/onlogin');?>"><i class="fa fa-sign-out"></i> 退出登陆</a></li>
				</ul>
			</li>

		</ul>
	</div>
	<!--notification menu end -->
</div>
<!-- header section end-->

        <!-- page heading start-->
        
        <!-- page heading end-->

        <div class="page-heading">
            <h3>
                配置管理
            </h3>
            <ul class="breadcrumb">
                <li>
                    <a href="<?php echo U('Index/index');?>">控制面板</a>
                </li>
                <li class="active">配置管理</li>
            </ul>
            <div class="state-info">
                <!--section class="panel">
	<div class="panel-body">
		<div class="summary">
			<span>年度总预约</span>
			<h3 class="red-txt"><?php echo ($order_count); ?>单</h3>
		</div>
		<div id="income" class="chart-bar"></div>
	</div>
</section>
<section class="panel">
	<div class="panel-body">
		<div class="summary">
			<span>年度有效预约</span>
			<h3 class="green-txt"><?php echo ($order_yx_count); ?>单</h3>
		</div>
		<div id="expense" class="chart-bar"></div>
	</div>
</section-->

<!--Sparkline Chart-->
<!--<script src="<?php echo ($public); ?>js/sparkline/jquery.sparkline.js"></script>-->
<!--script src="<?php echo ($public); ?>js/sparkline/sparkline-init.js"></script-->
<script>
    /*var Script = function () {
        $(".sparkline").each(function(){
            var $data = $(this).data();

            $data.valueSpots = {'0:': $data.spotColor};

            $(this).sparkline( $data.data || "html", $data,
                {
                    tooltipFormat: '<span style="display:block; padding:0px 10px 12px 0px;">' +
                    '<span style="color: {{color}}">&#9679;</span> {{offset:names}} ({{percent.1}}%)</span>'
                });
        });
        $("#income").sparkline([<?php echo ($zong_string); ?>], {
            type: 'bar',
            height: '35',
            barWidth: 5,
            barSpacing: 2,
            barColor: '#fc8675'
        });

        $("#expense").sparkline([<?php echo ($yx_string); ?>], {
            type: 'bar',
            height: '35',
            barWidth: 5,
            barSpacing: 2,
            barColor: '#65cea7'
        });
    }();*/
</script>
            </div>
        </div>
        <div class="wrapper" style="clear: both;">
            <div class="row">
                <div class="col-md-12">
                <section class="panel">
                    <header class="panel-heading custom-tab ">
                        <ul class="nav nav-tabs">
                            <?php if(is_array($config_type)): $k = 0; $__LIST__ = $config_type;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k;?><li <?php if($k == 1): ?>class="active"<?php endif; ?>>
                                <a href="#tab_<?php echo ($vo["id"]); ?>" data-toggle="tab"><?php echo ($vo["name"]); ?></a>
                            </li><?php endforeach; endif; else: echo "" ;endif; ?>
                        </ul>
                    </header>
                    <div class="panel-body">
                        <form action="" id="data_form_id" onsubmit="submit_form();return false;" class="form-horizontal ">
                        <div class="tab-content">
                        <?php if(is_array($lists)): $k = 0; $__LIST__ = $lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vv): $mod = ($k % 2 );++$k;?><div class="tab-pane <?php if($k == 1): ?>active<?php endif; ?>" id="tab_<?php echo ($k); ?>">
                            <section class="panel">
                                <div class="panel-body form-horizontal ">
                                    <?php if(is_array($vv)): $i = 0; $__LIST__ = $vv;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="form-group">
                                            <div class="control-label col-md-2"><?php echo ($vo["name"]); ?></div>
                                            <div class="col-md-8 col-xs-11">
                                                <?php echo ($vo["form"]); ?>
                                                <span class="help-block"><?php echo ($vo["description"]); ?>&nbsp;</span>
                                            </div>
                                            <div class="control-label col-md-2">&nbsp;</div>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10">
                                            <button class="btn btn-primary" type="submit">修改</button>
                                            <button class="btn btn-default" type="button" onclick="location.reload()">刷新</button>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            </div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                        </form>
                    </div>
                </section>
                </div>
            </div>
        </div>


        <!--footer section start-->
        <!--footer section start-->

<footer>
	<span class="years"></span> &copy; 邦果网 <a href="http://www.ibangoo.com" target="_blank">建设</a>
</footer>

<!--footer section end-->


    </div>
    <!-- main content end-->
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="<?php echo ($public); ?>js/jquery-1.10.2.min.js<?php echo ($versionnumber); ?>"></script>
<script src="<?php echo ($public); ?>js/jquery-ui-1.9.2.custom.min.js<?php echo ($versionnumber); ?>"></script>
<script src="<?php echo ($public); ?>js/jquery-migrate-1.2.1.min.js<?php echo ($versionnumber); ?>"></script>
<script src="<?php echo ($public); ?>js/bootstrap.min.js<?php echo ($versionnumber); ?>"></script>
<script src="<?php echo ($public); ?>js/modernizr.min.js<?php echo ($versionnumber); ?>"></script>
<script src="<?php echo ($public); ?>js/jquery.nicescroll.js<?php echo ($versionnumber); ?>"></script>

<!--easy pie chart-->
<script src="<?php echo ($public); ?>js/easypiechart/jquery.easypiechart.js<?php echo ($versionnumber); ?>"></script>
<script src="<?php echo ($public); ?>js/easypiechart/easypiechart-init.js<?php echo ($versionnumber); ?>"></script>

<!--icheck -->
<script src="<?php echo ($public); ?>js/iCheck/jquery.icheck.js<?php echo ($versionnumber); ?>"></script>
<script src="<?php echo ($public); ?>js/icheck-init.js<?php echo ($versionnumber); ?>"></script>

<!-- jQuery Flot Chart-->
<script src="<?php echo ($public); ?>js/flot-chart/jquery.flot.js<?php echo ($versionnumber); ?>"></script>
<script src="<?php echo ($public); ?>js/flot-chart/jquery.flot.tooltip.js<?php echo ($versionnumber); ?>"></script>
<script src="<?php echo ($public); ?>js/flot-chart/jquery.flot.resize.js<?php echo ($versionnumber); ?>"></script>


<!--Calendar-->
<script src="<?php echo ($public); ?>js/calendar/clndr.js<?php echo ($versionnumber); ?>"></script>
<script src="<?php echo ($public); ?>js/calendar/evnt.calendar.init.js<?php echo ($versionnumber); ?>"></script>
<script src="<?php echo ($public); ?>js/calendar/moment-2.2.1.js<?php echo ($versionnumber); ?>"></script>
<script src="<?php echo ($public); ?>js/underscore-min.js<?php echo ($versionnumber); ?>"></script>

<!--common scripts for all pages-->
<script src="<?php echo ($public); ?>js/scripts.js<?php echo ($versionnumber); ?>"></script>
<script src="<?php echo ($source); ?>js/jquery.form.js<?php echo ($versionnumber); ?>"></script>
<script src="<?php echo ($source); ?>layer/layer.js<?php echo ($versionnumber); ?>" type="text/javascript"></script>
<script>
	var myDate = new Date();
	//获取当前年
	var year=myDate.getFullYear();

	$(".years").text(year);
</script>
<div class="side-bar" id="info"></div>
<!--<div class="side-bar" id="info_mem"></div>-->
<style>
    .side-bar {width: 210px;height:70px;position: fixed;bottom: 20px;right: 0;z-index: 100;}
    .chat-tips{border:1px solid #d5d5d5;text-align:center;}
    #info{bottom:10px;}
    #info_mem{bottom:30px;}
</style>
<script>
    $(function(){
        setInterval(aa,10000);
        function aa(){
            var info_html = '';
            $.ajax({
                type: 'post',
                url: "<?php echo U('Ajaxjson/report');?>",
                data: {},
                dataType:'json',
                success:function(data){
//                    console.log(data);
                    if(data.status){
                        //alert(data.info);
                        info_html += "<div class='chat-tips'><a href='"+data.url+"' style='line-height:80px;'>"+data.info+"</a><br/></div>";

                    }
                    $("#info").html(info_html);
                }
            });

        }
    })

</script>
<script>
function submit_form(){
    layer.load(0, {shade: [0.2,'#616161']});
    $("#data_form_id").ajaxSubmit({
        type: "post",
        url:"<?php echo U('edit');?>",
        beforeSubmit:function(data){
            $.each(data,function(i){
                if(data[i]['name'] == 'username' && data[i]['value'] == '' ){

                    layer.closeAll('loading');
                    $("input[name='"+data[i]['name']+"']").focus();
                    return false;
                }
            });
            console.log(data);
        },
        success:function(data){
            layer.closeAll('loading');
            if(data.status == 1){
                layer.msg(data.info,{shift:1,time:1500},function(){
                    window.location.href = data.url;
                });
            }else{
                layer.msg(data.info,{shift:6,time:3000});
            }
        },
        dataType:   "json"
    });
}
</script>
<!--/**编辑器 kindeditor **/-->
<script type="text/javascript">
    var Kind_upload_json = "<?php echo U('Kind/upload_json');?>";
    var Kind_file_manager_json = "<?php echo U('Kind/file_manager_json');?>";
    var Kind_DiyImgName = 'config';
</script>
<link href="<?php echo ($source); ?>kindeditor/themes/default/default.css<?php echo ($versionnumber); ?>" rel="stylesheet" type="text/css"/>
<script src="<?php echo ($source); ?>kindeditor/kindeditor-min.js<?php echo ($versionnumber); ?>" type="text/javascript"></script>
<script src="<?php echo ($source); ?>kindeditor/lang/zh_CN.js<?php echo ($versionnumber); ?>" type="text/javascript"></script>
<script src="<?php echo ($source); ?>kindeditor/config.js<?php echo ($versionnumber); ?>" type="text/javascript"></script>

</body>
</html>