<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_common.css" />
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_forum_forumdisplay.css" />
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/commom.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
</head>

<body id="nv_forum" class="pg_index">
	<div id="hd">
		<div id="w_header">

			<c:import url="${path}/feiiohead.jsp"></c:import>
			<!--version: 2016-12-01 15:16:51-->
		</div>
		<div id="wp" class="wp">
			<style id="diy_style" type="text/css"></style>
			<div class="wp">
				<!--[diy=diy1]-->
				<div id="diy1" class="area"></div>
				<!--[/diy]-->
			</div>
			<div>
				<c:import url="${path}/feiiombright2.jsp"></c:import>

				<div id="ct" class="ct1 wp cl personal_onfo">
					<div class="mn ptop30">
						<!--[diy=diycontenttop]-->
						<div id="diycontenttop" class="area"></div>
						<!--[/diy]-->
						<div class="bm bw0">
							<div class="page_frame_navigation">
								<div class="follow_feed_cover" style="left: 129px22px;"></div>
								<ul class="mbw tb cl page_frame_ul" style="padding-left: 20px;">
									<li class="a"><a href="/fiioer/showMemberMsg.do?id=${fuf.fa_id}">个人资料</a></li>
									<li><a href="/fiioer/showMemberbroadcast.do?id=${fuf.fa_id}">广播</a></li>
									<li><a href="/fiioer/showMemberNote.do?id=${fuf.fa_id}">主题</a></li>

									<li class="manage_frame_nav"
										style="float: right; width: 200px; position: relative"></li>
								</ul>
							</div>
							<div class="bm_c">
								<div class="bm_c u_profile">
									<div class="pbm mbm bbda cl space_profile_box">
										<h2 class="mbn">基本资料</h2>
										<!-- 公开 -->
										<c:if test="${fuf.fa_hide_base==0}">
											<table cellspacing="0" cellpadding="0" class="tb_profile">
												<col width="120px" />
												<col width="558px" />
												<tr class="column2">
													<td>用户名</td>
													<td>${fuf.fa_username}</td>
												</tr>
												<tr class="column2">
													<td>用户等级</td>
													<td>${fr.fa_name}</td>
												</tr>
												<tr class="column2">
													<td>性别</td>
													<td>
													<c:if test="${fuf.fa_sex==0}">男</c:if>
													<c:if test="${fuf.fa_sex==1}">女</c:if>
													<c:if test="${fuf.fa_sex==2}">保密</c:if>
													</td>
												</tr>
												<tr class="column2">
													<td>QQ</td>
													<td>${fuf.fa_qq}</td>
												</tr>
												<tr class="column2">
													<td>微博地址</td>
													<td>${fuf.fa_weibo}</td>
												</tr>
												<tr class="column2">
													<td>居住省份</td>
													<td>
													<c:if test="${fuf.fa_life==0}">北京市</c:if>
													<c:if test="${fuf.fa_life==1}">浙江省</c:if>
													<c:if test="${fuf.fa_life==2}">天津市</c:if>
													<c:if test="${fuf.fa_life==3}">安徽省</c:if>
													<c:if test="${fuf.fa_life==4}">上海市</c:if>
													<c:if test="${fuf.fa_life==5}">福建省</c:if>
													<c:if test="${fuf.fa_life==6}">重庆市</c:if>
													<c:if test="${fuf.fa_life==7}">江西省</c:if>
													<c:if test="${fuf.fa_life==8}">山东省</c:if>
													<c:if test="${fuf.fa_life==9}">河南省</c:if>
													<c:if test="${fuf.fa_life==10}">湖北省</c:if>
													<c:if test="${fuf.fa_life==11}">湖南省</c:if>
													<c:if test="${fuf.fa_life==12}">广东省</c:if>
													<c:if test="${fuf.fa_life==13}">海南省</c:if>
													<c:if test="${fuf.fa_life==14}">山西省</c:if>
													<c:if test="${fuf.fa_life==15}">青海省</c:if>
													<c:if test="${fuf.fa_life==16}">江苏省</c:if>
													<c:if test="${fuf.fa_life==17}">辽宁省</c:if>
													<c:if test="${fuf.fa_life==18}">吉林省</c:if>
													<c:if test="${fuf.fa_life==19}">台湾省</c:if>
													<c:if test="${fuf.fa_life==20}">河北省</c:if>
													<c:if test="${fuf.fa_life==21}">贵州省</c:if>
													<c:if test="${fuf.fa_life==22}">四川省</c:if>
													<c:if test="${fuf.fa_life==23}">云南省</c:if>
													<c:if test="${fuf.fa_life==24}">陕西省</c:if>
													<c:if test="${fuf.fa_life==25}">甘肃省</c:if>
													<c:if test="${fuf.fa_life==26}">黑龙江省</c:if>
													<c:if test="${fuf.fa_life==27}">香港特别行政区</c:if>
													<c:if test="${fuf.fa_life==28}">澳门特别行政区</c:if>
													<c:if test="${fuf.fa_life==29}">广西壮族自治区</c:if>
													<c:if test="${fuf.fa_life==30}">宁夏回族自治区</c:if>
													<c:if test="${fuf.fa_life==31}">新疆维吾尔自治区</c:if>
													<c:if test="${fuf.fa_life==32}">内蒙古自治区</c:if>
													<c:if test="${fuf.fa_life==33}">西藏自治区</c:if>
													
													</td>
												</tr>
												
											</table>
										</c:if>
										<!-- 好友看见 -->
										<c:if test="${fuf.fa_hide_base==1}">
											<c:if test="${ifri>0}">
												<table cellspacing="0" cellpadding="0" class="tb_profile">
												<col width="120px" />
												<col width="558px" />
												<tr class="column2">
													<td>用户名</td>
													<td>${fuf.fa_username}</td>
												</tr>
												<tr class="column2">
													<td>用户等级</td>
													<td>${fr.fa_name}</td>
												</tr>
												<tr class="column2">
													<td>性别</td>
													<td>
													<c:if test="${fuf.fa_sex==0}">男</c:if>
													<c:if test="${fuf.fa_sex==1}">女</c:if>
													<c:if test="${fuf.fa_sex==2}">保密</c:if>
													</td>
												</tr>
												<tr class="column2">
													<td>QQ</td>
													<td>${fuf.fa_qq}</td>
												</tr>
												<tr class="column2">
													<td>微博地址</td>
													<td>${fuf.fa_weibo}</td>
												</tr>
												<tr class="column2">
													<td>居住省份</td>
													<td>
													<c:if test="${fuf.fa_life==0}">北京市</c:if>
													<c:if test="${fuf.fa_life==1}">浙江省</c:if>
													<c:if test="${fuf.fa_life==2}">天津市</c:if>
													<c:if test="${fuf.fa_life==3}">安徽省</c:if>
													<c:if test="${fuf.fa_life==4}">上海市</c:if>
													<c:if test="${fuf.fa_life==5}">福建省</c:if>
													<c:if test="${fuf.fa_life==6}">重庆市</c:if>
													<c:if test="${fuf.fa_life==7}">江西省</c:if>
													<c:if test="${fuf.fa_life==8}">山东省</c:if>
													<c:if test="${fuf.fa_life==9}">河南省</c:if>
													<c:if test="${fuf.fa_life==10}">湖北省</c:if>
													<c:if test="${fuf.fa_life==11}">湖南省</c:if>
													<c:if test="${fuf.fa_life==12}">广东省</c:if>
													<c:if test="${fuf.fa_life==13}">海南省</c:if>
													<c:if test="${fuf.fa_life==14}">山西省</c:if>
													<c:if test="${fuf.fa_life==15}">青海省</c:if>
													<c:if test="${fuf.fa_life==16}">江苏省</c:if>
													<c:if test="${fuf.fa_life==17}">辽宁省</c:if>
													<c:if test="${fuf.fa_life==18}">吉林省</c:if>
													<c:if test="${fuf.fa_life==19}">台湾省</c:if>
													<c:if test="${fuf.fa_life==20}">河北省</c:if>
													<c:if test="${fuf.fa_life==21}">贵州省</c:if>
													<c:if test="${fuf.fa_life==22}">四川省</c:if>
													<c:if test="${fuf.fa_life==23}">云南省</c:if>
													<c:if test="${fuf.fa_life==24}">陕西省</c:if>
													<c:if test="${fuf.fa_life==25}">甘肃省</c:if>
													<c:if test="${fuf.fa_life==26}">黑龙江省</c:if>
													<c:if test="${fuf.fa_life==27}">香港特别行政区</c:if>
													<c:if test="${fuf.fa_life==28}">澳门特别行政区</c:if>
													<c:if test="${fuf.fa_life==29}">广西壮族自治区</c:if>
													<c:if test="${fuf.fa_life==30}">宁夏回族自治区</c:if>
													<c:if test="${fuf.fa_life==31}">新疆维吾尔自治区</c:if>
													<c:if test="${fuf.fa_life==32}">内蒙古自治区</c:if>
													<c:if test="${fuf.fa_life==33}">西藏自治区</c:if>
													
													</td>
												</tr>
												
											</table>
											
											</c:if>
											<c:if test="${ifri<=0}">
												该信息没有公开
											</c:if>
										</c:if>
										<!-- 保密 -->
										<c:if test="${fuf.fa_hide_base==2}">
											该信息没有公开
										</c:if>
										
										
									</div>
									
									<div class="pbm mbm bbda cl space_profile_box">
										<h2 class="mbn">论坛统计</h2>
										<table cellspacing="0" cellpadding="0" class="tb_profile">
											<col width="120px" />
											<col width="558px" />
											<tr class="column2">
												<td>好友数</td>
												<td>${myFri}</td>
											</tr>
											<tr class="column2">
												<td>回帖(评论)数</td>
												<td>${myAnswer}</td>
											</tr>
											<tr class="column2">
												<td>发帖数</td>
												<td>${myNote}</td>
											</tr>
										</table>
									</div>
									<div class="pbm mbm bbda cl space_profile_box">
										<h2 class="mbn">勋章</h2>
										<div class="column2">
												<c:if test="${honor!=null && honor!=''}">
													<c:forEach items="${honor}" var="hr">
														<img class="mleft15" src="${hr['image']}"> 
													
														
													</c:forEach>
												</c:if> <c:if test="${honor==null}">
			    													暂无获得勋章
			    								</c:if>	
										</div>
										
										
										
									</div>
									<div class="pbm mbm bbda cl space_profile_box">
										<h2 class="mbn">活跃概况</h2>
										<table cellspacing="0" cellpadding="0" class="tb_profile">
											<col width="120px" />
											<col width="558px" />
											<tr class="column2">
												<td>管理组</td>
												<td><font color="red">
												<c:if test="${fuf.fa_ishost==0}">普通会员</c:if>
												<c:if test="${fuf.fa_ishost==1}">模块版主</c:if>
												<c:if test="${fuf.fa_ishost==2}">超级版主</c:if>
												
												</font></td>
											</tr>
											<tr class="column2">
												<td>用户组</td>
												<td>
												<c:if test="${groupIds!=null && groupIds!=''}">
														<c:forEach items="${groupIds}" var="hr">
												        	${hr}&nbsp;&nbsp;&nbsp;
												        </c:forEach>
																</c:if> <c:if test="${groupIds==null}">
												    	暂无用户组
												 </c:if>
												
												
												</td>
											</tr>
											<tr class="column2">
												<td>标签</td>
												<td>
													<c:if test="${label!=null && label!=''}">
														<c:forEach items="${label}" var="hr">
												        	${hr['name']}&nbsp;&nbsp;&nbsp;
												        </c:forEach>
																</c:if> <c:if test="${label==null}">
												    	暂无标签
												    </c:if>

												</td>
											</tr>
											
										</table>
									</div>
									<div id="psts" class="cl space_profile_box"
										style="border: none;">
										<h2 class="mbn">个人信息</h2>
										<c:if test="${fuf.fa_hide_job==0}">
											<table cellspacing="0" cellpadding="0" class="tb_profile">
											<col width="120px" />
											<col width="558px" />
											
											<tr class="column2">
												<td>积分</td>
												<td>${fuf.fa_jifen}</td>
											</tr>
											<tr class="column2">
												<td>飞镖</td>
												<td>${fuf.fa_feibiao}</td>
											</tr>
											<tr class="column2">
												<td>学历</td>
												<td>	
													<c:if test="${fuf.fa_edu==0}">其他</c:if>
													<c:if test="${fuf.fa_edu==1}">小学</c:if>
													<c:if test="${fuf.fa_edu==2}">初中</c:if>
													<c:if test="${fuf.fa_edu==3}">高中</c:if>
													<c:if test="${fuf.fa_edu==4}">大专</c:if>
													<c:if test="${fuf.fa_edu==5}">本科</c:if>
													<c:if test="${fuf.fa_edu==6}">硕士</c:if>
													<c:if test="${fuf.fa_edu==7}">博士</c:if>
												</td>
											</tr>
											<tr class="column2">
												<td>毕业学校</td>
												<td>${fuf.fa_school}</td>
											</tr>
										</table>
										</c:if>
										<c:if test="${fuf.fa_hide_job==1}">
											<c:if test="${ifri>0}">
												<table cellspacing="0" cellpadding="0" class="tb_profile">
											<col width="120px" />
											<col width="558px" />
											
											<tr class="column2">
												<td>积分</td>
												<td>${fuf.fa_jifen}</td>
											</tr>
											<tr class="column2">
												<td>飞镖</td>
												<td>${fuf.fa_feibiao}</td>
											</tr>
											<tr class="column2">
												<td>学历</td>
												<td>	
													<c:if test="${fuf.fa_edu==0}">其他</c:if>
													<c:if test="${fuf.fa_edu==1}">小学</c:if>
													<c:if test="${fuf.fa_edu==2}">初中</c:if>
													<c:if test="${fuf.fa_edu==3}">高中</c:if>
													<c:if test="${fuf.fa_edu==4}">大专</c:if>
													<c:if test="${fuf.fa_edu==5}">本科</c:if>
													<c:if test="${fuf.fa_edu==6}">硕士</c:if>
													<c:if test="${fuf.fa_edu==7}">博士</c:if>
												</td>
											</tr>
											<tr class="column2">
												<td>毕业学校</td>
												<td>${fuf.fa_school}</td>
											</tr>
										</table>
											</c:if>
											<c:if test="${ifri<=0}">
												该信息没有公开
											</c:if>
										</c:if>
										<c:if test="${fuf.fa_hide_job==2}">
											该信息没有公开
										</c:if>
										
									</div>
								</div>
								<!--[diy=diycontentbottom]-->
								<div id="diycontentbottom" class="area"></div>
								<!--[/diy]-->
							</div>
						</div>
					</div>
				</div>
				<div class="cr"></div>
			</div>
			<div class="wp mtn">
				<!--[diy=diy3]-->
				<div id="diy3" class="area"></div>
				<!--[/diy]-->
			</div>
			<c:import url="${path}/feiiombend.jsp"></c:import>
			
			<!--fwinmask end-->
			<div id="scrolltop2" class="scrolltop2"></div>
</body>
<script type="text/javascript" src="/js/commom.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript">
	login();
	loginbox();
	a_friend_li_2();
	flbc();
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
	$(function() {
		/* $("#append_parent").show();
		$("#showMsg").text("系统发生错误"); */
	})
</script>
</html>
