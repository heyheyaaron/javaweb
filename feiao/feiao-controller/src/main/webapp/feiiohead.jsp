<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>飞傲社区|飞傲官方论坛|飞傲产品官方交流平台</title>
		<meta name="renderer" content="webkit" />
		<meta name="keywords" content="${keepname}" />
		<meta name="description" content="${keepdesc} " />
		<style type="text/css">
			.pm_isnewzz {
			    background: url("/resources/php/bbs/static/image/common/pm_unread.png") no-repeat 0px 0px;
			    width: 20px;
			    height: 20px;
			    position: absolute;
			    right: 16px;
				bottom: 15px;
			    z-index:999; 
			}
		</style>
	
</head>
<body>
<!-- 提示弹出框 -->
<div id="append_parent" style="display: none">
	<div id="fwin_followmod" class="fwinmask" style="position:fixed; z-index: 601; left: 30%; top: 20%;" initialized="true">
		
		<table class="fwin" cellspacing="0" cellpadding="0">
			<tbody>
				<tr>
					<td class="m_c" id="fwin_content_followmod" style="" fwin="followmod">
						<h3 class="flb" id="fctrl_followmod" style="cursor: move;">
							<em>提示信息</em>
							<span>
								<a href="javascript:void(0)" class="flbc hidefocus"  title="关闭" id="closeTip">关闭</a>
							</span>
						</h3>
					
						<div class="c altw">
							<div class="alert_right" id="showMsg">成功</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
	<div id="fiio-header-container">
					<div class="fiio-header">
						<div class="fiio-header-wrap-1240">
							<div class="fiio-header-logo">
								<a class="fiio-header-logo-img" href="/"></a>
							</div>
							<div class="logBox">
								<div class="login-box" id="mzCust" style="position: relative;">
									<div id="laa" class="loginArea ">
									<c:if test="${fu!=null && fu.fa_id!=null}">
										
											<div class="log-img-box">
												<c:if test="${fu.fa_title_img!=null && fu.fa_title_img!=''}">
													<img src="${fu.fa_title_img}" class="user-avatar">
												</c:if>
												<c:if test="${fu.fa_title_img==null || fu.fa_title_img==''}">
													<img src="/img/log-default-avatar.png" class="user-avatar">
												</c:if>
												<ul class="log-dropdown" style="right: -44px; display: none">
													<li>
														<a class="actmanage_mzcust" href="/fiioer/showMemberMsg.do?id=${fu.fa_id}">个人账户</a>
														<a href="/fiioer/myFriendsMood.do">个人动态</a>
														<a href="/fiioer/myNote.do">我的帖子</a>
														<a href="/fiioer/myFriend.do">我的好友</a>
														<c:if test="${hasMyMsg>0}">
															<a href="/fiioer/myGetMsg.do" id="shanshan"><img  src="/resources/php/bbs/static/image/common/pm_unread.png" >&nbsp;我的消息</a>
														</c:if>
														<c:if test="${hasMyMsg<=0}">
															<a href="/fiioer/myGetMsg.do" >我的消息</a>
														</c:if>
														<a href="/fiioer/mySelfMsg.do">个人设置</a>
														<a href="/logouts.do">退出账户</a>
														
													</li>
												</ul>
											</div>
										
										
											
										
									
									</c:if>
									<c:if test="${fu==null || fu.fa_id==null}">
										<div class="log-img-box">
											<img src="/img/log-default-avatar.png" class="user-avatar">
										</div>
										<div class="not-login-block-sub">
											<div class="not-login-block-sub-tit"></div>
											<p>
												<a id="mzLogin" class="u-btn" href="/login.do">立即登录</a>
											</p>
											<p>没有账号?
												<a  class="s-mzblue" href="/register.do">立即注册</a>
											</p>
										</div>
									
									</c:if>
										
									</div>
									<c:if test="${hasMyMsg>0}">
										<div class="pm_isnewzz png_bg" id="shanshanimg"></div>
									</c:if>
									
								</div>
							</div>
							<ul class="fiio-header-link" id="fiio-header-link">
								<li>
									<a href="/">论坛首页</a>
								</li>
								
								<c:if test="${listHead!=null}">
									<c:forEach items="${listHead}" var="heads" >
										<li  class="fiio-header-link-product">
											<a href="${heads['url']}" class="fiio-header-link-product-a">${heads['name']}</a>
										</li>
									</c:forEach>
								</c:if>
								
								
							</ul>
						</div>
					</div>
				</div>
				<!-- 首页头部 -->
				
				<div class="wp">
					<div id="nv">
						<div class="block-wrap">
							<ul>
								<li class="first">
									<a href="/">首页</a>
								</li>
								<c:if test="${listmodel!=null}">
									<c:forEach items="${listmodel}" var="mol" >
										<li>
											<a href="/note/showFSection.do?id=${mol['id']}">${mol['name']}</a>
										</li>
									</c:forEach>
								</c:if>

                                                                <li  class="fiio-header-link-product">
								<a href="http://bbs.fiio.net/firmwareDown.do" class="fiio-header-link-product-a">固件下载</a>
								</li>

								<!-- 
								<li>
                                                                <a href="forum.php.html" class="all-blcok">全部版块</a>
                                                        </li> -->
								
							</ul>
						</div>
					</div>
					<!-- 搜索 -->
					<div id="scbar" class="cl">
						<form id="scbar_form">

							<div class="scbar_wrap">
								<input type="text" id="scbar_txt">
								<button type="button" id="scbar_btn"></button>
							</div>
						</form>
					</div>
					<div class="cr"> </div>
				</div>
				
				<script type="text/javascript">
$(function(){
	
	$("#scbar_txt").on("keypress", function (e) {
            var e = e || window.event;
            switch (e.keyCode) {
                case 13:
                    $("#scbar_btn").trigger("click");
					e.preventDefault();
                    return false;
                    break;
            }
        });
	
	if("${fu}"!=null && "${fu}"!=''){
		//鼠标的移入移出  
	    $("#mzCust").mouseover(function (){ 
	    	$("#laa").addClass("loginArea-hover")
	        $(".log-dropdown").show();  
	    }).mouseout(function (){  
	    	
	        $(".log-dropdown").hide();  
	        $("#laa").removeClass("loginArea-hover")
	    });
	  //关闭弹窗
		$("#closeTip").click(function(){
			$("#append_parent").hide();
		})
		
	}
	setInterval(function(){
	    if($("#shanshan").html()==''){
	    	$("#shanshan").html('<img  src="/resources/php/bbs/static/image/common/pm_unread.png" >&nbsp;我的消息')
	    }else{
	    	$("#shanshan").html('')
	    }
		if($("#shanshanimg").is(":hidden")){
	    	
	    	$("#shanshanimg").show()
	    }else{
	    	$("#shanshanimg").hide()
	    }
	    },200)
	 
	 $("#scbar_btn").click(function(){
		 var ttt = $("#scbar_txt").val();
		 window.location.href="/note/searchNoteData.do?search="+window.encodeURI(window.encodeURI(ttt));
	 })
	
})

/** /** 监听用户是不是按了回车键 onkeydown
/* $(document).keyup(function(event){
	// envet.keyCode : 获取按键的代号  
	// 13 : 回车键
	if (event.keyCode === 13){
		/** 事件触发 
		//$("#scbar_btn").trigger("click");
	}
});  */

</script>
</body>

</html>