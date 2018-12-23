
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="${keepname}" />
    <meta name="keywords" content="${keepdesc}" />
    
    <title>飞傲</title>
    <link href="/resources/uc/wlogin/base/css/base.css" type="text/css" rel="Stylesheet"/>
    <link href="/css/resetpwd.css" type="text/css" rel="Stylesheet"/>
    <link href="/css/common.css" type="text/css" rel="Stylesheet"/>
    <link href="/css/media.css" type="text/css" rel="Stylesheet"/>
    <link rel="stylesheet" type="text/css" href="/css/byPhone.css">
   <script src="/js/jquery.js"></script>
   <script src="/js/commom.js"></script>
   <script type="text/javascript" src="${path}/js/jquery-timer-1.0.js"></script>
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
         
         </style>
</head>
<body>
    <div id='content' class="content">
        


<div class=ucSimpleHeader id="header">
    <a href="" class='fiioLogo'><i class='i_icon'></i></a>
    
</div>
        <div class='title'><p class="">找回登录密码</p></div>
        <div class='flow'><i class='i_icon'></i></div>
        <div class='middle'>
            <form id="mainForm" >
                <input type="hidden"  id="form_resubmit_token_key">
                <input type="hidden" id="account" name="account">
                <div class='reset-password-div normalInput'>
                    <input type="password"  id="rpsw" placeholder='请输入新密码' >
                </div>
                <div class='reset-password-div normalInput ie6-btm0'>
                    <input type="password"  id="spsw" placeholder='请再次输入密码' >
                </div>
                <font id="tip" ></font>
                <div class='lineWrap'>
                    <a class="fullBtnBlue fleft" id="reset">重设密码</a>
                    <a class="fullBtnGray fleft" href="${path}/login.do">取消</a>
                </div>
                <div class='clear'></div>
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
        <div id="wechatPic" style="left: 1245px;top: 582px;display: none;"></div>
</body>
<script>
weChat();
$(function(){
	$("#reset").click(function(){
		if($("#rpsw").val()==$("#spsw").val()){
			if($("#rpsw").val().length>=6 && $("#rpsw").val().length<=18){
				$.ajax({
					url:"${path}/forget/resetPsw.do",
					data:{"id":"${id}","password":$("#rpsw").val()},
					type:"post",
					dataType:"json",
					success:function(data){
						if(data.tip=="success"){
							window.location.href="${path}/forget/forthPsw.do";
						}else{
							$("#tip").prop("color","red");
							$("#tip").text("    "+data.tip)
							setTimeout(function(){
								$("#tip").text("");
							}, 2000);
						}
					},
					error:function(){
						$("#tip").prop("color","red");
						$("#tip").text("     系统发生异常！")
						setTimeout(function(){
							$("#tip").text("");
						}, 2000);
					}
				})
			}else{
				$("#tip").prop("color","red");
				$("#tip").text("     密码长度为6到18位")
				setTimeout(function(){
					$("#tip").text("");
				}, 2000);	
			}
		}else{
			$("#tip").prop("color","red");
			$("#tip").text("     两次输入的密码不一致")
			setTimeout(function(){
				$("#tip").text("");
			}, 2000);
		}
	});
});
</script>
        
        
    </body>

</html>