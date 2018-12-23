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
<link rel="stylesheet" href="${path}/css/OwenLch.css">
</head>
<body>

	<c:import url="${path}/feiiohead.jsp"></c:import>
	<div id="wp" class="wp">
		<!-- 内容区域 -->
		<div id="ct" class="ct2_a wp cl">
			<c:import url="${path}/feiiombright.jsp"></c:import>
			<input type="hidden" id="curpage" value="1" />
			<div class="mn ct1_feed float_l">
				<!-- 列表 -->
				<div id="threadlist" class="tl bm cont_wp">
					<!-- 个人中心 帖子 -->
					<!--  -->
					<div class="guide_indicate bm_c">
						<table cellspacing="0" cellpadding="0" class="guide_theme">
							<thead>
								<tr>
									<th width="50">兑换商品</th>
									<th width="80">单价(飞镖)</th>
									<th width="50">数量</th>
									<th width="80">合计(飞镖)</th>
									<th width="160">收货信息</th>
									<th width="130">兑换日期</th>
									<th width="50">状态</th>
								</tr>
							</thead>
							<tbody id="moreDatas">
								
							</tbody>
						</table>
						<div class="cr"></div>
					</div>
					<div class="bm bw0 pgs cl pagebar"></div>
					<div id="loadingfeed" class="flw_moress">
						<a href="javascript:void(0)" class="xi2"  >更多》》</a>
					</div>
				</div>
			</div>
		</div>
		<div class="tborder_foot"></div>
		<c:import url="${path}/feiiombend.jsp"></c:import>
		<script type="text/javascript" src="../js/jquery.js"></script>
		<script type="text/javascript" src="../js/commom.js"></script>
		<script type="text/javascript">
			$(".buxian").click(function() {

				$(this).parent().find('.selectbox_simu').toggle();
			});
			login();
			loginbox();
		</script>
		<script type="text/javascript">
		$(function(){
			var url = "/fiioer/showMyShopData.do"
			//加载抽奖数据
			moreLongData({"curpage":$("#curpage").val()},url)
			//加载更多
			$("#loadingfeed").click(function(){
				moreLongData({"curpage":$("#curpage").val()},url)
			})
		})
		function moreLongData(data,url){
			$.ajax({
				url:url,
				data:data,
				type:"post",
				dataType:"json",
				success:function(data){
					var vas = "";
					for(i in data.rows){
						var status='待发货';
						
						if(data.rows[i].fa_type==2){
							status = '已发货';
						}else if(data.rows[i].fa_type==3){
							status='已收货';
						}else if(data.rows[i].fa_type==4){
							status='待退款';
						}else if(data.rows[i].fa_type==5){
							status='已退货';
						}
						var sums=data.rows[i].fa_cost*data.rows[i].fa_num;
						var vat ='<tr><td>'+data.rows[i].name+'</td><td>'+data.rows[i].fa_cost+'</td><td>'+data.rows[i].fa_num+'</td><td>'+sums+'</td><td>'+data.rows[i].adress+'</td><td>'+data.rows[i].times+'</td><td>'+status+'</td></tr>';
						vas = vas+vat;
						
						
					}
					//追加到页面
					if($("#curpage").val()>=data.totalpage){
						$("#loadingfeed").hide();
					}
					$("#curpage").val(Number($("#curpage").val())+1);
					$("#moreDatas").append(vas)
					
					
					
				},
				error:function(){
				}
			})
		}
		</script>
</body>

</html>
