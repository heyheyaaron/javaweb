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
<link rel="stylesheet" type="text/css" href="/css/OwenLch.css" />
<style >
.sresult_ulist .buddy li {
    width: 307px;
	height: 94px;
	padding: 22px 20px 15px;
	margin-right: 27px;
	margin-top: 17px;
}
</style>
</head>
<body>
	<c:import url="${path}/feiiohead.jsp"></c:import>

	<div id="wp" class="wp">
		<div id="ct" class="ct2_a wp cl">
			<c:import url="${path}/feiiombright.jsp"></c:import>
			<div class="mn cont_wp float_l">
				<div class="bm bw0 page_frame_navigation">
					<div class="follow_feed_cover" style="left: 342px;"></div>
					<ul class="tb cl page_frame_ul" style="padding-left: 20px;">
						<li><a href="/fiioer/myFollow.do">收听</a></li>
						<li><a href="/fiioer/myListener.do">听众</a></li>
						<li><a href="/fiioer/myFriend.do">好友</a></li>
						<li class="a"><a href="/fiioer/searchMember.do">搜索</a></li>
					</ul>
				</div>
				<div id="resultdiv" style="display: none">
					<div class="tips_sresult" >
						<h3 id="searchcontent">
							
							
						</h3>
					</div>
					<div class="sresult_ulist">
						<ul class="buddy cl relat_ulist" id="searchdataz">
						</ul>
					</div>
					<div class="bm_c">
						<ul class="flw_ulist relat_ulist" id="myDatas">
						</ul>
						<div class="bm bw0 pgs cl pagebar" >
							<div class="pg">
								<input type="hidden" id="zxcv" value="1" />
								<a href="javascript:void(0)" id="firstpage" class="OwenPageColor">1</a>
								<a href="javascript:void(0)" id="secondpage" >2</a>
								<a href="javascript:void(0)" id="thirdpage" >3</a>
								<a href="javascript:void(0)" id="forthpage" >4</a>
								<a href="javascript:void(0)" id="fifthpage" >5</a>
								<input type="hidden" id="totalsize" />
							</div>
						</div>
	
	
					</div>
				</div>
				
				<div class="ptm scf" id="searchdiv">
					<div class="relat_search ">
						<form id="userForm"> 
							<table cellpadding="0" cellspacing="0" class="tfm">
								<col width="116px;" />
								<col width="662px;" />
								<tr class="uname_relats">
									<th>用户名</th>
									<td><input type="text" name="username" class="px sbox2_relats" />
									 <label 
										 style="float: left; margin: 0px;">
											 <input type="checkbox"
											name="syncbbs" value="1"
											> <span>精确搜索</span>
									</label></td>
								</tr>
								<tr class="uid_relats">
									<th>手机号</th>
									<td><input type="text" name="tel" value=""
										class="px sbox2_relats" /></td>
								</tr>
								<tr class="uid_relats">
									<th>邮箱</th>
									<td><input type="text" name="email" value=""
										class="px sbox2_relats" /></td>
								</tr>
								<tr class="borderline_relats">
									<th></th>
									<td></td>
								</tr>
								<tr class="sex_relats">
									<th>性别</th>
									<td>
										<div>
											<span class="simselect"> <select class="gongkai" name="sex" >
													<option selected="selected" value="2">保密</option>
													<option value="0">男</option>
													<option value="1">女</option>

											</select></span>
										</div>
									</td>
								</tr>
								
											  
								<tr class="reside_relats select_w_102">
									<th>居住地</th>
									<td id="residecitybox" class="profile_setlist"><span
										class="simselect"><select class="gongkai" name="lifeplace"
											style="width: 100px;">
												<option selected="selected" value="-1">不设置</option>
												<option value="0">北京市</option>
												<option value="1">浙江省</option>
												<option value="2">天津市</option>
												<option value="3">安徽省</option>
												<option value="4">上海市</option>
												<option value="5">福建省</option>
												<option value="6">重庆市</option>
												<option value="7">江西省</option>
												<option value="8">山东省</option>
												<option value="9">河南省</option>
												<option value="10">湖北省</option>
												<option value="11">湖南省</option>
												<option value="12">广东省</option>
												<option value="13">海南省</option>
												<option value="14">山西省</option>
												<option value="15">青海省</option>
												<option value="16">江苏省</option>
												<option value="17">辽宁省</option>
												<option value="18">吉林省</option>
												<option value="19">台湾省</option>
												<option value="20">河北省</option>
												<option value="21">贵州省</option>
												<option value="22">四川省</option>
												<option value="23">云南省</option>
												<option value="24">陕西省</option>
												<option value="25">甘肃省</option>
												<option value="26">黑龙江省</option>
												<option value="27">香港特别行政区</option>
												<option value="28">澳门特别行政区</option>
												<option value="29">广西壮族自治区</option>
												<option value="30">宁夏回族自治区</option>
												<option value="31">新疆维吾尔自治区</option>
												<option value="32">内蒙古自治区</option>
												<option value="33">西藏自治区</option>
										</select></span></td>
								</tr>
								<tr class="borderline_relats">
									<th></th>
									<td></td>
								</tr>
								<tr class="btnbar_relats">
									<td colspan="2"><input type="hidden"> <a
											class="normalbtn bluebtn">
												<button type="button" class="pn normalbtn" id="searchBtn">
													<em>查找</em>
												</button>
										</a></td>
								</tr>
							</table>
							<input type="hidden"> <input type="hidden"> <input
									type="hidden"> <input type="hidden">
						</form>
					</div>
				</div>
			</div>
		</div>
		<c:import url="${path}/feiiombend.jsp"></c:import>
</body>
<script>
	$(".login-box").mouseover(function() {
		$(".not-login-block-sub").show();
	});

	$(".login-box").mouseleave(function() {
		$(".not-login-block-sub").hide();
	});
</script>
<script>
	$(function(){
		url="/fiioer/searchMember.do";
		
		//搜索
		$("#searchBtn").click(function(){
			searchMember($("#userForm").serialize()+"&curpage=1",url);
		})
		//第1页
		$("#firstpage").click(function(){
			$("#zxcv").val("1")
			$("#firstpage").addClass("OwenPageColor");
			$("#secondpage").removeClass("OwenPageColor");
			$("#thirdpage").removeClass("OwenPageColor");
			$("#forthpage").removeClass("OwenPageColor");
			$("#fifthpage").removeClass("OwenPageColor");
			searchMember($("#userForm").serialize()+"&curpage=1",url);
		})
		//第二页
		$("#secondpage").click(function(){
			$("#zxcv").val("2")
			$("#firstpage").removeClass("OwenPageColor");
			$("#secondpage").addClass("OwenPageColor");
			$("#thirdpage").removeClass("OwenPageColor");
			$("#forthpage").removeClass("OwenPageColor");
			$("#fifthpage").removeClass("OwenPageColor");
			searchMember($("#userForm").serialize()+"&curpage=2",url);
		})
		//第三页
		$("#thirdpage").click(function(){
			$("#zxcv").val("3")
			$("#firstpage").removeClass("OwenPageColor");
			$("#secondpage").removeClass("OwenPageColor");
			$("#thirdpage").addClass("OwenPageColor");
			$("#forthpage").removeClass("OwenPageColor");
			$("#fifthpage").removeClass("OwenPageColor");
			searchMember($("#userForm").serialize()+"&curpage=3",url);
		})
		//第四页
		$("#forthpage").click(function(){
			$("#zxcv").val("4")
			$("#firstpage").removeClass("OwenPageColor");
			$("#secondpage").removeClass("OwenPageColor");
			$("#thirdpage").removeClass("OwenPageColor");
			$("#forthpage").addClass("OwenPageColor");
			$("#fifthpage").removeClass("OwenPageColor");
			searchMember($("#userForm").serialize()+"&curpage=4",url);
		})
		//第末页
		$("#fifthpage").click(function(){
			$("#zxcv").val("5")
			$("#firstpage").removeClass("OwenPageColor");
			$("#secondpage").removeClass("OwenPageColor");
			$("#thirdpage").removeClass("OwenPageColor");
			$("#forthpage").removeClass("OwenPageColor");
			$("#fifthpage").addClass("OwenPageColor");
			searchMember($("#userForm").serialize()+"&curpage=5",url);
		})
		
	})
	function searchMember(data,url){
		$.ajax({
			url:url,
			data:data,
			type:"post",
			dataType:"json",
			success:function(data){
				$("#searchdiv").hide();
				$("#resultdiv").show();
				
				if(data.rows!=null && data.rows!=''){
					var hascon ='以下是查找到的用户列表(最多显示 100 个)，您还可以 <a href="javascript:void" class="returnSearchs">换个搜索条件试试</a>';
					$("#searchcontent").html(hascon);
					var vas ="";
					for(i in data.rows){
						var names = data.rows[i].name;
						if(names==null){
							names="该会员还没有昵称";
						}
						var vat ='<li class="bbda cl"><div class="flw_avt"><a class="avatar" href="/fiioer/showMemberMsg.do?id='+data.rows[i].id+'" target="_blank"><img src="'+data.rows[i].image+'"><span class="shadowbox_avatar"> </span></a></div><div class="cont_ulist"><h4 class="uname_sresult"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].id+'" title="'+names+'" target="_blank" style="color:#999999;">'+names+'</a></h4><p class="maxh"><font color="#999999">'+data.rows[i].ranks+'</font></p><div class="xg1"><a href="/fiioer/answerForFriend.do?id='+data.rows[i].id+'"   class="showmenu">发送消息&nbsp;&nbsp;&nbsp;<span class="arrow_gray"></span></a>';
						
						if(data.rows[i].getFriend<1){
							vat=vat+'<a href="javascript:void(0)" id="'+data.rows[i].id+'" class="getFriends" >&nbsp;&nbsp;&nbsp;加为好友</a>'
						}
						
						if(data.rows[i].isListen<1){
							vat=vat+'<a href="javascript:void(0)" id="'+data.rows[i].id+'st" class="adds" >&nbsp;&nbsp;&nbsp;收听</a>'
						}else{
							vat=vat+'<a href="javascript:void(0)" id="'+data.rows[i].id+'qx" class="deletes" >&nbsp;&nbsp;&nbsp;取消收听</a>'
						}
						vat=vat+'</div></div><div class="cr"></div></li>'
						vas = vas+vat;
					}
					$("#searchdataz").html(vas)
					//页码
					if(Number($("#secondpage").text())>data.totalpage){
						$("#secondpage").hide();
					}else{
						$("#secondpage").show();
					}
					if(Number($("#thirdpage").text())>data.totalpage){
						$("#thirdpage").hide();
					}else{
						$("#thirdpage").show();
					}
					if(Number($("#thirdpage").text())>data.totalpage){
						$("#forthpage").hide();
					}else{
						$("#forthpage").show();
					}
					if(Number($("#thirdpage").text())>data.totalpage){
						$("#fifthpage").hide();
					}else{
						$("#fifthpage").show();
					}
				}else{
					var nohascon='没有找到相关用户<a href="javascript:void" class="returnSearchs">换个搜索条件试试</a>'
					$("#searchcontent").html(nohascon);
					$("#searchdataz").empty(); 
					$("#firstpage").hide();
					$("#secondpage").hide();
					$("#thirdpage").hide();
					$("#forthpage").hide();
					$("#fifthpage").hide();
					
				}
				
				//加好友
				$(".getFriends").click(function(){
					var id=$(this).prop("id");
					$.ajax({
						url:"/fiioer/addMyFriend.do",
						data:{"id":id},
						type:"post",
						dataType:"json",
						success:function(data){
							if(data.tip=="success"){
								$("#append_parent").show();
								$("#showMsg").text("已发送申请好友请求！请耐心等候对方信息");
								setTimeout(function(){
									$("#append_parent").hide();
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
				//收听
				$(".adds").click(function(){
					var id=$(this).prop("id");
					id=id.substring(0,id.length-2)
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
									var cp = Number(($("#zxcv").val()));
									searchMember($("#userForm").serialize()+"&curpage="+cp,url);
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
				//返回搜索界面
				$(".returnSearchs").click(function(){
					$("#searchdiv").show();
					$("#resultdiv").hide();
				})
				//取关
				$(".deletes").click(function(){
					var id=$(this).prop("id");
					id=id.substring(0,id.length-2)
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
									var cp = Number(($("#zxcv").val()));
									searchMember($("#userForm").serialize()+"&curpage="+cp,url);
									
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
