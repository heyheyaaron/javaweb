<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    

 

    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
</head>
<body>
<c:import url="${path}/feiioback.jsp"></c:import>
<form id="userForm">
<table class="table table-bordered ">
    <tr>
        <td width="10%" >等级名字</td>
        <td><input type="text" name="fa_name"/></td>
    </tr>
    <tr>
        <td >图标</td>
        <td>
        	<img src="" id="pic_target" width="70px" height="70px" style="display: none;">
        	<br>
        	<a href="javascript:;" class="filess" style="margin-top:10px;">请选择要上传的图片
        	<input   type="file" id="file_pic" name="file" onchange="return ajaxFileUpload(this.id,'pic_target','pic_hidden','ht/rank');" style="width: 200px;"/>
			</a>
			<input  type="text" id="pic_hidden" name="fa_image" style="display: none;"/>
        </td>
    </tr>
    <tr>
        <td >等级内最低积分</td>
        <td><input type="number" name="fa_start" id="start" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/><font color="red">    *范围在-99999~99999之间</font></td>
    </tr>
    <tr>
        <td >等级内最高积分</td>
        <td><input type="number" name="fa_end" id="end" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/><font color="red">    *范围在-99999~99999之间</font></td>
    </tr>
    <tr>
    	<td>发帖是否需要验证</td>
    	<td><input type="radio" name="fa_notev" value="1" >     是      <input type="radio" name="fa_notev"  checked="checked" value="0" >     否 </td>
    </tr>
    <tr>
    	<td>评论是否需要验证</td>
    	<td><input type="radio" name="fa_rev" value="1" >     是      <input type="radio" name="fa_rev"  checked="checked" value="0" >     否 </td>
    </tr>
    
    <tr>
        <td ></td>
        <td>
        <shiro:hasPermission name="mbrank:add">
            <button  class="btn btn-primary" type="button" id="savebtn">保存</button> 
        </shiro:hasPermission>
            &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="${path}/member/returnRank.do";
		 });
		$("#savebtn").click(function(){
			
			if(Number($("#start").val())<-99999 || Number($("#start").val())>99999 ||Number($("#end").val())<-99999 || Number($("#end").val())>99999){
				sweetAlert({
		 			title: "",
		 			text: "积分范围为-99999~99999！",
		 			type: "info",
		 			confirmButtonColor: "#2b2e37",
		 			confirmButtonText: "确认",
		 			closeOnConfirm: false,
		 			timer:7000
		 		});
			}else{
				$.ajax({
					url:"${path}/member/sureAddRank.do",
					type:"post",
					data:$("#userForm").serialize(),
					dataType:"json",
					async : true,
					success:function(data){
						if(data.tip=="success"){
								sweetAlert({
						 			title: "",
						 			text: "保存成功！",
						 			type: "success",
						 			confirmButtonColor: "#2b2e37",
						 			confirmButtonText: "确认",
						 			closeOnConfirm: false,
						 			timer:7000
						 		},function(){
						 			window.location.href="${path}/member/returnRank.do?curpage=${curpage}";
						 		});
						}else{
							sweetAlert({
					 			title: "",
					 			text: data.tip,
					 			type: "warning",
					 			confirmButtonColor: "#2b2e37",
					 			confirmButtonText: "确认",
					 			closeOnConfirm: false,
					 			timer:7000
					 		});
						}
						
					},
					error:function(){
						sweetAlert({
				 			title: "",
				 			text: "数据加载失败！",
				 			type: "error",
				 			confirmButtonColor: "#2b2e37",
				 			confirmButtonText: "确认",
				 			closeOnConfirm: false,
				 			timer:7000
				 		});
					}
				})
			}
			
			
		});
		
		

    });
    /** 
    方法说明： ajax异步上传图片文件并实时显示 
    参数说明： 
    fileElementId：文件上传空间的id属性 <input type="file" id="file" name="file" /> 
    imgTargetId：用于显示上传的图片的img标签的id 
    imgHiddenId:一个用于存放上传图片的路径的隐藏的input标签 <input  type="text" id="pic_hidden" name="pic_hidden" style="display: none;"/> 
    saveDir:图片保存在服务器上某个文件夹的名称，如heads(用来存放员工头像) 
    */  
    var arr_filetype = ["jpg","png","jpeg","JPG","PNG","JPEG"];//支持的图片类型  
    function ajaxFileUpload(fileElementId,imgTargetId,imgHiddenId,saveDir){  
        //判断上传文件类型是否是图片类型  
        var filetype = $("#"+fileElementId).val().split(".")[1];  
        var num = arr_filetype.indexOf(filetype);//存在返回1，不存在返回-1  
        if(num == "-1"){  
            
			sweetAlert({
	 			title: "",
	 			text: "请选择"+arr_filetype.join(",")+"类型的图片文件！",
	 			type: "error",
	 			confirmButtonColor: "#2b2e37",
	 			confirmButtonText: "确认",
	 			closeOnConfirm: false,
	 			timer:7000
	 		});
            return false;  
        }   
        $.ajaxFileUpload  
        (  
            {  
                url:'${path}/image/fileUpload.do?saveDir='+saveDir,//用于文件上传的服务器端请求地址  
                secureuri:false,//一般设置为false  
                fileElementId:fileElementId,//文件上传空间的id属性  <input type="file" id="file" name="file" />  
                dataType: 'text',//返回值类型 一般设置为json  
                success: function (data, status)  //服务器成功响应处理函数  
                {  
                	
                	
                	data = data.substring(data.indexOf(">")+1,data.indexOf("</pre>"));
                	data =  eval('(' + data + ')');
                	if(data.trueOrFalse){
                		//alert(data.fileFileName);//从服务器返回的json中取出message中的数据,其中message为在struts2中action中定义的成员变量  
                        $("#"+imgTargetId).attr("src","");  
                        $("#"+imgTargetId).attr("src",data.fileFileName);  
                        $("#"+imgTargetId).show(); 
                        //将上传的图片路径（这里是相对服务器根路径的路径 ）暂存在该隐藏标签的value中，  
                        $("#"+imgHiddenId).val(data.fileFileName);  
                        
                        if(typeof(data.error) != 'undefined')  
                        {  
                            if(data.error != ''){  	
								sweetAlert({
						 			title: "",
						 			text: data.error,
						 			type: "error",
						 			confirmButtonColor: "#2b2e37",
						 			confirmButtonText: "确认",
						 			closeOnConfirm: false,
						 			timer:7000
						 		});
                            }else{  
								sweetAlert({
						 			title: "",
						 			text: data.message,
						 			type: "error",
						 			confirmButtonColor: "#2b2e37",
						 			confirmButtonText: "确认",
						 			closeOnConfirm: false,
						 			timer:7000
						 		});
                            }  
                        }  
                	}else{	
						sweetAlert({
				 			title: "",
				 			text: data.message,
				 			type: "error",
				 			confirmButtonColor: "#2b2e37",
				 			confirmButtonText: "确认",
				 			closeOnConfirm: false,
				 			timer:7000
				 		});
                	}
                    
                },  
                error: function (data, status, e)//服务器响应失败处理函数  
                {   	
                	
					sweetAlert({
			 			title: "",
			 			text: "系统异常",
			 			type: "error",
			 			confirmButtonColor: "#2b2e37",
			 			confirmButtonText: "确认",
			 			closeOnConfirm: false,
			 			timer:7000
			 		});
                }  
            }  
        )  
        return false;  
    } 
</script>