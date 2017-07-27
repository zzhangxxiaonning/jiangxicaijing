/**
 * 后台js 方法 
 *  2015-11-14
 *  
 * .enet360_upload_images		上传图片（本地+网络）
 * .enet360_upload_pc_images	上传图片（本地）
 * .enet360_upload_fail			上传附件
 * .enet360_upload_all_img		批量上传图片
 * 
**/
KindEditor.ready(function(K) {
    var editor_upload = K.editor({
        // uploadJson : Kind_upload_json,
        uploadJson : 'php/upload_json_lib.php',
        // DiyImgName : "ads",
        fileManagerJson : 'php/file_manager_json.php',
        // fileManagerJson : Kind_file_manager_json,
        allowFileManager : true,
        afterBlur: function(){editor_upload.sync();}
    });
   //编辑器
    window.editor = K.create('#editor_id',{
        cssPath:'/Source/kindeditor/plugins/code/prettify.css',
        resizeType :1,
        allowPreviewEmoticons : true,
        allowImageUpload : true,
        afterBlur: function(){this.sync();}
    });

    // 上传图片
    K('.enet360_upload_images').click(function(){
        var var_id = $(this).attr("var_id");
        editor_upload.loadPlugin("image", function(){
            editor_upload.plugin.imageDialog({
                imageUrl : K('#'+var_id+'_input').val(),
                clickFn : function(url,title,width,height,border,align){
                    K('#'+var_id+'_input').val(url);
                    $('#'+var_id+'_img').attr('src',url);
                    editor_upload.hideDialog();
                }
            });
        });
    });
    //多图上传
    K('#J_selectImage').click(function() {
        editor.loadPlugin('multiimage', function() {
            editor.plugin.multiImageDialog({
                clickFn : function(urlList) {
                    var div = K('#J_imageView');
                    //div.html('');
                    K.each(urlList, function(i, data) {
                        div.append('<span><img src="' + data.url + '" class="img_upload"><input type="hidden" name="img[]" value="' + data.url + '" /></span>');
                    });
                    editor.hideDialog();
                }
            });
        });
    });
    //删除图集里面图片
    $("#J_imageView").delegate("span","click",function(){
        if(window.confirm('你确定要删除此图片吗？')){
            var span=$(this);
            span.remove();
            return false;
        }
    });
    //上传附件
    K('.insertfile').click(function() {
        editor.loadPlugin('insertfile', function() {
            editor.plugin.fileDialog({
                fileUrl : K('#url').val(),
                clickFn : function(url, title) {
                    K('#url').val(url);
                    editor.hideDialog();
                }
            });
        });
    });
});