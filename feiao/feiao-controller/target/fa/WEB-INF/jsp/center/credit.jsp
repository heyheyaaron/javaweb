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
			<li class="items_setlist " style="border: none;"><a
				class="stitle" href="/fiioer/mySelfMsg.do"><span>个人资料</span><span
					class="collapsed"></span></a><span class="itemicon_setlist"> </span></li>
			<li class="items_setlist "><a class="stitle"
				href="/fiioer/myTitleImage.do"><span>头像与安全</span><span
					class="collapsed"></span></a><span class="itemicon_setlist"> </span></li>
			<li class="items_setlist a"><a class="stitle"
				href="/fiioer/myInte.do"><span>积分</span><span class="collapsed"></span></a><span
				class="itemicon_setlist"> </span></li>
			<li>
				<div>
					<ul class="tb cl">
						<li class="a"><a href="/fiioer/myInte.do">我的积分</a></li>
						<li><a href="/fiioer/InteData.do">积分记录</a></li>
						<li><a href="/fiioer/InteRole.do">积分规则</a></li>
					</ul>
					<ul class="creditl mtm">
						<li class="xi1"><em>积分&nbsp;</em>${fu.fa_jifen} &nbsp;</li>
						<li><em>飞镖&nbsp;</em>${fu.fa_feibiao}</li>
						
					</ul>
				</div>
			</li>
			<li class="items_setlist"><a class="stitle"
				href="/fiioer/myGroup.do"><span>用户组与标签</span><span
					class="collapsed"></span></a><span class="itemicon_setlist"> </span></li>
			<li class="items_setlist"><a class="stitle"
				href="/fiioer/myPrivacy.do"><span>隐私筛选</span><span
					class="collapsed"></span></a><span class="itemicon_setlist"> </span></li>
		</ul>
	</div>
	</div>
	</div>
	<c:import url="${path}/feiiombend.jsp"></c:import>
</body>
<script type="text/javascript" src="/js/commom.js"></script>
<script type="text/javascript">
	login();
	loginbox();
</script>
</html>
