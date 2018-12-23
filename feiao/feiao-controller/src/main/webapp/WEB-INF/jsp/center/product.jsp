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
				<div class="bm bw0 page_frame_navigation">
					<ul class="tb cl page_frame_ul" style="padding-left: 20px;">
						<li><a href="javascript:void(0)" style="font-size: 16px;">我的产品</a></li>
					</ul>
				</div>
				<div class="tips_sresult">
					<div class="product">
						<input type="text" id="proCode" class="product_input"
							placeholder="请输入您购买的飞傲产品防伪码"> <input type="button"
							value="注册" class="product_but" id="sureBtn" >&nbsp;&nbsp;&nbsp;<font id="tip" color="red"></font>
					</div>
					<div class="productlist">
						<h2 id="titletip"></h2>
						<ul id="myProductData">
						</ul>
					</div>
				</div>
			</div>
		</div>
		<c:import url="${path}/feiiombend.jsp"></c:import>

		<script src="/js/jquery.js" type="text/javascript"></script>
		<script type="text/javascript" src="/js/commom.js"></script>
		<script>
			login();
			loginbox();
		</script>
</body>
<script type="text/javascript">
	$(function(){
		//注册
		$("#sureBtn").click(function(){
			if($("#proCode").val()!=null&&$("#proCode").val()!=''){
				$.ajax({
					url:"/fiioer/registerProduct.do",
					data:{"proId":$("#proCode").val()},
					type:"post",
					dataType:"json",
					success:function(data){
						if(data.tip=="success"){
							$("#tip").text("注册成功");
							setTimeout(function() {
								$("#tip").text("");
								window.location.reload();
							}, 2000);
						}else{
							$("#tip").text(data.tip);
							setTimeout(function() {
								$("#tip").text("");
							}, 2000);
						}
					},
					error:function(){
						$("#tip").text("系统异常");
						setTimeout(function() {
							$("#tip").text("");
						}, 2000);
					}
				})
			}else{
				$("#tip").text("请输入产品防伪码");
				setTimeout(function() {
					$("#tip").text("");
				}, 2000);
			}
		})
		$.ajax({
			url:"/fiioer/showAllMyProduct.do",
			type:"post",
			dataType:"json",
			success:function(data){
				/* 
				<li>
					<div class="pic czjz">
						<a href="javascript:void(0)"><img src="+'data[i].image'+"></a>
					</div>
					<h2>
						<a href="javascript:void(0)" style="color: #333;">条形码：+'data[i].ma'+</a>
					</h2>
					<h2>
						<a href="javascript:void(0)">产品代号：+'data[i].id'+</a>
					</h2>
					<h2>
						<a href="javascript:void(0)">产品型号：+'data[i].types'+</a>
					</h2>
				</li>
				
				*/
				if(data!=null && data!=""){
					$("#titletip").text("您注册过飞傲的产品");
					var vas ="";
					for(i in data){
						var vat ='<li><div class="pic czjz"><a href="javascript:void(0)"><img src="'+data[i].image+'"></a></div><h2><a href="javascript:void(0)" style="color: #333;">条形码：'+data[i].ma+'</a></h2><h2><a href="javascript:void(0)">产品代号：'+data[i].id+'</a></h2><h2><a href="javascript:void(0)">产品型号：'+data[i].types+'</a></h2></li>';
						var vas = vas +vat;
					}
					$("#myProductData").html(vas)
				}else{
					$("#titletip").text("");
				}
				
			},
			error:function(){
				
			}
		})
	})
</script>

</html>
