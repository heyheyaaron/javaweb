<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>飞傲</title>
<meta name="keywords" content="" />
<meta name="description" content="飞傲" />
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
						<li class="a"><a href="/fiioer/myLabel.do">标签设置</a></li>
						<li style="width: 120px;"><a href="/fiioer/myModel.do">我的版块权限</a></li>
					</ul>
				<form id="userForm">
					<input type="hidden" name="id" value="${fu.fa_id}" />
					<table cellpadding="0" cellspacing="0" class="tdat ftb mtm mbm" id="qwert" >
						
					
					</table>
				</div>
				</form>
				<br />
				&nbsp;&nbsp;&nbsp;&nbsp;<input  type="button" value="保存标签"  id="bindLabel" class="normalbtn bluebtn" />  <font id="tip" color="red" ></font>
				<br />
			</li>
			<li class="items_setlist "><a class="stitle"
				href="/fiioer/myPrivacy.do"><span>隐私筛选</span><span
					class="collapsed"></span></a><span class="itemicon_setlist"> </span></li>

		</ul>

	</div>

	</div>
	</div>
	<c:import url="${path}/feiiombend.jsp"></c:import>

	<script src="/static_new/pc/js/common/autoLogin-4c304e456a.js"
		type="text/javascript"></script>

</body>
<script type="text/javascript" src="/js/commom.js"></script>
<script type="text/javascript" src="${path}/js/jquery-timer-1.0.js"></script>
<script>
	login();
	loginbox();
	$(function(){
		$("#bindLabel").click(function(){
			 $.ajax({
				url:"/fiioer/bindLabel.do",
				data:$("#userForm").serialize(),
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.tip=="success"){
						$("#tip").text("保存成功！");
						setTimeout(function() {
							$("#tip").text("");
						}, 2000);
					}else{
						$("#tip").text("系统发生异常！");
						setTimeout(function() {
							$("#tip").text("");
						}, 2000);
					}
				},
				error:function(){
					$("#tip").text("系统发生异常！");
					setTimeout(function() {
						$("#tip").text("");
					}, 2000);
				}
			})  
		});
		$.ajax({
			url:"/fiioer/getAllLabel.do",
			type:"post",
			dataType:"json",
			success:function(data){
				var vars = "";
				for (var i=0;i<data.length;i++){
					
					var qxsp = "${labels}";
					var istrues = 0;
					if (qxsp != null && qxsp != "") {
						qxsp = qxsp.substring(1, qxsp.length - 1);
						qxsp = qxsp.split(",");
						for ( var sp in qxsp) {
							if (qxsp[sp] == data[i].fa_id) {
								istrues = 1;
								break;
							}
						}
					}
					if (istrues) {
						if(i%3==0){
							var vat = "<tr><td><input type='checkbox' checked='checked'  name='ids' value='"+data[i].fa_id+"' >"+data[i].fa_name+"</td>"
							vars = vars + vat;
						}else if((i+1)%3==0){
							var vat = "<td><input type='checkbox' checked='checked'  name='ids' value='"+data[i].fa_id+"' >"+data[i].fa_name+"</td></tr>"
							vars = vars + vat;
						}else{
							var vat = "<td><input type='checkbox' checked='checked'  name='ids' value='"+data[i].fa_id+"' >"+data[i].fa_name+"</td>"
							vars = vars + vat;
						}
					}else{
						if(i%3==0){
							var vat = "<tr><td><input type='checkbox'   name='ids' value='"+data[i].fa_id+"' >"+data[i].fa_name+"</td>"
							vars = vars + vat;
						}else if((i+1)%3==0){
							var vat = "<td><input type='checkbox'   name='ids' value='"+data[i].fa_id+"' >"+data[i].fa_name+"</td></tr>"
							vars = vars + vat;
						}else{
							var vat = "<td><input type='checkbox'   name='ids' value='"+data[i].fa_id+"' >"+data[i].fa_name+"</td>"
							vars = vars + vat;
						}
					}
				}
				$("#qwert").html(vars);
			},
			error:function(){
				$("#tip").text("系统发生异常！");
				setTimeout(function() {
					$("#tip").text("");
				}, 2000);
			}
		}) 
	});
</script>
</html>
