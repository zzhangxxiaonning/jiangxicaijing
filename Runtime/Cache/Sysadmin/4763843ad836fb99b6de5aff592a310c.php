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
<div class="page-heading">
	<h3>
		评论管理
	</h3>
	<ul class="breadcrumb">
		<li>
			<a href="<?php echo U('Index/index');?>">控制面板</a>
		</li>
		<li class="active">评论管理</li>
	</ul>
</div>
<!-- page heading end-->

<!--body wrapper start-->
<div class="wrapper">
	<div class="row">
<section class="panel" style="margin-bottom:0px;">
	<header class="panel-heading">
		评论管理
		<span class="tools pull-right">
			<a href="javascript:void(0);" class="fa  <?php if(($is_service) == "0"): ?>fa-chevron-up<?php else: ?> fa-chevron-down<?php endif; ?>"> 搜索</a> &nbsp;
			<button class="btn btn-default" type="button" onclick="location.reload()"><i class="fa fa-refresh"></i> 刷新</button>
			<!-- <button class="btn btn-info" type="button" onclick="location.href='<?php echo U('edit');?>'"><i class="fa fa-plus"></i> 添加</button> -->
		</span>
	</header>
	<div class="panel-body" style=" <?php if(($is_service) == "0"): ?>display: none;<?php else: ?>display: block;<?php endif; ?>">
<form action="<?php echo U('index');?>" method="get">
<div class="col-md-2">	
	<div class="input-group panel">
		<span class="input-group-addon">标题</span>
		<input type="text" name="name" value="<?php echo I('get.name');?>" class="form-control" placeholder="">
	</div>
</div>
<div class="col-md-2">	
	<div class="input-group panel">
		<span class="input-group-addon">评论人</span>
		<input type="text" name="uid" value="<?php echo I('get.uid');?>" class="form-control" placeholder="">
	</div>
</div>
	<div class="col-md-2">
		<div class="input-group panel">
			<span class="input-group-addon">查看状态</span>
			<select class="form-control" name="status">
				<option value="-1">全部</option>
				<option value="1" <?php if(I('get.status','-1') == '1'): ?>selected<?php endif; ?> >已查看</option>
				<option value="0" <?php if(I('get.status','-1') == '0'): ?>selected<?php endif; ?> >未查看</option>
			</select>
		</div>
	</div>
<div class="col-md-2">	
	<div class="input-group panel">
		<span class="input-group-addon">显示状态</span>
		<select class="form-control" name="isshow">
			<option value="-1">全部</option>
			<option value="1" <?php if(I('get.isshow','-1') == '1'): ?>selected<?php endif; ?> >显示</option>
			<option value="0" <?php if(I('get.isshow','-1') == '0'): ?>selected<?php endif; ?> >不显示</option>
		  </select>
	</div>
</div>
<div class="col-md-3">
	<div class="input-group panel">
		<span class="input-group-addon">发布</span>
		<div class="input-group input-large custom-date-range" data-date="2013-07-13" data-date-format="yyyy-mm-dd">
	        <input type="text" class="form-control dpd1" name="start_time" value="<?php if(!empty($info["start_time"])): echo (date('Y-m-d H:i:s',$info["start_time"])); endif; ?>">
	        <span class="input-group-addon">To</span>
	        <input type="text" class="form-control dpd2" name="end_time" value="<?php if(!empty($info["end_time"])): echo (date('Y-m-d H:i:s',$info["end_time"])); endif; ?>">
	    </div>
	</div>
</div>
<div class="col-md-1">	
	<button class="btn btn-default" type="submit"><i class="fa fa-search"></i> 查找</button>
</div>

</form>
</section>
		<section class="panel">
			<div class="panel-body">

<table class="table table-bordered">
	<thead>
	<tr>
		<th>ID</th>
		<th>标题</th>
		<th>评论人</th>
		<th>内容</th>
		<th>状态</th>
		<th>时间</th>
		<th>操作</th>
	</tr>
	</thead>
	<tbody>
	<?php if(is_array($lists)): $i = 0; $__LIST__ = $lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
		<td><?php echo ($vo["id"]); ?></td>
		<td><span <?php if($vo['count'] != 0): ?>title="<?php echo ($vo["count"]); ?>条未审核"<?php endif; ?>><?php echo ($vo["title"]); if($vo['count'] != 0): ?><code><?php echo ($vo["count"]); ?></code><?php endif; ?></span></td>
		<td><?php echo ($vo["username"]); ?></td>
		<td style="max-width:300px;" title="<?php echo ($vo["content"]); ?>"><?php echo (mb_substr($vo["content"],0,15,'utf-8')); ?>...</td>
		<td>
			<?php if($vo['status'] == 1): ?><a href="<?php echo U('editcom',array('id'=>$vo['id']));?>" class="label label-success label-mini">已查看</a>

			<?php else: ?>
				<a href="<?php echo U('editcom',array('id'=>$vo['id']));?>" class="label label-warning label-mini">未查看</a><?php endif; ?>

		</td>
		<td><?php echo (date('Y-m-d H:i:s',$vo["create_time"])); ?></td>
		<td>
			<a href="<?php echo U('edit',array('id'=>$vo['id']));?>" class="btn btn-default btn-sm" id="add-sticky"><i class="fa fa-edit"></i>查看</a>
			<a href="javascript:void(0);" class="btn btn-default btn-sm jQ_delete_reload" data-href="<?php echo U('del_com',array('id'=>$vo['id']));?>" title="确定是否删除该评论和评论回复,删除以后将无法恢复"><i class="fa fa-times"></i> 删除</a>
			<a href="<?php echo U('editnav',array('id'=>$vo['id']));?>" class="btn btn-default btn-sm"><i class="fa fa-eye"></i>
				<?php if($vo['isshow'] == '1'): ?>不显示<?php else: ?>显示<?php endif; ?>
			</a>
		</td>
	</tr><?php endforeach; endif; else: echo "" ;endif; ?>
   
	</tbody>
</table>
			</div>
			
			<div class="panel-body">
				<div class="">
					<ul class="pagination"><?php echo ($page); ?></ul>
				</div>
				<h4>Tips:</h4>
				<p>1.状态：<code>已启用</code>表示该评论可以使用；<code>已禁用</code>表示该评论无法使用；</p>
				<p>2.数量：标题后面数字为该评论的回复<code>未审核数量</code></p>

			</div>
		</section>
	</div>
	

	
</div>
<!--body wrapper end-->

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


<!--pickers css-->
<link rel="stylesheet" type="text/css" href="<?php echo ($public); ?>js/bootstrap-datetimepicker/css/datetimepicker-custom.css<?php echo ($versionnumber); ?>" />
<!--pickers plugins-->
<script type="text/javascript" src="<?php echo ($public); ?>js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js<?php echo ($versionnumber); ?>"></script>
<!--pickers initialization-->
<script src="<?php echo ($public); ?>js/pickers-init.js<?php echo ($versionnumber); ?>"></script>

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
<script src="<?php echo ($public); ?>js/common.js<?php echo ($versionnumber); ?>"></script>

</body>
</html>