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
						<li class="a"><a href="/fiioer/myGroup.do">我的用户组</a></li>
						<li><a href="/fiioer/myLabel.do">标签设置</a></li>
						<li style="width: 120px;"><a href="/fiioer/myModel.do">我的版块权限</a></li>
					</ul>
					<c:if test="${listgroup==null}">
						<br />
						<br />
						<br />
						对不起，你还没有加入任何用户组
						<br />
					</c:if>
					<c:if test="${listgroup!=null}">
					<div class="integrallist rule_intelist">
						<table cellspacing="0" cellpadding="0" class="dt valt">
							<col width="126px;" />
							<col width="96px;" />
							<col width="166px;" />
							<col width="68px;" />
							<col width="68px;" />
							<col width="92px;" />
							<tr>
								<th colspan="2">用户组名</th>
								<th colspan="2">图标</th>
								<th colspan="2">描述</th>
							</tr>
							<c:forEach items="${listgroup}" var="lg" varStatus="vs">
								<tr <c:if test="${vs.index%2==0}">class="alt"</c:if> >
								
								<td colspan="2">${lg['name']}</td>
								<td colspan="2">
									<img src="${lg['image']}" width="50px"/>
								</td>
								<td colspan="2">${lg['descs']}</td>
								
							</tr>
							</c:forEach>
							
						</table>
					</div>
					</c:if>
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
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" src="/js/commom.js"></script>
	<script>
		$(".select_box li.li1").click(function() {

			$(this).parents().find(".p_pop1").toggle();

		});
		$(".select_box li.li2").click(function() {

			$(this).parents().find(".p_pop2").toggle();

		});
		$(".select_box li.li3").click(function() {

			$(this).parents().find(".p_pop3").toggle();

		});
		$(".select_box li.li4").click(function() {

			$(this).parents().find(".p_pop4").toggle();

		});
		login();
		loginbox();
	</script>



</body>

</html>
