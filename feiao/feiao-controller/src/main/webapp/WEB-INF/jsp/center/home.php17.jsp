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
						<li class="a"><a href="/fiioer/mySelfMsg.do">基本资料</a></li>
						<li><a href="/fiioer/myJob.do">职业信息</a></li>
						<li><a href="/fiioer/myActive.do">活动信息</a></li>
					</ul>
					<iframe id="frame_profile" name="frame_profile"
						style="display: none"></iframe>
					<form id="userForm">
						<input type="hidden" name="fa_id" value="${fu.fa_id}">
						<input type="hidden" name="fa_username"
										value="${fu.fa_username}"  />
							<table cellspacing="0" cellpadding="0"
								class="profile_setlist input_w_316 tfm" id="profilelist">
								<tr>
									<th>用户名</th>
									<td><input type="text" 
										value="${fu.fa_username}" disabled="disabled" /></td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<th>用户等级</th>
									<td>${fr.fa_name}</td>
									<td>&nbsp;</td>
								</tr>
								<tr id="tr_gender" class="select_w_316">
									<th id="th_gender">性别</th>
									<td id="td_gender"><span class="simselect"> <select
											class="gongkai" name="fa_sex">

												<option value="0"
													<c:if test="${fu.fa_sex==0}">selected="selected"</c:if>>男</option>
												<option value="1"
													<c:if test="${fu.fa_sex==1}">selected="selected"</c:if>>女</option>
												<option value="2"
													<c:if test="${fu.fa_sex==2}">selected="selected"</c:if>>保密</option>

										</select>
									</span></td>
								</tr>
								<tr>
									<th>获得的勋章</th>
									<td><c:if test="${honor!=null && honor!=''}">
											<c:forEach items="${honor}" var="hr">
												<img src="${hr['image']}" title="${hr['name']}" 
													>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												
											</c:forEach>
										</c:if> <c:if test="${honor==null}">
	    													暂无获得勋章
	    								</c:if></td>
									<td>&nbsp;</td>
								</tr>
								<tr id="tr_qq" class="select_w_316">
									<th id="th_qq">QQ</th>
									<td id="td_qq"><input type="text" id="qq" name="fa_qq"
										value="${fu.fa_qq}" class="px">
											<div class="rq mtn" id="showerror_qq"></div>
											<p class="d"></p></td>
								</tr>
								<tr id="tr_field1" class="select_w_316">
									<th id="th_field1">微博地址</th>
									<td id="td_field1"><input type="text" " id="field1"
										name="fa_weibo" value="${fu.fa_weibo}" class="px"><div
												class="rq mtn" id="showerror_field1"></div>
											<p class="d"></p></td>
								</tr>
								<tr id="tr_residecity" class="select_w_102">
									<th id="th_residecity">居住省份</th>
									<td id="td_gender"><span class="simselect"><select
											class="gongkai" name="fa_life">
												<option value="0"
													<c:if test="${fu.fa_life==0}">selected="selected"</c:if>>北京市</option>
												<option value="1"
													<c:if test="${fu.fa_life==1}">selected="selected"</c:if>>浙江省</option>
												<option value="2"
													<c:if test="${fu.fa_life==2}">selected="selected"</c:if>>天津市</option>
												<option value="3"
													<c:if test="${fu.fa_life==3}">selected="selected"</c:if>>安徽省</option>
												<option value="4"
													<c:if test="${fu.fa_life==4}">selected="selected"</c:if>>上海市</option>
												<option value="5"
													<c:if test="${fu.fa_life==5}">selected="selected"</c:if>>福建省</option>
												<option value="6"
													<c:if test="${fu.fa_life==6}">selected="selected"</c:if>>重庆市</option>
												<option value="7"
													<c:if test="${fu.fa_life==7}">selected="selected"</c:if>>江西省</option>
												<option value="8"
													<c:if test="${fu.fa_life==8}">selected="selected"</c:if>>山东省</option>
												<option value="9"
													<c:if test="${fu.fa_life==9}">selected="selected"</c:if>>河南省</option>
												<option value="10"
													<c:if test="${fu.fa_life==10}">selected="selected"</c:if>>湖北省</option>
												<option value="11"
													<c:if test="${fu.fa_life==11}">selected="selected"</c:if>>湖南省</option>
												<option value="12"
													<c:if test="${fu.fa_life==12}">selected="selected"</c:if>>广东省</option>
												<option value="13"
													<c:if test="${fu.fa_life==13}">selected="selected"</c:if>>海南省</option>
												<option value="14"
													<c:if test="${fu.fa_life==14}">selected="selected"</c:if>>山西省</option>
												<option value="15"
													<c:if test="${fu.fa_life==15}">selected="selected"</c:if>>青海省</option>
												<option value="16"
													<c:if test="${fu.fa_life==16}">selected="selected"</c:if>>江苏省</option>
												<option value="17"
													<c:if test="${fu.fa_life==17}">selected="selected"</c:if>>辽宁省</option>
												<option value="18"
													<c:if test="${fu.fa_life==18}">selected="selected"</c:if>>吉林省</option>
												<option value="19"
													<c:if test="${fu.fa_life==19}">selected="selected"</c:if>>台湾省</option>
												<option value="20"
													<c:if test="${fu.fa_life==20}">selected="selected"</c:if>>河北省</option>
												<option value="21"
													<c:if test="${fu.fa_life==21}">selected="selected"</c:if>>贵州省</option>
												<option value="22"
													<c:if test="${fu.fa_life==22}">selected="selected"</c:if>>四川省</option>
												<option value="23"
													<c:if test="${fu.fa_life==23}">selected="selected"</c:if>>云南省</option>
												<option value="24"
													<c:if test="${fu.fa_life==24}">selected="selected"</c:if>>陕西省</option>
												<option value="25"
													<c:if test="${fu.fa_life==25}">selected="selected"</c:if>>甘肃省</option>
												<option value="26"
													<c:if test="${fu.fa_life==26}">selected="selected"</c:if>>黑龙江省</option>
												<option value="27"
													<c:if test="${fu.fa_life==27}">selected="selected"</c:if>>香港特别行政区</option>
												<option value="28"
													<c:if test="${fu.fa_life==28}">selected="selected"</c:if>>澳门特别行政区</option>
												<option value="29"
													<c:if test="${fu.fa_life==29}">selected="selected"</c:if>>广西壮族自治区</option>
												<option value="30"
													<c:if test="${fu.fa_life==30}">selected="selected"</c:if>>宁夏回族自治区</option>
												<option value="31"
													<c:if test="${fu.fa_life==31}">selected="selected"</c:if>>新疆维吾尔自治区</option>
												<option value="32"
													<c:if test="${fu.fa_life==32}">selected="selected"</c:if>>内蒙古自治区</option>
												<option value="33"
													<c:if test="${fu.fa_life==33}">selected="selected"</c:if>>西藏自治区</option>
										</select></span></td>
								</tr>

								<tr id="tr_privacy" class="select_w_316">
									<th id="th_privacy">隐私保护</th>
									<td id="td_privacy"><span class="simselect"><select
											class="gongkai" name="fa_hide_base">
												<option value="0"
													<c:if test="${fu.fa_hide_base==0}">selected="selected"</c:if>>公开</option>
												<option value="1"
													<c:if test="${fu.fa_hide_base==1}">selected="selected"</c:if>>好友可见</option>
												<option value="2"
													<c:if test="${fu.fa_hide_base==2}">selected="selected"</c:if>>保密</option>

										</select></span></td>
								</tr>

								<tr>
									<td colspan="3" class="btnbar_setlist"><input
										type="hidden" />
										<button type="button" id="saveBth" class="normalbtn bluebtn" />
										<strong>保存</strong>
										</button> <font id="tip" color="red"></font> <span id="submit_result"
										class="rq"></span></td>
								</tr>
							</table>
					</form>
					<script type="text/javascript">
						$(function() {
							$("#saveBth").click(function() {
								$.ajax({
									url : "/fiioer/saveBaseMb.do",
									data : $("#userForm").serialize(),
									type : "post",
									dataType : "json",
									success : function(data) {
										if (data.tip == "success") {
											$("#tip").text("保存成功！");
											setTimeout(function() {
												$("#tip").text("");
											}, 2000);
										} else {
											$("#tip").text(data.tip);
											setTimeout(function() {
												$("#tip").text("");
											}, 2000);
										}
									},
									error : function() {
										$("#tip").text("系统发生异常");
										setTimeout(function() {
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
				href="/fiioer/myInte.do"><span>积分</span><span class="collapsed"></span></a><span
				class="itemicon_setlist"> </span></li>
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
