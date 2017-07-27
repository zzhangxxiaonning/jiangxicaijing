/**
 * 后台js 方法 
 * 尉强 2015-11-14
 *  
 * .enet360_upload_images		上传图片（本地+网络）
 * .enet360_upload_pc_images	上传图片（本地）
 * .enet360_upload_fail			上传附件
 * .enet360_upload_all_img		批量上传图片
 * 
**/
KindEditor.ready(function(K){
	var editor_upload = K.editor({
		uploadJson : Kind_upload_json,
		fileManagerJson : Kind_file_manager_json,
		allowFileManager : true,
		afterBlur: function(){editor_upload.sync();}
	});
	// editor_upload = K.create('textarea[name="content"]', {
		// allowFileManager : true
	// });
	// 上传图片
	K('.enet360_upload_images').click(function(){
		var up_id = $(this).attr("varid");
		editor_upload.loadPlugin('image', function(){
			editor_upload.plugin.imageDialog({
				imageUrl : K('#'+up_id+'_input').val(),
				clickFn : function(url,title,width,height,border,align){
					K('#'+up_id+'_input').val(url);
					$('#'+up_id+'_img').attr('src',url);
					editor_upload.hideDialog();
				}
			});
		});
	});
	K('.enet360_upload_pc_images').click(function(){
		var up_id = $(this).attr("varid");
		editor_upload.loadPlugin('image', function(){
			editor_upload.plugin.imageDialog({
				imageUrl : K('#'+up_id+'_input').val(),
				clickFn : function(url,title,width,height,border,align){
					K('#'+up_id+'_input').val(url);
					$('#'+up_id+'_img').attr('src',url);
					editor_upload.hideDialog();
				}
			});
		});
	});
	// 上传附件
	K('.enet360_upload_fail').click(function(){
		var up_id = $(this).attr("varid");
		editor_upload.loadPlugin('insertfile',function(){
			editor_upload.plugin.fileDialog({
				fileUrl : K('#'+up_id+'_input').val(),
				clickFn : function(url, title) {
					K('#'+up_id+'_input').val(url);
					editor_upload.hideDialog();
				}
			});
		});
	});
	
	//批量上传图片
	K('.enet360_upload_all_img').click(function(){
		var up_id = $(this).attr("varid");
		editor_upload.loadPlugin('multiimage',function(){
			editor_upload.plugin.multiImageDialog({
				clickFn : function(urlList) {
					var div = K('#'+up_id+'_div');
					K.each(urlList, function(i, data){
						div.append('<p><img src="' + data.url + '" /><input type="hidden" name="img[]" value="' + data.url + '" /></p>');
					});
					editor_upload.hideDialog();
				}
			});
		});
	});
	
});