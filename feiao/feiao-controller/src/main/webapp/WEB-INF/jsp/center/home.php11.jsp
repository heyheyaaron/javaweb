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
				<div class="bm bw0 page_frame_navigation">
					<div class="follow_feed_cover" style="left: 128px;"></div>
					<ul class="tb cl page_frame_ul" style="padding-left: 20px;">
						<li><a href="/fiioer/myFollow.do">收听</a></li>
						<li class="a"><a href="/fiioer/myListener.do">听众</a></li>
						<li><a href="/fiioer/myFriend.do">好友</a></li>
						<li><a href="/fiioer/searchMember.do">搜索</a></li>
					</ul>
				</div>
				<div class="bm_c">
					<ul class="flw_ulist relat_ulist" id="myDatas">
						




					</ul>
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
		<script type="text/javascript">
			// 头像浮动
			adrift = new avatar_drift();
			adrift.init();
		</script>
		<c:import url="${path}/feiiombend.jsp"></c:import>
</body>
<script type="text/javascript" src="/js/commom.js"></script>
<script type="text/javascript">
	login();
	loginbox();
</script>
<script type="text/javascript">
	$(function() {
		var url = "/fiioer/selectMyFansByPage.do";
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
				if(data.rows!=null &&data.rows.length>0 ){
					for(i in data.rows){
						var names = data.rows[i].name;
						if(data.rows[i].name==null){
							names="该用户还没有昵称"
						}
						if(data.rows[i].isEach==1){
							var vat='<li class="cl"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].id+'"  class="flw_avt"><em class="avatar"><img src="'+data.rows[i].image+'" style="cursor: pointer;"> <span class="shadowbox_avatar"></span></em></a> <a id="'+data.rows[i].id+'" href="javascript:void(0)" class="flw_btn_fo deletes">取消收听</a><h6 class="pbn xs2 name_ulist"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].id+'" class="xi2">'+names+'</a>&nbsp;<span class="xg1 xs1 xw0"></span></h6><p class="xg1">'+data.rows[i].mood+'</p><p class="ptm xg1 bar_ulist"><a  href="/fiioer/myFollow.do">收听'+data.rows[i].shouting+'&nbsp;&nbsp;&nbsp;&nbsp;</a><a href="/fiioer/myListener.do">听众'+data.rows[i].tingzhong+' </a>&nbsp;&nbsp;&nbsp;&nbsp;</p></li> ';
							vas = vas +vat
						}else{
							var vat='<li class="cl"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].id+'"  class="flw_avt"><em class="avatar"><img src="'+data.rows[i].image+'" style="cursor: pointer;"> <span class="shadowbox_avatar"></span></em></a> <a id="'+data.rows[i].id+'" href="javascript:void(0)" class="flw_btn_fo adds">收听</a><h6 class="pbn xs2 name_ulist"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].id+'" class="xi2">'+names+'</a>&nbsp;<span class="xg1 xs1 xw0"></span></h6><p class="xg1">'+data.rows[i].mood+'</p><p class="ptm xg1 bar_ulist"><a href="/fiioer/myFollow.do">收听'+data.rows[i].shouting+'&nbsp;&nbsp;&nbsp;&nbsp;</a><a href="/fiioer/myListener.do">听众'+data.rows[i].tingzhong+' </a>&nbsp;&nbsp;&nbsp;&nbsp;</p></li> ';
							vas = vas +vat
						}
						
					}
					$("#myDatas").html(vas)
				}else{
					$("#myDatas").html("              <br>您还没有听众哦！")
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
				
				//取关
				$(".deletes").click(function(){
					var id=$(this).prop("id");
					$.ajax({
						url:"/fiioer/deleteMyFollow.do",
						data:{"id":id},
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
									var cp = Number(($("#curpage").text()));
									
									pageData({"curpage":cp},url)
								},1000)
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
							$("#showMsg").text("系统发生异常，请重新操作");
							setTimeout(function(){
								$("#append_parent").hide();
							},2000)
						}
					})
					
				})
				//关注
				$(".adds").click(function(){
					var id=$(this).prop("id");
					$.ajax({
						url:"/fiioer/addMyFollow.do",
						data:{"id":id},
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
									var cp = Number(($("#curpage").text()));
									
									pageData({"curpage":cp},url)
								},1000)
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
							$("#showMsg").text("系统发生异常，请重新操作");
							setTimeout(function(){
								$("#append_parent").hide();
							},2000)
						}
					})
					
				})
				
				
				
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
