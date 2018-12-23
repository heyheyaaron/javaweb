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
		<div id="ct" class="ct2_a wp cl">
			<c:import url="${path}/feiiombright.jsp"></c:import>
			<div class="mn cont_wp float_l">
				<div class="bm bw0">
					<div class="page_frame_navigation">
						<div class="follow_feed_cover" style="left: 236px;"></div>
						<ul class="tb cl page_frame_ul" style="padding-left: 20px;">
							<li class="y"><a href="/fiioer/myState.do"
								class="xi2 msgsetbtn_nav">屏蔽管理</a></li>
							<li><a href="/fiioer/myGetMsg.do">个人消息</a></li>
							<li><a href="/fiioer/mySystemMsg.do">系统消息</a></li>
							<li class="a"><a href="/fiioer/myRemind.do">提醒</a></li>
						</ul>
					</div>
					<div class="xld xlda notice_msg">

						<div class="nts pml" id="sessionMsg">
						</div>
						<div class="bm bw0 pgs cl pagebar" >
						<div class="pg">
							<a class="prev" id="lastpage" ><em class="previcon"></em></a>
							<strong id="curpage">1</strong>
							<a href="javascript:void(0)" id="secondpage" >2</a>
							<a href="javascript:void(0)" id="thirdpage" >3</a>
							<a href="javascript:void(0)" id="forthpage" >4</a>
							<a href="javascript:void(0)"  >...</a>
							<a href="javascript:void(0)" id="fifthpage" >5</a>
							<a href="javascript:void(0)" id="nextpage" class="nxt"><em class="nxticon"></em></a>
							<input type="hidden" id="totalsize" />
						</div>
					</div>
					</div>
				</div>
			</div>
			
		</div>
		<div class="wp mtn">
			<!--[diy=diy3]-->
			<div id="diy3" class="area"></div>
			<!--[/diy]-->
		</div>
		<c:import url="${path}/feiiombend.jsp"></c:import>
</body>
<script type="text/javascript" src="/js/commom.js"></script>
<script type="text/javascript">
	login();
	loginbox();
</script>
<script type="text/javascript">
$(function(){
	var url="/fiioer/selectRemindBypage.do"
	pageData({"curpage":1},url)
	//上一页
	$("#lastpage").click(function(){
		var cp =Number(($("#curpage").text()))-1
		pageData({"curpage":cp},url)
	})
	//第二页
	$("#secondpage").click(function(){
		var cp =Number(($("#curpage").text()))+1
		pageData({"curpage":cp},url)
	})
	//第三页
	$("#thirdpage").click(function(){
		var cp =Number(($("#curpage").text()))+2
		pageData({"curpage":cp},url)
	})
	//第四页
	$("#forthpage").click(function(){
		var cp =Number(($("#curpage").text()))+3
		pageData({"curpage":cp},url)
	})
	//第末页
	$("#fifthpage").click(function(){
		var cp =Number(($("#fifthpage").text()))
		pageData({"curpage":cp},url)
	})
	//下一页
	$("#nextpage").click(function(){
		var cp =Number(($("#curpage").text()))+1
		pageData({"curpage":cp},url)
	})
})

function pageData(data,url){
	$.ajax({
		url:url,
		data:data,
		type:"post",
		dataType:"json",
		success:function(data){
			var vas = "";
			
			if(data.rows!=null && data.rows.length>0){
				for(i in data.rows){
					/* 好友申请 */
					if(data.rows[i].fmt==1){
						var vat='<dl class="cl" ><table cellspacing="0" cellpadding="0"><colgroup><col width="34px"><col width="744px"></colgroup><tbody><tr><th><div class="avt mbn"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].fid+'" class="avatar"><img src="'+data.rows[i].image+'" style="cursor: pointer;"><span class="shadowbox_avatar"> </span></a></div></th><td><div class="ntc_body readntc_body"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].fid+'">用户    '+data.rows[i].name+'</a> 想加你为好友 &nbsp;&nbsp;&nbsp;    ';
						if(data.rows[i].istrue==0){
							vat = vat +'<a href="javascript:void(0)" class="tongyi" id="'+data.rows[i].fid+'t"><font color="red">同意</font></a>&nbsp;&nbsp;&nbsp; <a href="javascript:void(0)" class="jujue" id="'+data.rows[i].fid+'j"><font color="red">拒绝</font></a>';
						}else if(data.rows[i].istrue==1){
							vat = vat +'<a href="javascript:void(0)"><font color="red">已同意</font></a>';
						}else{
							vat = vat +'<a href="javascript:void(0)"><font color="red">已拒绝</font></a>';
						}
						vat = vat +'</div><div class="time_msgnotice"><span class="xg1 xw0"><span>'+data.rows[i].day+'</span></span> <a class="shield_msgnotice ignores" href="javascript:void(0)" id="'+data.rows[i].fid+'">屏蔽</a><a class="shield_msgnotice deletes" href="javascript:void(0)" id="'+data.rows[i].id+'">删除</a></div><div class="cr"></div></td></tr></tbody></table></dl>';
						vas = vas+vat
					/*成为好友  */
					}else if(data.rows[i].fmt==2){
						var vat='<dl class="cl" ><table cellspacing="0" cellpadding="0"><colgroup><col width="34px"><col width="744px"></colgroup><tbody><tr><th><div class="avt mbn"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].fid+'" class="avatar"><img src="'+data.rows[i].image+'" style="cursor: pointer;"><span class="shadowbox_avatar"> </span></a></div></th><td><div class="ntc_body readntc_body"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].fid+'">用户   '+data.rows[i].name+'</a> 和您成为了好友</div><div class="time_msgnotice"><span class="xg1 xw0"><span>'+data.rows[i].day+'</span></span> <a class="shield_msgnotice ignores" href="javascript:void(0)" id="'+data.rows[i].fid+'" title="屏蔽后将不再能收到该用户的所有提醒">屏蔽</a><a class="shield_msgnotice deletes" href="javascript:void(0)" id="'+data.rows[i].id+'">删除</a></div><div class="cr"></div></td></tr></tbody></table></dl>';
						vas = vas+vat
					/* 拒绝 */
					}else if(data.rows[i].fmt==8){
						var vat='<dl class="cl" ><table cellspacing="0" cellpadding="0"><colgroup><col width="34px"><col width="744px"></colgroup><tbody><tr><th><div class="avt mbn"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].fid+'" class="avatar"><img src="'+data.rows[i].image+'" style="cursor: pointer;"><span class="shadowbox_avatar"> </span></a></div></th><td><div class="ntc_body readntc_body"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].fid+'">用户   '+data.rows[i].name+'</a> 拒绝了你的好友请求</div><div class="time_msgnotice"><span class="xg1 xw0"><span>'+data.rows[i].day+'</span></span> <a class="shield_msgnotice ignores" href="javascript:void(0)" id="'+data.rows[i].fid+'" title="屏蔽后将不再能收到该用户的所有提醒">屏蔽</a><a class="shield_msgnotice deletes" href="javascript:void(0)" id="'+data.rows[i].id+'">删除</a></div><div class="cr"></div></td></tr></tbody></table></dl>';
						vas = vas+vat
					/* 收听 */
					}else if(data.rows[i].fmt==3){
						var vat='<dl class="cl" ><table cellspacing="0" cellpadding="0"><colgroup><col width="34px"><col width="744px"></colgroup><tbody><tr><th><div class="avt mbn"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].fid+'" class="avatar"><img src="'+data.rows[i].image+'" style="cursor: pointer;"><span class="shadowbox_avatar"> </span></a></div></th><td><div class="ntc_body readntc_body"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].fid+'">用户   '+data.rows[i].name+'</a> 收听了你</div><div class="time_msgnotice"><span class="xg1 xw0"><span>'+data.rows[i].day+'</span></span> <a class="shield_msgnotice ignores" href="javascript:void(0)" id="'+data.rows[i].fid+'" title="屏蔽后将不再能收到该用户的所有提醒">屏蔽</a><a class="shield_msgnotice deletes" href="javascript:void(0)" id="'+data.rows[i].id+'">删除</a></div><div class="cr"></div></td></tr></tbody></table></dl>';
						vas = vas+vat
						/* 回帖 */
					}else if(data.rows[i].fmt==4){
						var vat='<dl class="cl" ><table cellspacing="0" cellpadding="0"><colgroup><col width="34px"><col width="744px"></colgroup><tbody><tr><th><div class="avt mbn"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].fid+'" class="avatar"><img src="'+data.rows[i].image+'"><span class="shadowbox_avatar"> </span></a></div></th><td><div class="ntc_body readntc_body"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].fid+'">用户   '+data.rows[i].name+'</a> 评论了您的帖子 <a href="/note/showNoteContent.do?id='+data.rows[i].pid+'+&floor='+data.rows[i].ceng+'" class="lit">查看</a></div><div class="time_msgnotice"><span class="xg1 xw0"><span>'+data.rows[i].day+'</span></span> <a class="shield_msgnotice ignores" href="javascript:void(0)" id="'+data.rows[i].fid+'" title="屏蔽后将不再能收到该用户的所有提醒">屏蔽</a><a class="shield_msgnotice deletes" href="javascript:void(0)" id="'+data.rows[i].id+'">删除</a></div><div class="cr"></div></td></tr></tbody></table></dl>';
						vas = vas+vat
						/* 回复帖子评论 */
					}else if(data.rows[i].fmt==5){
						var vat='<dl class="cl" ><table cellspacing="0" cellpadding="0"><colgroup><col width="34px"><col width="744px"></colgroup><tbody><tr><th><div class="avt mbn"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].fid+'" class="avatar"><img src="'+data.rows[i].image+'"><span class="shadowbox_avatar"> </span></a></div></th><td><div class="ntc_body readntc_body"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].fid+'">用户   '+data.rows[i].name+'</a> 在帖子中回复了您<a href="/note/showNoteContent.do?id='+data.rows[i].pid+'+&floor='+data.rows[i].ceng+'" class="lit">查看</a></div><div class="time_msgnotice"><span class="xg1 xw0"><span>'+data.rows[i].day+'</span></span> <a class="shield_msgnotice ignores" href="javascript:void(0)" id="'+data.rows[i].fid+'" title="屏蔽后将不再能收到该用户的所有提醒">屏蔽</a><a class="shield_msgnotice deletes" href="javascript:void(0)" id="'+data.rows[i].id+'">删除</a></div><div class="cr"></div></td></tr></tbody></table></dl>';
						vas = vas+vat
						/* 会心情 */
					}else if(data.rows[i].fmt==6){
						var vat='<dl class="cl" ><table cellspacing="0" cellpadding="0"><colgroup><col width="34px"><col width="744px"></colgroup><tbody><tr><th><div class="avt mbn"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].fid+'" class="avatar"><img src="'+data.rows[i].image+'"><span class="shadowbox_avatar"> </span></a></div></th><td><div class="ntc_body readntc_body"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].fid+'">用户   '+data.rows[i].name+'</a> 评论了您的心情 <a href="/fiioer/myMoodShow.do?id='+data.rows[i].pid+'" class="lit">查看</a></div><div class="time_msgnotice"><span class="xg1 xw0"><span>'+data.rows[i].day+'</span></span> <a class="shield_msgnotice ignores" href="javascript:void(0)" id="'+data.rows[i].fid+'" title="屏蔽后将不再能收到该用户的所有提醒">屏蔽</a><a class="shield_msgnotice deletes" href="javascript:void(0)" id="'+data.rows[i].id+'">删除</a></div><div class="cr"></div></td></tr></tbody></table></dl>';
						vas = vas+vat
						/* 会心情 */
					}else{
						var vat='<dl class="cl" ><table cellspacing="0" cellpadding="0"><colgroup><col width="34px"><col width="744px"></colgroup><tbody><tr><th><div class="avt mbn"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].fid+'" class="avatar"><img src="'+data.rows[i].image+'"><span class="shadowbox_avatar"> </span></a></div></th><td><div class="ntc_body readntc_body"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].fid+'">用户   '+data.rows[i].name+'</a> 回复了您的评论 <a href="/fiioer/myMoodShow.do?id='+data.rows[i].pid+'" class="lit">查看</a></div><div class="time_msgnotice"><span class="xg1 xw0"><span>'+data.rows[i].day+'</span></span> <a class="shield_msgnotice ignores" href="javascript:void(0)" id="'+data.rows[i].fid+'" title="屏蔽后将不再能收到该用户的所有提醒">屏蔽</a><a class="shield_msgnotice deletes" href="javascript:void(0)" id="'+data.rows[i].id+'">删除</a></div><div class="cr"></div></td></tr></tbody></table></dl>';
						vas = vas+vat
					}
				}
				
				$("#sessionMsg").html(vas)	
				
				//删除
				$(".deletes").click(function(){
					var id = $(this).prop("id");
					$.ajax({
						url:"/fiioer/deleteSystemRemind.do",
						data:"id="+id,
						type:"post",
						dataType:"json",
						success:function(data){
							if(data.tip=="success"){
								
								var cp = Number(($("#curpage").text()));
								var ts = Number(($("#totalsize").val()));
								
								if(ts%20==1){
									cp=cp-1
								}
								if(cp<1){
									cp=1
								}
								pageData({"curpage":cp},url)
								
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
				//忽略
				$(".ignores").click(function(){
					var id = $(this).prop("id");
					$.ajax({
						url:"/fiioer/ignoreSystemRemind.do",
						data:"id="+id,
						type:"post",
						dataType:"json",
						success:function(data){
							if(data.tip=="success"){
								$("#append_parent").show();
								$("#showMsg").text("忽略成功，您将不会收到该用户的所有提醒");
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
				
				//同意好友
				$(".tongyi").click(function(){
					var id = $(this).prop("id");
					id=id.substring(0,id.length-1);
					$.ajax({
						url:"/fiioer/agreeBecomeTheFriend.do",
						data:"id="+id,
						type:"post",
						dataType:"json",
						success:function(data){
							if(data.tip=="success"){
								
								var cp = Number(($("#curpage").text()));
								var ts = Number(($("#totalsize").val()));
								
								pageData({"curpage":cp},url)
								
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
				//拒绝好友
				$(".jujue").click(function(){
					var id = $(this).prop("id");
					id=id.substring(0,id.length-1);
					$.ajax({
						url:"/fiioer/stopBecomeTheFriend.do",
						data:"id="+id,
						type:"post",
						dataType:"json",
						success:function(data){
							if(data.tip=="success"){
								
								var cp = Number(($("#curpage").text()));
								var ts = Number(($("#totalsize").val()));
								
								pageData({"curpage":cp},url)
								
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
				
				
			}else{
				$("#sessionMsg").html("<br>您还没有任何消息提醒<br>")
			}
			
			//加到分页页面curpage
			$("#curpage").text(data.curpage);
			$("#totalsize").val(data.totalsize);
			$("#secondpage").text(Number(data.curpage)+1);
			$("#thirdpage").text(Number(data.curpage)+2);
			$("#forthpage").text(Number(data.curpage)+3);
			$("#fifthpage").text(Number(data.totalpage));
			if(data.curpage==1){
				$("#lastpage").hide();
			}else{
				$("#lastpage").show();
			}
			if(data.curpage>=data.totalpage){
				$("#nextpage").hide();
				$("#secondpage").hide();
			}else{
				$("#nextpage").show();
				$("#secondpage").show();
			}
			if(Number(data.curpage)+2>data.totalpage){
				$("#thirdpage").hide();
			}else{
				$("#thirdpage").show();
			}
			if(Number(data.curpage)+3>data.totalpage){
				$("#forthpage").hide();
			}else{
				$("#forthpage").show();
			}
			if(Number(data.curpage)+3>=Number(data.totalpage)){
				$("#fifthpage").hide();
			}else{
				$("#fifthpage").show();
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
}
</script>

</html>
