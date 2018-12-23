<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_common.css" />
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_forum_index.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<link rel="stylesheet" type="text/css" href="/bbs/static/shop/index.css" />
<link rel="stylesheet" type="text/css"
	href="/bbs/static/newstyle/main.css" />
<script src="/js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/commom.js"></script>
</head>

<body id="nv_forum" class="pg_index">
	<div id="hd">
		<div id="w_header">

			<c:import url="${path}/feiiohead.jsp"></c:import>
			<!--version: 2016-12-01 15:16:51-->
		</div>
		<div id="wp" class="wp">

			<!-- 内容区域 -->
			<div class="wp">
				<div class="picplayer">
					<ul class="picplayer-wrap clearfix">
						<c:if test="${banners!=null}">
							<c:forEach items="${banners}" var="bn"  >
							<li class="picplayer-item"><a href="${bn['url']}"> <img
								src="${bn['image']}"></a></li>
							</c:forEach>
						</c:if>
						
					</ul>
					<div class="picplayer-control">
						<c:if test="${banners!=null}">
							<c:forEach items="${banners}" var="bn"  >
						<a href="javascript:;" class="control-l"></a> <a
							href="javascript:;" class="control-r"></a>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<div class="mcoin-title clearfix">
					<p class="mcoin-title-l">
						<span class="mcoin-logo"></span> <span>兑换商城</span>
					</p>
					<p class="mcoin-my">
					<c:if test="${fu!=null && !empty fu}">
						我的飞镖：<span>${fu.fa_feibiao}</span>个 
						</a> ｜ <a href="/fiioer/myOrder.do">我的兑换记录></a>
					</c:if>
					<c:if test="${fu==null || empty fu}">
						<a href="/login.do">您还没登录呢！<a/>
					</c:if>
					</p>
				</div>
				<div class="mcoin-content">
					<div class="mcoin-content-title clearfix">
						<ul class="mcoin-type" id="filterType">
						</ul>
						<div class="mcoin-filter" style="cursor: pointer;">
							&nbsp;&nbsp;&nbsp;<span id="priceTxt">按价格筛选</span>&nbsp;&nbsp;&nbsp;
							<ul class="mcoin-filter-price" id="filterPrice"
								style="cursor: pointer;">
								<li price-range="" data-txt="按价格筛选" id="all">全部</li>
								<li price-range="1-2000" data-txt="1-2000" id="low">1-2000</li>
								<li price-range="2001-3000" data-txt="2001-3000" id="lower">2001-3000</li>
								<li price-range="3001-4000" data-txt="3001-4000" id="height">3001-4000</li>
								<li price-range="4001-0" data-txt="4001以上" id="heighter">4001以上</li>
							</ul>
						</div>
					</div>
					<ul class="mcoin-content-wrap clearfix" id="myDatas">
						
					</ul>
					<div class="mcoin-pagination">
						<ul class="clearfix" id="pagination" style="width: 144px;">
							<li class="paginationPre" id="lasts">&lt;</li>
							<li data-page="1" class="active pageItem" id="curpage">1</li>
							<li data-page="2" class="pageItem" id="nextpage">2</li>
							<li class="paginationNext" id="nexts">&gt;</li>
							<input type="hidden" id="totalsize"/>
							<input type="hidden" id="typess" value="0"/>
						</ul>
					</div>
				</div>
				<div class="tborder_foot"></div>
				<c:import url="${path}/feiiombend.jsp"></c:import>
				<div id="scrolltop2" style="left: 1491.5px; display: block;"
					class="scrolltop2"></div>

				<script src="/bbs/static/layer/layer.js" type="text/javascript"></script>

				<script type="text/javascript">
					login();
					loginbox();
					$(window).scroll(function() {
						var _top = $(window).scrollTop();
						if (_top > document.documentElement.clientHeight) {
							$(".scrolltop2").css("opacity", "1");

						} else {
							$(".scrolltop2").css("opacity", "0");
						}
					})
					$(".scrolltop2").bind("click", function() {
						$("html, body").animate({
							"scroll-top" : 0
						}, "slow");
					})

					$(".mcoin-filter").click(function() {
						$("#filterPrice").toggle();
					})

					$(".mcoin-type li").click(function() {
						$(this).addClass('active').siblings().removeClass();
					})
				</script>
</body>
<script>
$(function(){
	
	var url = "/shopPro/selectShopProByPage.do";
	pageData({"curpage":1,"typess":0},url)
	/* 价格区间选择 */
	$("#all").click(function(){
		$("typess").val("0")
		pageData({"curpage":1,"typess":0},url)
	})
	$("#low").click(function(){
		$("typess").val("1")
		pageData({"curpage":1,"typess":1},url)
	})
	$("#lower").click(function(){
		$("typess").val("2")
		pageData({"curpage":1,"typess":2},url)
	})
	$("#height").click(function(){
		$("typess").val("3")
		pageData({"curpage":1,"typess":3},url)
	})
	$("#heighter").click(function(){
		$("typess").val("4")
		pageData({"curpage":1,"typess":4},url)
	})
	
	/* 分页选择 */
	$("#lasts").click(function(){
		var cp =Number(($("#curpage").text()))-1
		pageData({"curpage":cp,"typess":$("typess").val()},url)
	})
	$("#curpage").click(function(){
		var cp =Number(($("#curpage").text()))
		pageData({"curpage":cp,"typess":$("typess").val()},url)
	})
	$("#nextpage").click(function(){
		var cp =Number(($("#curpage").text()))+1
		pageData({"curpage":cp,"typess":$("typess").val()},url)
	})
	$("#nexts").click(function(){
		var cp =Number(($("#curpage").text()))+1
		pageData({"curpage":cp,"typess":$("typess").val()},url)
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
				if(data.rows!=null && data.rows.length>0 ){
					for(i in data.rows){
						
						
						var vat ='<li class="mcoin-item"><div class="mcoin-item-wrap"><img src="'+data.rows[i].image+'" alt=""><p class="mcoin-item-title">'+data.rows[i].name+'</p><p class="mcoin-item-price">飞镖<span>'+data.rows[i].count+'</span>个</p><div class="mcoin-item-mask"><p class="mcoin-item-mask-title">'+data.rows[i].name+'</p><p class="mcoin-item-mask-desc">'+data.rows[i].descs+'</p><p class="mcoin-item-mask-price">飞镖<span>'+data.rows[i].count+'</span>个</p><a href="/shopPro/buyThisProductBy.do?id='+data.rows[i].id+'" class="mcoin-item-mask-buy">兑换</a></div></div></li>';
						vas = vas +vat
					}
					$("#myDatas").html(vas)
				}else{
					$("#myDatas").html("              <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;还没有商品可兑换！")
				}
				
				//加到分页页面curpage
				$("#curpage").text(data.curpage);
				$("#totalsize").val(data.totalsize);
				$("#nextpage").text(Number(data.curpage)+1);
				if(data.curpage==1){
					$("#lasts").hide();
				}else{
					$("#lasts").show();
				}
				if(data.curpage>=data.totalpage){
					$("#nexts").hide();
					$("#nextpage").hide();
				}else{
					$("#nexts").show();
					$("#nextpage").show();
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
