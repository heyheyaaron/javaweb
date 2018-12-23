<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_common.css" />

<link href="/bbs/static/shop/common.css" rel="stylesheet" />
<link rel="stylesheet" href="/bbs/static/lottery/lottery.v5.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<link href="/bbs/static/newstyle/main.css" rel="stylesheet"
	type="text/css" />
<script src="/js/jquery.js" type="text/javascript"></script>
<script type="/text/javascript" src="js/commom.js"></script>
</head>

<body>
	<!-- 顶部 -->
	<div id="hd">
		<div id="w_header">
			<c:import url="${path}/feiiohead.jsp"></c:import>
		</div>
		
	</div>
	<input type="hidden" id="lyid" />
	<input type="hidden" id="zjid" />
	<input type="hidden" id="lycc"  value="0"/>
	<div id="wp" class="wp">
		<div class="draw_container cl">
			<div class="draw_area fll">
				<div class="draw_cont">
					<div class="pointer"></div>
					<div class="rotate">
						<img id="rotate" src="${keepimg}" />
					</div>
				</div>
			</div>
			<div class="info_area fll cl">
				<div class="loginstatus fll">
				<c:if test="${fu==null || empty fu}">
					<div class="login_no">
						<p>登录后才可以参加抽奖哦</p>
						<a href="/login.do" class="login_btn">登 录</a>
					</div>
				</c:if>
				<c:if test="${fu!=null && !empty fu}">
					<div class="login_yes">
						<p>
							亲爱的 <em class="c_blue fs18">${fu.fa_username}</em> 你好！
						</p>
						<p>
							您剩余飞镖 <em class="c_blue fs18">${fu.fa_feibiao}</em> 个
						</p>
						<p>
							每次抽奖消耗飞镖 <em class="c_blue fs18">${keeplottery}</em> 个
						</p>
						
					</div>
				</c:if>	
					
				</div>
				<div class="line"></div>
				<c:if test="${guanggao!=null && !empty guanggao}">
				<a href="${guanggao[0].url}" class="pic_bar fll"> <img
					src="${guanggao[0].image}" width="290" />
				</a>
				</c:if>
				
				<div class="line"></div>
				<div class="winner_list fll">
					<h2>中奖名单</h2>
					<div>
						<ul>
						<c:if test="${cjlist!=null && !empty cjlist}">
							<c:forEach items="${cjlist}" var="cj" >
								<li><span class="giftname c_blue">抽中了奖品：
								
								${cj['name']}
								&nbsp;
								
								</span><em
								class="uname">用户&nbsp;${cj['username']}</em></li>
							</c:forEach>
						
						</c:if>
							
							
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="">
		<div class="dialog_address_info">
			<div class="dialog_address_title">
				信息 <a href="javascript:void(0)"
					class="layui-layer-ico layui-layer-close layui-layer-close1" id="wcl"></a>
			</div>
			<p class="draw_tip"></p>
			<p class="blank_no">请填写您的真实信息，以确保奖品的正确发放.</p>
			<p class="blank_yes hide">
				您已填写过收货联系信息，请核实！如有变动， <a class="c_blue editinfo">点此修改</a>
			</p>
			<dl class="mt15 getinfo_name">
				<dt>*姓名：</dt>
				<dd>
					<input class="blank_no" type="text" id="names"> <span
						class="blank_yes hide"></span>
				</dd>
			</dl>
			<dl class="getinfo_phone">
				<dt>*手机：</dt>
				<dd>
					<input class="blank_no" type="text" id="tels"> <span
						class="blank_yes hide"></span>
				</dd>
			</dl>
			<dl class="getinfo_address">
				<dt>*收货地址：</dt>
				<dd>
					<input class="blank_no" type="text" id="adresss"> <span
						class="blank_yes get_address hide"></span>
				</dd>
			</dl>
			<div class="blank_btn">
				<button class="blank_no" id="sureBtn">确认</button>
				<button class="blank_yes hide" id="cancelBtn">取消</button>
				<p class="hide">带 * 项为必填</p>&nbsp;&nbsp;<font id="tipa" color="red"></font>
			</div>
		</div>
	</div>
	<div class="tborder_foot"></div>
	<c:import url="${path}/feiiombend.jsp"></c:import>
	<div id="scrolltop2" style="left: 1491.5px; display: block;"
		class="scrolltop2"></div>
	<script type="text/javascript" src="/js/commom.js"></script>
	<script type="text/javascript">
		login();
		loginbox();
		$(function() {
			$(window).scroll(function() {
				if ($(window).scrollTop() > 600) {
					$("#scrolltop2").fadeIn();
				} else {
					$("#scrolltop2").fadeOut();
				}
			});

			$("#scrolltop2").click(function() {
				$('body,html').animate({
					scrollTop : 0
				}, 500);
				return false;
			});
		});
	</script>
	<script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script src="bbs/static/layer/layer.js" type="text/javascript"></script>
	<script src="js/jQueryRotate.2.2.js"></script>
	<script src="js/jquery.easing.min.js"></script>
	<script>
		$(function() {
			var timeOut = function() { //超时函数
				
				$(".rotate").rotate({
					angle : 0,
					duration : 10000,
					animateTo : 2160, //这里是设置请求超时后返回的角度，所以应该还是回到最原始的位置，2160是因为我要让它转6圈，就是360*6得来的
					callback : function() {
						alert('网络超时')
					}
				});
			};
			var rotateFunc = function(awards, angle, text) { //awards:奖项，angle:奖项对应的角度
				$('.rotate').stopRotate();
				$(".rotate").rotate({
					angle : 0,
					duration : 5000,
					animateTo : angle + 1440, //angle是图片上各奖项对应的角度，1440是我要让指针旋转4圈。所以最后的结束的角度就是这样子^^
					callback : function() {
						layer.alert(text);
					}
				});
			};

			$(".pointer").rotate(
					{
						bind : {
							click : function() {
								var time = [ 0, 1 ];
								
								time = time[Math.floor(Math.random()
										* time.length)];
								/*if(time==0){
									timeOut(); //网络超时
								}*/
								if(Number($("#lycc").val())>0){
									$("#append_parent").show();
									$("#showMsg").text("抽奖太频繁啦，休息一会儿再抽吧");
									setTimeout(function(){
										$("#append_parent").hide();
									},2000)
								}else{
									if("${fu}"!=null && "${fu}"!=""){
										if(Number("${fu.fa_feibiao}")>=Number("${keeplottery}")){
											var sum = 0;
											var c0 = [0,Number("${apz[6].fa_percent}")];
											
											sum =  Number("${apz[6].fa_percent}");
											
											var c1 = [sum,sum+Number("${apz[0].fa_percent}")];
											sum = sum+ Number("${apz[0].fa_percent}");
											var c2 = [sum,sum+Number("${apz[7].fa_percent}")];
											sum = sum+ Number("${apz[7].fa_percent}");
											var c3 = [sum,sum+Number("${apz[2].fa_percent}")];
											sum = sum+ Number("${apz[2].fa_percent}");
											var c4 = [sum,sum+Number("${apz[5].fa_percent}")];
											sum = sum+ Number("${apz[5].fa_percent}");
											var c5 = [sum,sum+Number("${apz[3].fa_percent}")];
											sum = sum+ Number("${apz[3].fa_percent}");
											var c6 = [sum,sum+Number("${apz[1].fa_percent}")];
											sum = sum+ Number("${apz[1].fa_percent}");
											var c7 = [sum,sum+Number("${apz[4].fa_percent}")];
											sum = sum+ Number("${apz[4].fa_percent}");
											$("#lycc").val("1")
											var data = Math.round(Math.random()*(sum-1));
											if (data >=c0[0] && data<c0[1]) {
												saveLotteryData("${apz[6].fa_id}")
												
												if(Number($("#zjid").val())<=0){
													if(Number("${apz[6].fa_type}")>0){
														rotateFunc(1, 65, '恭喜您抽中${apz[6].fa_name}，请填写收货地址，我们将尽快给您邮寄');
														setTimeout(function(){
															$('.dialog_address_info').fadeIn()
														},6000)
														
													}else{
														rotateFunc(1, 65, '恭喜您抽中${apz[6].fa_num}飞镖,系统已自动加到您的账号上，请注意查看')
														setTimeout(function(){
															window.location.href="/luckDraw.do"
														},10000)
													}
												}
												
												
												
											}
											if (data >=c1[0] && data<c1[1]) {
												saveLotteryData("${apz[0].fa_id}")
												if(Number($("#zjid").val())<=0){
													if(Number("${apz[0].fa_type}")>0){
														
														rotateFunc(8, 337, '恭喜您抽中${apz[0].fa_name}，请填写收货地址，我们将尽快给您邮寄');
														setTimeout(function(){
															$('.dialog_address_info').fadeIn()
														},6000)
													}else{
														rotateFunc(8, 337, '恭喜您抽中${apz[0].fa_num}飞镖,系统已自动加到您的账号上，请注意查看')
														setTimeout(function(){
															window.location.href="/luckDraw.do"
														},10000)
													}
												}
												
												
											}
											if (data >=c2[0] && data<c2[1]) {
												saveLotteryData("${apz[7].fa_id}")
												if(Number($("#zjid").val())<=0){
													if(Number("${apz[7].fa_type}")>0){
														rotateFunc(3, 22, '恭喜您抽中${apz[7].fa_name}，请填写收货地址，我们将尽快给您邮寄');
														setTimeout(function(){
															$('.dialog_address_info').fadeIn()
														},6000)
													}else{
														rotateFunc(3, 22, '恭喜您抽中${apz[7].fa_num}飞镖,系统已自动加到您的账号上，请注意查看')
														setTimeout(function(){
															window.location.href="/luckDraw.do"
														},10000)
													}
												}
												
											}
											if (data >=c3[0] && data<c3[1]) {
												saveLotteryData("${apz[2].fa_id}")
												if(Number($("#zjid").val())<=0){
													if(Number("${apz[2].fa_type}")>0){
														rotateFunc(2, 247, '恭喜您抽中${apz[2].fa_name}，请填写收货地址，我们将尽快给您邮寄');
														setTimeout(function(){
															$('.dialog_address_info').fadeIn()
														},6000)
													}else{
														rotateFunc(2, 247, '恭喜您抽中${apz[2].fa_num}飞镖,系统已自动加到您的账号上，请注意查看')
														setTimeout(function(){
															window.location.href="/luckDraw.do"
														},10000)
													}
												}
												
											}
											if (data >=c4[0] && data<c4[1]) {
												saveLotteryData("${apz[5].fa_id}")
												if(Number($("#zjid").val())<=0){
													if(Number("${apz[5].fa_type}")>0){
														rotateFunc(4, 110, '恭喜您抽中${apz[5].fa_name}，请填写收货地址，我们将尽快给您邮寄');
														setTimeout(function(){
															$('.dialog_address_info').fadeIn()
														},6000)
													}else{
														rotateFunc(4, 110, '恭喜您抽中${apz[5].fa_num}飞镖,系统已自动加到您的账号上，请注意查看')
														setTimeout(function(){
															window.location.href="/luckDraw.do"
														},10000)
													}
												}
												
												
											}
											if (data >=c5[0] && data<c5[1]) {
												saveLotteryData("${apz[3].fa_id}")
												if(Number($("#zjid").val())<=0){
													if(Number("${apz[3].fa_type}")>0){
														rotateFunc(6, 197, '恭喜您抽中${apz[3].fa_name}，请填写收货地址，我们将尽快给您邮寄');
														setTimeout(function(){
															$('.dialog_address_info').fadeIn()
														},6000)
													}else{
														rotateFunc(6, 197, '恭喜您抽中${apz[3].fa_num}飞镖,系统已自动加到您的账号上，请注意查看')
														setTimeout(function(){
															window.location.href="/luckDraw.do"
														},10000)
													}
												}
												
											}
											if (data >=c6[0] && data<c6[1]) {
												saveLotteryData("${apz[1].fa_id}")
												if(Number($("#zjid").val())<=0){
													if(Number("${apz[1].fa_type}")>0){
														rotateFunc(7, 293, '恭喜您抽中${apz[1].fa_name}，请填写收货地址，我们将尽快给您邮寄');
														setTimeout(function(){
															$('.dialog_address_info').fadeIn()
														},6000)
													}else{
														rotateFunc(7, 293, '恭喜您抽中${apz[1].fa_num}飞镖,系统已自动加到您的账号上，请注意查看')
														setTimeout(function(){
															window.location.href="/luckDraw.do"
														},10000)
													}
												}
												
											}
											if (data >=c7[0] && data<c7[1]) {
												saveLotteryData("${apz[4].fa_id}")
												if(Number($("#zjid").val())<=0){
													if(Number("${apz[4].fa_type}")>0){
														rotateFunc(5, 155, '恭喜您抽中${apz[4].fa_name}，请填写收货地址，我们将尽快给您邮寄');
														setTimeout(function(){
															$('.dialog_address_info').fadeIn()
														},6000)
													}else{
														rotateFunc(5, 155, '恭喜您抽中${apz[4].fa_num}飞镖,系统已自动加到您的账号上，请注意查看')
														setTimeout(function(){
															window.location.href="/luckDraw.do"
														},10000)
													}	
												}
												
											}
										}else{
											
											$("#append_parent").show();
											$("#showMsg").text("飞镖数不够，不能抽奖");
											setTimeout(function(){
												$("#append_parent").hide();
											},2000)
										}
									}else{
										$("#append_parent").show();
										$("#showMsg").text("请登录后再抽奖");
										setTimeout(function(){
											$("#append_parent").hide();
										},2000)
										
									}
								}
								
								
								/* time = 1
								if (time == 1) {
									var data = [ 1, 2, 3, 4, 5, 6, 7, 8 ]; //返回的数组
									data = data[Math.floor(Math.random()
											* data.length)];
									//								console.log(data);
									

								} */
							}
						}

					});

		})

		$(".dialog_address_title .layui-layer-close").click(function() {
			$(".dialog_address_info").fadeOut();
		})
		function saveLotteryData(id){
			$.ajax({
				url:"/shopPro/saveLotteryData.do",
				data:{"id":id,"cost":"${keeplottery}"},
				type:"post",
				async:false,
				dataType:"json",
				success:function(data){
					if(data.tip=="success"){
						$("#lyid").val(data.id);
						$("#zjid").val("0");
					}else{
						$("#zjid").val("1");
						$("#append_parent").show();
									$("#showMsg").text(data.tip);
									setTimeout(function(){
										$("#append_parent").hide();
									},4000)
									
					}
				},
				error:function(){
					$("#zjid").val("1");
					$("#append_parent").show();
									$("#showMsg").text("系统发生异常,请稍后再操作");
									setTimeout(function(){
										$("#append_parent").hide();
									},2000)
									
				}
			})
		}
	</script>
	<script type="text/javascript">
	$(function(){
		$("#sureBtn").click(function(){
			$.ajax({
				url:"/shopPro/saveLotteryAdress.do",
				data:{"name":$("#names").val(),"tel":$("#tels").val(),"adress":$("#adresss").val(),"id":$("#lyid").val()},
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.tip=="success"){
						$("#tipa").text("操作成功");
						setTimeout(function(){
							window.location.href="/luckDraw.do"
						},1000)
					}else{
						$("#tipa").text(data.tip);
						setTimeout(function(){
							$("#tipa").text("");
						},2000)
					}
				},
				error:function(){
					$("#tipa").text("系统发生异常,请稍后再操作");
					setTimeout(function(){
						$("#tipa").text("");
					},2000)
				}
			})
		})
		$("#cancelBtn").click(function(){
			$(".dialog_address_info").hide();
			window.location.href="/luckDraw.do"
		})
		$("#wcl").click(function(){
			window.location.href="/luckDraw.do"
		})
	})
	</script>
</body>

</html>
