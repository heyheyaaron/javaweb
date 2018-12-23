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
<input type="hidden" name="fa_id" value="${faProduct.fa_id}"/>
<table class="table table-bordered ">
    
    
    <tr>
        <td width="10%" >产品代号</td>
        <td><input type="text"  value="${faProduct.fa_id}" disabled="disabled"/></td>
    </tr>
    <tr>
        <td  >产品名称</td>
        <td><input type="text" name="fa_title" value="${faProduct.fa_title}"/></td>
    </tr>
    <tr>
        <td  >产品型号</td>
        <td><input type="text" name="fa_type" value="${faProduct.fa_type}"/></td>
    </tr>
    <tr>
        <td  >条形码</td>
        <td><input type="text" name="fa_ma" value="${faProduct.fa_ma}"/></td>
    </tr>
    
    <tr>
        <td >产品图片</td>
        <td>
        	<img src="${faProduct.fa_image}" id="pic_target" width="70px" >
        	<br>
        	<a href="javascript:;" class="filess" style="margin-top:10px;">请选择要上传的图片
        	
        	<input type="file" id="file_pic" name="file" onchange="return ajaxFileUpload(this.id,'pic_target','pic_hidden','ht/product');" style="width: 200px;"/>
			</a>
			<input  type="text" id="pic_hidden" name="fa_image" style="display: none;" value="${faProduct.fa_image}"/>
        </td>
    </tr>
    
    
    <tr>
        <td ></td>
        <td>
        <shiro:hasPermission name="cppro:update">
            <button  class="btn btn-primary" type="button" id="savebtn">保存</button> 
        </shiro:hasPermission> 
            &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
    <tr>
        <td ></td>
        <td>
             
         </td>
    </tr>
    <tr>
    	<td >报名人信息</td>
        <td >
        <a href="javascript:;" class="filesf" style="margin-bottom:10px;"><font id="qxzs" >请选择.xsl格式的文件</font>
		    <input type="file" name="upFile" id="upFile" >
		</a>
        <br>
           
			    <shiro:hasPermission name="cppro:import">
			    	 <button type="button" class="btn btn-warning" id="excelbtn" style="margin-bottom:10px;">导入</button>
			  
			    	<font color="red" size="2"> * 必须使用excel文件导入，excel表中的第一列为产品盒码，第二列为注册码，第三列为产品代号（若第三列没有数据，则默认产品代号为当前页面的产品代号）</font>
			    <br>	
				</shiro:hasPermission>
        	<table class="table table-bordered " id="cmstable">
			</table>
        </td>
        
    </tr>
</table>
<div class="inline pull-right page">
		
         <font id="total" ></font> 条记录 <font id="curpage"></font>/<font id="totalpage"></font> 页  <a href='javascript:void(0)' id="firstp">首页</a>     <a href='javascript:void(0)' id="lastp">上一页</a>     <span class='current' id="curp"></span>     <a href='javascript:void(0)' id="nextfp"></a>     <a href='javascript:void(0)' id="nextsp"></a>     <a href='javascript:void(0)' id="nexttp"></a>     <a href='javascript:void(0)' id="nextp">下一页</a>     <a href='javascript:void(0)' id="endp">最后一页</a>    &nbsp;</div>
</body>
</form>
</body>
</html>
<script type="text/javascript" src="${path}/js/jquery/jquery.ocupload-1.1.2.js"></script>
<script>
    $(function () {   
    	//导入
		
				//window.location.href="${path}/pro/excelToPro.do?id=${faProduct.fa_id}";
		/** 为导入的按钮绑定一键上传 (异步) */
		/* $("#excelbtn").upload({
			name : "upFile", // 上传的文件名 <input type='file' name='regionFile'/>
			action : "${path}/pro/excelToPro.do", // 请求URL
		 	params: {"id":"${faProduct.fa_id}"},//请求时额外传递的参数，默认为空
            autoSubmit: true,//是否自动提交，即当选择了文件，自动关闭了选择窗口后，是否自动提交请求。
            
		}); */
		$("#upFile").change(function(){
			$("#qxzs").text("已找到文件，请点击导入上传数据...")
			
		});
		$("#excelbtn").click(function(){
			$.ajaxFileUpload({
		        url: '${path}/pro/excelToPro.do?id=${faProduct.fa_id}', //用于文件上传的服务器端请求地址
		        secureuri: false, //一般设置为false
		        fileElementId: 'upFile', //文件上传空间的id属性  
		        dataType: 'HTML', //返回值类型 一般设置为json
		        success: function (data, status)  //服务器成功响应处理函数
		        {                
		        	data = data.substring(data.indexOf(">")+1,data.indexOf("</pre>"));
                	data =  eval('(' + data + ')');
		        	if(data.tip=="success"){
		        		sweetAlert({
				 			title: "",
				 			text: "上传成功",
				 			type: "success",
				 			confirmButtonColor: "#2b2e37",
				 			confirmButtonText: "确认",
				 			closeOnConfirm: false,
				 			timer:7000
				 		},function(){
				 			window.location.href='${path}/pro/updatePro.do?curpage=${curpage}&id=${faProduct.fa_id}';
				 		});
		        	}else{
		        		sweetAlert({
				 			title: "",
				 			text: data.tip,
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
		);

		});
		$('#backid').click(function(){
				window.location.href="${path}/pro/returnPro.do?curpage=${curpage}";
		 });
		//加载
		var url = "${path}/pro/selectProErp.do"
		
		cmspagePro("curpage=1&id=${faProduct.fa_id}",url);
		
		//点击首页
		$("#firstp").click(function(){
			cmspagePro("curpage=1&id=${faProduct.fa_id}&"+$("#searchform").serialize(),url);
		})
		//点击上一页
		$("#lastp").click(function(){
			var cpage = Number($("#curpage").text())-1; 
			cmspagePro("curpage="+cpage+"&id=${faProduct.fa_id}&"+$("#searchform").serialize(),url);
		})
		//点击当前页+1
		$("#nextfp").click(function(){
			var cpage = Number($("#curpage").text())+1; 
			cmspagePro("curpage="+cpage+"&id=${faProduct.fa_id}&"+$("#searchform").serialize(),url);
		})
		//点击当前页+2
		$("#nextsp").click(function(){
			var cpage = Number($("#curpage").text())+2; 
			cmspagePro("curpage="+cpage+"&id=${faProduct.fa_id}&"+$("#searchform").serialize(),url);
		})
		//点击当前页+3
		$("#nexttp").click(function(){
			var cpage = Number($("#curpage").text())+3; 
			cmspagePro("curpage="+cpage+"&id=${faProduct.fa_id}&"+$("#searchform").serialize(),url);
		})
		//点击下一页
		$("#nextp").click(function(){
			var cpage = Number($("#curpage").text())+1; 
			cmspagePro("curpage="+cpage+"&id=${faProduct.fa_id}&"+$("#searchform").serialize(),url);
		})
		//点击最后一页
		$("#endp").click(function(){
			var cpage = Number($("#totalpage").text()); 
			cmspagePro("curpage="+cpage+"&id=${faProduct.fa_id}&"+$("#searchform").serialize(),url);
		})
		$("#savebtn").click(function(){
			
			
				$.ajax({
					url:"${path}/pro/sureUpdatePro.do",
					type:"post",
					data:$("#userForm").serialize(),
					dataType:"json",
					async : true,
					success:function(data){
						if(data.tip=="success"){
								sweetAlert({
						 			title: "",
						 			text: "修改成功！",
						 			type: "success",
						 			confirmButtonColor: "#2b2e37",
						 			confirmButtonText: "确认",
						 			closeOnConfirm: false,
						 			timer:7000
						 		},function(){
						 			window.location.href="${path}/pro/returnPro.do?curpage=${curpage}";
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
    function cmspagePro(cmsdata,url){
    	
    	
    	$.ajax({
    		url : url, // 请求URL
    		data:cmsdata,
    		type : "post", // 请求方式
    		dataType : "json", // 服务器响应回来的数据类型json: {}、[]、[{},{}]
    		async : true,
    		success : function(data){
    			var vars = "<thead><tr><th>uid</th><th>产品盒码</th><th>注册码</th><th>产品代号</th><th>绑定会员</th><th>操作</th></tr></thead>"
    			
    			
    			for (var i=0;i<data.rows.length;i++){
    				var condition = "未绑定会员";
    				if(data.rows[i].username!=null && data.rows[i].username!=''){
    					condition = data.rows[i].username;
    				}
    				var vart = '<tr><td>'+data.rows[i].id+'</td><td>'+data.rows[i].boxid+'</td><td>'+data.rows[i].zuce+'</td><td>'+data.rows[i].proid+'</td><td>'+condition+'</td><td>    <shiro:hasPermission name="cppro:delete"><a href="javascript:void(0)" ><span id="'+data.rows[i].id+'" class="deletes">删除</span></a></shiro:hasPermission></td></tr>';	
    				vars = vars+vart;
    			}
    			$("#cmstable").html(vars);
    			pageful(data);
    			//把商品追加到JSP页面中
    			$(".deletes").click(function(){
    				var zid = $(this).attr("id")
    				
    				sweetAlert({
    		 			title: "确定要删除吗？",
    		 			text: "该操作为永久删除，一旦删除将不得恢复！",
    		 			type: "warning",
    		 			confirmButtonColor: "#2b2e37",
    		 			confirmButtonText: "确认删除",
    		 			closeOnConfirm: false,
    		 			showCancelButton:true,
    		 			cancelButtonText:"不删除了",
    		 		},function(){
    		 			$.ajax({
    						url:"/pro/deleteProErp.do",
    						data:{"id":zid,"curpage":data.curpage},
    						type:"post",
    						dataType:"json",
    						async:true,
    						success:function(data){
    							if(data.tip){
    								sweetAlert({
    						 			title: "",
    						 			text: "删除成功！",
    						 			type: "success",
    						 			confirmButtonColor: "#2b2e37",
    						 			confirmButtonText: "确认",
    						 			closeOnConfirm: false,
    						 			timer:7000
    						 		},function(){
    						 			window.location.href ="/pro/updatePro.do?curpage=${curpage}&id=${faProduct.fa_id}";
    						 				
    						 		});
    							}else{
    								sweetAlert({
    						 			title: "",
    						 			text: "删除失败！",
    						 			type: "error",
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
    		},
    		error : function(){
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
    	});
    	
    }
  //JS校验form表单信息  
   /*  function checkData(){  
       var fileDir = $("#upfile").val();  
       var suffix = fileDir.substr(fileDir.lastIndexOf("."));  
       if("" == fileDir){  
           alert("选择需要导入的Excel文件！");  
           return false;  
       }  
       if(".xls" != suffix && ".xlsx" != suffix ){  
           alert("选择Excel格式的文件导入！");  
           return false;  
       }  
       return true;  
    }   */
</script>