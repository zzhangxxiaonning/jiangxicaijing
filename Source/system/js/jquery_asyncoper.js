//异步提交数据 jquery_asyncoper.js
/**
 * url:"{:U('Slide/edit_category_handle')}"
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
 * url:"{:U('Slide/delete_slide_category', array('id'=>$vo['id']))}"
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