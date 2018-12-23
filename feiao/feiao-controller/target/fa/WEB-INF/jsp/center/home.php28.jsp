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
<script src="../js/jquery.js" type="text/javascript"></script>
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
						<li><a href="/fiioer/myPrivacy.do">个人隐私设置</a></li>
						<li class="a"><a href="/fiioer/myState.do">动态筛选</a></li>
					</ul>
					<form class="privacy_setlist select_w_316">
						<input type="hidden">
							<table cellspacing="0" cellpadding="0"
								class="tfm bbda filterrule_setlist">
								<caption>
									<h2 class="ptw pbn xs2">筛选规则一：屏蔽指定好友分组的动态</h2>
									<p class="xg1">您可以决定屏蔽哪些好友分组的动态，屏蔽好友分组内的组员所发布的动态都将被屏蔽掉(仅限查看好友的动态时生效)
									</p>
									<p class="d">
										(您可以在自己的<a href="/fiioer/friendList.do">好友列表</a>中，对好友进行分组，并可以对用户组进行改名
										)
									</p>
								</caption>
								<c:if test="${listGroup==null || empty listGroup}">
									<tr>
										<td class="d">现在还没有好友分组</td>
									</tr>
								</c:if>
								<c:if test="${listGroup!=null && !empty listGroup}">
									<tr>
										<td>
										
										<c:forEach items="${listGroup}" var="lg" >
											<label> <input type="checkbox" name="groupsname" <c:if test="${lg['ignores']==1}">checked="checked"</c:if> value="${lg['id']}"  class="pc">${lg['name']}</label>
										</c:forEach>
										</td>
									</tr>
									<tr>
										<td>
											<button type="button" class="normalbtn bluebtn" id="saveSt"  />
											<strong>保存</strong>   
										</button>   <font id="tipSt" color="red" >  </font>
										</td>
									</tr>
								</c:if>
								
							</table>
							<table cellspacing="0" cellpadding="0"
								class="tfm bbda filterrule_setlist">
								<caption>
									<h2 class="ptw pbn xs2">筛选规则二：屏蔽指定好友的对话</h2>
									<p class="xg1">
										点击一下首页好友动态列表后面的屏蔽标志，就可以屏蔽指定好友的对话了。 <br />下面列出的是您已经屏蔽的好友名，您可以选择是否取消屏蔽
									
									</p>
								</caption>
								<c:if test="${listFriends==null || empty listFriends}">
									<tr>
										<td class="d">现在还没有屏蔽的动态类型</td>
									</tr>
								
								</c:if>
								<c:if test="${listFriends!=null  && !empty listFriends}">
									<tr>
										<td>
										
										<c:forEach items="${listFriends}" var="lg" >
											<label> <input type="checkbox" name="friendsname" checked="checked" value="${lg['id']}"  class="pc">${lg['name']}</label>
										</c:forEach>
										</td>
									</tr>
									<tr>
										<td>
											<button type="button" class="normalbtn bluebtn" id="saveNd"  />
											<strong>保存</strong>   
										</button>   <font id="tipNd" color="red" >  </font>
										</td>
									</tr>
								
								
								</c:if>
								
							</table>
							<table cellspacing="0" cellpadding="0"
								class="tfm filterrule_setlist">
								<caption>
									<h2 class="ptw pbn xs2">筛选规则三：屏蔽指定好友的提醒</h2>
									<p class="xg1">
										点击一下通知列表后面的屏蔽标志，就可以屏蔽指定好友的提醒了。 <br />下面列出的是您已经屏蔽的好友名，您可以选择是否取消屏蔽
									</p>
								</caption>
								<c:if test="${listMsg==null ||empty listMsg}">
									<tr>
										<td class="d">现在还没有屏蔽的提醒</td>
									</tr>
								</c:if>
								<c:if test="${listMsg!=null && !empty listMsg}">
								
									<tr>
										<td>
										
										<c:forEach items="${listMsg}" var="lg" >
											<label> <input type="checkbox" name="msgsname" checked="checked"  value="${lg['id']}"  class="pc">${lg['username']}</label>
										</c:forEach>
										</td>
									</tr>
									<tr>
										<td>
											<button type="button" class="normalbtn bluebtn" id="saveRd"  />
											<strong>保存</strong>   
										</button>   <font id="tipRd" color="red" >  </font>
										</td>
									</tr>
								
								</c:if>
								
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
	<script type="text/javascript">
		
		$(".buxian").click(function() {

			$(this).parent().find('.selectbox_simu').toggle();
		});
		login();
		loginbox();
	</script>
	<script type="text/javascript">
		$(function(){
			//屏蔽用户组
			$("#saveSt").click(function(){
				var ids ="";
				$('input[name="groupsname"]').each(function(){
					if($(this).prop("checked")){
						if(ids==""){
							ids=$(this).val();
						}else{
							ids=ids+","+$(this).val();
						}
					}
	            });
				$.ajax({
					url:"/fiioer/ignoreGroups.do",
					data:{"ids":ids,"id":"${fu.fa_id}"},
					type:"post",
					dataType:"json",
					success:function(data){
						if(data.tip=="success"){
							$("#tipSt").text("保存成功");
							setTimeout(function() {
								$("#tipSt").text("");
							}, 2000);
						}else{
							$("#tipSt").text("系统发生异常");
							setTimeout(function() {
								$("#tipSt").text("");
							}, 2000);
						}
					},
					error:function(){
						$("#tipSt").text("系统发生异常");
						setTimeout(function() {
							$("#tipSt").text("");
						}, 2000);
					}
				});
	               
			})
			//屏蔽指定用户
			$("#saveNd").click(function(){
				var ids ="";
				$('input[name="friendsname"]').each(function(){
					if(!$(this).prop("checked")){
						if(ids==""){
							ids=$(this).val();
						}else{
							ids=ids+","+$(this).val();
						}
					}
	            });
				$.ajax({
					url:"/fiioer/ignoreFriends.do",
					data:{"ids":ids},
					type:"post",
					dataType:"json",
					success:function(data){
						if(data.tip=="success"){
							$("#tipNd").text("保存成功");
							setTimeout(function() {
								$("#tipNd").text("");
							}, 2000);
						}else{
							$("#tipNd").text("系统发生异常");
							setTimeout(function() {
								$("#tipNd").text("");
							}, 2000);
						}
					},
					error:function(){
						$("#tipNd").text("系统发生异常");
						setTimeout(function() {
							$("#tipNd").text("");
						}, 2000);
					}
				});
	               
			})
			//屏蔽指定用户提醒
			$("#saveRd").click(function(){
				var ids ="";
				$('input[name="msgsname"]').each(function(){
					if($(this).prop("checked")){
						if(ids==""){
							ids=$(this).val();
						}else{
							ids=ids+","+$(this).val();
						}
					}
	            });
				$.ajax({
					url:"/fiioer/ignoreMsgs.do",
					data:{"ids":ids,"id":"${fu.fa_id}"},
					type:"post",
					dataType:"json",
					success:function(data){
						if(data.tip=="success"){
							$("#tipRd").text("保存成功");
							setTimeout(function() {
								$("#tipRd").text("");
							}, 2000);
						}else{
							$("#tipRd").text("系统发生异常");
							setTimeout(function() {
								$("#tipRd").text("");
							}, 2000);
						}
					},
					error:function(){
						$("#tipNd").text("系统发生异常");
						setTimeout(function() {
							$("#tipNd").text("");
						}, 2000);
					}
				});
	               
			})
			
		})
	</script>
	
</body>

</html>
