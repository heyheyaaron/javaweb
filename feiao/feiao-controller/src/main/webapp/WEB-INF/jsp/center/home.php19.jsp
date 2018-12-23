<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_common.css" />
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_home_spacecp.css" />
<script src="/js/jquery.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<script type="text/javascript" src="${path}/js/jquery-timer-1.0.js"></script>
</head>
<body>
	<c:import url="${path}/feiiohead.jsp"></c:import>

	<div id="wp" class="wp">
		<c:import url="${path}/feiiombright.jsp"></c:import>

		<ul class="main_wp settinglist">
			<li class="items_setlist a" style="border: none;"><a
				class="stitle" href="/fiioer/mySelfMsg.do"><span>个人资料</span><span
					class="collapsed"></span></a><span class="itemicon_setlist"> </span></li>
			<li>
				<div>
					<ul class="tb cl">
						<li><a href="/fiioer/mySelfMsg.do">基本资料</a></li>
						<li><a href="/fiioer/myJob.do">职业信息</a></li>
						<li class="a"><a href="/fiioer/myActive.do">活动信息</a></li>
					</ul>
					<form id="userForm">
						<input type="hidden" name="fa_id" value="${fu.fa_id}">
							<table cellspacing="0" cellpadding="0"
								class="profile_setlist input_w_316 tfm" id="profilelist">
								<tr>
									<th>用户名</th>
									<td>${fu.fa_username}</td>
									<td>&nbsp;</td>
								</tr>
								<tr id="tr_realname" class="select_w_316">
									<th id="th_realname">真实姓名</th>
									<td id="td_realname"><input type="text" id="realname" name="fa_name" value="${fu.fa_name}"
										class="px"><div class="rq mtn" id="showerror_realname"></div>
											<p class="d"></p></td>
								</tr>
								<tr id="tr_idcard" class="select_w_316">
									<th id="th_idcard">证件号</th>
									<td id="td_idcard"><input type="text" id="idcard" name="fa_idc" value="${fu.fa_idc}"
										class="px"><div class="rq mtn" id="showerror_idcard"></div>
											<p class="d"></p></td>
								</tr>
								<tr >
									<th >证件类型</th>
									
									<td ><span class="simselect"><select
											class="gongkai" name="fa_idctype">
											
												<option value="sfz" <c:if test="${fu.fa_idctype=='sfz'}">selected="selected"</c:if>>身份证</option>
												<option value="qt" <c:if test="${fu.fa_idctype=='qt'}">selected="selected"</c:if>>其他</option>
											
										</select></span></td>
								</tr>

								<tr id="tr_privacy" class="select_w_316">
									<th id="th_privacy">隐私保护</th>
									<td id="td_privacy"><span class="simselect"><select
											class="gongkai" name="fa_hide_active">
											<option value="0" <c:if test="${fu.fa_hide_active==0}">selected="selected"</c:if>>公开</option>
												<option value="1" <c:if test="${fu.fa_hide_active==1}">selected="selected"</c:if>>好友可见</option>
												<option value="2" <c:if test="${fu.fa_hide_active==2}">selected="selected"</c:if>>保密</option>
											
										</select></span></td>
								</tr>

								<tr>
									<td colspan="3" class="btnbar_setlist"><input
										type="hidden">
											<button type="button" id="saveBth"
												class="normalbtn bluebtn" />
											<strong>保存</strong>
										</button>    <font id="tip" color="red"></font> <span id="submit_result" class="rq"></span></td>
								</tr>
							</table>
					</form>
					<script type="text/javascript">
					$(function(){
						$("#saveBth").click(function(){
							$.ajax({
								url:"/fiioer/saveActiveMb.do",
								data:$("#userForm").serialize(),
								type:"post",
								dataType:"json",
								success:function(data){
									if(data.tip=="success"){
										$("#tip").text("保存成功！");
										setTimeout(function(){
											$("#tip").text("");
										}, 2000);
									}else{
										$("#tip").text(data.tip);
										setTimeout(function(){
											$("#tip").text("");
										}, 2000);
									}
								},
								error:function(){
									$("#tip").text("系统发生异常");
									setTimeout(function(){
										$("#tip").text("");
									}, 2000);
								}
							})
						})
					})
						
						simSelectFun(".profile_setlist select");
						function show_error(fieldid, extrainfo) {
							var elem = $('th_' + fieldid);
							if (elem) {
								elem.className = "rq";
								fieldname = elem.innerHTML;
								extrainfo = (typeof extrainfo == "string") ? extrainfo
										: "";
								$('showerror_' + fieldid).innerHTML = "请检查该资料项 "
										+ extrainfo;
								$(fieldid).focus();
							}
						}
						function show_success(message) {
							message = message == '' ? '资料更新成功' : message;
							showDialog(
									message,
									'right',
									'提示信息',
									function() {
										top.window.location.href = top.window.location.href;
									}, 0, null, '', '', '', '', 3);
						}
						function clearErrorInfo() {
							var spanObj = $('profilelist')
									.getElementsByTagName("div");
							for ( var i in spanObj) {
								if (typeof spanObj[i].id != "undefined"
										&& spanObj[i].id.indexOf("_")) {
									var ids = explode('_', spanObj[i].id);
									if (ids[0] == "showerror") {
										spanObj[i].innerHTML = '';
										$('th_' + ids[1]).className = '';
									}
								}
							}
						}
					</script>
				</div>
			</li>
			<li class="items_setlist "><a class="stitle"
				href="/fiioer/myTitleImage.do"><span>头像与安全</span><span
					class="collapsed"></span></a><span class="itemicon_setlist"> </span></li>
			<li class="items_setlist "><a class="stitle"
				href="/fiioer/myInte.do"><span>积分</span><span
					class="collapsed"></span></a><span class="itemicon_setlist"> </span></li>
			<li class="items_setlist "><a class="stitle"
				href="/fiioer/myGroup.do"><span>用户组与标签</span><span
					class="collapsed"></span></a><span class="itemicon_setlist"> </span></li>
			<li class="items_setlist "><a class="stitle"
				href="/fiioer/myPrivacy.do"><span>隐私筛选</span><span
					class="collapsed"></span></a><span class="itemicon_setlist"> </span></li>

		</ul>

	</div>
	</div>

	</div>
	<c:import url="${path}/feiiombend.jsp"></c:import>

</body>
<script type="text/javascript" src="/js/commom.js"></script>
<script>
	login();
	loginbox();
</script>



</html>