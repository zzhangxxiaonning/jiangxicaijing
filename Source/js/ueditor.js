/**
 * 百度富文本编辑器
 * 尉强 2015-11-14
 *  
 * jQuery(".closehtml") 关闭弹出页面
 * jQuery("#ymtiaozhuan")分页跳转到制定页面
 * jQuery(".jqUrlSubmitReload")异步提交表单 并刷新当前页面
 * jQuery(".jqUrlDeleteReload")异步删除 并刷新当前页面
 * 
 * 
 * 
**/
$(function(){
	var enet360_editor_all_a = [];
	jQuery(".enet360_editor_all").each(function(){
		enet360_editor_all_a[jQuery(this).attr("id")] = UE.getEditor(jQuery(this).attr("id"),{
            elementPathEnabled:false
		});
	});
	
})