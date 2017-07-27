$(function(){
	//Jquery 异步删除 并刷新当前页面
	$(".jQ_delete_reload").click(function(){
		var url = $(this).attr("data-href");
		var title = $(this).attr("title")||"确定是否删除该信息";
		layer.confirm(title,{
			btn: ['确定','取消']
		},function(){
			// console.log(url+"--"+title);
			$.get(url,function(data){
				if(data.status == 1){
					layer.msg(data.info,{shift:6,time:1500},function(){
						window.location.reload(); 
					});
				}else{
					layer.msg(data.info,{shift:6,time:2000});
				}		
			},"json");
		},function(){});
	});
})