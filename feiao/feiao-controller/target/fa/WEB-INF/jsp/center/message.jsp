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
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_home_follow.css-wxr.css" />
<script src="/js/jquery.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/css/header.css" />
</head>
<body>

	<c:import url="${path}/feiiohead.jsp"></c:import>
	<div id="wp" class="wp">
		<div id="ct" class="ct2_a wp cl">
			<c:import url="${path}/feiiombright.jsp"></c:import>

			<div class="mn cont_wp float_l">
				<div class="bm space breadnav_msg">
					<a href="/fiioer/myGetMsg.do">个人消息</a><span> > </span> <span>发送消息</span>
				</div>
				

				<div class="mn">
					<div class="bm bw0">
						<h1 class="mt">
							<img class="vm" src="static/image/feed/pm.gif"> 发送消息> 
						</h1>

						<div id="__pmform_0">
							<form id="userForm">
											<div class="c form_postmsg">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font id="tipz" color="red" size="2"></font>
												<table cellspacing="0" cellpadding="0"
													class="tfm pmform mtm">
													<tr>
														<th><label for="username">收件人</label></th>
														<td>
															<div class="cl">
																<div class="un_selector"
																	onclick="$('#username').focus();">
																	
																	
																	
																	
																	<span id="usernameWp"> <input type="text" 
																		id="username"></span>
																		
																		
																	<!-- 搜索框 -->	
																	<div id="username_menu" style="position: absolute; z-index: 701;display: none" initialized="true">
																		<ul id="friends" class="pmfrndl" style="">
																			
																		</ul>
																	</div>
																	
																</div>
															</div>



														</td>
													</tr>

													<tr>
														<th><label for="sendmessage">内容</label></th>
														<td>
															<div class="area textarea_w_640">
																<textarea rows="8" cols="40" id="sendmessage" name="descs"
																	></textarea>
															</div>
														</td>
													</tr>
													<tr>
														<th>&nbsp;</th>
														<td class="btnbar_postmsg">
															<button type="button" id="pmsubmit_btn"
																class="normalbtn bluebtn">
																<strong>发送</strong>
															</button>
														</td>
													</tr>
												</table>
											</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<input  type="hidden" name="users" value="eeeeee"/>
		<c:import url="${path}/feiiombend.jsp"></c:import>
</body>
<script src="/js/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/commom.js"></script>
<script>
	login();
	loginbox();
</script>
<script>
$(function(){
	
	/* 弹出框内容改变事件 */
	$('#username').bind('input propertychange', function(){
		$.ajax({
			url:"/fiioer/searchMemberByVague.do",
			data:{"username":$(this).val()},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data!=null && data.length>0){
					$("#username_menu").show();
					var vas = "";
					for(i in data){
						var vat = '<li><a href="javascript:;"   class="a qwer" id="'+data[i].id+'s"><strong>'+data[i].name+'</strong></a></li>';
						vas=vas+vat;
					}
					$("#friends").html(vas);
					
					$(".qwer").click(function(){
						var id = $(this).prop("id");
						id = id.substring(0,id.length-1);
						var name = $(this).text();
						$("#username_menu").hide();
						$("#username").val("")
						var bl = false;
						var countz = 0;
						$("input[name='users']").each(function(){
							countz=countz+1
							if($(this).val()==id){
								bl=true;
								return false;
							}
						})
						if(bl){
							$("#tipz").text("您已经选择该好友，不能重复选中");
							setTimeout(function(){
								$("#tipz").text("");
							},3000)
						}else{
							if(countz>5){
								$("#tipz").text("最对只能同时发给5个好友");
								setTimeout(function(){
									$("#tipz").text("");
								},3000)
							}else{
								$("#usernameWp").before('<span class="unamecard_msg" "><em class="z" >'+name+'</em><a href="javascript:void(0)" class="deletehh"  ><font color="gray">x</font></a><input name="users" value="'+id+'"  type="hidden"></span>')
								//删除
								 $(".deletehh").click(function(){
									$(this).parent().remove();
								}) 
							}
							
						}
						
						
					})
					
					
				}else{
					$("#username").val("")
					$("#tipz").text("您的好友列表中，没有该昵称的好友");
					setTimeout(function(){
						$("#tipz").text("");
					},3000)
				}
			},
			error:function(){
				$("#tipz").text("系统发生错误");
				setTimeout(function(){
					$("#tipz").text("");
				},2000)
			}
		})
		
		
	}); 
	//发送
	$("#pmsubmit_btn").click(function(){
		$.ajax({
			url:"/fiioer/sendMyMsgToMyFriends.do",
			data:$("#userForm").serialize(),
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.tip=="success"){
					$("#append_parent").show();
					$("#showMsg").text("发送成功");
					setTimeout(function(){
						$("#append_parent").hide();
					},2000)
				}else{
					$("#append_parent").show();
					$("#showMsg").text(data.tip);
					setTimeout(function(){
						$("#append_parent").hide();
					},2000)
				}
			},
			error:function(){
				$("#append_parent").show();
				$("#showMsg").text("系统发生错误");
				setTimeout(function(){
					$("#append_parent").hide();
				},2000)
			}
		})
		
	})
	
})

</script>

</html>