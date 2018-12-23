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
<style >
.address_tit .address_mid {
    width: 289px;
    height: 129px;
    background-color: rgb(255, 255, 255);
    box-shadow: 0px 16px 24px 0px rgba(0, 0, 0, 0.17);
    position: absolute;
    top: 50%;
    left: 50%;
    margin-left: -167.5px;
    margin-top: -266.5px;
    padding: 30px 20px;
}
.address_tit {
    
    top: 0;
}	
</style>
</head>
<body>
	<c:import url="${path}/feiiohead.jsp"></c:import>
	<div class="address_tit" id="adressz" >
        		<form id="userForm">
                <div class="address_mid">
                		<input type="hidden"  id="ids" />
                        <div class="address_s" id="city">
                        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系人：&nbsp;&nbsp;&nbsp;
                        		<select id="adid" class="prov">
                        			<c:forEach var="re" items="${listre}">
                        				<option value="${re['fa_id']}" title="手机:${re['fa_tel']}  地址：{${re['fa_pr']}${re['fa_ci']}${re['fa_ar']}${re['fa_detail']}}">${re['fa_name']}</option>
                        			</c:forEach>
                        			
                                </select>
                        	
                        </div>
                        <div class="address_bot">
                                <input type="button" class="but" id="sureBtn" value="确认">
                                <input type="button" class="but quxiao" value="取消" id="cancelBtn"><font color="red" id="tip" style="float: right;"></font>&nbsp;&nbsp;&nbsp;
                        </div>
                </div>
                </form>
        </div>

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
								<th width="80">中奖奖品</th>
								<th width="150">中奖时间</th>
								<th width="70">兑奖状态</th>
								<th width="280" >地址信息</th>
								<th width="50" >设置</th>
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
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" src="/js/commom.js"></script>
	<script type="text/javascript">
		$(".buxian").click(function() {

			$(this).parent().find('.selectbox_simu').toggle();
		});
		login();
		loginbox();
	</script>
	<script type="text/javascript">
	$(function(){
		var url = "/fiioer/showMyLotteryData.do"
		$("#adressz").hide();
		//加载抽奖数据
		moreLongData({"curpage":$("#curpage").val()},url)
		//加载更多
		$("#loadingfeed").click(function(){
			moreLongData({"curpage":$("#curpage").val()},url)
		})
		//取消
		$("#cancelBtn").click(function(){
			$("#ids").val("")
			$("#adressz").hide();
		})
		//添加或修改联系地址
		$("#sureBtn").click(function(){
			$.ajax({
				url:"/fiioer/updateLotteryAdress.do",
				data:{"id":$("#ids").val(),"adid":$("#adid").val()},
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.tip=="success"){
						$("#tip").text("保存成功")
						setTimeout(function(){
							$("#tip").text("")
							window.location.href="/fiioer/myLottery.do"
						},1000)
					}else{
						$("#tip").text(data.tip)
						setTimeout(function(){
							$("#tip").text("")
							
						},2000)
					}
					
				},
				error:function(){
					$("#tip").text("系统出现异常")
					setTimeout(function(){
						$("#tip").text("")
						
					},2000)
					}
			})
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
					var status='<font color="red">已取消</font>';
					
					if(data.rows[i].isfinish==1){
						status = '未兑奖';
					}else if(data.rows[i].isfinish==2){
						status='<font color="green">已兑奖</font>';
					}
					if(data.rows[i].adress!=null){
						var vat ='<tr><td>'+data.rows[i].name+'</td><td>'+data.rows[i].createtime+'</td><td>'+status+'</td><td>'+data.rows[i].adress+'</td><td><a href="javascript:void(0)" id="'+data.rows[i].id+'" class="updates" >编辑地址</a></td></tr>';
						vas = vas+vat;
					}else{
						
						var adresss = "还未设置地址";
						var vat = '<tr><td>'+data.rows[i].name+'</td><td>'+data.rows[i].createtime+'</td><td>'+status+'</td><td>'+adresss+'</td><td><a href="javascript:void(0)" id="'+data.rows[i].id+'" class="adds" >添加地址</a></td></tr>';
						
						vas = vas+vat;
					}
					
				}
				//追加到页面
				if($("#curpage").val()>=data.totalpage){
					$("#loadingfeed").hide();
				}
				$("#curpage").val(Number($("#curpage").val())+1);
				$("#moreDatas").append(vas)
				//修改
				$(".updates").click(function(){
					var id = $(this).prop("id")
					var z=false;
					for(i in data.rows){
						if(id==data.rows[i].id){
							z=true;
							break;
						}
					}
					if(z){
						$("#adressz").show();
						$("#ids").val(id)
					}
					
				})
				//增加
				$(".adds").click(function(){
					var id = $(this).prop("id")
					var z=false;
					for(i in data.rows){
						if(id==data.rows[i].id){
							z=true;
							break;
						}
					}
					if(z){
						$("#adressz").show();
						$("#ids").val(id)
					}
				})
				
			},
			error:function(){
			}
		})
	}
	</script>
	</div>

</body>

</html>