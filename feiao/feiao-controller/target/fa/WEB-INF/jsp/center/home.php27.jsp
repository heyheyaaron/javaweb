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
</head>
<body>
	<c:import url="${path}/feiiohead.jsp"></c:import>
	<div id="wp" class="wp">
		<c:import url="${path}/feiiombright.jsp"></c:import>

		<ul class="main_wp settinglist">
			<li class="items_setlist " style="border: none;"><a
				class="stitle" href="/fiioer/mySelfMsg.do"><span>个人资料</span><span
					class="collapsed"></span></a><span class="itemicon_setlist"> </span></li>
			<li class="items_setlist "><a class="stitle"
				href="/fiioer/myTitleImage.do"><span>头像与安全</span><span
					class="collapsed"></span></a><span class="itemicon_setlist"> </span></li>
			<li class="items_setlist "><a class="stitle"
				href="/fiioer/myInte.do"><span>积分</span><span class="collapsed"></span></a><span
				class="itemicon_setlist"> </span></li>
			<li class="items_setlist "><a class="stitle"
				href="/fiioer/myGroup.do"><span>用户组与标签</span><span
					class="collapsed"></span></a><span class="itemicon_setlist"> </span></li>
			<li class="items_setlist a"><a class="stitle"
				href="/fiioer/myPrivacy.do"><span>隐私筛选</span><span
					class="collapsed"></span></a><span class="itemicon_setlist"> </span></li>
			<li>
				<div style="margin-bottom: 20px;">
					<ul class="tb cl">
						<li class="a"><a href="/fiioer/myPrivacy.do">个人隐私设置</a></li>
						<li><a href="/fiioer/myState.do">动态筛选</a></li>
					</ul>
					<form class="privacy_setlist select_w_316" id="userForm" >
						<input type="hidden"  name="id" value="${fu.fa_id}" >

							<table cellspacing="0" cellpadding="0" class="tfm">
								<tr>
									<th style="vertical-align: middle;">好友列表</th>
									<td><span class="simselect"><select class="gongkai" name="friendType" >
												<option value="0" <c:if test="${fu.fa_hide_friend==0}">selected="selected"</c:if>>公开</option>
												<option value="1" <c:if test="${fu.fa_hide_friend==1}">selected="selected"</c:if>>好友可见</option>
												<option value="2" <c:if test="${fu.fa_hide_friend==2}">selected="selected"</c:if>>保密</option>
												<option value="3" <c:if test="${fu.fa_hide_friend==3}">selected="selected"</c:if>>仅注册用户可见</option>
										</select></span></td>
								</tr>
								<tr>
									<td colspan="2" class="btnbar_setlist"><a
										class="normalbtn bluebtn"><button type="button" id="saveBtn" >
												<strong>保存</strong>
											</button></a>     <font id="tip" color="red"></font></td>
								</tr>
							</table>
					</form>

				</div>
			</li>
		</ul>

	</div>
	</div>
	</div>
	<c:import url="${path}/feiiombend.jsp"></c:import>
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" src="/js/commom.js"></script>
	<script>
		login();
		loginbox();
		$(function(){
			$("#saveBtn").click(function(){
				$.ajax({
					url:"/fiioer/saveFriendState.do",
					data:$("#userForm").serialize(),
					type:"post",
					dataType:"json",
					success:function(data){
						if(data.tip=="success"){
							$("#tip").text("保存成功");
							setTimeout(function(){
								$("#tip").text("");
							},2000)
						}else{
							$("#tip").text("系统发生异常");
							setTimeout(function(){
								$("#tip").text("");
							},2000)
						}
					},
					error:function(){
						$("#tip").text("系统发生异常");
						setTimeout(function(){
							$("#tip").text("");
						},2000)
					}
				})
			});
		})
	</script>


</body>

</html>