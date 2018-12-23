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
		<link href="/css/common.css" type="text/css" rel="Stylesheet" />
		<link href="/css/byPhone.css" type="text/css" rel="Stylesheet" />
		<link href="/css/media.css" type="text/css" rel="Stylesheet" />
		   <script src="/js/jquery.js"></script>
         <script src="/js/commom.js"></script>
         <script type="text/javascript" src="${path}/js/jquery-timer-1.0.js"></script>
         <style >
         	.geetest_holder.geetest_mobile.geetest_ant.geetest_popup .geetest_popup_box {
			    
			    top: 40% !important;
			    left: 74% !important;
			    
			}
			#vcodez {
    width: 200px;
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
         a.fullBtnBlues {
			    margin-bottom: 0px;
			    display: inline-block;
			    height: 40px;
			    width: 127px;
			    font-size: 18px;
			    line-height: 40px;
			    text-align: center;
			    outline: none;
			    cursor: pointer;
			    background-color: #ff3939;
			    color: #fff;
			    border-radius: 4px;
			    margin-left: 1px;
			}
         a.fullBtnBlue {
			    
			    width: 127px !important;
			    margin-left: 50px !important;
			    
			}
         </style>
	</head>

	<body>
		<div id='content' class="content">

			<div class=ucSimpleHeader id="header">
				<a href="" class='fiioLogo'><i class='i_icon'></i></a>

			</div>
			<div class='title'>找回登录密码</div>
			<div class='flow'><i class='i_icon'></i></div>
			<div class='middle'>
				
					<input type="hidden" id="account" >
					<input type="hidden"  id="hasEmail">
					
					
					<div class='normalInput cycode-box show-cycode' >
						<div class="cycode-selectbox" style="height: 100%;width: 100%">
							
							<select id="ty" style="height: 100%;width: 100%;border: 0">
								<option value="0">通过手机找回密码</option>
								<option value="2">通过邮箱找回密码</option>
								<option value="1">通过密保找回密码</option>
							</select>
						</div>
						
					</div>
					
					
					
					<!--通过手机找回密码  -->
					<div id="telPsw">
					<c:if test="${fu.fa_telphone!=null}">
						<div class='normalInput cycode-box show-cycode' id="cycode-box">
							<div class="cycode-selectbox">
								<span class="cycode-selected">
		                        <input readonly class="ipt-cycode"  value="+86" >
		                        <i class="arrow-down"></i>
		                    </span>
								<input id="phone" value="${fu.fa_telphone}" class="ipt-phone" disabled="disabled">
							</div>
						</div>
						<div class='lineWrap'>
							<div class="normalInput box-input">
								<input type="text" id="vcode" name="vcode"  placeholder='验证码' >
								<span class="form-line"></span>
								<a id="getKey" href="javascript:void(0);" class="linkABlue" data-step="1">获取验证码</a>
							</div>
							<div class="clear"></div>
							<font id="tipt"></font>
						</div>
						<div class='nextWrap'>
							<a  class="fullBtnBlues" href="/forget/firstPsw.do">上一步</a>
							<a id='nextStep' class="fullBtnBlue" href="javascript:void(0);">下一步</a>
						</div>
					
					</c:if>
					<c:if test="${fu.fa_telphone==null}">
						您还未绑定手机，请选择别的方式找回密码
					
					</c:if>
						
					</div>
					<!--通过邮箱找回密码  -->
					<div id="emailPsw">
					<c:if test="${fu.fa_email!=null}">
						<div class='normalInput cycode-box show-cycode' id="cycode-box">
							<div class="cycode-selectbox">
								
								<input id="email" value="${fu.fa_email}" class="ipt-phone" disabled="disabled">
							</div>
						</div>
						<div class='lineWrap'>
							<div class="normalInput box-input">
								<input type="text" id="vcodez" name="vcode"  placeholder='验证码' >
								<span class="form-line"></span>
								<a id="getKeyz" href="javascript:void(0);" class="linkABlue" data-step="1">获取验证码</a>
							</div>
							<div class="clear"></div>
							<font id="tipe"></font>
						</div>
						<div class='nextWrap'>
							<a id='nextStepz' class="fullBtnBlue" href="javascript:void(0);">下一步</a>
						</div>
					
					</c:if>
					<c:if test="${fu.fa_email==null}">
						您还未绑定邮箱，请选择别的方式找回密码
					
					</c:if>
						
					</div>
					
					
					
					
					
					<!--通过密保找回密码  -->
					<form id="userForm">
					<input type="hidden"  name="id" value="${fu.fa_id}">
					<div id="mbPsw">
					<c:if test="${fu.fa_mibao_qu_st!=null && fu.fa_mibao_qu_nd!=null && fu.fa_mibao_qu_rd !=null}">
						
						<div class='normalInput cycode-box show-cycode' >
							<div class="cycode-selectbox" style="height: 100%;width: 100%">
								
								<input  class="ipt-phone" value="${fu.fa_mibao_qu_st}" disabled="disabled" style="height: 100%;width: 100%">
							</div>
							
						</div>
						<div class='normalInput cycode-box show-cycode' >
							<div class="cycode-selectbox" style="height: 100%;width: 100%">
								
								<input  type="text" class="ipt-phone" name="answer1"  style="height: 100%;width: 100%">
							</div>
							
						</div>
						<div class='normalInput cycode-box show-cycode' >
							<div class="cycode-selectbox" style="height: 100%;width: 100%">
								
								<input  class="ipt-phone" value="${fu.fa_mibao_qu_nd}" disabled="disabled" style="height: 100%;width: 100%">
							</div>
							
						</div>
						<div class='normalInput cycode-box show-cycode' >
							<div class="cycode-selectbox" style="height: 100%;width: 100%">
								
								<input  type="text" class="ipt-phone" name="answer2"  style="height: 100%;width: 100%">
							</div>
							
						</div>
						<div class='normalInput cycode-box show-cycode' >
							<div class="cycode-selectbox" style="height: 100%;width: 100%">
								
								<input  class="ipt-phone" value="${fu.fa_mibao_qu_rd}" disabled="disabled" style="height: 100%;width: 100%">
							</div>
							
						</div>
						<div class='normalInput cycode-box show-cycode' >
							<div class="cycode-selectbox" style="height: 100%;width: 100%">
								
								<input  type="text" class="ipt-phone" name="answer3"  style="height: 100%;width: 100%">
							</div>
							
						</div>
						<font id="tipm"></font>
						
						<div class='nextWrap'>
							<a id='nextSteps' class="fullBtnBlue" href="javascript:void(0);">下一步</a>
						</div>
					
					</c:if>
					<c:if test="${fu.fa_mibao_qu_st==null || fu.fa_mibao_qu_nd==null || fu.fa_mibao_qu_rd ==null}">
						您还未设置密保问题，或者密保问题不完整，请选择别的方式找回密码
					</c:if>
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
	//选择找回密码方式
	$("#mbPsw").hide();
	$("#telPsw").show();
	$("#emailPsw").hide();
	$("#ty").change(function(){
		if($(this).val()==0){
			$("#mbPsw").hide();
			$("#telPsw").show();
			$("#emailPsw").hide();
		}else if($(this).val()==2){
			$("#mbPsw").hide();
			$("#telPsw").hide();
			$("#emailPsw").show();
		}else{
			
			$("#telPsw").hide();
			$("#mbPsw").show();
			$("#emailPsw").hide();
		}
	})
	//通过手机验证
	$("#nextStep").click(function(){
		$.ajax({
			url:"${path}/forget/videTel.do",
			data:{"vcode":$("#vcode").val()},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.tip=="success"){
					window.location.href="${path}/forget/thirdPsw.do?id=${fu.fa_id}";
				}else{
					$("#tipt").prop("color","red");
					$("#tipt").text("  "+data.tip)
					setTimeout(function(){
						$("#tipt").text("");
					}, 2000);
				}
				
			},
			error:function(){
				$("#tipt").prop("color","red");
				$("#tipt").text("  系统出现异常，请重新操作")
				setTimeout(function(){
					$("#tipt").text("");
				}, 2000);
			}
		})
		
	})
	//通过邮箱验证
	$("#nextStepz").click(function(){
		$.ajax({
			url:"${path}/forget/videEmail.do",
			data:{"vcode":$("#vcodez").val()},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.tip=="success"){
					window.location.href="${path}/forget/thirdPsw.do?id=${fu.fa_id}";
				}else{
					$("#tipe").prop("color","red");
					$("#tipe").text("  "+data.tip)
					setTimeout(function(){
						$("#tipe").text("");
					}, 2000);
				}
				
			},
			error:function(){
				$("#tipe").prop("color","red");
				$("#tipe").text("  系统出现异常，请重新操作")
				setTimeout(function(){
					$("#tipe").text("");
				}, 2000);
			}
		})
		
	})
	
	
	//通过密保
	$("#nextSteps").click(function(){
		
		$.ajax({
			url:"${path}/forget/videMibao.do",
			data:$("#userForm").serialize(),
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.tip=="success"){
					window.location.href="${path}/forget/thirdPsw.do?id=${fu.fa_id}";
				}else{
					$("#tipm").prop("color","red");
					$("#tipm").text("  "+data.tip)
					setTimeout(function(){
						$("#tipm").text("");
					}, 2000);
				}
				
			},
			error:function(){
				$("#tipm").prop("color","red");
				$("#tipm").text("  系统出现异常，请重新操作")
				setTimeout(function(){
					$("#tipm").text("");
				}, 2000);
			}
		})
	})
	//手机获取验证码
	$("#getKey").click(function(){
		if($("#getKey").attr("data-step")==1){
			
		
		$.ajax({
			url:"${path}/sendCodeByTel.do",
			data:{"tel":"${fu.fa_telphone}"},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.tip=="success"){
				downcounts($("#getKey"),'{0}s再获取', 60);
				}else{
					$("#tipt").prop("color","red");
					$("#tipt").text("  "+data.tip)
					setTimeout(function(){
						$("#tipt").text("");
					}, 2000);
				}
				
			},
			error:function(){
				$("#tipt").prop("color","red");
				$("#tipt").text("  系统出现异常，请重新操作")
				setTimeout(function(){
					$("#tipt").text("");
				}, 2000);
			}
		})
		}
	})
	
	
	//邮箱获取验证码
	$("#getKeyz").click(function(){
		if($("#getKeyz").attr("data-step")==1){
			
		
		$.ajax({
			url:"${path}/sendCodeByEmail.do",
			data:{"email":"${fu.fa_email}"},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.tip=="success"){
				downcounts($("#getKeyz"),'{0}s再获取', 60);
				}else{
					$("#tipe").prop("color","red");
					$("#tipe").text("  "+data.tip)
					setTimeout(function(){
						$("#tipe").text("");
					}, 2000);
				}
				
			},
			error:function(){
				$("#tipe").prop("color","red");
				$("#tipe").text("  系统出现异常，请重新操作")
				setTimeout(function(){
					$("#tipe").text("");
				}, 2000);
			}
		})
		}
	})
})
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