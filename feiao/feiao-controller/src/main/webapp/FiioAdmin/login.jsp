<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
	
	</head>

	<body style="background-color: ">
	<c:import url="${path}/feiioback.jsp"></c:import>
		<div class="container" style="background-size:100% 100%">
		    <div class="row" style="background-size:100% 100%">
		        <div class="col-md-offset-3 col-md-6" style="padding-top: 250px;padding-bottom: 250px" >
		        <!-- updates 登录背景 -->
		            <form id="loginform" class="form-horizontal" style="background: url('${path}/images/login1.jpg');background-size:100% 100%">
		                <span class="heading">用户登录</span>
		                <div class="form-group">
		                    <input type="text" class="form-control" name="userId" id="userId" placeholder="用户名或电子邮件">
		                    <i class="fa fa-user"></i>
		                </div>
		                <div class="form-group help">
		                    <input type="password" class="form-control" name="password" id="password" placeholder="密　码">
		                    <i class="fa fa-lock"></i>
		                   
		                </div>
		                <div class="form-group help">
		                	<table style="width: 100%">
		                		<tr >
		                			<td style="width: 70%"><input type="text" class="form-control" name="vcode" id="vcode" placeholder="输入验证码" ></td>
		                			<td ><div id="sees" style="float:right;background-color: #f0f0f0;" class="btn btn-default"><img id="see" src="${path}/verify/show.do" style="width: 100%"/></div></td>
		                		</tr>
		                	</table>
		                	
		                    
		                    <i class="fa fa-lock"></i>
		                   
		                </div>
		                
		                
		                <div class="form-group">
		                	
		                    <div class="main-checkbox">
		                        <input type="checkbox" name="key" value="1" id="checkbox1"/>
		                        <label for="checkbox1" ></label>
		                    </div>
		                    <span class="text">Remember me</span>
		                    <input type="button" class="btn btn-default" id="loginBtn" value="登录">
		                </div>
		                
		            </form>
		        </div>
		    </div>
		</div>
	</body>
	
	<style type="text/css">    
	/* updates 背景 */  
     body{      
        background-color:#3d3d3d;    
        background-size:100% 100%;    
        height: 100%
     }      
 	</style> 
 	<script type="text/javascript">
 	/** 登录页面不能有父窗口 */
	if (window != parent){
		parent.location = window.location;
	}
	
	/** 判断如果是登录用户就跳转到主页面 */
	if ("${session_userh}" != ""){
		window.location.href = "${path}/system/main.do";
	}
 	$(function(){
 	
 	$("#sees").click(function(){
 		/* $("#see").trigger("click"); */
		/** 让验证码变一下  <img src=""/>*/
		//alert("?");
		$("#see").attr("src", "${path}/verify/show.do?random=" + Math.random());
	}).mouseover(function(){ // onmouseover
		// this: dom <img/>
		$("#see").css("cursor", "pointer");
	});
 	
	$("#loginBtn").click(function(event){
		
		/** 获取帐号 */
		var userId = $("#userId");
		/** 获取密码 */
		var password = $("#password");
		/** 获取验证码 */
		var vcode = $("#vcode");
		/** 定义提示信息 */
		var tip = "";
		
		if ($.trim(userId.val()) == ""){
			tip = "账户不能为空！";
			sweetAlert({
	 			title: "",
	 			text: "账户不能为空！",
	 			type: "warning",
	 			confirmButtonColor: "#2b2e37",
	 			confirmButtonText: "确认",
	 			closeOnConfirm: false,
	 			timer:7000
	 		});
			/** 获取焦点 */
			userId.focus();
		}else if (!/^\w{5,25}$/.test($.trim(userId.val())) ){
			tip = "帐号格式不正确！";
			sweetAlert({
	 			title: "",
	 			text: "帐号格式不正确！",
	 			type: "warning",
	 			confirmButtonColor: "#2b2e37",
	 			confirmButtonText: "确认",
	 			closeOnConfirm: false,
	 			timer:7000
	 		});
			userId.focus();
		}else if ($.trim(password.val()) == ""){
			tip = "密码不能为空！";
			sweetAlert({
	 			title: "",
	 			text: "密码不能为空！",
	 			type: "warning",
	 			confirmButtonColor: "#2b2e37",
	 			confirmButtonText: "确认",
	 			closeOnConfirm: false,
	 			timer:7000
	 		});
			/** 获取焦点 */
			password.focus();
		}else if ($.trim(vcode.val()) == ""){
			tip = "验证码不能为空！";
			sweetAlert({
	 			title: "",
	 			text: "验证码不能为空！",
	 			type: "warning",
	 			confirmButtonColor: "#2b2e37",
	 			confirmButtonText: "确认",
	 			closeOnConfirm: false,
	 			timer:7000
	 		});
			/** 获取焦点 */
			vcode.focus();
		}else if (!/^[a-z|A-Z|0-9]{4}$/.test($.trim(vcode.val()))){
			tip = "验证码格式不正确！";
			sweetAlert({
	 			title: "",
	 			text: "验证码格式不正确！",
	 			type: "warning",
	 			confirmButtonColor: "#2b2e37",
	 			confirmButtonText: "确认",
	 			closeOnConfirm: false,
	 			timer:7000
	 		});
			vcode.focus();
		} 
		// 判断tip 
		if (tip != ""){
			
			sweetAlert({
	 			title: "",
	 			text: tip,
	 			type: "info",
	 			confirmButtonColor: "#2b2e37",
	 			confirmButtonText: "确认",
	 			closeOnConfirm: false,
	 			timer:2000
	 		});
			}else{
			/** 把表单中的input元素序列化成请求参数(get请求字符串) */
			var params = $("#loginform").serialize();
			
			/** 异步请求登录 */
			$.ajax({
				url : "${path}/system/login.do", // 请求URL
				type : "post", // 请求方式
				data : params, // 请求参数
				dataType : "json", // 指定服务器响应回来的数据类型
				async : true, // 异步请求
				success : function(data){ // 请求成功
					// data : 响应数据(json)
					// {status : 0|1|2, tip : ""}
					// 往控制台输出日志
					//console.log(data);
					//alert(data.key + "==" + data.userId);
					
					if (data.status == 0){
						
						window.location.href = "${path}/system/main.do";
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
						/** 让验证码变一下 */
						$("#see").trigger("click");
					 } 
					
				},
				error : function(){ // 请求失败
					
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
	});
	
	
	
});

/** 监听用户是不是按了回车键 onkeydown */
$(document).keydown(function(event){
	// envet.keyCode : 获取按键的代号  
	// 13 : 回车键
	if (event.keyCode === 13){
		/** 事件触发 */
		$("#loginBtn").trigger("click");
	}
});
 	</script>
	

</html>