<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<meta name="description" content="">
	<meta name="keywords" content="飞傲">
		<title>飞傲</title>
<link href="/resources/uc/web/base/css/base.css" type="text/css"
	rel="Stylesheet" />
<link href="/resources/uc/web/base/css/head.css" type="text/css"
	rel="Stylesheet" />
<link href="/resources/uc/wlogin/base/css/cycode.css" rel="stylesheet" />
<link href="/resources/uc/web/member/css/actmanage.css" type="text/css"
	rel="Stylesheet" />
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<style>
#file_pic {
position: absolute;
z-index: 10;
}
.geetest_holder.geetest_mobile.geetest_ant.geetest_popup .geetest_popup_box
	{
	top: 40% !important;
	left: 74% !important;
}

#wechatPic {
	position: absolute;
	background: url(${weixin}) no-repeat;
	align: "center";
	width: 124px;
	height: 124px;
	_filter: progid: DXImageTransform.Microsoft.AlphaImageLoader(src='${weixin}');
	_background-image: none;
	z-index: 1000;
	background-size: 100% 100%;
	display: none;
	top: 685px !important;
	left: 1340px !important;
}

.normalInput input {
	width: 86%;
}
</style>
</head>

<body>
	<div id='content' class="content">
		<input type='hidden' id="mz_csrf_tks">
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
												<li><a class="actmanage_mzcust" href="/fiioer/showMemberMsg.do?id=${fu.fa_id}">个人账户</a>
													<a href="/fiioer/myFriendsMood.do">个人动态</a> <a
													href="/fiioer/myNote.do">我的帖子</a> <a
													href="/fiioer/myFriend.do">我的好友</a> <a
													href="/fiioer/myGetMsg.do">我的消息</a> <a
													href="/fiioer/mySelfMsg.do">个人信息</a> <a href="/logouts.do">退出账户</a>

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
											<p>
												没有账号? <a class="s-mzblue" href="/register.do">立即注册</a>
											</p>
										</div>

									</c:if>

								</div>
							</div>
						</div>
						<ul class="fiio-header-link" id="fiio-header-link">
							<li><a href="/">论坛首页</a></li>

							<c:if test="${listHead!=null}">
								<c:forEach items="${listHead}" var="heads">
									<li class="fiio-header-link-product"><a
										href="${heads['url']}" class="fiio-header-link-product-a">${heads['name']}</a>
									</li>
								</c:forEach>
							</c:if>


						</ul>
					</div>
				</div>
			</div> <!-- *********************************************** -->
		<div class="fiioblContent">

			<div id='navWrap' class="navWrap">
				<ul class="nav">
					<li id="accountManage"><a href="/fiioer/myTitleImage.do"
						class="linkABlue">账号管理</a>
						<div class='current'></div></li>

				</ul>
			</div>
			<div class='clear'></div>
			<div class='topWrap'>
				<div class='top-leftWrap'>
					<c:if test="${fu.fa_title_img!=null && fu.fa_title_img!=''}"><img id='pic_target' src='${fu.fa_title_img}' width="100px"></c:if> 
                    <c:if test="${fu.fa_title_img==null || fu.fa_title_img==''}"><img id='pic_target' src='/img/423ab7a3c1724a0aafaef7ff8a18f492z.png' width="100px"></c:if>
					 
						
					<input  type="hidden" id="pic_hidden" name="fa_image" value="${fu.fa_title_img}"/>
				</div>
				<div class='top-rightWrap'>
					<div id="nickNameTitle" class='lineWrap nickname'>
						<label id='nickName'> ${fu.fa_username} </label> 

					</div>
					
					
					
					<div id="setUserNameWrap" class='lineWrap grayTip ftop'>
						<a  class="blue modify" href="javascript:;"><input   type="file" id="file_pic" name="file"   onchange="return ajaxFileUpload(this.id,'pic_target','pic_hidden','mb/title/${fu.fa_id}mb');" />
</a>
					</div>
					<font color="red" size="1">&nbsp;&nbsp;(*图片规格500*500，不大于1M)</font>
					<div id="setUserNameWrap" class='lineWrap grayTip ftop'>
					
						<a id="setuserName" class="blue modify" href="javascript:;">保存头像</a>  &nbsp;&nbsp;&nbsp;<font id="tipt" color="red" ></font>
					</div>
					
				</div>
				<div class='clear'></div>
			</div>
			<div class='mainWrap'>
				<div class='titleWrap grayBorderB grayBorderTop'>
					<div class='title-leftWrap'>
						<span>账号安全</span>
					</div>
					
					<div class='clear'></div>
				</div>
				<div class='bodyWrap'>
					<div id='pwdWrap' class='lineWrap pwdWrapTop'>
						<div class='item-right'>
							<a href='javascript:void(0);' class='linkABlue modify'
								id="mmxgmm">修改&nbsp;&nbsp;&nbsp;</a>
						</div>
						<div class='item-left'>密码</div>
						<div class='item-middle'></div>
						<div class='clear'></div>
					</div>
					<!-- 1 -->
					<!-- 修改密码 -->
					<!-- 2 -->
					<div id='mmxgmm1' class='grayBorderB modify_content'
						style='display: none;'>
						<div class='cEmail-titleWrap'>
							<span>修改密码</span>
						</div>
						<form class='cEmail-bodyWrap' id="mmxxmmForm">
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>原密码</label>
								</div>
								<input type="password" name="oripsw" class='normalInput'>
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>新密码</label>
								</div>
								<div class='normalInput'>
									 <input
										type="password" name="newpsw"  /> <a
										 class="pwdBtnShow noselect"> <i class="i_icon"></i>
									</a>
										<div class='clear'></div>
								</div>
							</div>
							<div class='lineWrap'>
								<label class='fleft'>&nbsp;</label> <a href='javascript:;'
									class="fullBtnBlue save_form fleft" id="mmxgmmbc">保存</a> <a
									href='javascript:;' class="fullBtnGray cancel_form fleft"
									id="mmxgmm1qx">取消</a>&nbsp;&nbsp;&nbsp;<font id="tipmmxgmm1" color="red"></font>
								<div class='clear'></div>
							</div>
						</form>
					</div>
					
					
					<!-- 邮箱 -->
					
					<div id='emailWrap' class='lineWrap'>
						
						<!--if已验证  -->
						<div class='item-right' style='display: block;'>
							<a id='yxxgyx' href='javascript:void(0);'
								class='linkABlue modify'>修改邮箱&nbsp;&nbsp;&nbsp;</a>
						</div>
						<c:if test="${fu.fa_telphone!=null && fu.fa_telphone!=''}">
						<div class='item-right' style='display: block;'>
							<a id='yxxgsj' href='javascript:void(0);'
								class='linkABlue modify'>修改手机&nbsp;&nbsp;&nbsp;</a>
						</div>
						</c:if>
						<!-- end if -->
						<!--if-->
						<div class='item-right'>
							<a id='yxxgmm' href='javascript:void(0);'
								class='linkABlue modify'>修改密码&nbsp;&nbsp;&nbsp;</a>
						</div>
						<div class='item-left'>邮箱</div>
						<!--if-->
						<div class='item-middle' id='email-item-middle1'
							>
							<span id="current_email" class='email bold'>${fn:substring(fu.fa_email,0,3)}****${fn:substring(fu.fa_email,4,fu.fa_email.length())}</span> <br> <span
								class='grayTip'>已验证，可通过邮箱找回密码</span>
						</div>
						<!-- end if -->
						<!--if-->
						
						<!-- end if -->
						<!--if-->
						
						<!-- end if -->
						<!-- end if -->
						<div class='clear'></div>
					</div>
					
					
					
					<!-- 邮箱修改密码 -->
					<div id='yxxgmm1'
						class='grayBorderT grayBorderB modify_content '
						style='display: none;'>
						<div class='cEmail-titleWrap'>
							<span id="editEmails">修改密码</span>
						</div>
						<form class='cEmail-bodyWrap' id="yxxgmmForm">
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>新密码</label>
								</div>
								<input type="password" name="newpsw"  class="normalInput">
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>邮件验证码</label>
								</div>
								<div class="normalInput bottom">
									<input type="text"  name="code"
										class="kapkey"> <span class="form-line"></span> <a
										 href="javascript:void(0);" id="yxxgmmyzm"
										class="linkABlue invalidBtn get_kapkey">获取验证码</a> 
								</div>
							</div>
							<div class='lineWrap'>
								<label class='fleft'>&nbsp;</label> <a
									class="fullBtnBlue ce-u-save save_form fleft" id="yxxgmmbc">保存</a>
								<a class="fullBtnGray ce-u-cancel cancel_form fleft"
									id="yxxgmm1qx">取消</a>&nbsp;&nbsp;&nbsp;<font id="tipyxxgmm" color="red"></font>
								<div class='clear'></div>
							</div>
						</form>
					</div>
					
					
					 <!-- 修改邮箱第1部 -->
					<div id='yxxgyx1'
						class='grayBorderT grayBorderB modify_content'
						style='display: none;'>
						<div class='cEmail-titleWrap'>
							<span>修改邮箱第一步</span>
						</div>
						<form class='cEmail-bodyWrap' id="yxxgyx1Form">
							<div class='lineWrap' id="currentEmail">
								<div class='leftWrap'>
									<label class='leftLabel'>当前邮箱</label>
								</div>
								<span id='ce-u-current_email'
									class='normalInput current_email bold'>${fn:substring(fu.fa_email,0,3)}****${fn:substring(fu.fa_email,4,fu.fa_email.length())}</span>
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>邮件验证码</label>
								</div>
								<div class="normalInput bottom">
									<input type="text" id="yxxgyx1Id"
										class="kapkey"> <span class="form-line"></span> <a
										id="yxxgyxyzm1" href="javascript:void(0);"
										class="linkABlue  get_kapkey">获取验证码</a> 
								</div>
							</div>
							<div class='lineWrap'>
								<label class='fleft'>&nbsp;</label> <a
									class="fullBtnBlue ce-u-save save_form fleft"
									id="yxxgyxxyb">下一步</a> <a
									class="fullBtnGray ce-u-cancel cancel_form fleft"
									id="yxxgyx1qx">取消</a>&nbsp;&nbsp;&nbsp;<font id="tipyxxgyx1" color="red"></font>
								<div class='clear'></div>
							</div>
						</form>
					</div>
					<!-- 修改邮箱第二部 -->
					<div id='yxxgyx2'
						class='grayBorderT grayBorderB modify_content'
						style='display: none;'>
						<div class='cEmail-titleWrap'>
							<span>修改邮箱第二步</span>
						</div>
						<form class='cEmail-bodyWrap'>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>新邮箱</label>
								</div>
								<input type="text" id="newemailbyemail" class='normalInput'>
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>邮件验证码</label>
								</div>
								<div class="normalInput bottom">
									<input type="text" id="codetwoss"
										class="kapkey"> <span class="form-line"></span> <a
										id="yxxgyxyzm2" href="javascript:void(0);"
										class="linkABlue invalidBtn get_kapkey">获取验证码</a> 
								</div>
							</div>
							<div class='lineWrap'>
								<label class='fleft'>&nbsp;</label> <a
									class="fullBtnBlue save_form fleft" id="yxxgyxbc">保存</a>
								<a class="fullBtnGray cancel_form fleft"
									id="yxxgyx2qx">取消</a>&nbsp;&nbsp;&nbsp;<font id="tipyxxgyx2" color="red"></font>
								<div class='clear'></div>
							</div>
						</form>
					</div>
					 <!-- 邮箱修改手机第1部 -->
					<div id='yxxgsj1'
						class='grayBorderT grayBorderB modify_content'
						style='display: none;'>
						<div class='cEmail-titleWrap'>
							<span>修改手机第一步</span>
						</div>
						<form class='cEmail-bodyWrap'>
							<div class='lineWrap' id="currentEmails">
								<div class='leftWrap'>
									<label class='leftLabel'>当前邮箱</label>
								</div>
								<span id='ce-u-current_email'
									class='normalInput current_email bold'>${fn:substring(fu.fa_email,0,3)}****${fn:substring(fu.fa_email,4,fu.fa_email.length())}</span>
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>邮件验证码</label>
								</div>
								<div class="normalInput bottom">
									<input type="text" id="yxxgsjyzm1"
										class="kapkey"> <span class="form-line"></span> <a
										id="yxxgsjsend1" href="javascript:void(0);"
										class="linkABlue  get_kapkey">获取验证码</a> 
								</div>
							</div>
							<div class='lineWrap'>
								<label class='fleft'>&nbsp;</label> <a
									class="fullBtnBlue ce-u-save save_form fleft"
									id="yxxgsjxyb">下一步</a> <a
									class="fullBtnGray ce-u-cancel cancel_form fleft"
									id="yxxgsj1qx">取消</a>&nbsp;&nbsp;&nbsp;<font id="tipyxxgsj1" color="red" ></font>
								<div class='clear'></div>
							</div>
						</form>
					</div>
					<!-- 邮箱修改手机第二部 -->
					<div id='yxxgsj2'
						class='grayBorderT grayBorderB modify_content'
						style='display: none;'>
						<div class='cEmail-titleWrap'>
							<span>修改手机第二步</span>
						</div>
						<form class='cEmail-bodyWrap'>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>新手机</label>
								</div>
								<input type="text" id="newTelByEmail" class='normalInput'>
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>手机验证码</label>
								</div>
								<div class="normalInput bottom">
									<input type="text" id="yxxgsjyzm2"
										class="kapkey"> <span class="form-line"></span> <a
										id="yxxgsjsend2" href="javascript:void(0);"
										class="linkABlue invalidBtn get_kapkey">获取验证码</a> <a
										href="javascript:void(0);" class="linkABlue kapkey_requested"
										style="display: none;">已发送 <span class="interval_num">60</span></a>
								</div>
							</div>
							<div class='lineWrap'>
								<label class='fleft'>&nbsp;</label> <a
									class="fullBtnBlue save_form fleft" id="yxxgsjbc">保存</a>
								<a class="fullBtnGray cancel_form fleft"
									id="yxxgsj2qx">取消</a>&nbsp;&nbsp;&nbsp;<font id="tipyxxgsj2" color="red"></font>
								<div class='clear'></div>
							</div>
						</form>
					</div>
					
					
					
					
					<div id='telWrap' class='lineWrap'>
						<!--if-->
						<c:if test="${fu.fa_telphone!=null && fu.fa_telphone!=''}">
						<div class='item-right'>
							<a id="sjxgmm" href='javascript:void(0);'
								class='linkABlue modify'>修改密码&nbsp;&nbsp;&nbsp;</a>
						</div>
						<div class='item-right'>
							<a id="sjxgsj" href='javascript:void(0);'
								class='linkABlue modify'>修改手机&nbsp;&nbsp;&nbsp;</a>
						</div>
						</c:if>
						<!-- end if -->
						<!--if-->
						<c:if test="${fu.fa_telphone==null || fu.fa_telphone==''}">
						<div class='item-right' style='display: block;'>
							<a id="sjbdsj" href='javascript:void(0);'
								class='linkABlue modify'>绑定手机&nbsp;&nbsp;&nbsp;</a>
						</div>
						</c:if>
						<!-- end if -->
						<div class='item-left'>手机号码</div>
						<!--if-->
						<c:if test="${fu.fa_telphone!=null && fu.fa_telphone!=''}">
						<div class='item-middle' id='telModify'>
							<span id="current_phone" class='bold'>${fn:substring(fu.fa_telphone,0,4)}****${fn:substring(fu.fa_telphone,8,11)}</span> <br>
								<span class='grayTip'>已验证，可通过手机找回密码</span>
						</div>
						</c:if>
						<!-- end if -->
						<!--if-->
						<c:if test="${fu.fa_telphone==null || fu.fa_telphone==''}">
						<div class='item-middle' id='telBind' >
							<span class='bold'>未绑定</span> <br> <span class='grayTip'>绑定后可通过手机号码登录、找回密码、异常登录提醒、<br>登录不常用设备验证</span>
						</div>
						</c:if>
						<!-- end if -->
						<div class='clear'></div>
					</div>
					
					
					
					<!-- 绑定手机 -->
					<div id='sjbdsj1'
						class='grayBorderT grayBorderB modify_content'
						style='display: none;'>
						<div class='bindTel-titleWrap'>
							<span>绑定手机号码</span>
						</div>
						<form class='cEmail-bodyWrap'>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>手机号码</label>
								</div>
								<input type="text" id="bindTel" class="normalInput">
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>手机验证码</label>
								</div>
								<div class="normalInput bottom">
									<input type="text" id="bindTelyzm"
										class="kapkey"> <span class="form-line"></span> <a
										id="bindTelBtn" href="javascript:void(0);"
										class="linkABlue invalidBtn get_kapkey">获取验证码</a>
								</div>
							</div>
							<div class='lineWrap'>
								<label class='fleft'>&nbsp;</label> <a
									class="fullBtnBlue ce-u-save save_form fleft" id="sjbdsj1bc">保存</a>
								<a class="fullBtnGray ce-u-cancel cancel_form fleft"
									id="sjbdsj1qx">取消</a>&nbsp;&nbsp;&nbsp;<font id="zxcvb" color="red"></font>
								<div class='clear'></div>
							</div>
						</form>
					</div>
					<!-- 手机修改手机 1 -->
					
					<div id='sjxgsj1'
						class='grayBorderT grayBorderB modify_content'
						style='display: none;'>
						<div id="changePhoneValidPhone" class="change_valid_wrap">
							<div class='setQuestion-titleWrap'>
								<span>修改手机号（验证原手机）</span>
							</div>
							<form id="formPhoneValidPhone" class='setQuestion-bodyWrap'>
								<div class='lineWrap'>
									<div class='leftWrap'>
										<label class='leftLabel'>原手机号</label>
									</div>
									<input type="text" value="${fu.fa_telphone}" disabled="disabled" class='normalInput'>
								</div>
								<div class='lineWrap'>
									<div class='leftWrap'>
										<label class='leftLabel'>验证码</label>
									</div>
									<div class="normalInput bottom">
										<input type="text" id="sjxgsjyzm1" class="kapkey"> <span
											class="form-line"></span> <a id="sjxgsjsend1"
											href="javascript:void(0);"
											class="linkABlue invalidBtn get_kapkey">获取验证码</a>
										</a>
									</div>
									<div clear="clear"></div>
								</div>
								<div class='lineWrap'>
									<label class='fleft'>&nbsp;</label> <a
										class="fullBtnBlue save_form fleft" id="sjxgsjxyb">下一步</a>
									<a class="fullBtnGray cancel_form fleft"
										id="sjxgsj1qx">取消</a>&nbsp;&nbsp;&nbsp;<font id="tipsjxgsj1" color="red"></font>
									<div class='clear'></div>
								</div>
								<div class='clear'></div>
							</form>
						</div>
					</div>
					<!-- 手机修改手机 2 -->
					<div id='sjxgsj2'
						class='grayBorderT grayBorderB modify_content'
						style='display: none;'>
						<div class='cTel-titleWrap'>
							<span>输入新手机号</span>
						</div>
						<form class='cEmail-bodyWrap'>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>新手机号码</label>
								</div>
								<input type="text" id="newPhoness" class='normalInput'>
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>验证码</label>
								</div>
								<div class="normalInput bottom">
									<input type="text" id="sjxgsjyzm2" class="kapkey"> <span
										class="form-line"></span> <a id="sjxgsjsend2"
										href="javascript:void(0);"
										class="linkABlue invalidBtn get_kapkey">获取验证码</a> 
								</div>
								<div clear="clear"></div>
							</div>
							<div class='lineWrap'>
								<label class='fleft'>&nbsp;</label> <a
									class="fullBtnBlue save_form fleft" id="sjxgsj2bc">保存</a>
								<a class="fullBtnGray cancel_form fleft" id="sjxgsj2qx">取消</a>&nbsp;&nbsp;&nbsp;<font id="tipsjxgsj2" color="red"></font>
								<div class='clear'></div>
							</div>
						</form>
					</div>
					<!-- 手机修改密码 1 -->
					
					<div id='sjxgmm1'
						class='grayBorderT grayBorderB modify_content'
						style='display: none;'>
						<div id="changePhoneValidPhones" class="change_valid_wrap">
							<div class='setQuestion-titleWrap'>
								<span>修改密码</span>
							</div>
							<form class='cEmail-bodyWrap'>
								<div class='lineWrap'>
									<div class='leftWrap'>
										<label class='leftLabel'>新密码</label>
									</div>
									<input type="password" id="telnewpsw" class="normalInput">
								</div>
								<div class='lineWrap'>
									<div class='leftWrap'>
										<label class='leftLabel'>手机验证码</label>
									</div>
									<div class="normalInput bottom">
										<input type="text" id="sjxgmmyzm"
											class="kapkey"> <span class="form-line"></span> <a
											id="sjxgmmsend" href="javascript:void(0);"
											class="linkABlue invalidBtn get_kapkey">获取验证码</a>
									</div>
								</div>
								<div class='lineWrap'>
									<label class='fleft'>&nbsp;</label> <a
										class="fullBtnBlue ce-u-save save_form fleft" id="sjxgmmbc">保存</a>
									<a class="fullBtnGray ce-u-cancel cancel_form fleft"
										id="sjxgmm1qx">取消</a>&nbsp;&nbsp;&nbsp;<font color="red" id="tipsjxgmm"></font>
									<div class='clear'></div>
								</div>
							</form>
						</div>
					</div>
					
					<div id='mibao' class='lineWrap'>
						<div class='item-left'>密保问题</div>
						<c:if test="${fu.fa_mibao_qu_st==null && fu.fa_mibao_qu_nd==null && fu.fa_mibao_qu_rd==null}">
						<div id="mbszmb" class='item-right'>
							<a id="setSafe" href='javascript:void(0)'>设置密保&nbsp;&nbsp;&nbsp;</a>
						</div>
						</c:if>
						<c:if test="${fu.fa_mibao_qu_st!=null || fu.fa_mibao_qu_nd!=null || fu.fa_mibao_qu_rd!=null}">
						<c:if test="${fu.fa_telphone!=null && fu.fa_telphone!=''}">
						<div id="mbxgsj" class='item-right'>
							<a id="setSafe" href='javascript:void(0)'>修改手机&nbsp;&nbsp;&nbsp;</a>
						</div>
						</c:if>
						<div id="questionSetTip" class='item-right'>
							<a id="mbxgmb" href='javascript:void(0)'>修改密保&nbsp;&nbsp;&nbsp;</a>
						</div>
						</c:if>
						<div id="questionUnSettedTip" class='item-middle' >
							<span id='tip' class='bold'>设置密保&nbsp;&nbsp;&nbsp;</span> <br> <span
								class='grayTip'>设置密保可大幅提升账号安全</span>
						</div>
						<div class='clear'></div>
					</div>
					<!-- 设置密保 -->
					<div id='mbszmb1'
						class='grayBorderT grayBorderB modify_content'
						style='display: none;'>
						<div class='setQuestion-titleWrap'>
							<span>设置密保（验证密码）</span>
						</div>
						<form class='setQuestion-bodyWrap'>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>账号密码</label>
								</div>
								<input type="password" id="szmbpsw" class='normalInput'>
							</div>
							<div class='lineWrap'>
								<label class='fleft'>&nbsp;</label> <a
									class="fullBtnBlue save_form fleft" id="mbszmbxyb">下一步</a>
								<a class="fullBtnGray cancel_form fleft" id="mbszmb1qx">取消</a>&nbsp;&nbsp;&nbsp;<font id="szmb1" color="red"></font>
								<div class='clear'></div>
							</div>
							<div class='clear'></div>
						</form>
					</div>
					<div id='mbszmb2'
						class='grayBorderT grayBorderB modify_content'
						style='display: none;'>
						<div class='setQuestion-titleWrap'>
							<span>设置密保</span>
						</div>
						<form class='setQuestion-bodyWrap' id="mibaoForm">
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>问题一：</label>
								</div>
								<select name="fa_mibao_qu_st" class='normalInput'>
									<c:forEach items="${mibao}" var="mb"  varStatus="vs">
									<c:if test="${vs.index==0}">
									<option value="${mb['fa_name']}" selected="selected" >${mb['fa_name']}</option>
									</c:if>
									<c:if test="${vs.index!=0}">
									<option value="${mb['fa_name']}" >${mb['fa_name']}</option>
									</c:if>
										
									</c:forEach>
								</select>
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>答案：</label>
								</div>
								<input type="text" name="fa_mibao_ar_st" class='normalInput' />
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>问题二：</label>
								</div>
								<select name="fa_mibao_qu_nd" class='normalInput'>
									<c:forEach items="${mibao}" var="mb"  varStatus="vs" >
										<c:if test="${vs.index==1}">
										<option value="${mb['fa_name']}" selected="selected" >${mb['fa_name']}</option>
										</c:if>
										<c:if test="${vs.index!=1}">
										<option value="${mb['fa_name']}" >${mb['fa_name']}</option>
										</c:if>
										
									</c:forEach>
								</select>
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>答案：</label>
								</div>
								<input type="text" name="fa_mibao_ar_nd"  class='normalInput' />
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>问题三：</label>
								</div>
								<select name="fa_mibao_qu_rd" class='normalInput'>
									<c:forEach items="${mibao}" var="mb" varStatus="vs" >
										<c:if test="${vs.index==2}"><option value="${mb['fa_name']}" selected="selected" >${mb['fa_name']}</option></c:if>
										<c:if test="${vs.index!=2}"><option value="${mb['fa_name']}" >${mb['fa_name']}</option></c:if>
											
									</c:forEach>
								</select>
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>答案：</label>
								</div>
								<input type="text" name="fa_mibao_ar_rd" class='normalInput' />
							</div>
							<div class='lineWrap'>
								<label class='fleft'>&nbsp;</label> <a
									class="fullBtnBlue save_form fleft" id="mbszmbbc">保存</a>
								<a class="fullBtnGray cancel_form fleft"
									id="mbszmb2qx">取消</a>&nbsp;&nbsp;&nbsp;<font id="szmb2" color="red"></font>
								<div class='clear'></div>
							</div>
						</form>
					</div>
					<!-- 修改密保1 -->
					<div id='mbxgmb1'
						class='grayBorderT grayBorderB modify_content'
						style='display: none;'>
						<div class='cQuestion-titleWrap'>
							<span>修改密保(验证)</span>
						</div>
						<form class='cQuestion-bodyWrap' id="mibaouForm">
							<div class='questionlineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>问题一：</label>
								</div>
								<span  class="normalInput current_email" >${fu.fa_mibao_qu_st}</span> <input
									type="hidden">
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>答案：</label>
								</div>
								<input type="text" name="fa_mibao_ar_st" class='normalInput' />
							</div>
							<div class='questionlineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>问题二：</label>
								</div>
								<span id='cqtwo' class="normalInput current_email">${fu.fa_mibao_qu_nd}</span> <input
									type="hidden">
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>答案：</label>
								</div>
								<input type="text" name="fa_mibao_ar_nd" class='normalInput' />
							</div>
							<div class='questionlineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>问题三：</label>
								</div>
								<span id='cqtwo' class="normalInput current_email">${fu.fa_mibao_qu_rd}</span> <input
									type="hidden">
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>答案：</label>
								</div>
								<input type="text" name="fa_mibao_ar_rd" class='normalInput' />
							</div>
							<div class='lineWrap'>
								<label class='fleft'>&nbsp;</label> <a
									class="fullBtnBlue save_form fleft" id="mbxgmbxyb">下一步</a>
								<a class="fullBtnGray cancel_form fleft"
									id="mbxgmb1qx">取消</a>&nbsp;&nbsp;&nbsp;<font id="xgmb1" color="red"></font>
								<div class='clear'></div>
							</div>
						</form>
					</div>
					<!-- 修改密保2-->
					<div id='mbxgmb2'
						class='grayBorderT grayBorderB modify_content'
						style='display: none;'>
						<div class='cQuestion-titleWrap'>
							<span>修改密保(设置新的密保问答)</span>
						</div>
						<form class='cQuestion-bodyWrap' id="mibaosForm">
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>问题一:</label>
								</div>
								<select name="fa_mibao_qu_st" class='normalInput'>
									<c:forEach items="${mibao}" var="mb" varStatus="vs" >
										<c:if test="${vs.index==0}"><option value="${mb['fa_name']}" selected="selected" >${mb['fa_name']}</option></c:if>
										<c:if test="${vs.index!=0}"><option value="${mb['fa_name']}" >${mb['fa_name']}</option></c:if>
										
									</c:forEach>
								</select>
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>答案：</label>
								</div>
								<input type="text" name="fa_mibao_ar_st" class='normalInput' />
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>问题二:</label>
								</div>
								<select name="fa_mibao_qu_nd" class='normalInput'>
									<c:forEach items="${mibao}" var="mb" varStatus="vs" >
										<c:if test="${vs.index==1}"><option value="${mb['fa_name']}" selected="selected" >${mb['fa_name']}</option></c:if>
										<c:if test="${vs.index!=1}"><option value="${mb['fa_name']}" >${mb['fa_name']}</option></c:if>
										
									</c:forEach>
								</select>
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>答案：</label>
								</div>
								<input type="text" name="fa_mibao_ar_nd" class='normalInput' />
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>问题三:</label>
								</div>
								<select name="fa_mibao_qu_rd" class='normalInput'>
									<c:forEach items="${mibao}" var="mb" varStatus="vs" >
										<c:if test="${vs.index==2}"><option value="${mb['fa_name']}" selected="selected" >${mb['fa_name']}</option></c:if>
										<c:if test="${vs.index!=2}"><option value="${mb['fa_name']}" >${mb['fa_name']}</option></c:if>
										
									</c:forEach>
								</select>
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>答案：</label>
								</div>
								<input type="text" name="fa_mibao_ar_rd" class='normalInput' />
							</div>
							<div class='lineWrap'>
								<label class='fleft'>&nbsp;</label> <a
									class="fullBtnBlue save_form fleft" id="mbxgmbbc">保存</a>
								<a class="fullBtnGray cancel_form fleft"
									id="mbxgmb2qx">取消</a>&nbsp;&nbsp;&nbsp;<font id="xgmb2" color="red"></font>
								<div class='clear'></div>
							</div>
						</form>
					</div>
					<!-- 密保修改手机1 -->
					<div id='mbxgsj1'
						class='grayBorderT grayBorderB modify_content'
						style='display: none;'>
						<div class='cQuestion-titleWrap'>
							<span>更换手机</span>
						</div>
						<form class='cQuestion-bodyWrap' id="mibaouqForm">
							<div class='questionlineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>问题一：</label>
								</div>
								<span  class="normalInput current_email">${fu.fa_mibao_qu_st}</span> <input
									type="hidden">
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>答案：</label>
								</div>
								<input type="text" name="fa_mibao_ar_st" class='normalInput' />
							</div>
							<div class='questionlineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>问题二：</label>
								</div>
								<span  class="normalInput current_email">${fu.fa_mibao_qu_nd}</span> <input
									type="hidden">
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>答案：</label>
								</div>
								<input type="text" name="fa_mibao_ar_nd" class='normalInput' />
							</div>
							<div class='questionlineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>问题三：</label>
								</div>
								<span ' class="normalInput current_email">${fu.fa_mibao_qu_rd}</span> <input
									type="hidden">
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>答案：</label>
								</div>
								<input type="text" name="fa_mibao_ar_rd" class='normalInput' />
							</div>
							<div class='lineWrap'>
								<label class='fleft'>&nbsp;</label> <a
									class="fullBtnBlue save_form fleft" id="mbxgsjxyb">下一步</a>
								<a class="fullBtnGray cancel_form fleft"
									id="mbxgsj1qx">取消</a>&nbsp;&nbsp;&nbsp;<font id="tipmbsj" color="red"></font>
								<div class='clear'></div>
							</div>
						</form>
					</div>
					<!-- 密保修改手机2-->
					<div id='mbxgsj2'
						class='grayBorderT grayBorderB modify_content'
						style='display: none;'>
						<div class='cQuestion-titleWrap'>
							<span>更换手机</span>
						</div>
						<form class='cQuestion-bodyWrap'>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>新手机号码</label>
								</div>
								<input type="text" id="newtelphone" class='normalInput'>
							</div>
							<div class='lineWrap'>
								<div class='leftWrap'>
									<label class='leftLabel'>验证码</label>
								</div>
								<div class="normalInput bottom">
									<input type="text" id="kapkeyTelNewzz" class="kapkey"> <span
										class="form-line"></span> <a id="hqyzmzz"
										href="javascript:void(0);"
										class="linkABlue invalidBtn get_kapkey">获取验证码</a> 
								</div>
								<div clear="clear"></div>
							</div>
							<div class='lineWrap'>
								<label class='fleft'>&nbsp;</label> <a
									class="fullBtnBlue save_form fleft" id="mbxgsjbc">确认</a>
								<a class="fullBtnGray cancel_form fleft"
									id="mbxgsj2qx">取消</a>&nbsp;&nbsp;&nbsp;<font id="tipmbsj2" color="red"></font>
								<div class='clear'></div>
							</div>
							
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	<input type="hidden" id="form_resubmit_token_key">
		<ul style='display: none;' id='mail' class='bRadius2 boxShadow10'></ul>
		<%-- <div id='fiioblFooter' class='footerWrap' style="background: #fff;">
			<div class='footerInner'>
				<div class='footer-layer1'>
					<div class='footer-innerLink'>
						<c:if test="${listNor!=null}">
							<c:forEach items="${listNor}" var="nor">
								<a href="${nor['url']}">${nor['name']}</a>
								<img class="foot-line"
									src="/resources/common/images/default/space.gif">
							</c:forEach>
						</c:if>
						<div href="javascript:void(0);" id="globalName"
							class="footer-language">
							简体中文&nbsp;&nbsp;&nbsp;
							<div id="globalContainer" class="footer-language_menu"
								style="height: 40px;">
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
						<a id='footer-weChat' class='footer-weChat'
							href="javascript:void(0);"><i class='i_icon'></i></a> <a
							class='footer-qzone' href="${QQ}"><i class='i_icon'></i></a>
					</div>
				</div>
				<div class='clear'></div>
				<div id='fiioblCopyright' class="copyrightWrap">
					<div class="copyrightInner">
						<c:if test="${listCom!=null}">
							<c:forEach items="${listCom}" var="com">
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
		</div> --%>
	<div id="wechatPic"></div>
	<script>
		weChat();
	</script>


	<script charset="utf-8" type="text/javascript"
		src="/resources/common/js/jquery-1.7.1.min.js"></script>
	<script charset="utf-8" type="text/javascript"
		src="/resources/common/js/M20130902.js"></script>
	<script type="text/javascript"
		src="/resources/uc/web/base/js/jquery.form.js" charset="utf-8"></script>
	<script type="text/javascript"
		src="/resources/uc/web/base/js/jquery.validate.js" charset="utf-8"></script>
	<script type="text/javascript" src="/resources/uc/web/base/js/utils.js"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="/resources/uc/web/base/js/fiiobl.elements.js" charset="utf-8"></script>
	<script type="text/javascript" src="/resources/uc/web/base/js/base.js"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="/resources/uc/web/member/js/common/jquery.autoEmail.js"
		charset="utf-8"></script>
	<script type="text/javascript"
		src="/resources/uc/web/member/js/dropdown.js" charset="utf-8"></script>
	<script src="/resources/uc/wlogin/base/js/cycode.js"></script>
	<script type="text/javascript"
		src="/resources/uc/web/member/js/actmanage.js" charset="utf-8"></script>
		<script type="text/javascript" src="${path}/js/ajaxfileupload.js"></script>

</body>
<script type="text/javascript">
	var ReceiveEmail = '';
	var isHit = 'false';
	var isBindPhone = true;
	var isBindEmail = false;
</script>
<script type="text/javascript">

$(function(){
	//鼠标的移入移出  
    $("#mzCust").mouseover(function (){ 
    	$("#laa").addClass("loginArea-hover")
        $(".log-dropdown").show();  
    }).mouseout(function (){  
    	
        $(".log-dropdown").hide();  
        $("#laa").removeClass("loginArea-hover")
    });
	//上传图片
	 $('#setuserName').click(function(){
		 $.ajax({
			 url:"/fiioer/updateMyImage.do",
			 data:{"imageUrl":$("#pic_hidden").val()},
			 type:"post",
			 dataType:"json",
			 success:function(data){
				 if(data.tip=="success"){
					 $("#tipt").text("保存成功");
						setTimeout(function(){
							$("#tipt").text("");
						}, 2000);
				 }else{
					$("#tipt").text("系统发生异常");
					setTimeout(function(){
						$("#tipt").text("");
					}, 2000);
				 }
			 },
			 error:function(){
				 $("#tipt").text("系统发生异常");
					setTimeout(function(){
						$("#tipt").text("");
					}, 2000);
			 }
			 
		 })
	}) 
	//修改密码之
		//打开与关闭修改密码按钮
		$("#mmxgmm").click(function(){
			if($("#mmxgmm1").is(":hidden")){
				$("#mmxgmm1").show()
			}else{
				$("#mmxgmm1").hide()
				
			}
		})
		
		//取消
		$("#mmxgmm1qx").click(function(){
			$("#mmxgmm1").hide()
		})
		//保存
		$("#mmxgmmbc").click(function(){
			 $.ajax({
				 url:"/fiioer/updatePswByPsw.do",
				 data:$("#mmxxmmForm").serialize(),
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 $("#tipmmxgmm1").text("保存成功");
							setTimeout(function(){
								$("#tipmmxgmm1").text("");
							}, 2000);
					 }else{
						$("#tipmmxgmm1").text(data.tip);
						setTimeout(function(){
							$("#tipmmxgmm1").text("");
						}, 2000);
					 }
				 },
				 error:function(){
					 $("#tipmmxgmm1").text("系统发生异常");
						setTimeout(function(){
							$("#tipmmxgmm1").text("");
						}, 2000);
				 }
				 
			 })
		})
		
//邮箱
	//邮箱修改邮箱	
		//展开关闭修改邮箱div
		$("#yxxgyx").click(function(){
			if($("#yxxgyx1").is(":hidden")){
				$("#yxxgyx1").show();
				$("#yxxgyx2").hide();
				$("#yxxgsj1").hide();
				$("#yxxgsj2").hide();
				$("#yxxgmm1").hide();
			}else{
				$("#yxxgyx1").hide();
				
			}
			
		})
		//验证码
		$("#yxxgyxyzm1").click(function(){
			$.ajax({
				 url:"/fiioer/sendMsgToemail.do",
				 data:{"codeName":"emailChangeEmailOld"},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 downcounts($("#yxxgyxyzm1"),'{0}s再获取', 60);
					 }
				 },
				 error:function(){
					 $("#tipyxxgyx1").text("系统发生异常");
						setTimeout(function(){
							$("#tipyxxgyx1").text("");
						}, 2000);
				 }
				 
			 })
		});
		//取消邮箱操作第一步
		$("#yxxgyx1qx").click(function(){
			$("#yxxgyx1").hide();
		})
		//第二步
		$("#yxxgyxxyb").click(function(){
			 $.ajax({
				 url:"/fiioer/vidCodeIsTrueByEmail.do",
				 data:{"codeName":"emailChangeEmailOld","code":$("#yxxgyx1Id").val()},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 $("#yxxgyx1").hide();
						 $("#yxxgyx2").show();
					 }else{
						$("#tipyxxgyx1").text(data.tip);
						setTimeout(function(){
							$("#tipyxxgyx1").text("");
						}, 2000);
					 }
				 },
				 error:function(){
					 $("#tipyxxgyx1").text("系统发生异常");
						setTimeout(function(){
							$("#tipyxxgyx1").text("");
						}, 2000);
				 }
				 
			 })
			
		})
		//验证码2
		$("#yxxgyxyzm2").click(function(){
			$.ajax({
				 url:"/fiioer/sendMsgToNewemail.do",
				 data:{"codeName":"emailChangeEmailNew","email":$("#newemailbyemail").val()},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 downcounts($("#yxxgyxyzm2"),'{0}s再获取', 60);
					 }else{
						 $("#tipyxxgyx2").text(data.tip);
							setTimeout(function(){
								$("#tipyxxgyx2").text("");
							}, 2000);
					 }
				 },
				 error:function(){
					 $("#tipyxxgyx2").text("系统发生异常");
						setTimeout(function(){
							$("#tipyxxgyx2").text("");
						}, 2000);
				 }
				 
			 })
		});
		//保存
		$("#yxxgyxbc").click(function(){
			$.ajax({
				 url:"/fiioer/updateEmailByEmail.do",
				 data:{"codeName":"emailChangeEmailNew","email":$("#newemailbyemail").val(),"code":$("#codetwoss").val()},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 $("#tipyxxgyx2").text("保存成功");
							setTimeout(function(){
								$("#tipyxxgyx2").text("");
							}, 2000);
					 }else{
						 $("#tipyxxgyx2").text(data.tip);
							setTimeout(function(){
								$("#tipyxxgyx2").text("");
							}, 2000);
					 }
					 
				 },
				 error:function(){
					 $("#tipyxxgyx2").text("系统发生异常");
						setTimeout(function(){
							$("#tipyxxgyx2").text("");
						}, 2000);
				 }
				 
			 })
		});
		//取消第二步
		$("#yxxgyx2qx").click(function(){
			$("#yxxgyx2").hide();
		})
	//邮箱修改手机
		
		//展开关闭修改邮箱div
		$("#yxxgsj").click(function(){
			if($("#yxxgsj1").is(":hidden")){
				$("#yxxgsj1").show();
				$("#yxxgyx1").hide();
				$("#yxxgyx2").hide();
				$("#yxxgsj2").hide();
				$("#yxxgmm1").hide();
			}else{
				$("#yxxgsj1").hide();
				
			}
			
		})
		//验证码
		$("#yxxgsjsend1").click(function(){
			$.ajax({
				 url:"/fiioer/sendMsgToemail.do",
				 data:{"codeName":"emailChangeTelOld"},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 downcounts($("#yxxgsjsend1"),'{0}s再获取', 60);
					 }
				 },
				 error:function(){
					 $("#tipyxxgmm").text("系统发生异常");
						setTimeout(function(){
							$("#tipyxxgsj1").text("");
						}, 2000);
				 }
				 
			 })
		});
		//取消邮箱操作第一步
		$("#yxxgsj1qx").click(function(){
			$("#yxxgsj1").hide();
		})
		//第二步
		$("#yxxgsjxyb").click(function(){
			 $.ajax({
				 url:"/fiioer/vidCodeIsTrueByEmail.do",
				 data:{"codeName":"emailChangeTelOld","code":$("#yxxgsjyzm1").val()},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 $("#yxxgsj1").hide();
							
						 $("#yxxgsj2").show();
					 }else{
						$("#tipyxxgsj1").text(data.tip);
						setTimeout(function(){
							$("#tipyxxgsj1").text("");
						}, 2000);
					 }
				 },
				 error:function(){
					 $("#tipyxxgsj1").text("系统发生异常");
						setTimeout(function(){
							$("#tipyxxgsj1").text("");
						}, 2000);
				 }
				 
			 })
			
		})
		//验证码2
		$("#yxxgsjsend2").click(function(){
			$.ajax({
				 url:"/fiioer/sendMsgToNewTel.do",
				 data:{"codeName":"emailChangeTelNew","tel":$("#newTelByEmail").val()},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 downcounts($("#yxxgsjsend2"),'{0}s再获取', 60);
					 }else{
						 $("#tipyxxgsj2").text(data.tip);
							setTimeout(function(){
								$("#tipyxxgsj2").text("");
							}, 2000);
					 }
				 },
				 error:function(){
					 $("#tipyxxgsj2").text("系统发生异常");
						setTimeout(function(){
							$("#tipyxxgsj2").text("");
						}, 2000);
				 }
				 
			 })
		});
		//保存
		$("#yxxgsjbc").click(function(){
			$.ajax({
				 url:"/fiioer/updateTelByEmail.do",
				 data:{"codeName":"emailChangeTelNew","tel":$("#newTelByEmail").val(),"code":$("#yxxgsjyzm2").val()},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 $("#tipyxxgsj2").text("保存成功");
							setTimeout(function(){
								$("#tipyxxgsj2").text("");
							}, 2000);
					 }else{
						 $("#tipyxxgsj2").text(data.tip);
							setTimeout(function(){
								$("#tipyxxgsj2").text("");
							}, 2000);
					 }
					 
				 },
				 error:function(){
					 $("#tipyxxgsj2").text("系统发生异常");
						setTimeout(function(){
							$("#tipyxxgsj2").text("");
						}, 2000);
				 }
				 
			 })
		});
		//取消第二步
		$("#yxxgsj2qx").click(function(){
			$("#yxxgsj2").hide();
		})
	//邮箱修改密码
		//展开关闭
		$("#yxxgmm").click(function(){
			if($("#yxxgmm1").is(":hidden")){
				$("#yxxgmm1").show();
				$("#yxxgyx1").hide();
				$("#yxxgyx2").hide();
				$("#yxxgsj1").hide();
				$("#yxxgsj2").hide();
			}else{
				$("#yxxgmm1").hide();
			}
			
		})
		//验证码
		$("#yxxgmmyzm").click(function(){
			$.ajax({
				 url:"/fiioer/sendMsgToemail.do",
				 data:{"codeName":"emailChangePsw"},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 downcounts($("#yxxgmmyzm"),'{0}s再获取', 60);
					 }
				 },
				 error:function(){
					 $("#tipyxxgmm").text("系统发生异常");
						setTimeout(function(){
							$("#tipyxxgmm").text("");
						}, 2000);
				 }
				 
			 })
		});
		//保存
		$("#yxxgmmbc").click(function(){
			$.ajax({
				 url:"/fiioer/updatePswByEmail.do",
				 data:$("#yxxgmmForm").serialize(),
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 $("#tipyxxgmm").text("保存成功");
							setTimeout(function(){
								$("#tipyxxgmm").text("");
							}, 2000);
					 }else{
						$("#tipyxxgmm").text(data.tip);
						setTimeout(function(){
							$("#tipyxxgmm").text("");
						}, 2000);
					 }
				 },
				 error:function(){
					 $("#tipmmxgmm1").text("系统发生异常");
						setTimeout(function(){
							$("#tipmmxgmm1").text("");
						}, 2000);
				 }
				 
			 })
		});
		//取消
		$("#yxxgmm1qx").click(function(){
			$("#yxxgmm1").hide();
		})
//手机
	//绑定手机
		$("#sjbdsj").click(function(){
			if($("#sjbdsj1").is(":hidden")){
				$("#sjbdsj1").show();
				$("#sjxgsj1").hide();
				$("#sjxgmm1").hide();
				$("#sjxgsj2").hide();
			}else{
				$("#sjbdsj1").hide();
			}
		})
		//验证码
		$("#bindTelBtn").click(function(){
			$.ajax({
				 url:"/fiioer/sendMsgToNewTel.do",
				 data:{"codeName":"bindTel","tel":$("#bindTel").val()},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 downcounts($("#bindTelBtn"),'{0}s再获取', 60);
					 }else{
						 $("#zxcvb").text(data.tip);
							setTimeout(function(){
								$("#zxcvb").text("");
							}, 2000);
					 }
				 },
				 error:function(){
					 $("#zxcvb").text("系统发生异常");
						setTimeout(function(){
							$("#zxcvb").text("");
						}, 2000);
				 }
				 
			 })
		});
		//绑定
		$("#sjbdsj1bc").click(function(){
			$.ajax({
				 url:"/fiioer/bindTel.do",
				 data:{"codeName":"bindTel","tel":$("#bindTel").val(),"code":$("#bindTelyzm").val()},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 $("#zxcvb").text("保存成功");
							setTimeout(function(){
								$("#zxcvb").text("");
							}, 2000);
					 }else{
						 $("#zxcvb").text(data.tip);
							setTimeout(function(){
								$("#zxcvb").text("");
							}, 2000);
					 }
				 },
				 error:function(){
					 $("#zxcvb").text("系统发生异常");
						setTimeout(function(){
							$("#zxcvb").text("");
						}, 2000);
				 }
				 
			 })
		})
		//取消
		$("#sjbdsj1qx").click(function(){
			$("#sjbdsj1").hide();
		})
	//修改手机
		//1
		$("#sjxgsj").click(function(){
			if($("#sjxgsj1").is(":hidden")){
				$("#sjxgsj1").show();
				$("#sjbdsj1").hide();
				$("#sjxgsj2").hide();
				$("#sjxgmm1").hide();
				
				
			}else{
				$("#sjxgsj1").hide();
			}
		})
		//验证码1
		$("#sjxgsjsend1").click(function(){
			$.ajax({
				 url:"/fiioer/sendMsgToTel.do",
				 data:{"codeName":"telChangeTelOld"},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 downcounts($("#sjxgsjsend1"),'{0}s再获取', 60);
					 }
				 },
				 error:function(){
					 $("#tipsjxgsj1").text("系统发生异常");
						setTimeout(function(){
							$("#tipsjxgsj1").text("");
						}, 2000);
				 }
				 
			 })
		})
		//取消1
		$("#sjxgsj1qx").click(function(){
			$("#sjxgsj1").hide();
		})
		//2
		$("#sjxgsjxyb").click(function(){
			 $.ajax({
				 url:"/fiioer/vidCodeIsTrueByTel.do",
				 data:{"codeName":"telChangeTelOld","code":$("#sjxgsjyzm1").val()},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 $("#sjxgsj1").hide();
						$("#sjxgsj2").show();
					 }else{
						$("#tipsjxgsj1").text(data.tip);
						setTimeout(function(){
							$("#tipsjxgsj1").text("");
						}, 2000);
					 }
				 },
				 error:function(){
					 $("#tipsjxgsj1").text("系统发生异常");
						setTimeout(function(){
							$("#tipsjxgsj1").text("");
						}, 2000);
				 }
				 
			 })
			
		})
		//验证码2
		$("#sjxgsjsend2").click(function(){
			$.ajax({
				 url:"/fiioer/sendMsgToNewTel.do",
				 data:{"codeName":"telChangeTelNew","tel":$("#newPhoness").val()},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 downcounts($("#sjxgsjsend2"),'{0}s再获取', 60);
					 }else{
						 $("#tipsjxgsj2").text(data.tip);
							setTimeout(function(){
								$("#tipsjxgsj2").text("");
							}, 2000);
					 }
				 },
				 error:function(){
					 $("#tipsjxgsj2").text("系统发生异常");
						setTimeout(function(){
							$("#tipsjxgsj2").text("");
						}, 2000);
				 }
				 
			 })
		});
		//保存
		$("#sjxgsj2bc").click(function(){
			$.ajax({
				 url:"/fiioer/updateTelByTel.do",
				 data:{"codeName":"telChangeTelNew","tel":$("#newPhoness").val(),"code":$("#sjxgsjyzm2").val()},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 $("#tipsjxgsj2").text("保存成功");
							setTimeout(function(){
								$("#tipsjxgsj2").text("");
							}, 2000);
					 }else{
						 $("#tipsjxgsj2").text(data.tip);
							setTimeout(function(){
								$("#tipsjxgsj2").text("");
							}, 2000);
					 }
					 
				 },
				 error:function(){
					 $("#tipsjxgsj2").text("系统发生异常");
						setTimeout(function(){
							$("#tipsjxgsj2").text("");
						}, 2000);
				 }
				 
			 })
		});
		//取消2
		$("#sjxgsj2qx").click(function(){
			$("#sjxgsj2").hide();
		})
	//修改密码
		//1
		$("#sjxgmm").click(function(){
			if($("#sjxgmm1").is(":hidden")){
				$("#sjxgmm1").show();
				$("#sjbdsj1").hide();
				$("#sjxgsj1").hide();
				$("#sjxgsj2").hide();
			}else{
				$("#sjxgmm1").hide();
			}
		})
		//验证码1
		$("#sjxgmmsend").click(function(){
			$.ajax({
				 url:"/fiioer/sendMsgToTel.do",
				 data:{"codeName":"telChangePsw"},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 downcounts($("#sjxgmmsend"),'{0}s再获取', 60);
					 }
				 },
				 error:function(){
					 $("#tipsjxgmm").text("系统发生异常");
						setTimeout(function(){
							$("#tipsjxgmm").text("");
						}, 2000);
				 }
				 
			 })
		})
		//保存
		$("#sjxgmmbc").click(function(){
			$.ajax({
				 url:"/fiioer/updatePswByTel.do",
				 data:{"newpsw":$("#telnewpsw").val(),"code":$("#sjxgmmyzm").val()},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 $("#tipsjxgmm").text("保存成功");
							setTimeout(function(){
								$("#tipsjxgmm").text("");
							}, 2000);
					 }else{
						$("#tipsjxgmm").text(data.tip);
						setTimeout(function(){
							$("#tipsjxgmm").text("");
						}, 2000);
					 }
				 },
				 error:function(){
					 $("#tipsjxgmm").text("系统发生异常");
						setTimeout(function(){
							$("#tipsjxgmm").text("");
						}, 2000);
				 }
				 
			 })
		})
		//取消1
		$("#sjxgmm1qx").click(function(){
			$("#sjxgmm1").hide();
		})
//密保
	//设置密保
		//1展示密保
		$("#mbszmb").click(function(){
			if($("#mbszmb1").is(":hidden")){
				$("#mbszmb1").show();
				
				$("#mbxgsj1").hide();
				$("#mbxgsj2").hide();
				
				 $("#mbxgmb1").hide();
				 $("#mbxgmb2").hide();
			}else{
				$("#mbszmb1").hide();
			}
		})
		//取消1
		$("#mbszmb1qx").click(function(){
			$("#mbszmb1").hide();
		})
		//2
		$("#mbszmbxyb").click(function(){
			$.ajax({
				 url:"/fiioer/findPswIsTrue.do",
				 data:{"psw":$("#szmbpsw").val()},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 $("#mbszmb1").hide();
						 $("#mbszmb2").show();
					 }else{
						$("#szmb1").text(data.tip);
						setTimeout(function(){
							$("#szmb1").text("");
						}, 2000);
					 }
				 },
				 error:function(){
					 $("#szmb1").text("系统发生异常");
						setTimeout(function(){
							$("#szmb1").text("");
						}, 2000);
				 }
				 
			 })
			
			
		})
		//保存密保
		$("#mbszmbbc").click(function(){
			$.ajax({
				 url:"/fiioer/saveMibao.do",
				 data:$("#mibaoForm").serialize(),
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 $("#szmb2").text("保存成功");
							setTimeout(function(){
								$("#szmb2").text("");
							}, 2000);
					 }else{
						$("#szmb2").text(data.tip);
						setTimeout(function(){
							$("#szmb2").text("");
						}, 2000);
					 }
				 },
				 error:function(){
					 $("#szmb2").text("系统发生异常");
						setTimeout(function(){
							$("#szmb2").text("");
						}, 2000);
				 }
				 
			 })
		})
		//取消2
		$("#mbszmb2qx").click(function(){
			$("#mbszmb2").hide();
		})
	//密保修改手机
		//1展示密保
		$("#mbxgsj").click(function(){
			if($("#mbxgsj1").is(":hidden")){
				$("#mbxgsj1").show();
				
				$("#mbszmb1").hide();
				
				$("#mbxgsj2").hide();
				
				 $("#mbxgmb1").hide();
				 $("#mbxgmb2").hide();
			}else{
				$("#mbxgsj1").hide();
			}
		})
		//取消1
		$("#mbxgsj1qx").click(function(){
			$("#mbxgsj1").hide();
		})
		//2
		$("#mbxgsjxyb").click(function(){
			$.ajax({
				 url:"/fiioer/findMiBaoIsTrue.do",
				 data:$("#mibaouqForm").serialize(),
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 $("#mbxgsj1").hide();
						 $("#mbxgsj2").show();
					 }else{
						$("#tipmbsj").text(data.tip);
						setTimeout(function(){
							$("#tipmbsj").text("");
						}, 2000);
					 }
				 },
				 error:function(){
					 $("#tipmbsj").text("系统发生异常");
						setTimeout(function(){
							$("#tipmbsj").text("");
						}, 2000);
				 }
				 
			 })
			
		})
		//取消2
		$("#mbxgsj2qx").click(function(){
			$("#mbxgsj2").hide();
		})
		//验证码
		$("#hqyzmzz").click(function(){
			$.ajax({
				 url:"/fiioer/sendMsgToNewTel.do",
				 data:{"codeName":"MibaoChangeTel","tel":$("#newtelphone").val()},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 downcounts($("#hqyzmzz"),'{0}s再获取', 60);
					 }else{
						 $("#tipmbsj2").text(data.tip);
							setTimeout(function(){
								$("#tipmbsj2").text("");
							}, 2000);
					 }
				 },
				 error:function(){
					 $("#tipmbsj2").text("系统发生异常");
						setTimeout(function(){
							$("#tipmbsj2").text("");
						}, 2000);
				 }
				 
			 })
		});
		//保存
		$("#mbxgsjbc").click(function(){
			$.ajax({
				 url:"/fiioer/updateTelByTel.do",
				 data:{"codeName":"MibaoChangeTel","tel":$("#newtelphone").val(),"code":$("#kapkeyTelNewzz").val()},
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 $("#tipmbsj2").text("保存成功");
							setTimeout(function(){
								$("#tipmbsj2").text("");
							}, 2000);
					 }else{
						 $("#tipmbsj2").text(data.tip);
							setTimeout(function(){
								$("#tipmbsj2").text("");
							}, 2000);
					 }
				 },
				 error:function(){
					 $("#tipmbsj2").text("系统发生异常");
						setTimeout(function(){
							$("#tipmbsj2").text("");
						}, 2000);
				 }
				 
			 })
		});
	//密保修改密保
		//1展示密保
		$("#mbxgmb").click(function(){
			if($("#mbxgmb1").is(":hidden")){
				$("#mbxgmb1").show();
				
				$("#mbxgsj1").hide();
				
				$("#mbszmb1").hide();
				
				$("#mbxgsj2").hide();
				
				 $("#mbxgmb2").hide();
			}else{
				$("#mbxgmb1").hide();
			}
		})
		//取消1
		$("#mbxgmb1qx").click(function(){
			$("#mbxgmb1").hide();
		})
		
		//2
		$("#mbxgmbxyb").click(function(){
			$.ajax({
				 url:"/fiioer/findMiBaoIsTrue.do",
				 data:$("#mibaouForm").serialize(),
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 $("#mbxgmb1").hide();
						$("#mbxgmb2").show();
					 }else{
						$("#xgmb1").text(data.tip);
						setTimeout(function(){
							$("#xgmb1").text("");
						}, 2000);
					 }
				 },
				 error:function(){
					 $("#xgmb1").text("系统发生异常");
						setTimeout(function(){
							$("#xgmb1").text("");
						}, 2000);
				 }
				 
			 })
			
			
		})
		//保存
		$("#mbxgmbbc").click(function(){
			$.ajax({
				 url:"/fiioer/updateMibao.do",
				 data:$("#mibaosForm").serialize(),
				 type:"post",
				 dataType:"json",
				 success:function(data){
					 if(data.tip=="success"){
						 $("#xgmb2").text("保存成功");
							setTimeout(function(){
								$("#xgmb2").text("");
							}, 2000);
					 }else{
						$("#xgmb2").text(data.tip);
						setTimeout(function(){
							$("#xgmb2").text("");
						}, 2000);
					 }
				 },
				 error:function(){
					 $("#xgmb2").text("系统发生异常");
						setTimeout(function(){
							$("#xgmb2").text("");
						}, 2000);
				 }
				 
			 })
		})
		//取消2
		$("#mbxgmb2qx").click(function(){
			$("#mbxgmb2").hide();
		})
})
</script>
<script>
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
                        	$("#tipt").text(data.error);
        					setTimeout(function(){
        						$("#tip").text("");
        					}, 2000);
                        }else{  
                        	$("#tipt").text(data.message);
        					setTimeout(function(){
        						$("#tip").text("");
        					}, 2000);
                        }  
                    }  
            	}else{	
            		$("#tipt").text(data.message);
					setTimeout(function(){
						$("#tip").text("");
					}, 2000);
            	}
                
            },  
            error: function (data, status, e)//服务器响应失败处理函数  
            {   	
            	
            	$("#tipt").text("系统发生异常");
				setTimeout(function(){
					$("#tip").text("");
				}, 2000);
            }  
        }  
    )  
    return false;  
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
function renmovecode(){
	$.ajax({
		 url:"/renmovecode.do",
		 type:"post",
		 dataType:"json",
		 success:function(data){
			
		 },
		 error:function(){
			 
		 }
		 
	 })
}
</script>
</html>
