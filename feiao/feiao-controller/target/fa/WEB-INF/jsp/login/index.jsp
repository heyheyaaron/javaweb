<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="description" content="${keepname}" />
        <meta name="keywords" content="${keepdesc}" />
        <meta content="width=1080" name="viewport" />
        <title>飞傲</title>
        <link href="${path}/resources/uc/wlogin/base/css/base.css" rel="stylesheet" />
        <link href="${path}/wlogin/base/css/cycode.css" rel="stylesheet" />
        <link href="${path}/wlogin/member/css/login.css" rel="stylesheet" />
         <script src="${path}/js/jquery.js"></script>
         <script src="${path}/js/commom.js"></script>
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
		.normalInput input {
    
    		width: 86%;
    	}
         </style>
</head>

<body>
        <div id='content' class="content" >
                <div class=ucSimpleHeader id="header" style="padding-bottom: 40px;">
                        <a href="/" class='fiioLogo'><i class='i_icon'></i></a>
                </div>
                <div class="banner-box">
                        <form id="userForm" class="main-form">
                                <div class="tab-title">
                                        <a class="linkABlue" id="toAccountLogin" href="${path}/login.do">账号登录</a>
                                        
                                        
                                </div>
                                <div id="tsk"  class="tip-box visiblility-hidden">
                                        <i class="err-ico"></i>
                                        <span class="tip-font"></span>
                                        <span class="close-ico"></span>
                                </div>
                                <div class='normalInput cycode-box fieldInput' id="cycode-box">
                                        <div class="cycode-selectbox">
                                                
                                                <input class="ipt-account inp-focus" id="account" name="username" placeholder="手机号/邮箱/昵称">
                                        </div>
                                        <div id="cycode-container" class="cycode-container"></div>
                                </div>
                                <div class='normalInput fieldInput'>
                                        <input type="password" class="inp-focus" name="password" id="password" placeholder='密码' >
                                </div>
                                <div id="j_abnormalInp" class="normalInput" style="display:none">
                                        <input type="text"  id="abnormal" class="kapkey inp-focus" placeholder="验证码">
                                        <span class="form-line"></span>
                                        <a id="j_abnormalKey" href="javascript:void(0);"  class="linkABlue get_kapkey">获取验证码</a>
                                        <a id="j_abnormalTime" href="javascript:void(0);" class="kapkey_requested" style="display:none;"><span class="interval_num">60</span>秒后重新获取</a>
                                </div>
                                <p id="j_abnormalTips" class="abnormal-tips"></p>
                                <div id='kapkeyWrap' class='lineWrap' style='display:none'>
                                        <div class='normalInput'>
                                                <input type="text"  id="kapkey" class='kapkey' placeholder="验证码" >
                                                <img id="imgKey" class='pointer' >
                                        </div>
                                </div>
                                <input type="hidden"  id="appuri" />
                                <input type="hidden" id="useruri" />
                                <input type="hidden" id="service" />
                                <input type="hidden"  id="sid" />
                                <div class='normalInput fieldInput' style='display:none;'>
                                        <input id="tips-show" />
                                </div>
                                <!-- 极速验证 -->
                                <div>
							        <div id="captcha2">
							            <p id="wait2" class="show">正在加载验证码......</p>
							        </div>
							    </div>
                                <span id="j_geetest_error" class="error geetest_error" style="display:none"></span>
                                <div class='rememberField'>
                                     <span class="mzchkbox"><input name="key" id="remember" type="checkbox" value="1" >
                                        <label for="remember" tabindex="0">记住登录状态</label></span>
                                </div>
                                <a id="login" class='fullBtnBlue' href="javascript:void(0)">登录</a>
                                <div class='transferField'>
                                        <a class="go2forgetpwd linkABlue rememberFieldForA" href="/forget/firstPsw.do">忘记密码?</a>
                                        <a class="go2register linkABlue" href="/register.do" class="linkAGray" id="toRegister">注册</a>
                                </div>
                                
                        </form>
                </div>
        </div>
                         <div id='fiioblFooter' class='footerWrap' style="background: #fff; ">
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
                                <!-- <div class='footer-service'>
                                        <span class='service-label'>全国服务热线</span>
                                        <span class='service-num'>4000 426 826 </span>
                                        <a id='service-online' class='service-online' href="javascript:void(0);">在线客服</a>
                                </div> -->
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
                                        <!-- <span>FiiO Electronic Technology Co., Ltd. All rights reserved. </span>
                                        <a href="javascript:void(0)" class='linkAGray'>粤ICP备07072214号-2</a>
                                        <a href="" class='linkAGray'>粤公网安备 44049102496009 号</a>
                                        <a href="" class="linkAGray">营业执照</a> -->
                                </div>
                        </div>
                </div>
        </div>
        <div id="wechatPic" style="left: 1234px;top: 569px;display: none;"></div>
</body>
<script>
weChat();
$(function(){
	//极速验证
	$.ajax({
        url: "${path}/gt/register2?t=" + (new Date()).getTime(), // 加随机数防止缓存
        type: "get",
        dataType: "json",
        success: function (data) {
            // 调用 initGeetest 初始化参数
            // 参数1：配置参数
            // 参数2：回调，回调的第一个参数验证码对象，之后可以使用它调用相应的接口
            initGeetest({
                gt: data.gt,
                challenge: data.challenge,
                new_captcha: data.new_captcha, // 用于宕机时表示是新验证码的宕机
                offline: !data.success, // 表示用户后台检测极验服务器是否宕机，一般不需要关注
                product: "popup", // 产品形式，包括：float，popup
                width: "100%",
                top: "92%",
			    left: "78%"
                // 更多配置参数请参见：http://www.geetest.com/install/sections/idx-client-sdk.html#config
            }, handler2);
        }
    });
	//登录
	$("#login").click(function(){
		if($("#account").val()!=null && $("#account").val()!=""){
			if($("#password").val()!=null && $("#password").val()!=""){
				var result = captchaObj.getValidate();
		        if (!result) {
		            $("#tsk").removeClass("visiblility-hidden");
		            $("#tsk").addClass("visiblility");
		            $(".tip-font").text("请点击按钮进行验证")
		        }else{
		        	$.ajax({
		        		url:"${path}/sureLogin.do",
		        		data:$("#userForm").serialize(),
		        		type:"post",
		        		dataType:"json",
		        		success:function(data){
		        			if(data.tip=="success"){
		        				window.location.href="/";
		        			}else{
		        				$("#tsk").removeClass("visiblility-hidden");
			    	            $("#tsk").addClass("visiblility");
			    	            $(".tip-font").text(data.tip)
		        			}
		        			
		        		},
		        		error:function(){
		        			$("#tsk").removeClass("visiblility-hidden");
		    	            $("#tsk").addClass("visiblility");
		    	            $(".tip-font").text("系统发生错误，请重新输入")
		        		}
		        	});
		        }
			}else{
				$("#tsk").removeClass("visiblility-hidden");
	            $("#tsk").addClass("visiblility");
	            $(".tip-font").text("请输入密码")
			}
		}else{
			$("#tsk").removeClass("visiblility-hidden");
            $("#tsk").addClass("visiblility");
            $(".tip-font").text("请输入手机/邮箱/昵称")
		}
		
	})
	//扫码
	$("#qr-btn").click(function(){
		if($("#qr-panel").hasClass('hide')){
			$("#qr-panel").removeClass("hide");
		}else{
			$("#qr-panel").addClass("hide");
		}
	})
})
</script>

<script charset="utf-8" type="text/javascript" src="${path}/resources/common/js/jquery-1.7.1.min.js"></script>

<script type="text/javascript" src="${path}/resources/uc/wlogin/member/js/geetest-3.0.js" charset="utf-8"></script>
<script type="text/javascript" src="${path}/resources/uc/wlogin/base/js/jquery.form.js" charset="utf-8"></script>
<script type="text/javascript" src="${path}/resources/uc/wlogin/base/js/jquery.validate.js" charset="utf-8"></script>
<script type="text/javascript" src="${path}/resources/uc/wlogin/base/js/utils.js" charset="utf-8"></script>
<script type="text/javascript" src="${path}/resources/uc/wlogin/base/js/fiiobl.elements.js" charset="utf-8"></script>
<script type="text/javascript" src="${path}/esources/uc/wlogin/base/js/base.js" charset="utf-8"></script>
    <script src="${path}/resources/uc/wlogin/base/js/cycode.js"></script>
<script type="text/javascript" src="${path}/resources/uc/wlogin/member/js/login.js" charset="utf-8"></script>
<script src="/js/gt.js"></script>

</html>
