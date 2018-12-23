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
						<li><a href="/fiioer/myInte.do">我的积分</a></li>
						<li><a href="/fiioer/InteData.do">积分记录</a></li>
						<li class="a"><a href="/fiioer/InteRole.do">积分规则</a></li>
					</ul>
					<div class="integrallist rule_intelist">
						<table cellspacing="0" cellpadding="0" class="dt valt">
							<col width="126px;" />
							<col width="96px;" />
							<col width="166px;" />
							<col width="68px;" />
							<col width="68px;" />
							<col width="92px;" />
							<tr>
								<th>动作名称</th>
								<th width="15%">积分</th>
								<th width="15%">飞镖</th>
								<th width="25%">周期范围</th>
								<th colspan="2">周期内最多奖励次数</th>
							</tr>
							<tr class="alt">
								<td>签到</td>
								<td>
									<c:if test="${rp.signInte>0}">+</c:if>${rp.signInte}
									
								</td>
								<td><c:if test="${rp.signFb>0}">+</c:if>${rp.signFb}</td>
								<td>
									<c:if test="${rp.signz==0}">不限</c:if>
									<c:if test="${rp.signz==2}">每天</c:if>
									<c:if test="${rp.signz==1}">一次</c:if>
								</td>
								<td  colspan="2">
									<c:if test="${rp.signt==0}">不限</c:if>
									<c:if test="${rp.signt!=0}">${rp.signt}</c:if>
								</td>
							</tr>
							<tr>
								<td>每天登录</td>
								<td>
									<c:if test="${rp.loginInte>0}">+</c:if>${rp.loginInte}
									
								</td>
								<td><c:if test="${rp.loginFb>0}">+</c:if>${rp.loginFb}</td>
								<td>
									<c:if test="${rp.loginz==0}">不限</c:if>
									<c:if test="${rp.loginz==2}">每天</c:if>
									<c:if test="${rp.loginz==1}">一次</c:if>
								</td>
								<td  colspan="2">
									<c:if test="${rp.logint==0}">不限</c:if>
									<c:if test="${rp.logint!=0}">${rp.logint}</c:if>
								</td>
							</tr>
							<tr   class="alt">
								<td>发表回复</td>
								<td><c:if test="${rp.respeakInte>0}">+</c:if>${rp.respeakInte}</td>
								<td><c:if test="${rp.respeakFb>0}">+</c:if>${rp.respeakFb}</td>
								<td>
									<c:if test="${rp.respeakz==0}">不限</c:if>
									<c:if test="${rp.respeakz==2}">每天</c:if>
									<c:if test="${rp.respeakz==1}">一次</c:if>
								</td>
								<td colspan="2">
									<c:if test="${rp.respeakt==0}">不限</c:if>
									<c:if test="${rp.respeakt!=0}">${rp.respeakt}</c:if>
								</td>
							</tr>
							<tr>
								<td>发表主题帖子</td>
								<td><c:if test="${rp.themeInte>0}">+</c:if>${rp.themeInte}</td>
								<td><c:if test="${rp.themeFb>0}">+</c:if>${rp.themeFb}</td>
								<td>
									<c:if test="${rp.themez==0}">不限</c:if>
									<c:if test="${rp.themez==2}">每天</c:if>
									<c:if test="${rp.themez==1}">一次</c:if>
								</td>
								<td colspan="2">
									<c:if test="${rp.themet==0}">不限</c:if>
									<c:if test="${rp.themet!=0}">${rp.themet}</c:if>
								</td>
							</tr>
							<tr   class="alt">
								<td>帖子加精</td>
								<td><c:if test="${rp.jingInte>0}">+</c:if>${rp.jingInte}</td>
								<td><c:if test="${rp.jingFb>0}">+</c:if>${rp.jingFb}</td>
								<td>
									<c:if test="${rp.jingz==0}">不限</c:if>
									<c:if test="${rp.jingz==2}">每天</c:if>
									<c:if test="${rp.jingz==1}">一次</c:if>
								</td>
								<td colspan="2">
									<c:if test="${rp.jingt==0}">不限</c:if>
									<c:if test="${rp.jingt!=0}">${rp.jingt}</c:if>
								</td>
							</tr>
							<tr>
								<td>帖子被删</td>
								<td><c:if test="${rp.deleteInte>0}">+</c:if>${rp.deleteInte}</td>
								<td><c:if test="${rp.deleteFb>0}">+</c:if>${rp.deleteFb}</td>
								<td>
									<c:if test="${rp.deletez==0}">不限</c:if>
									<c:if test="${rp.deletez==2}">每天</c:if>
									<c:if test="${rp.deletez==1}">一次</c:if>
								</td>
								<td colspan="2">
									<c:if test="${rp.deletet==0}">不限</c:if>
									<c:if test="${rp.deletet!=0}">${rp.deletet}</c:if>
								</td>
							</tr>
							<tr   class="alt">
								<td>参与投票</td>
								<td><c:if test="${rp.voteInte>0}">+</c:if>${rp.voteInte}</td>
								<td><c:if test="${rp.voteFb>0}">+</c:if>${rp.voteFb}</td>
								<td>
									<c:if test="${rp.votez==0}">不限</c:if>
									<c:if test="${rp.votez==2}">每天</c:if>
									<c:if test="${rp.votez==1}">一次</c:if>
								</td>
								<td colspan="2">
									<c:if test="${rp.votet==0}">不限</c:if>
									<c:if test="${rp.votet!=0}">${rp.votet}</c:if>
								</td>
							</tr>
							<tr>
								<td>设置头像</td>
								<td><c:if test="${rp.titleInte>0}">+</c:if>${rp.titleInte}</td>
								<td><c:if test="${rp.titleFb>0}">+</c:if>${rp.titleFb}</td>
								<td>
									<c:if test="${rp.titlez==0}">不限</c:if>
									<c:if test="${rp.titlez==2}">每天</c:if>
									<c:if test="${rp.titlez==1}">一次</c:if>
								</td>
								<td colspan="2">
									<c:if test="${rp.titlet==0}">不限</c:if>
									<c:if test="${rp.titlet!=0}">${rp.titlet}</c:if>
								</td>
							</tr>
							<tr   class="alt">
								<td>邮箱认证</td>
								<td><c:if test="${rp.emailInte>0}">+</c:if>${rp.emailInte}</td>
								<td><c:if test="${rp.emailFb>0}">+</c:if>${rp.emailFb}</td>
								<td>
									<c:if test="${rp.emailz==0}">不限</c:if>
									<c:if test="${rp.emailz==2}">每天</c:if>
									<c:if test="${rp.emailz==1}">一次</c:if>
								</td>
								<td colspan="2">
									<c:if test="${rp.emailt==0}">不限</c:if>
									<c:if test="${rp.emailt!=0}">${rp.emailt}</c:if>
								</td>
							</tr>
							<tr>
								<td>产品注册</td>
								<td><c:if test="${rp.proInte>0}">+</c:if>${rp.proInte}</td>
								<td><c:if test="${rp.proFb>0}">+</c:if>${rp.proFb}</td>
								<td>
									<c:if test="${rp.proz==0}">不限</c:if>
									<c:if test="${rp.proz==2}">每天</c:if>
									<c:if test="${rp.proz==1}">一次</c:if>
								</td>
								<td colspan="2">
									<c:if test="${rp.prot==0}">不限</c:if>
									<c:if test="${rp.prot!=0}">${rp.prot}</c:if>
								</td>
							</tr>
							
							
							
						</table>
					</div>
				</div>
			</li>
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
<script type="text/javascript">
	login();
	loginbox();
</script>
</html>
