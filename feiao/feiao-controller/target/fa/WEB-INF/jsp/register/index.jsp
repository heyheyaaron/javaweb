<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>飞傲社区</title>
		<meta name="description" content="${keepname}" />
		<meta name="keywords" content="${keepdesc}" />
		<meta content="width=1080" name="viewport" />
		<link href="/resources/uc/wlogin/base/css/base.css" type="text/css" rel="Stylesheet" />
		<link rel="stylesheet" type="text/css" href="/css/forgetpwd.css">
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
					<div id="tsk"  class="tip-box visiblility-hidden">
                                        <i class="err-ico"></i>
                                        <span class="tip-font"></span>
                                        <span class="close-ico"></span>
                                </div>
					

					<div class='normalInput cycode-box show-cycode' id="cycode-box">
						<div class="cycode-selectbox">
							
							<input id="email" name="email" class="ipt-phone inp-focus" placeholder="邮箱" >
						</div>
						
						
					</div>
				
					<!-- 极速验证 -->
                         <div>
					        <div id="captcha2">
					            <p id="wait2" class="show"></p>
					        </div>
					    </div>
					

					<div class='box-geetest'>
						<div id="div_id_embed"></div>
						<div id="div_geetest_lib"></div>
					</div>
					

				
					<div id='fiioblService' class="rememberField" style="font-size:12px;">
						<c:if test="${x1!=null && !empty x1}">
						<label class="pointer" for="acceptfiiobl" tabindex="0">点击立即注册，即表示您同意并愿意遵守</label>
						<a href="${x1[0].url}"  target="_blank"  class="linkABlue" >${x1[0].name}</a>
						
						</c:if>
						<c:if test="${x2!=null && !empty x2}">
						<label class="pointer">和</label>
						<a href="${x2[0].url}" target="_blank" class="linkABlue"  >${x2[0].name}</a>
						</c:if>
						
					</div>
					<a id="nextStep"   class="fullBtnBlue register-btn" data-step='1' href="javascript:void(0)">立即注册</a>
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
         
		<script src="/js/gt.js"></script>
		<script type="text/javascript" src="${path}/js/jquery-timer-1.0.js"></script>
		  <div id="wechatPic" style="left: 1245px;top: 565px;display: none;"></div>

<script>
weChat();
$(function(){
	var handler2 = function (captchaObj) {
		
		//立即注册
		$("#nextStep").click(function(){
			if($(this).attr("data-step")==1){
				var result = captchaObj.getValidate();
				
		        if (!result) {
		            $("#tsk").removeClass("visiblility-hidden");
		            $("#tsk").addClass("visiblility");
		            $(".tip-font").text("请点击按钮进行验证")
		        }else{
		        	/* var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		        	if(myreg.test($("#email").val())){ */
		        		
		        		emailForRe();
		        	/* }else{
		        		$("#tsk").removeClass("visiblility-hidden");
			            $("#tsk").addClass("visiblility");
			            $(".tip-font").text("邮箱格式不正确")
		        	} */
		        	
		        }
			}
			
		})
        // 将验证码加到id为captcha的元素里，同时会有三个input的值用于表单提交
        captchaObj.appendTo("#captcha2");
        
    };
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
	
})
function emailForRe(){
	$.ajax({
		url:"/sendEmailForRegister.do",
		data:{"email":$("#email").val()},
		type:"post",
		dataType:"json",
		success:function(data){
			if(data.tip=="success"){
				downcounts($("#nextStep"),'{0}s再获取', 60);
				$("#tsk").removeClass("visiblility-hidden");
 	            $("#tsk").addClass("visiblility");
 	            $(".tip-font").text("点击邮箱里的链接即可完成注册")
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
}
function downcounts(thiss,msg, seconds){
	if (seconds > 1){
		/** 自减 */
		seconds--;
		/** 替换消息中的占位符 */
		var msgText = msg.replace("{0}", seconds);
		/** 禁用按钮 */
		
		thiss.attr("data-step", 0);
		thiss.text(msgText);
		
		
		
		
		/** 开启延迟的定时器 */
		setTimeout(function(){
			downcounts(thiss,msg, seconds);
		}, 1000);
	}else{
		
		thiss.attr("data-step", 1).text("重新发送");
		
		
	}
}
</script>
	</body>


</html>