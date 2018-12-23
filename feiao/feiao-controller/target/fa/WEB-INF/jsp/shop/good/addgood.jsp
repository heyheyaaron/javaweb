<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript" charset="utf-8" src="${path}/kindeditor/kindeditor.js"></script>
    <script type="text/javascript" src="${path}/jedate/jedate.min.js"></script>
	<script type="text/javascript">
	 //$(function(){
		KE.show({
			id : 'content1',
			imageUploadJson : '../../jsp/upload_json.jsp',
			fileManagerJson : '../../jsp/file_manager_json.jsp',
			allowFileManager : false,
			afterCreate : function(id) {
				KE.event.ctrl(document, 13, function() {
					KE.util.setData(id);
					document.forms['userForm'].submit();
				});
				KE.event.ctrl(KE.g[id].iframeDoc, 13, function() {
					KE.util.setData(id);
					document.forms['userForm'].submit();
				});
			}
			
		});
		
        
	//});
	
		function sb1(){
	         
	         
	      // jquery 表单提交 
	         $("#userForm").ajaxSubmit(function(data) { 
	         	
	         }); 

	         return false; // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转 
	     }
	</script>

 

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
        <td width="10%" >商品名称</td>
        <td><input type="text" name="fa_name"/></td>
    </tr>
    <tr>
        <td >图片</td>
        <td>
        	<img src="" id="pic_target" width="70px" height="70px" style="display: none;">
        	<br>
        	<a href="javascript:;" class="filess" style="margin-top:10px;">请选择要上传的图片
        	<input   type="file" id="file_pic" name="file" onchange="return ajaxFileUpload(this.id,'pic_target','pic_hidden','ht/group');" style="width: 200px;"/>
			</a>
			<input  type="text" id="pic_hidden" name="fa_image" style="display: none;"/>
        </td>
    </tr>
    <tr>
        <td  >兑换价格（飞镖数量）</td>
        <td><input type="number" name="fa_cost" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
    </tr>
    <tr>
        <td  >库存量</td>
        <td><input type="number" name="fa_num" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
    </tr>
    <tr>
        <td  >是否归还</td>
        <td><input type="radio" name="fa_isreturn" value="0" checked="checked">否&nbsp;&nbsp;&nbsp;<input type="radio" name="fa_isreturn" value="1" >是</td>
    </tr>
    <tr>
    	<td>是否永久兑换</td>
    	<td><input type="radio"  name="fa_islong" value="0" checked="checked">是&nbsp;&nbsp;&nbsp;<input type="radio" name="fa_islong" value="1" >否</td>

    </tr>
    <tr id="dhrq">
    	<td>兑换日期</td>
    	<td>
    	 日期：
    <span class="datep"><input class="datainp" id="startday" name="startday" type="text" placeholder="开始日期" width="250px"  readonly></span>
	----- 
	 <span class="datep"><input class="datainp" id="endday" name="endday" type="text" placeholder="结束日期"  width="300px" readonly></span>
    	</td>
    </tr>
    <tr>
           <td >提示</td>
           <td>
              <textarea  cols="60" rows="10" name="fa_tips" ></textarea>
           </td>
    </tr>
    <tr>
        <td >描述</td>
        <td><textarea id="content1" name="fa_desc" cols="100" rows="8" style="width:800px;height:600px;visibility:hidden;"></textarea></td>
    </tr>
    
    
    
    <tr>
        <td ></td>
        <td>
        <shiro:hasPermission name="mbgroup:add">
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
				window.location.href="${path}/shop/returnGood.do";
		 });
		document.getElementById("dhrq").style.display="none";
		$("#startday").val("");
		$("#endday").val("");
		$("input[name='fa_islong']").click(function(){
			
			if($(this).val()==0){
				document.getElementById("dhrq").style.display="none";
			}else{
				document.getElementById("dhrq").style.display="";
			}
		})
		$("#savebtn").click(function(){
			document.getElementById("content1").value=KE.util.getData('content1');
				$.ajax({
					url:"${path}/shop/sureAddGood.do",
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
						 			window.location.href="${path}/shop/returnGood.do?curpage=${curpage}";
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
    jeDate({
    	dateCell:"#startday",
    	format:"YYYY年MM月DD日 hh:mm:ss",
    	isinitVal:true,
    	isTime:true, //isClear:false,
    	minDate:"2014-09-19 00:00:00",
    	okfun:function(val){alert(val)}
    })
    jeDate({
    	dateCell:"#endday",
    	format:"YYYY年MM月DD日 hh:mm:ss",
    	isinitVal:true,
    	isTime:false, //isClear:false,
    	minDate:"2014-09-19 00:00:00",
    	okfun:function(val){alert(val)}
    })
</script>