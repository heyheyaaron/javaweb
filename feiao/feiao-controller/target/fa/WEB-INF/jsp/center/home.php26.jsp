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
				href="/fiioer/myInte.do"><span>积分</span><span
					class="collapsed"></span></a><span class="itemicon_setlist"> </span></li>
			<li class="items_setlist a"><a class="stitle"
				href="/fiioer/myGroup.do"><span>用户组与标签</span><span
					class="collapsed"></span></a><span class="itemicon_setlist"> </span></li>
			<li>
				<div>
					<ul class="tb cl">
						<li><a href="/fiioer/myGroup.do">我的用户组</a></li>
						<li><a href="/fiioer/myLabel.do">标签设置</a></li>
						<li class="a" style="width: 120px;"><a
							href="/fiioer/myModel.do">我的版块权限</a></li>
					</ul>

					<div class="upower_usergroup">
						<table cellpadding="0" cellspacing="0" class="tdat ftb mtm mbm">
							<tr class="alt head_dug">
								<th class="xw1" width="20%">版块名称</th>
								<td class="xw1">发帖权限</td>
								<td class="xw1">回帖权限</td>
								<td class="xw1">点赞权限</td>
								<td class="xw1">投票权限</td>
								<td class="xw1">浏览权限</td>
							</tr>
							<c:if test="${listm!=null && listm!=''}">
								<c:forEach items="${listm}" var="lm" varStatus="vx">
									<tr <c:if test="${vx.index%2!=0}">class="alt"</c:if>>
										<th><a href="javascript:void(0)">${lm['name']}</a></th>
										<td>
											<c:if test="${lm['fg']>0}">
												<img src="/resources/php/bbs/static/image/common/data_valid.gif"/>
											</c:if>
										</td>
										<td>
											<c:if test="${lm['fr']>0}">
												<img src="/resources/php/bbs/static/image/common/data_valid.gif"/>
											</c:if>
										</td>
										<td>
											<c:if test="${lm['fz']>0}">
												<img src="/resources/php/bbs/static/image/common/data_valid.gif"/>
											</c:if>
										</td>
										<td>
											<c:if test="${lm['fv']>0}">
												<img src="/resources/php/bbs/static/image/common/data_valid.gif"/>
											</c:if>
										</td>
										<td>
											<c:if test="${lm['fea']>0}">
												<img src="/resources/php/bbs/static/image/common/data_valid.gif"/>
											</c:if>
										</td>
										
									</tr>
								</c:forEach>
							</c:if>
							
							





						</table>
					</div>
					<div class="tipbar_dug">
						<img src="/resources/php/bbs/static/image/common/data_valid.gif"
							class="vm" /> 表示有权操作
					</div>
				</div>
			</li>
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
