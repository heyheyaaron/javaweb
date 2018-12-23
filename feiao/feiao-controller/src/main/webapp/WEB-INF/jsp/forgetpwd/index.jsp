<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="description" content="${keepname}" />
        <meta name="keywords" content="${keepdesc}" />
        <title>飞傲</title>
        <link href="/resources/uc/wlogin/base/css/base.css" type="text/css" rel="Stylesheet" />
        <link href="/css/cycode.css" rel="stylesheet" />
        <link href="/css/forgetpwd.css" type="text/css" rel="Stylesheet" />
        <link href="/css/common.css" type="text/css" rel="Stylesheet" />
        <link href="/css/media.css" type="text/css" rel="Stylesheet" />
        <script src="/js/jquery.js"></script>
         <script src="/js/commom.js"></script>
         <script type="text/javascript" src="${path}/js/jquery-timer-1.0.js"></script>
        <style >
        
        	.normalInput{
        	line-height: 34px !important;
        	font-size: 35px !important;
        	
        	}
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
                        <a href="/" class='fiioLogo'><i class='i_icon'></i></a>
                </div>
                <div class='title'>找回登录密码</div>
                <div class='flow'>
                        <i class='i_icon'></i>
                        <span class="flow_1">Enter the account</span>
                        <span class="flow_2">Verification code</span>
                        <span class="flow_3">Reset password</span>
                        <span class="flow_4">Complete</span>
                </div>
                <div class='middle'>
                        <form id="mainForm">
                                <div class='normalInput cycode-box box-input' id="cycode-box">
                                        <div class="cycode-selectbox">
                                                <span class="cycode-selected">
                            <input class="ipt-cycode" readonly id="cycode" >
                            <i class="arrow-down"></i>
                        </span>
                                                <input type="text"  class="ipt-account" id="account" name="username" placeholder="手机号/邮箱">
                                        </div>
                                        
                                </div>
                                <div class='lineWrap'>
                                        <div class="normalInput box-input">
                                        	
                                                <input type="text" id="kapkey"  name="code"  placeholder='验证码'>
                                                <img id="see" class="pointer" src="${path}/verify/show.do" >
                                                <font id="tip" size="2"></font>
                                            
                                        </div>
                                </div>
                                <div class='lineWrap'>
                                        <a id='nextStep' class="fullBtnBlue" href="javascript:void(0)">下一步</a>
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
        <div id="wechatPic" style="left: 1245px;top: 582px;display: none;"></div>
</body>
<script>
weChat();
$(function(){
	$("#see").click(function(){
 		/* $("#see").trigger("click"); */
		/** 让验证码变一下  <img src=""/>*/
		//alert("?");
		$("#see").attr("src", "${path}/verify/show.do?random=" + Math.random());
	}).mouseover(function(){ // onmouseover
		// this: dom <img/>
		$("#see").css("cursor", "pointer");
	});
	$("#nextStep").click(function(){
		$.ajax({
			url:"${path}/forget/vidFirst.do",
			data:{"username":$("#account").val(),"code":$("#kapkey").val()},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.tip=="success"){
					window.location.href="${path}/forget/secondPsw.do?id="+data.id;
				}else{
					$("#see").trigger("click");
					$("#tip").prop("color","red");
					$("#tip").text(data.tip)
					setTimeout(function(){
						$("#tip").text("");
					}, 2000);
				}
				
			},
			error:function(){
				$("#tip").prop("color","red");
				$("#tip").text("网络不稳定，请重新操作！");
				setTimeout(function(){
					$("#tip").text("");
				}, 2000);
			}
		})
	});
})
</script>

</html>











