<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_common.css" />
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<link rel="stylesheet" type="text/css" href="/bbs/static/shop/index.css" />
<script type="text/javascript" src="/js/commom.js"></script>
<script src="/static_new/pc/js/common/jquery-1-6da57f4a2b.7.1.min.js"
	type="text/javascript"></script>
<script src="/js/jquery-1.11.2.min.js" type="text/javascript"></script>
</head>

<body id="nv_forum" class="pg_index">
	<div id="hd">
		<div id="w_header">
			
			<c:import url="${path}/feiiohead.jsp"></c:import>
			<!--version: 2016-12-01 15:16:51-->
		</div>
		<div id="wp" class="wp">
			<link rel="stylesheet" type="text/css" id="css_mobile"
				href="/template/default/common/index.css"/>
				<div class="content_par">
					<div class="content">
						<div class="c_list">
							<h3>固件下载</h3>
							<div class="down">
								<ul id="myDatas">
									
									
								</ul>
								
							</div>
							<div class="mcoin-pagination">
								<ul class="clearfix" id="pagination" style="width: 144px;">
									<li class="paginationPre" id="lasts">&lt;</li>
									<li data-page="1" class="active pageItem" id="curpage">1</li>
									<li data-page="2" class="pageItem" id="nextpage">2</li>
									<li class="paginationNext" id="nexts">&gt;</li>
									<input type="hidden" id="totalsize"/>
								</ul>
							</div>
						</div>
					</div>
				</div>
		</div>
	</div>
	<!--id=wp-->
	<!-- <div class="service_par">
		<div class="service">
			<div class="service_cate">
				<h3>售前售后服务</h3>
				<ul class="sc_list clearfix">
					<li><a href=""> <i class="sc_1"></i> <span>维修进度&nbsp;自助查询</span>
					</a></li>
					<li><a href=""> <i class="sc_2"></i> <span>产品问题&nbsp;技术支持</span>
					</a></li>
					<li><a> <i class="sc_3"></i> <span>在线客服&nbsp;点击对话</span>
					</a></li>
					<li class="last"><a href="login/index.html"> <i
							class="sc_4"></i> <span>其它问题&nbsp;发帖咨询</span>
					</a></li>
				</ul>
			</div>
			<div class="service_cate community">
				<h3>社区管理</h3>
				<ul class="sc_list clearfix">
					<li><a
						href="forum.php-mod=forumdisplay&fid=22&filter=digest&digest=1.html">
							<i class="sc_5"></i> <span>社区办公</span>
					</a></li>
					<li class="last"><a href="shop.html"> <i class="sc_6"></i>
							<span>兑换商城</span>
					</a></li>
				</ul>
			</div>
		</div>
	</div> -->
	<c:import url="${path}/feiiombend.jsp"></c:import>
	<div id="scrolltop2" style="left: 1491.5px; display: block;"
		class="scrolltop2"></div>
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
	</script>
</body>
<script>
$(function(){
	var url = "/selectFirmwareByPage.do";
	pageData({"curpage":1},url)
	/* 分页选择 */
	$("#lasts").click(function(){
		var cp =Number(($("#curpage").text()))-1
		pageData({"curpage":cp},url)
	})
	$("#curpage").click(function(){
		var cp =Number(($("#curpage").text()))
		pageData({"curpage":cp},url)
	})
	$("#nextpage").click(function(){
		var cp =Number(($("#curpage").text()))+1
		pageData({"curpage":cp},url)
	})
	$("#nexts").click(function(){
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
				if(data.rows!=null && data.rows.length>0 ){
					for(i in data.rows){
						var vat ='<li><div class="czjz pic"><a href="'+data.rows[i].fa_url+'"><img src="'+data.rows[i].fa_image+'"></a><h2><a href="'+data.rows[i].fa_url+'">'+data.rows[i].fa_name+'</a></h2></div></li>';
						vas = vas +vat
					}
					
					$("#myDatas").html(vas)
				}else{
					$("#myDatas").html("              <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;还没有固件可下载！")
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
