<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_common.css" />
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_forum_index.css"/>
	<link rel="stylesheet" type="text/css" href="/css/style.css"/>
		<link rel="stylesheet" type="text/css" href="/css/header.css" />

		<script src="/js/jquery-1.11.2.min.js" type="text/javascript"></script>
		<script src="/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
		<script type="text/javascript" src="/js/commom.js"></script>
		
		<script>
(function(a,h,c,b,f,g){a["UdeskApiObject"]=f;a[f]=a[f]||function(){(a[f].d=a[f].d||[]).push(arguments)};g=h.createElement(c);g.async=1;g.charset="utf-8";g.src=b;c=h.getElementsByTagName(c)[0];c.parentNode.insertBefore(g,c)})(window,document,"script","http://assets-cli.udesk.cn/im_client/js/udeskApi.js","ud");
ud({
    "code": "1hc99a06",
    "link": "http://fiio.udesk.cn/im_client/?web_plugin_id=24493"
});
</script>
</head>
<style>
.wryh
{
	font-family:"微软雅黑" !important;
	color:#515151 !important;
	font-size:15px !important;
}
</style>
<body id="nv_forum" class="pg_index">
	<div id="hd">
		<div id="w_header">
			<c:import url="${path}/feiiohead.jsp"></c:import>

		</div>
		<div id="wp" class="wp">
			<link rel="stylesheet"
				href="/static_new/pc/css/index/index-51816a1dd8.css">
				<div class="wp">
					<!--[diy=diy1]-->
                                                     <div class="banner-box1">
								<div class="banner">
									<div href="" class="prev"></div>
									<div href="" class="next"></div>
									<div class="bd">
										<ul>
											<c:if test="${listbanner!=null}">
												<c:forEach items="${listbanner}" var="br">
													<li><a href="${br['url']}" target="_blank"   ><img
															src="${br['image']}" ></a></li>
												</c:forEach>
											</c:if>
										</ul>
									</div>
									<div class="roll_small_signimg_div_opcity"></div>
									<div class="hd">
										<div class="roll">
											<div class="roll-title">
												<a href="javascript:void(0);">  </a>
											</div>
											<div class="roll_small_signimg_div">
												<ul>
													<c:if test="${listbanner!=null}">
														<c:forEach items="${listbanner}" var="br">
															<li class="roll_img"><img src="${br['image']}"
																width="50" height="29"></li>
														</c:forEach>
													</c:if>

												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>


					<div class="index_content">
						<div class="index_left">
							
							<!-- hot thread start -->
							<div class="hot-thread mtop20">
								<div class="thd-header">
									<div class="sum-info">
										<ul id="hotHead">
											<li>
												<p>
													今日发帖：<span class="num">${nowCount}</span>
												</p>
											</li>
											<li class="splitter"></li>
											<li>
												<p>
													历史最高：<span class="num">${noteCount}</span>
												</p>
											</li>
											<li class="splitter"></li>
											<li>
												<p>
													会员：<span class="num">${memberCount}</span>
												</p>
											</li>
										</ul>
									</div>
									<h3 class="mod-title">社区热帖</h3>
								</div>
								<div class="thd-list">
									<table>
										<tbody>
										<c:if test="${hotnote!=null &&!empty hotnote}">
											<c:forEach var="hn" items="${hotnote}" varStatus="vs" >
												<c:if test="${vs.index%2==0 }">
													<tr>
														<td>
														<div class="thread-td">
															<a href="/fiioer/showMemberMsg.do?id=${hn['uid']}" class="thread-avatar"> <img
																src="${hn['image']}" style="cursor: pointer;"></a>
															<div class="thread-title">
																<a class="t-title" href="/note/showNoteContent.do?id=${hn['id']}">
																<c:if test="${fn:length(hn['title'])>15}">
																	<c:set var = "string22" value = "${fn:substring(hn['title'],0, 15)}" />
																	${string22}...
																</c:if>
																<c:if test="${fn:length(hn['title'])<=15}">
																	${hn['title']}
																</c:if>
																	 </a>
																<div class="meta-info">
																	<span class="username">${hn['name']}</span>
																	<p class="info-right">
																		<span><i class="index-thread-view"></i>${hn['ping']}</span> <span><i
																			class="short index-thread-comment"></i>${hn['count']}</span>
																	</p>
																</div>
															</div>
														</div>
													</td>
												</c:if>
												<c:if test="${vs.index%2==1 }">
													<td>
													<div class="thread-td">
														<a href="/fiioer/showMemberMsg.do?id=${hn['uid']}" class="thread-avatar"> <img
															src="${hn['image']}" style="cursor: pointer;"></a>
														<div class="thread-title">
															<a class="t-title" href="/note/showNoteContent.do?id=${hn['id']}">
															<c:if test="${fn:length(hn['title'])>15}">
																<c:set var = "string22" value = "${fn:substring(hn['title'],0, 15)}" />
																${string22}...
															</c:if>
															<c:if test="${fn:length(hn['title'])<=15}">
																${hn['title']}
															</c:if>
																 </a>
															<div class="meta-info">
																<span class="username">${hn['name']}</span>
																<p class="info-right">
																	<span><i class="index-thread-view"></i>${hn['ping']}</span> <span><i
																		class="short index-thread-comment"></i>${hn['count']}</span>
																</p>
															</div>
														</div>
													</div>
												</td>
												</tr>
												</c:if>
											</c:forEach>
										
										</c:if>
											

										</tbody>
									</table>
								</div>
							</div>
							<!-- hot thread end -->
							<div class="recommend-thread mtop20">
							<%-- <c:if test="${tjnote!=null &&!empty tjnote}"> --%>
									<c:forEach var="hn" items="${tjnote}" >
										
										<dl class="rt-list">
											<dt class="rt-img">
												<a href="/note/showNoteContent.do?id=${hn['id']}" class="is_image"> <img
													width="311" height="213" class="lazy"
													src="${hn['image']}" style="display: inline;"></a>
											</dt>
											<dd class="rt-main">
												<div class="rt-wrap">
													<p class="rt-title-name">${hn['sname']}</p>
												</div>
												<p class="rt-href">
													<a class="rth" href="/note/showNoteContent.do?id=${hn['id']}">
														
																${hn['title']}
													
													</a>
		
												</p>
												<div class="rt-meta">
													<span class="readicon_uinfo_5"
														style="margin: 0 4px 0 0; float: left;"></span> <span
														class="spfont">${hn['ping']}</span> <span class="replyicon_uinfo_5"
														style="margin: 0 4px 0 20px; float: left;"></span> <span
														class="spfont">${hn['count']}</span> <span class="spfont"
														style="margin: 0 0 0 20px;">/ <a
														href="/fiioer/showMemberMsg.do?id=${hn['uid']}">${hn['name']}</a></span> <span class="spfont"
														style="margin: 0 0 0 20px;">/ <span>${hn['day']}</span></span> <span
														class="spfont alte" style="float: right;"><a
														class="alink" href="/note/showNoteContent.do?id=${hn['id']}"><font color="#9b9b9b">阅读全文</font></a></span>
												</div>
												<div class="content wryh">
													
														${hn['desc']}
													
													
													
												</div>
												<div class="itail">
													<div class="ishare">
														<span class="bdsharebuttonbox isharebtn"> <a
															class="bds_tsina" target="_blank" href="http://service.weibo.com/share/share.php?title=${hn['title']}&url=http://bbs.fiio.net/note/showNoteContent.do?id=${hn['id']}&pic=http://bbs.fiio.net/${hn['image']}">&nbsp;&nbsp;&nbsp;&nbsp;</a>
														</span> <span class="bdsharebuttonbox isharebtn"> <a
															class="bds_tsina1" id="${hn['id']}s"  href="javascript:void(0)">&nbsp;&nbsp;&nbsp;&nbsp;</a>
														</span>
														<div class="sosh-pop  fenxiang" id="qwert" >
																		<div class="sosh-qrcode-pic"><img src="${path}/qrCode?noteid=${hn['id']}"></div>
																		<div class="sosh-qrcode-text">用微信扫描二维码<br>分享至好友和朋友圈</div>
																		<a href="javascript:;" target="_self" class="sosh-pop-close" id="${hn['id']}e">⨯</a>
																	</div>
													</div>
												</div>
											</dd>
										</dl>
										
									</c:forEach>
							<%-- </c:if> --%>
							
							
								
								
							</div>
						</div>
						<div class="index_right">
							<div class="index_right_2">
								<div class="signinwrap_expand">
									<div class="signin_expand signin_expand_2 " style="width: 272px;">
										<a attribute="">
											<div class="week_ban" id="weekday"></div>
											<div class="btncont_signin btncont_signin_2" id="qiandao">签&nbsp;到</div>
											<div class="cr"></div>
										</a>
									</div>
									<div class="tips_signin"
										style="display: none; left: 0; top: 65px;">
										<span class="tipcont_signin" id="tipz"></span><em
											class="point_signtip"></em>
									</div>
									<div style="margin-top: 10px;">
										<a href="/shopPro/showShopProduct.do"> <img
											src="/bbs/static/image/common/shop.png" width="128"></a> <a
											href="/luckDraw.do" style="margin-left: 9px;"> <img
											src="/bbs/static/image/common/lottery.png" width="128"></a>
									</div>
								</div>
								<div class="qr-code" style="border: 1px solid #EEEEEE;">
									<a href="/note/showFSection.do?id=6"><img
										src="/img/fanhui.png"></a>
								</div>
								<div class="hot-area">
									<p class="r-title">热门版块</p>
									<div class="remove-border">
										<table width="100%">
											<tbody>
												<c:if test="${listmodel!=null}">
													<c:forEach items="${listmodel}" var="mol" varStatus="as" >
														<c:if test="${as.index%2==0}">
															<tr class="odd">
													<td><a href="/note/showFSection.do?id=${mol['id']}">${mol['name']}</a></td>
														</c:if>
														<c:if test="${as.index%2==1}">
														<td><a href="/note/showFSection.do?id=${mol['id']}">${mol['name']}</a></td>
												</tr>
														</c:if>
													</c:forEach>
												</c:if>
												
													
											</tbody>
										</table>
									</div>
								</div>
								<div class="column_r5">
									<div id="portal_block_606" class="inrotate_img block move-span">
										<div class="blocktitle title padding0"><span class="titletext2">最新活动</span></div>
										<div class="bread_line">
											<div class="line"></div>
											<div class="cr"></div>
										</div>
										<div id="portal_block_606_content" class="dxb_bc">
											<div class="module cl ml" style="padding-top:15px;">
												<ul>
													<c:if test="${hdnote!=null && !empty hdnote}">
														<c:forEach items="${hdnote}" var="hn" >
															<li>
																<div class="img_l">
																	<img src="${hn['image']}" width="121" height="92">
																</div>
																<div class="mhometitle">
																	<div class="title">${hn['name']}</div>
																	<div class="summary">${hn['desc']}</div>
																	<a href="${hn['url']}">
																		<div class="but">立即参加</div>
																	</a>
																</div>
																<div class="cr"></div>
															</li>
														</c:forEach>
													
													</c:if>
													
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="column_r8">
									<div id="portal_block_614" class="inrotate_img block move-span">
										<div id="portal_block_614_content" class="dxb_bc">
											<div class="module cl ml" style="padding-top:15px;">
												<ul>
													<li style="width: 270px;">
														<div class="blocktitle title padding0 item_img1"><span class="titletext2">新人课堂</span></div>
														<div class="bread_line">
															<div class="line"></div>
															<div class="cr"></div>
														</div>
														<c:if test="${ktnote!=null && !empty ktnote}">
															<c:forEach items="${ktnote}" var="hn" >
																<a href="${hn['url']}">
																	<img src="${hn['image']}" width="268" height="147">
																</a>
																<div class="bread_line">
																	<div class="cr"></div>
																</div>
															</c:forEach>
														</c:if>
														
													</li>
													
												</ul>
											</div>
										</div>
									</div>
								</div>
								<div class="column_r9">
									<div id="portal_block_615" class="padding_margin0 block move-span">
										<div id="portal_block_615_content" class="dxb_bc">
											<div class="module cl xl">
												<ul>
													<c:if test="${xtnote!=null && !empty xtnote}">
															<c:forEach items="${xtnote}" var="hn" >
																<li class="thread1">
																	<a class="cg" href="${hn['url']}">${hn['name']}</a>
																</li>
															</c:forEach>
														</c:if>
													
												</ul>
											</div>
										</div>
									</div>
								</div>
								
								<div class="column_r7">
									<div class="tagbox" style="background-color:#FFFFFF;">
										<div class="tag_tags">
											<div id="bbs_firmware_push_get" class="tg activity">${gujian[0].name}</div>
											<div id="bbs_system_course_get" class="tg ">${gujian[1].name}</div>
											<div class="cr"></div>
										</div>
										<div class="cr"></div>
										<div class="tag_main" style="height:183px;">
											<div class="ctag" style=" overflow:hidden;">
												<div id="portal_block_533" class="padding_margin0 block move-span">
													<div id="portal_block_533_content" class="dxb_bc">
														<div class="module cl xl">
															<ul>
																<li style="margin:0px;">
																${gujian[0].desc}
																	<!-- <dl class="cl xld">
																		<dt style="font-size:14px;color:#222222;font-weight:bold;line-height:24px;padding:2px 0px;"></dt>
																		<dt style=" color:#222222; font-size:14px; line-height:24px;height:24px;padding:2px 0px;overflow:hidden;">发布日期：2017 年 3 月 28 日</dt>
																	</dl> -->
																</li>
																<!-- <li style="margin:0px;">
																	<dl class="cl xld">
																		<dd style="font-size:14px;color:#222222;line-height:24px;padding:0px;">适用机型：PRO 6 Plus、MX6 等</dd>
																	</dl>
																</li> -->
																
																<li style="display:block;float:none;font-size:0;height:0;line-height:0;overflow:hidden;clear:both;visibility: hidden;margin:0px;"></li>
																<li style="padding-top:6px;">
																	<a class="download_button" href="/firmwareDown.do" style="display: block;">
																		<div class="firmware_download">下载更新</div>
																	</a>
																</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											
											
											
											<div class="ctag" style=" overflow:hidden; display:none;">
												<div id="portal_block_535" class="padding_margin0 block move-span">
													
													<div id="portal_block_535_content" class="dxb_bc">
														<div class="module cl xl">
															<ul>
																<li style="margin:0px;">
																	${gujian[1].desc}
																</li>
																
																
																<li style="display:block;float:none;font-size:0;height:0;line-height:0;overflow:hidden;clear:both;visibility: hidden;margin:0px;"></li>
																<li style="padding-top:6px;">
																	<a class="download_button" href="/firmwareDown.do" style="display: block;">
																		<div class="firmware_download">下载更新</div>
																	</a>
																</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								
							</div>
						</div>
						<div class="cr"></div>
					</div>
					<!--[/diy]-->
				</div>
				<!-- 尾部 -->
				<c:import url="${path}/feiioend.jsp"></c:import>
				<div id="scrolltop2" style="left: 1491.5px; display: block;"
					class="scrolltop2"></div>
				<script type="text/javascript">
					show();
					login();
					loginbox();
					$(".tag_tags .tg").mouseover(
							function(e) {
								var index = $(".tag_tags .tg").index(this);
								$(this).addClass("activity").siblings()
										.removeClass('activity')
								$(".ctag").eq(index).show().siblings().hide();
							})
					jQuery(".banner").slide(
							{
								mainCell : ".bd ul",
								effect : "leftLoop",
								autoPlay : true,
								trigger : "click",
								startFun : function(i, c) {
									jQuery('.roll-title a').html(
											jQuery('.roll_img img').eq(i).attr(
													'alt'))
								}
							});

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
					$(".rt-list .bds_tsina1").click(function  () {
						var id = $(this).prop("id");
						$("#"+id).parent().parent().find(".fenxiang").show();
					})
					$(".sosh-pop-close").click(function  () {
						var id = $(this).prop("id");
						$("#"+id).parent().hide();
						
					})

				</script>
				<script >
				$(function(){
					var a = new Array("日", "一", "二", "三", "四", "五", "六");  
					var week = new Date().getDay();  
					var str = "星期"+ a[week];
					$("#weekday").html(str)
					
					if(Number("${issign}")>0){
						$("#qiandao").text("已签到")
					}else{
						$("#qiandao").html("签&nbsp;到")
					}
					
					//签到
	$("#qiandao").click(function(){
		if("${fu}"!=null && "${fu}"!=""){
			$.ajax({
				url:"/note/signIsTrue.do",
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.tip=="success"){
						$(".tips_signin").show();
						$("#tipz").html('恭喜你，签到成功')
						setTimeout(function(){
							$(".tips_signin").hide();
						},2000)
					}else{
						$(".tips_signin").show();
						$("#tipz").html(data.tip)
						setTimeout(function(){
							$(".tips_signin").hide();
						},2000)
					}
				},
				error:function(){
					$(".tips_signin").show();
					$("#tipz").html('系统发生异常,请稍后再操作')
					setTimeout(function(){
						$(".tips_signin").hide();
					},2000)
				}
			})
			
			
			
		}else{
			$(".tips_signin").show();
			$("#tipz").html('请先<a href="/login.do">登录</a>')
			setTimeout(function(){
				$(".tips_signin").hide();
			},2000)
		}
		
	})
				})
				</script>
				
				
</body>

</html>