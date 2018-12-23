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
	href="/resources/php/bbs/static/shop/common.css" />
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/php/bbs/static/shop/view.css" />
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/commom.js"></script>
<style >
.address_mid {
    
    height: 277px !important;
    }
    
    .address_bot .but {
    background: #3987ff !important;}
</style>
</head>

<body id="nv_forum" class="pg_index">
<div class="address_tit" id="adressz">
                <div class="address_mid">
                        <input type="text" class="address_input"  id="name" placeholder="姓名">
                        <input type="text" class="address_input" name="fa_tel"  id="tel" placeholder="手机号" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');">
                        
                        
                        <textarea rows="3" placeholder="详细地址"  id="detail"></textarea>
                        <div class="address_bot">
                                <input type="button" class="but" id="sureBtn" value="确认">
                                <input type="button" class="but quxiao" value="取消" id="cancelBtn"><font color="red" id="tip" style="float: right;"></font>&nbsp;&nbsp;&nbsp;
                        </div>
                </div>
        </div>
	<div id="hd">
		<div id="w_header">
			
			<c:import url="${path}/feiiohead.jsp"></c:import>
			<!--version: 2016-12-01 15:16:51-->
		</div>
		<div id="wp" class="wp">
			<div class="wp">

				<div class="mcoin-title clearfix">
					<p class="mcoin-title-l">
						<a href="javascript:void(0)">互动社区</a>&nbsp;&nbsp;>&nbsp;&nbsp;<span><a
							href="/shopPro/showShopProduct.do">兑换商城</a></span>
					</p>
					<p class="mcoin-my">
					
					<c:if test="${fu!=null && !empty fu}">
						我的飞镖：<span id="myMcoin">${fu.fa_feibiao}</span>个 ｜ <a href="/fiioer/myOrder.do">我的兑换纪录></a>
					</c:if>
					<c:if test="${fu==null || empty fu}">
						<a href="/login.do">您还没登录呢！<a/>
					</c:if>
					
					
						
					</p>
				</div>
				<div class="mcoin-content">
					<div class="mcoin-content-buy clearfix">
						<div class="goods-pic">
							<img src="${sg.fa_image}">
						</div>
						<div class="goods-buy">
							<p class="goods-buy-title">${sg.fa_name}</p>


							<p class="goods-buy-price" style="margin-top: 11px;">
								飞镖：<span class="total" id="price">${sg.fa_cost}</span> 个
							</p>

							<p class="goods-buy-return">
								是否归还：<span><c:if test="${sg.fa_isreturn==0}">否</c:if><c:if test="${sg.fa_isreturn==1}">是</c:if></span>
							</p>
							<p class="goods-buy-period">
								兑换周期：<span><c:if test="${sg.fa_islong==0}">永久</c:if>
								<c:if test="${sg.fa_islong==1}">
								<fmt:formatDate value="${sg.fa_starttime}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;至&nbsp;<fmt:formatDate value="${sg.fa_endtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</c:if>
								</span>
							</p>
							<p class="goods-buy-stock">
								库 存：<span id="stock">${sg.fa_num}</span>个
							</p>
							<p class="goods-buy-num">
								数 量：<a href="javascript:;" id="jianzz">-</a><span id="countzz">1</span><a
									href="javascript:;" id="jiazz">+</a>
									<!-- <i>(限兑<em id="maxnum">1</em>个)
								</i> -->
							</p>
							<p class="goods-buy-btn" style="margin-bottom: 16px;">
							<c:if test="${sg.fa_num<=0}"><a id="goodsBuyBtn"  href="javascript:;"> 已售罄</a></c:if>
							<c:if test="${sg.fa_num>0}"><a id="addToCartBtn"  href="javascript:;">立即购买</a></c:if>
								
								 
							</p>
							<div class="goods-buy-infos">
								<c:if test="${beizhus!=null && !empty beizhus}">
									<c:forEach items="${beizhus}" var="bz" >
										${bz['desc']}
									</c:forEach>
								</c:if>
							</div>
						</div>
					</div>
					<div class="mcoin-content-detail">
						${sg.fa_desc}
					</div>
				</div>

				<div class="tborder_foot"></div>

				<c:import url="${path}/feiiombend.jsp"></c:import>
				<!-- end Footer -->
			</div>

			
			

			<div id="scrolltop2" style="left: 1491.5px; display: block;"
				class="scrolltop2"></div>
</body>
<script type="text/javascript">
	login();
	loginbox();
	$(window).scroll(function() {
		var sc = $(window).scrollTop();
		var rwidth = $(window).width()
		if (sc > 0) {
			$("#scrolltop2").css("display", "block");
			$("#scrolltop2").css("left", "1491.5px")
		} else {
			$("#scrolltop2").css("display", "none");
		}
	})

	$(".scrolltop2").click(function() {
		$("html").animate({
			"scrollTop" : "0px"
		}, 300); //IE,FF
		$("body").animate({
			"scrollTop" : "0px"
		}, 300); //Webkit
	});
</script>
<script>
$(function(){
	$("#jianzz").click(function(){
		if(Number($("#countzz").text())>1){
			$("#countzz").text(Number($("#countzz").text())-1);
		}else{
			$("#countzz").text("1")
		}
	})
	$("#jiazz").click(function(){
		if(Number($("#countzz").text())<Number("${sg.fa_num}")){
			$("#countzz").text(Number($("#countzz").text())+1);
		}else{
			$("#countzz").text("${sg.fa_num}")
		}
	})
	$("#addToCartBtn").click(function(){
		if("${fu}"==null || "${fu}"==""){
			$("#append_parent").show();
			$("#showMsg").text("您还没有登录，请登录！");
			setTimeout(function(){
				$("#append_parent").hide();
			},2000)
		}else{
			if(Number("${fu.fa_feibiao}")>=Number("${sg.fa_cost}")*Number($("#countzz").text())){
				$("#adressz").show();
			}else{
				$("#append_parent").show();
				$("#showMsg").text("您的飞镖数不够兑换该商品");
				setTimeout(function(){
					$("#append_parent").hide();
				},2000)
			}
		}
		
		
	})
	$("#sureBtn").click(function(){
		if($("#name").val()!=null && $("#name").val()!=""){
			if($("#tel").val()!=null && $("#tel").val()!=""){
				if($("#detail").val()!=null && $("#detail").val()!=""){
					var names = $("#name").val()+"   电话："+$("#tel").val()+"   地址："+$("#detail").val();
					$.ajax({
						url:"/shopPro/createShopGood.do",
						data:{"id":"${sg.fa_id}","count":$("#countzz").text(),"adress":names},
						type:"post",
						dataType:"json",
						success:function(data){
							if(data.tip=="success"){
								$("#tip").text("兑换成功");
								setTimeout(function(){
									$("#tip").text("");
									$("#adressz").hide();
								},1000)
							}else{
								$("#tip").text(data.tip);
								setTimeout(function(){
									$("#tip").text("");
								},2000)
							}
							
							
						},
						error:function(){
							$("#tip").text("系统发生错误");
							setTimeout(function(){
								$("#tip").text("");
							},2000)
						}
					})
				}else{
					$("#tip").text(data.tip);
					setTimeout(function(){
						$("#tip").text("地址不能为空");
					},2000)
				}
			}else{
				$("#tip").text(data.tip);
				setTimeout(function(){
					$("#tip").text("手机不能为空");
				},2000)
			}
		}else{
			$("#tip").text(data.tip);
			setTimeout(function(){
				$("#tip").text("姓名不能为空");
			},2000)
		}
		
		
		
	})
	$("#cancelBtn").click(function(){
		$("#adressz").hide();
	})
})
</script>
</html>