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
<style>
	.sort{
		
		width:30px;
	}
</style>
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
		<?php echo ($cat_name); ?>
	</h3>
	<ul class="breadcrumb">
		<li>
			<a href="<?php echo U('Index/index');?>">控制面板</a>
		</li>
		<li class="active"><?php echo ($cat_name); ?></li>
	</ul>

</div>
<!-- page heading end-->

<!--body wrapper start-->
<div class="wrapper">
	<div class="row">
		<div class="col-xs-12">
			<!-- 返回信息 -->
			<div class="error-message" style="display:none;"></div>
			<form id="backupForm" action="<?php echo U('index_post',array('type'=>$btype,'backup_name'=>$bname,'sizelimit'=>$bsizelimit,'dosubmit'=>$bdosubmit));?>" method="post">
				<div>
					<a href="<?php echo U('restore');?>" class="btn btn-defalut">查看备份</a>
					<!-- <input type="submit" value="开始备份" class="btn btn-info" id="submitbtn"> -->
					<input type="button" value="开始备份" class="btn btn-info" id="submitbtn">
				</div>
				<div class="widget-box">
					<div class="widget-header widget-header-flat">
						<h4 class="smaller">
							<i class="ace-icon glyphicon glyphicon-list"></i>
							<?php echo ($meta_title); ?>
						</h4>
					</div>
					<div class="widget-body">
						<div class="widget-main">
							<!-- 自定内容 -->
							<div class="table_list">
								<table class="table" cellspacing="0" class="table_form">
									<tr>
										<td class="col-xs-2">备份分卷大小</td>
										<td>
											<input type="text" name="sizelimit" value="<?php echo ($sizelimit); ?>" size="10"> K
											&nbsp;&nbsp;(推荐10M以下)
										</td>
									</tr>
									<tr>
										<td>备份名称</td>
										<td><input type="text" name="backup_name" value="<?php echo ($backup_name); ?>"></td>
									</tr>
									<tr>
										<td>备份类型</td>
										<td>
											<label>
												<input type="radio" checked="checked" value="full" name="backup_type" onclick="javascript:$('#js-showtables').hide();" class="ace">
												<span class="lbl"> 备份所有&nbsp;&nbsp;</span>
											</label>
											<label>
												<input type="radio" value="custom" name="backup_type" onclick="javascript:$('#js-showtables').show();" class="ace" />
												<span class="lbl">自定义备份</span>
											</label>
										</td>
									</tr>
									<tr id="js-showtables">
										<td align="right">
											<label class="position-relative">
												<input type="checkbox" class="ace" checked="checked" id="selectAll" onclick="checkAll()">
												<span class="lbl">&nbsp;&nbsp;全选/反选</span>
											</label>
										</td>
										<td colspan="2">
											<?php if(is_array($tables)): $i = 0; $__LIST__ = $tables;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><label class="position-relative inline" style="width:300px;">
													<input name="backup_tables[<?php echo ($val); ?>]" type="checkbox" value="-1" checked="checked" class="ace js-checkitem" />
													<span class="lbl">&nbsp;&nbsp;<?php echo ($val); ?></span>
												</label><?php endforeach; endif; else: echo "" ;endif; ?>
										</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
								</table>
							</div>
							<!-- end -->
						</div>
					</div>
				</div>
			</form>
			<!-- end -->
		</div>
		<style type="text/css">
			#js-showtables{display:none;}
			.checkbox.inline{
				margin-left: 10px;
			}
		</style>

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
<script type="text/javascript">
	// 全选反选
	function checkAll()
	{
		var checkedOfAll=$("#selectAll").prop("checked");
		$("input[type='checkbox']").prop("checked", checkedOfAll);
	}
	$(function(){
		$("#submitbtn").click(function(){
			$('.error-message').css('display','block');
			$('.error-message').html('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><i class="ace-icon fa fa-spinner fa-spin orange bigger-125"></i>&nbsp;&nbsp;正在备份，请勿进行其他操作！</div>');
			var data=$('#backupForm').serialize();
			var url="<?php echo U('Database/index_post');?>";
			postajaxForm(url,data);
		});
	});

	//异步提交数据
	/**
	 * url:"<?php echo U('Slide/edit_category_handle');?>"
	 * serial:$('#edit_slide_category').serialize()
	 */
	function postajaxForm(url,serial){
		cache: false,
				$.ajax({
					type: "POST",
					url: url,
					data: serial,
					dataType: 'json',
					success:function(data){
						//判断时候为json数据
						if(data.status)
						{
							// 延时执行
							$('.error-message').css('display','block');
							$(".error-message").html('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><p><i class="ace-icon fa fa-check"></i>提示！'+data.info+'</p></div>');
							$('.error-message').click(function(){
								$('.error-message').css('display','none');
							});
							setTimeout(function(){
								if(data.hasOwnProperty("url")){
									if(data.url!=''){
										window.location=data.url;
									}
								}else{
									$('.error-message').css('display','none');
								}
							},1000);

						} else {
							$('.error-message').css('display','block');
							$(".error-message").html('<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><i class="ace-icon fa fa-times"></i>提示！'+data.info+'<br></div>');
							$('.error-message').click(function(){
								$('.error-message').css('display','none');
							});
							setTimeout(function(){
								$('.error-message').css('display','none');
								if(data.hasOwnProperty("url")){
									if(data.url!=''){
										window.location=data.url;
									}
								}
							},1000);
						}
					}
				});
	}

	//删除单行
	/**
	 * url:"<?php echo U('Slide/delete_slide_category', array('id'=>$vo['id']));?>"
	 * os:$(this)
	 */
	function del(url,os){
		var tr =os.parent().parent();
		if (confirm("确定删除？")) {
			var id = os.attr("value");
			$.ajax({
				url: url,
				data: "id=" + id,
				type: "POST",
				success: function (data) {
					if (data.status=='1') {
						data=data.info;
						showTis(data,1,'success');
						tr.fadeOut("slow");
					}else{
						data=data.info;
						showTis(data,1,'error');
					}

				}
			});
		}
		return false;
	}
	function showTis(data,time,stut){

		$('.error-message').css('display','block');
		if(stut=='error'){
			$(".error-message").html('<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><i class="ace-icon fa fa-times"></i>提示！'+data+'<br></div>');
		}else{
			$(".error-message").html('<div class="alert alert-block alert-success"><button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i></button><p><i class="ace-icon fa fa-check"></i>提示！'+data+'</p></div>');
		}
		$('.error-message').click(function(){
			$('.error-message').css('display','none');
		});
		setTimeout(function(){
			$('.error-message').css('display','none');
			//window.location.reload();
		},(1000*time));
	}


</script>
</body>
</html>