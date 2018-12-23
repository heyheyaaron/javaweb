<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	
</head>
<body>
	<div id="meizu_space">
					<div class="space_box">
						<div class="meizu_name">
							<span class="inner_uname">${fuf.fa_username}</span> <a class="mzvip"
								href="javascript:void(0)">
									<span class="cl"></span>
						</div>
						<div class="avatar_img">
							<a class="avatar"><img
								src="${fuf.fa_title_img}"><span
									class="shadowbox_avatar"> </span></a>
						</div>
						<div class="top20">
							<div class="grid">
								<div class="number">${myNote}</div>
								<div class="explain">帖子</div>
							</div>
							<div class="grid">
								<div class="number">${myFolow}</div>
								<div class="explain">收听</div>
							</div>
							<div class="grid">
								<div class="number">${myFans}</div>
								<div class="explain">听众</div>
							</div>
							<div class="cr"></div>
						</div>
					</div>
					<div class="space_box cut_line" style="padding-top: 10px;">
						<div>
							<c:if test="${igz>0}">
								<a id="followmods" class="social_listen normalbtn bluebtn" href="javascript:void(0)">取消收听</a>
							</c:if>
							<c:if test="${igz<=0}">
							<a id="followmod" class="social_listen normalbtn bluebtn" href="javascript:void(0)">收听</a>
							</c:if>
							
						</div>
						<div>
							<div style="float: left;">
								<a href="/fiioer/answerForFriend.do?id=${fuf.fa_id}" 
									class="social_contact normalbtn graybtn w80">发消息</a>
							</div>

							<div style="float: left; margin-left: 15px;"
								class="a_friend_li_2">
								<c:if test="${ifri>0}">
									<a href="javascript:void(0)" 
									class="xi2 social_contact normalbtn graybtn w80">互为好友</a>
								</c:if>
								<c:if test="${ifri<=0}">
									<a href="javascript:void(0)" id="getFriends"
										class="xi2 social_contact normalbtn graybtn w80">加为好友</a>
								</c:if>
								
							</div>
							<div class="cr"></div>
						</div>
					</div>
					<div class="space_box cut_line">
						
						<c:if test="${pro!=null && !empty pro}">
							<div>
								<span style="color: #999999"> <a href=""><font
										color="#999999">我的飞傲产品</font></a>
								</span>
							</div>
							<div class="mzpro_pic" style="margin-top: 15px;">
								<c:forEach items="${pro}" var="pr">
									<div class="png_dg">
										<img src="${pr['image']}" class="png_bg"><h2
												style="padding: 0px; float: none;">${pr['types']}</h2>
									</div>			
								</c:forEach>

							</div>
						</c:if>
						
						
					</div>
				</div>
</body>
<script type="text/javascript">
	$(function(){
		$("#followmod").click(function(){
			//关注
			
			$.ajax({
				url:"/fiioer/addMyFollow.do",
				data:{"id":"${fuf.fa_id}"},
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.tip=="success"){
						$("#append_parent").show();
						$("#closeTip").hide();
						$("#showMsg").text("收听成功");
						
						
						setTimeout(function(){
							$("#closeTip").show();
							$("#append_parent").hide();
							window.location.reload();
						},1000)
					}else{
						$("#append_parent").show();
						$("#closeTip").hide();
						$("#showMsg").text(data.tip);
						setTimeout(function(){
							$("#closeTip").show();
							$("#append_parent").hide();
						},1000)
					}
				},
				error:function(){
					$("#append_parent").show();
					$("#showMsg").text("系统发生异常，请重新操作");
					setTimeout(function(){
						$("#append_parent").hide();
					},2000)
				}
			})
			
		})
		//加好友
		$("#getFriends").click(function(){
			$.ajax({
				url:"/fiioer/addMyFriend.do",
				data:{"id":"${fuf.fa_id}"},
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.tip=="success"){
						$("#append_parent").show();
						$("#closeTip").hide();
						$("#showMsg").text("已发送申请好友请求！请耐心等候对方信息");
						setTimeout(function(){
							$("#closeTip").show();
							$("#append_parent").hide();
						},1000)
					}else{
						$("#append_parent").show();
						$("#showMsg").text(data.tip);
						setTimeout(function(){
							$("#closeTip").show();
							$("#append_parent").hide();
						},1000)
					}
				},
				error:function(){
					$("#append_parent").show();
					$("#closeTip").hide();
					$("#showMsg").text("系统发生异常，请重新操作");
					setTimeout(function(){
						$("#append_parent").hide();
					},2000)
				}
			})
		})
		//取关
		$("#followmods").click(function(){
			$.ajax({
				url:"/fiioer/deleteMyFollow.do",
				data:{"id":"${fuf.fa_id}"},
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.tip=="success"){
						
						$("#append_parent").show();
						$("#closeTip").hide();
						$("#showMsg").text("取消收听成功");
						setTimeout(function(){
							$("#closeTip").show();
							$("#append_parent").hide();
							window.location.reload();
							
						},1000)
					}else{
						$("#append_parent").show();
						$("#closeTip").hide();
						$("#showMsg").text(data.tip);
						setTimeout(function(){
							$("#closeTip").show();
							$("#append_parent").hide();
						},1000)
					}
				},
				error:function(){
					$("#append_parent").show();
					$("#showMsg").text("系统发生异常，请重新操作");
					setTimeout(function(){
						$("#append_parent").hide();
					},2000)
				}
			})
			
		})
		
	})
</script>
</html>