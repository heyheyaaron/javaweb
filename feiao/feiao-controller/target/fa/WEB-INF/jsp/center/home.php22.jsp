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
<!-- 日期插件 -->
<link rel="stylesheet" type="text/css" href="${path}/laydate/need/laydate.css" />

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
						<li class="a"><a href="/fiioer/InteData.do">积分记录</a></li>
						<li><a href="/fiioer/InteRole.do">积分规则</a></li>
					</ul>
					<p class="tbmu bw0 head_record">
						<a class="a" href="javascript:void(0)">积分收益</a>

					</p>

					<form id="searchForm">
						<div class="form_record select_w_316" style="margin-top: 0;">
							<table cellspacing="0" cellpadding="0">
								<tr>
									<th>积分/飞镖:</th>
									<td><span class="simselect"><select class="gongkai" name="types" >
												<option value="2" selected="selected">不限</option>
												<option value="0">积分</option>
												<option value="1">飞镖</option>

										</select></span></td>
								</tr>
								<tr class="timecontrol_w">
									<th>时间范围:</th>
									<td>
									
									<input  name="startDay" id="startDay" class="laydate-icon" onclick="laydate({istime: true, format: 'YYYY-MM-DD'})">
									到		
									<input  name="endDay" class="laydate-icon" onclick="laydate({istime: true, format: 'YYYY-MM-DD'})">
									</td>
								</tr>
								<tr>
									<th>收支:</th>
									<td><span class="simselect"><select class="gongkai" name="buyOrSelf">
												<option value="0">不限</option>
												<option value="1">支出</option>
												<option value="2">支入</option>
										</select></span></td>
								</tr>
								
								<tr>
									<td class="btnbar_setlist" colspan="2"><button
											type="button" id="searchBtn" class="normalbtn bluebtn">
											<strong>查询</strong>
										</button>   <font id="tip" color="red"></font></td>
								</tr>
							</table>
							
						</div>
						
							
						<div class="integrallist">
							<table cellspacing="0" cellpadding="0" class="dt" id="cmstable">
								
							</table>
						</div>
						<div class="inline pull-right page" >
									
							         <font id="total" ></font> 条记录 <font id="curpage"></font>/<font id="totalpage"></font> 页  <a href='javascript:void(0)' id="firstp">首页</a>     <a href='javascript:void(0)' id="lastp">上一页</a>     <span class='current' id="curp"></span>     <a href='javascript:void(0)' id="nextfp"></a>     <a href='javascript:void(0)' id="nextsp"></a>     <a href='javascript:void(0)' id="nexttp"></a>     <a href='javascript:void(0)' id="nextp">下一页</a>     <a href='javascript:void(0)' id="endp">最后一页</a>    &nbsp;
						</div>
						<input type="hidden"> <input type="hidden"> <input
								type="hidden">
					</form>

				</div>
			</li>

			<li class="items_setlist"><a class="stitle"
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
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/commom.js"></script>

<script type="text/javascript" src="${path}/js/jquery-timer-1.0.js"></script>
<!--  laydate 日期插件 -->
		<script src="${path}/laydate/laydate.js"></script>
		<script type="text/javascript" src="${path}/js/OwenLch/OwenLchCms.js"></script>
<script type="text/javascript">
	
	$(".buxian").click(function() {

		$(this).parent().find('.selectbox_simu').toggle();
	});
	login();
	loginbox();
</script>
<script type="text/javascript">
	$(function(){
		
		
		var url = "${path}/fiioer/findUserInteById.do";
		cmspageInte($("#searchForm").serialize()+"&id=${fu.fa_id}&curpage=1", url)
		//搜索
		$("#searchBtn").click(function(){
			cmspageInte($("#searchForm").serialize()+"&id=${fu.fa_id}&curpage=1", url)
		})
		//点击首页
		$("#firstp").click(function() {
			cmspageInte($("#searchForm").serialize()+"&id=${fu.fa_id}&curpage=1", url)
		})
		//点击上一页
		$("#lastp").click(function() {
			var cpage = Number($("#curpage").text()) - 1;
			cmspageInte($("#searchForm").serialize()+"&id=${fu.fa_id}&curpage="+cpage, url)
			
		})
		//点击当前页+1
		$("#nextfp").click(function() {
			var cpage = Number($("#curpage").text()) + 1;
			cmspageInte($("#searchForm").serialize()+"&id=${fu.fa_id}&curpage="+cpage, url)
		})
		//点击当前页+2
		$("#nextsp").click(function() {
			var cpage = Number($("#curpage").text()) + 2;
			cmspageInte($("#searchForm").serialize()+"&id=${fu.fa_id}&curpage="+cpage, url)
		})
		//点击当前页+3
		$("#nexttp").click(function() {
			var cpage = Number($("#curpage").text()) + 3;
			cmspageInte($("#searchForm").serialize()+"&id=${fu.fa_id}&curpage="+cpage, url)
		})
		//点击下一页
		$("#nextp").click(function() {
			var cpage = Number($("#curpage").text()) + 1;
			cmspageInte($("#searchForm").serialize()+"&id=${fu.fa_id}&curpage="+cpage, url)
		})
		//点击最后一页
		$("#endp").click(function() {
			var cpage = Number($("#totalpage").text());
			cmspageInte($("#searchForm").serialize()+"&id=${fu.fa_id}&curpage="+cpage, url)
		})
	})
function cmspageInte(cmsdata,url){
	
	
	$.ajax({
		url : url, // 请求URL
		data:cmsdata,
		type : "post", // 请求方式
		dataType : "json", // 服务器响应回来的数据类型json: {}、[]、[{},{}]
		async : true,
		success : function(data){
			if (data.tip == 1) {
				var vars = '<tr><th width="96">用户操作</th><th width="96">变化种类</th><th width="96">变化数值</th><th width="96">变化后数值</th><th width="140">变更时间</th><th width="180">详情</th></tr>';
				for (var i = 0; i < data.rows.length; i++) {
					var types = "积分";
					if (data.rows[i].typess == 1) {
						types = "飞镖";
					}
					var vart = '<tr><td>' + data.rows[i].makes
							+ '</td><td>' + types + '</td><td>'
							+ data.rows[i].changes + '</td><td>'
							+ data.rows[i].sums + '</td><td>'
							+ data.rows[i].timess + '</td><td>'
							+ data.rows[i].detail + '</td></tr>';
					vars = vars + vart;
				}
				$("#cmstable").html(vars);
				pageful(data);
			}else if(data.tip ==2){
				$("#tip").text(data.msg);
				setTimeout(function() {
					$("#tip").text("");
				}, 2000);
			}else{
				$("#tip").text("系统发生异常，请稍后再操作");
				setTimeout(function() {
					$("#tip").text("");
				}, 2000);
			}
			
			
			
		},
		error : function(){
			$("#tip").text("系统发生异常，请稍后再操作");
			setTimeout(function() {
				$("#tip").text("");
			}, 2000);
		}
	});
	
}
</script>
</html>
