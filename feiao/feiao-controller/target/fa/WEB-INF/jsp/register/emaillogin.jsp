<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="description" content="${keepname}" />
		<meta name="keywords" content="${keepdesc}" />
		<meta content="width=1080" name="viewport" />
		<title>飞傲社区</title>
		<link href="/resources/uc/wlogin/base/css/base.css" type="text/css" rel="Stylesheet" />
		<link rel="stylesheet" type="text/css" href="../css/forgetpwd.css">
		<link href="/css/cycode.css" rel="stylesheet" />
		<link href="/css/register.css" type="text/css" rel="Stylesheet" />
		<style >
         	.geetest_holder.geetest_mobile.geetest_ant.geetest_popup .geetest_popup_box {
			    
			    top: 40% !important;
			    left: 74% !important;
			    
			}
         #wechatPic {
         	position: absolute;
		    background: url(${weixin}) no-repeat;
		    align:"center";
		    width: 124px;
			height: 124px;
		    _filter: progid: DXImageTransform.Microsoft.AlphaImageLoader(src='${weixin}');
		    _background-image: none;
		    z-index: 1000;
		   background-size:100% 100%;
		    display: none;
		    top:685px !important;
		    left:1340px !important;
		}
		/* #wechatPic {
		    
		    
		    width: 310px;
		    height: 270px;
		    background: url(../../../../../img/weixin.png) no-repeat;
		    
		} */
         </style>
	</head>

	<body>
		<div id='content' class="content">

			<div class=ucSimpleHeader id="header">
				<a href="/" class='fiioLogo'><i class='i_icon'></i></a>

			</div>
			<div class="banner-box">
				<form id="mainForm" class="main-form">
					<div class="tab-title">
						<a class="linkABlue" id="toTelRegister" href="javascript:void(0)">注册飞傲账号</a>

					</div>
					<div  id="tsk" class="tip-box visiblility-hidden">
						<i class="err-ico"></i>
						<span class="tip-font"></span>
						<span class="close-ico"></span>
					</div>
					
					
				
					
					<div class='normalInput'>
						<input type="text" value="${email}" disabled="disabled"   class="inp-focus">
						<font >邮箱：</font>
						
						<div class='clear'></div>
					</div>
					<div class='normalInput'>
						<input type="password" placeholder='密码'  id="pbl" name="password"  class="inp-focus">
						<font >密码：</font><font id="ptip" class="ptip" color="red"></font>
						<div class='clear'></div>
					</div>
					<div class='normalInput'>
						<input type="password" placeholder='确认密码'  id="sbl"  class="inp-focus">
						<font >确认密码：</font><font id="stip" class="ptip" color="red"></font>
						<div class='clear'></div>
					</div>
					<div class='normalInput'>
						<input type="username" placeholder='昵称'  id="nnbl"  class="inp-focus">
						<font >昵称：</font><font id="nntip" class="ptip" color="red"></font>
						<div class='clear'></div>
					</div>

					<div class='box-geetest'>
						<div id="div_id_embed"></div>
						<div id="div_geetest_lib"></div>
					</div>
					

				
					
					<a id="nextStep" class="fullBtnBlue register-btn" data-step='1' href="javascript:void(0)">确认注册</a>
					<div class="transferField">
						<a class="go2register linkABlue" href="/login.do" id="toLogin">登录</a>
					</div>
				</form>
			</div>
			
		</div>

        <div id='fiioblFooter' class='footerWrap' style="background: #fff;">
                <div class='footerInner'>
                        <div class='footer-layer1'>
                                <div class='footer-innerLink'>
                                        <c:if test="${listNor!=null}">
											<c:forEach items="${listNor}" var="nor" >
												<a href="${nor['url']}">${nor['name']}</a>
                                        		<img class="foot-line" src="/resources/common/images/default/space.gif">
											</c:forEach>
										</c:if>
                                        <div href="javascript:void(0);" id="globalName" class="footer-language">
                                                简体中文&nbsp;&nbsp;&nbsp;
                                                <div id="globalContainer" class="footer-language_menu" style="height: 40px;">
                                                        <a href="javascript:void(0)" id="i18n-link" class="ClobalItem">English</a>
                                                </div>
                                        </div>
                                </div>
                                <div class='footer-outerLink'>
                                        <a class='footer-sinaMblog' href="${weibo}"><i class='i_icon'></i></a>
                                        <a id='footer-weChat' class='footer-weChat' href="javascript:void(0);"><i class='i_icon'></i></a>
                                        <a class='footer-qzone' href="${QQ}"><i class='i_icon'></i></a>
                                </div>
                        </div>
                        <div class='clear'></div>
                        <div id='fiioblCopyright' class="copyrightWrap">
                                <div class="copyrightInner">
                                        <c:if test="${listCom!=null}">
											<c:forEach items="${listCom}" var="com" >
												<a href="javascript:void(0)" class='linkAGray'>${com['name']}</a>
											</c:forEach>
										</c:if>
                                </div>
                        </div>
                </div>
        </div>
		  <script src="/js/jquery.js"></script>
         <script src="/js/commom.js"></script>
		
		  <div id="wechatPic" style="left: 1245px;top: 565px;display: none;"></div>

<script>
weChat();
$(function(){
	//密码格式
	$("#pbl").blur(function(){
		if($("#sbl").val()!=null && $("#sbl").val()!=""){
			if($("#pbl").val()!=null &&/^\w{6,18}$/.test($.trim($("#pbl").val()))){
				$("#ptip").attr("color","green")
				$("#ptip").text("√")
				
				if($("#sbl").val()==$("#pbl").val()){
					$("#stip").attr("color","green")
					$("#stip").text("√")
				}else{
					$("#stip").attr("color","red")
					$("#stip").text("两次密码长度不一样")
				}
				
			}else{
				$("#ptip").attr("color","red")
				$("#ptip").text("密码长度为6到18位")
			}
			
		}else{
			if($("#pbl").val()!=null &&/^\w{6,18}$/.test($.trim($("#pbl").val()))){
				$("#ptip").attr("color","green")
				$("#ptip").text("√")
			}else{
				$("#ptip").attr("color","red")
				$("#ptip").text("密码长度为6到18位")
			}
		}
		
		
	});
	//确认密码
	$("#sbl").blur(function(){
		if($("#sbl").val()==$("#pbl").val()){
			$("#stip").attr("color","green")
			$("#stip").text("√")
		}else{
			$("#stip").attr("color","red")
			$("#stip").text("输入两次密码不一致")
		}
	});
	//昵称
	$("#nnbl").blur(function(){
		$.ajax({
			url:"/note/usernameIsTrue.do",
			data:{"username":$("#nnbl").val()},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.tip=="success"){
					$("#nntip").attr("color","green")
					$("#nntip").text("√")
				}else{
					$("#nntip").attr("color","red")
					$("#nntip").text(data.tip)
				}
			},
			error:function(){
				$("#tsk").removeClass("visiblility-hidden");
		            $("#tsk").addClass("visiblility");
		            $(".tip-font").text("网速太卡，请稍后再操作")
			}
		})
		
		
		
	});
	$("#nextStep").click(function(){
		if($("#ptip").text()=="√"){
			if($("#stip").text()=="√"){
				if($("#nntip").text()=="√"){
					$.ajax({
						url:"/RegisterMemberForEmail.do",
						data:{"password":$("#pbl").val(),"email":"${email}","username":$("#nnbl").val()},
						type:"post",
						dataType:"json",
						success:function(data){
							if(data.tip=="success"){
								$("#tsk").removeClass("visiblility-hidden");
				 	            $("#tsk").addClass("visiblility");
				 	            $(".tip-font").text("注册成功，请返回登录页面进行登录")
				 	            setTimeout(function(){
									window.location.href="/login.do";
								},1000)
							}else{
								$("#tsk").removeClass("visiblility-hidden");
				 	            $("#tsk").addClass("visiblility");
				 	            $(".tip-font").text(data.tip)
							}
						},
						error:function(){
							$("#tsk").removeClass("visiblility-hidden");
					            $("#tsk").addClass("visiblility");
					            $(".tip-font").text("网速太卡，请稍后再操作")
						}
					})
				}else{
					$("#tsk").removeClass("visiblility-hidden");
			         $("#tsk").addClass("visiblility");
			         $(".tip-font").text("该昵称不能使用")
				}
				
			}else{
				 $("#tsk").removeClass("visiblility-hidden");
		         $("#tsk").addClass("visiblility");
		         $(".tip-font").text("输入的两次密码结果不一致")
			}
		}else{
			$("#tsk").removeClass("visiblility-hidden");
	         $("#tsk").addClass("visiblility");
	         $(".tip-font").text("输入的两次密码结果不一致")
		}
	})
})
</script>
	</body>


</html>