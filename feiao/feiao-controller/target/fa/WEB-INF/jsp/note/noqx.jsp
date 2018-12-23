<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_common.css" />
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_forum_forumdisplay.css">
	<link rel="stylesheet" type="text/css" href="/css/header.css">
		<link rel="stylesheet" type="text/css" href="/data/cache/mystyle.css" />
		<link rel="stylesheet" type="text/css" href="/data/cache/style_1_forum_viewthread.css" />
		<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="/js/commom.js"></script>
		<script type="text/javascript" src="/js/aa.js"></script>
		<script type="text/javascript" charset="utf-8"
			src="${path}/kindeditor/kindeditor.js"></script>
		<style>
</style>
		
</head>

<body id="nv_forum" class="pg_viewthread">

	<div id="hd">
		<div id="w_header">

			<c:import url="${path}/feiiohead.jsp"></c:import>
			<!--version: 2016-12-01 15:16:51-->
		</div>
		<div id="wp" class="wp">
			<link rel="stylesheet"
				href="/static_new/pc/css/forum/lottery-48900a4070.css">
				<script type="text/javascript">
					var fid = parseInt('22'), tid = parseInt('2493275');
				</script>
				<script src="/static_new/pc/js/common/forum_moderate-b3cb01d5c8.js"
					type="text/javascript"></script>
				<script src="/static_new/pc/js/forum/forum_all-638680fae2.js"
					type="text/javascript"></script>
				<script type="text/javascript">
					zoomstatus = parseInt(0);
					var imagemaxwidth = '700';
					var aimgcount = new Array();
				</script>
				<style id="diy_style" type="text/css"></style>
				<!--[diy=diynavtop]-->
				<div id="diynavtop" class="area"></div>
				<!--[/diy]-->
				<style id="diy_style" type="text/css"></style>
				<div class="wp">
					<!--[diy=diy1]-->
					<div id="diy1" class="area"></div>
					<!--[/diy]-->
				</div>
				<div class="wp cl">
					<div id="expandBox" class="expandbox_mn" style="">
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
						</div>
						<div class="titlebar_expand">
							<h3>版块信息</h3>
							<span>发帖总量&nbsp;:&nbsp;${totalCount}</span>
						</div>
						<div class="readblock_expand rules_expand">
							<div class="bm_pintro">
								版主 : <span class="xi2"> <c:if
										test="${sns!=null && !empty sns}">
										<c:forEach items="${sns}" var="sn">
											<a href="/fiioer/showMemberMsg.do?id=${sn['id']}"
												class="notabs">${sn['name']}</a>
										</c:forEach>
									</c:if> <c:if test="${sns==null || empty sns}">
									该板块还没有设立版主
								</c:if>


								</span>
							</div>
							<c:if
								test="${fu.fa_ishost>1 || fu.fa_sectionid==faSection.fa_id}">
								<div id="bj1" style="display: none">
									<a href="javascript:void(0)" id="bianji1">预览</a>
									<div class="ptn xg2">
										<textarea rows="6" cols="37" id="descss">${faSection.fa_desc}</textarea>
									</div>
									<a href="javascript:void(0)" style="float: right;"
										id="suredese">确认</a>
								</div>
								<div id="bj2">
									<a href="javascript:void(0)" id="bianji2">编辑</a>
									<div class="ptn xg2 eeeee">${faSection.fa_desc}</div>
								</div>
							</c:if>
							<c:if
								test="${fu.fa_ishost<=1 && fu.fa_sectionid!=faSection.fa_id}">
								<div id="bj2">

									<div class="ptn xg2 eeeee">${faSection.fa_desc}</div>
								</div>

							</c:if>


						</div>
						<div class="titlebar_expand">
							<h3>推荐阅读</h3>
						</div>
						<div class="readblock_expand recread_expand">
							<div id="portal_block_701" class="inrotate_img block move-span">
								<div id="portal_block_701_content" class="dxb_bc">
									<ul class="toprec_recread cl">
										<c:if test="${hasImage!=null &&!empty hasImage}">
											<c:forEach items="${hasImage}" var="hi">
												<li><a href="${hi['fa_url']}"><img
														src="${hi['fa_image']}" width="124" height="100"></a> <a
													href="${hi['fa_url']}">
														<p>${hi['fa_name']}</p>
												</a></li>
											</c:forEach>

										</c:if>


									</ul>
								</div>
							</div>
							<div id="portal_block_761"
								class="padding_margin0 block move-span">
								<div class="bread_line">
									<div class="line"></div>
									<div class="cr"></div>
								</div>
								<div id="portal_block_761_content" class="dxb_bc">
									<ul class="recitems_recread cl">
										<c:if test="${noImage!=null &&!empty noImage}">
											<c:forEach items="${noImage}" var="ni">
												<li class="thread"><a href="${ni['fa_url']}">${ni['fa_name']}</a></li>
											</c:forEach>
										</c:if>



									</ul>
								</div>
							</div>
						</div>


					</div>


















					<div id="ct" class="plate_mn postcontbox_mn">
						<div id="postlist" class="pl bm wp_postlist">
							<div class="headdiv_post">
								<div id="pt" class="bm cl bread_post">
									<div class="z">
										<a href="/">互动社区</a> <em>></em> <a
											href="/note/showFSection.do?id=${faSection.fa_id}">${faSection.fa_name}</a>
									</div>
								</div>
								
								
							</div>
							<div id="post_39920445"
								class="item_postlist graybar_postlist firstitem_postlist">
								<table id="pid39920445" cellspacing="0" cellpadding="0">
									<col width="64px" />
									<col width="594px" />
									<tr>
										<!--第一个帖子-->
										<td class="plc" colspan="2">
											<div class="thread_postlist">
												<div class="posttitlewrap ">
													
													<div class="posttitle ">
														<a id="thread_subject " href="/login.do"
															style="font-size: 24px;">对不起，你没有权限浏览该贴，请<font color="red">登录</font>或者提升等级 </a>
															
													</div>
												</div>
												<div class="pi infobar_post">
													
													<div class="pti barl_post ">
														<div class="pdbt "></div>
														
													</div>
												</div>
												<div class="pct postcont_postlist fontsizelimit">
													<div class="pcb">
														<div class="t_fsz">
															<table cellspacing="0" cellpadding="0">
																
																

																
															</table>
														</div>




														<div style="clear: both;"></div>
														

													</div>
												</div>
										</td>
									</tr>
								</table>
							</div>
						</div>

						
						<div id="diyfastposttop" class="area"></div>
						
					</div>
				</div>
			<div class="wp mtn">
				<div id="diy3" class="area"></div>
				
			</div>

		</div>
	</div>


	<c:import url="${path}/feiiombend.jsp"></c:import>
	<!--fwinmask end-->
	<div id="scrolltop2" style="left: 1491.5px; display: block;"
		class="scrolltop2"></div>

</body>
<script type="text/javascript">
	login();
	loginbox();
	$(".light").click(function() {
		$(".fwinmask1").show();
	})
	$(".more").click(function() {
		$(".p_pop2").toggle();
	});
	$(".flbc").click(function() {
		$(".fwinmask1").hide();
		$(".fwinmask2").hide();
		$(".fwinmask3").hide();
		$(".fwinmask4").hide();
		$(".fwinmask5").hide();
	})
	$(".dpbtn1").click(function() {
		$(".time").toggle();
	});
	$(".topic").click(function() {
		$(".fwinmask2").show();
	});
	$(".close").click(function() {
		$(".fwinmask3").show();
	});
	$(".sj").click(function() {
		$(".fwinmask4").show();
	});
	$(".move").click(function() {
		$(".fwinmask5").show();
	});
	$(".share-part  img").click(function() {
		$(".share-box").toggle();
	});
	$("#itemcp_digest").click(function(argument) {
		$(".dopt1").toggle();
	});
	$(".dpbtn2").click(function() {
		$(".replay").toggle();
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
</script>
<script>
	$(function() {
		var a = new Array("日", "一", "二", "三", "四", "五", "六");
		var week = new Date().getDay();
		var str = "星期" + a[week];
		$("#weekday").html(str)

		$("#hyg").click(
				function() {
					$("#vmss").attr("src",
							"${path}/verify/show.do?random=" + Math.random());
				})
		var url = "/note/selectNoteComment.do"
		
		
		//上一页
		$("#lastpage").click(function() {
			var cp = Number(($("#curpage").text())) - 1
			pageData({
				"curpage" : cp,
				"id" : "${fn.fa_id}"
			}, url)
		})
		//第二页
		$("#secondpage").click(function() {
			var cp = Number(($("#curpage").text())) + 1
			pageData({
				"curpage" : cp,
				"id" : "${fn.fa_id}"
			}, url)
		})
		//第三页
		$("#thirdpage").click(function() {
			var cp = Number(($("#curpage").text())) + 2
			pageData({
				"curpage" : cp,
				"id" : "${fn.fa_id}"
			}, url)
		})
		//第四页
		$("#forthpage").click(function() {
			var cp = Number(($("#curpage").text())) + 3
			pageData({
				"curpage" : cp,
				"id" : "${fn.fa_id}"
			}, url)
		})
		//第末页
		$("#fifthpage").click(function() {
			var cp = Number(($("#fifthpage").text()))
			pageData({
				"curpage" : cp,
				"id" : "${fn.fa_id}"
			}, url)
		})
		//下一页
		$("#nextpage").click(function() {
			var cp = Number(($("#curpage").text())) + 1
			pageData({
				"curpage" : cp,
				"id" : "${fn.fa_id}"
			}, url)
		})
		//修改处理状态
				$("#xgclzt").click(function(){
					var i =0;
					if ("${fu.fa_ishost}" == 2
							|| "${fu.fa_sectionid}" == "${faSection.fa_id}") {
						i = 1;
					}
					$.ajax({
						url:"/note/updateNoteDealStatus.do",
						data:{"status":$("#selectids").val(),"ishost":i,"id":"${fn.fa_id}"},
						type:"post",
						dataType:"json",
						success:function(data){
							if (data.tip == "success") {
								$("#append_parent").show();
								$("#closeTip").hide();
								$("#showMsg").text("设置成功,请刷新一下页面更新状态");
								setTimeout(function() {
									$("#closeTip").show();
									$("#append_parent").hide();
								}, 1000)
							} else {
								$("#append_parent").show();
								$("#showMsg").text(data.tip);
								setTimeout(function() {
									$("#append_parent").hide();
								}, 2000)
							}
						},
						error:function(){
							$("#append_parent").show();
							$("#showMsg").text("系统发生错误");
							setTimeout(function() {
								$("#append_parent").hide();
							}, 2000)
						}
					})
				})
		//提交投票结果
		$("#tijiao").click(function(){
			$.ajax({
					url : "/note/tijiaovote.do",
					data : $("#voteForm").serialize(),
					type : "post",
					dataType : "json",
					success : function(data) {
						if(data.tip=="success"){
							$("#append_parent").show();
							$("#showMsg").text("投票成功");
							setTimeout(
									function() {
										$("#append_parent").hide();
										window.location.href = "/note/showNoteContent.do?id=${fn.fa_id}";
									}, 2000)
						}else{
							$("#append_parent").show();
							$("#showMsg").text(data.tip);
							setTimeout(
									function() {
										$("#append_parent").hide();
										
									}, 2000)
						}
						

					},
					error : function() {
						$("#append_parent").show();
						$("#showMsg").text("系统发生错误");
						setTimeout(function() {
							$("#append_parent").hide();
						}, 2000)
					}

				})
		})
		//修改帖子
		$("#updateBtns").click(function() {
			var i = 0;
			if ("${fu.fa_ishost}" == 2 || "${fu.fa_sectionid}" == "${faSection.fa_id}" || "${fu.fa_id}"=="${fn.fa_userid}") {
				i = 1;
			}
			if(i>0){
				window.location.href="/note/showUpdateNote.do?id=${fn.fa_id}";
			}
		})
		//删除主题
		$("#deleteNote")
				.click(
						function() {
							var i = 0;
							if ("${fu.fa_ishost}" == 2
									|| "${fu.fa_sectionid}" == "${faSection.fa_id}") {
								i = 1;
							}
							$
									.ajax({
										url : "/note/deleteNote.do",
										data : {
											"ids" : "${fn.fa_id}",
											"ishost" : i
										},
										type : "post",
										dataType : "json",
										success : function(data) {
											if (data.tip == "success") {
												$("#append_parent").show();
												$("#closeTip").hide();
												$("#showMsg").text("删除成功");
												setTimeout(
														function() {
															window.location.href = "/note/showFSection.do?id=${faSection.fa_id}";
														}, 1000)
											} else {
												$("#append_parent").show();
												$("#showMsg").text(data.tip);
												setTimeout(function() {
													$("#append_parent").hide();
												}, 2000)
											}
										},
										error : function() {
											$("#append_parent").show();
											$("#showMsg").text("系统发生错误");
											setTimeout(function() {
												$("#append_parent").hide();
											}, 2000)
										}
									})
						})
		//高亮
		$("#gaoliang").click(
				function() {
					var i = 0;
					if ("${fu.fa_ishost}" == 2
							|| "${fu.fa_sectionid}" == "${faSection.fa_id}") {
						i = 1;
					}
					var j = "${fn.fa_gaoliang}";
					if (j == 1) {
						j = 0;
					} else {
						j = 1;
					}
					$.ajax({
						url : "/note/glNote.do",
						data : {
							"ids" : "${fn.fa_id}",
							"ishost" : i,
							"types" : j
						},
						type : "post",
						dataType : "json",
						success : function(data) {
							if (data.tip == "success") {
								$("#append_parent").show();
								$("#showMsg").text("设置成功");
								setTimeout(function() {
									$("#append_parent").hide();
								}, 1000)
							} else {
								$("#append_parent").show();
								$("#showMsg").text(data.tip);
								setTimeout(function() {
									$("#append_parent").hide();
								}, 2000)
							}
						},
						error : function() {
							$("#append_parent").show();
							$("#showMsg").text("系统发生错误");
							setTimeout(function() {
								$("#append_parent").hide();
							}, 2000)
						}
					})
				})
		//精品
		$("#jingpin").click(
				function() {
					var i = 0;
					if ("${fu.fa_ishost}" == 2
							|| "${fu.fa_sectionid}" == "${faSection.fa_id}") {
						i = 1;
					}
					var j = "${fn.fa_jingpin}";
					if (j == 1) {
						j = 0;
					} else {
						j = 1;
					}
					$.ajax({
						url : "/note/jhNote.do",
						data : {
							"ids" : "${fn.fa_id}",
							"ishost" : i,
							"types" : j
						},
						type : "post",
						dataType : "json",
						success : function(data) {
							if (data.tip == "success") {
								$("#append_parent").show();
								$("#showMsg").text("设置成功");
								setTimeout(function() {
									$("#append_parent").hide();
								}, 1000)
							} else {
								$("#append_parent").show();
								$("#showMsg").text(data.tip);
								setTimeout(function() {
									$("#append_parent").hide();
								}, 2000)
							}
						},
						error : function() {
							$("#append_parent").show();
							$("#showMsg").text("系统发生错误");
							setTimeout(function() {
								$("#append_parent").hide();
							}, 2000)
						}
					})
				})
		//置顶
		$("#zhiding").click(
				function() {
					var i = 0;
					if ("${fu.fa_ishost}" == 2
							|| "${fu.fa_sectionid}" == "${faSection.fa_id}") {
						i = 1;
					}
					var j = "${fn.fa_zhiding}";
					if (j == 1) {
						j = 0;
					} else {
						j = 1;
					}
					$.ajax({
						url : "/note/zdNote.do",
						data : {
							"ids" : "${fn.fa_id}",
							"ishost" : i,
							"types" : j
						},
						type : "post",
						dataType : "json",
						success : function(data) {
							if (data.tip == "success") {
								$("#append_parent").show();
								$("#showMsg").text("设置成功");
								setTimeout(function() {
									$("#append_parent").hide();
								}, 1000)
							} else {
								$("#append_parent").show();
								$("#showMsg").text(data.tip);
								setTimeout(function() {
									$("#append_parent").hide();
								}, 2000)
							}
						},
						error : function() {
							$("#append_parent").show();
							$("#showMsg").text("系统发生错误");
							setTimeout(function() {
								$("#append_parent").hide();
							}, 2000)
						}
					})
				})
		//热搜
		$("#resou").click(
				function() {
					var i = 0;
					if ("${fu.fa_ishost}" == 2
							|| "${fu.fa_sectionid}" == "${faSection.fa_id}") {
						i = 1;
					}
					var j = "${fn.fa_nohot}";
					if (j == 1) {
						j = 0;
					} else {
						j = 1;
					}
					$.ajax({
						url : "/note/rsNote.do",
						data : {
							"ids" : "${fn.fa_id}",
							"ishost" : i,
							"types" : j
						},
						type : "post",
						dataType : "json",
						success : function(data) {
							if (data.tip == "success") {
								$("#append_parent").show();
								$("#showMsg").text("设置成功");
								setTimeout(function() {
									$("#append_parent").hide();
								}, 1000)
							} else {
								$("#append_parent").show();
								$("#showMsg").text(data.tip);
								setTimeout(function() {
									$("#append_parent").hide();
								}, 2000)
							}
						},
						error : function() {
							$("#append_parent").show();
							$("#showMsg").text("系统发生错误");
							setTimeout(function() {
								$("#append_parent").hide();
							}, 2000)
						}
					})
				})
		//移动
		$("#moveNote").click(function() {
			if ($("#moveModel").is(":hidden")) {
				$("#moveModel").show();
			} else {
				$("#moveModel").hide();
			}
		})
		//移动到哪个模块
		$(".moveModels").click(
				function() {
					var t = $(this).prop("id");
					var i = 0;
					if ("${fu.fa_ishost}" == 2
							|| "${fu.fa_sectionid}" == "${faSection.fa_id}") {
						i = 1;
					}
					$.ajax({
						url : "/note/moveNote.do",
						data : {
							"ids" : "${fn.fa_id}",
							"ishost" : i,
							"typeid" : t
						},
						type : "post",
						dataType : "json",
						success : function(data) {
							if (data.tip == "success") {
								$("#append_parent").show();
								$("#showMsg").text("移动成功");
								setTimeout(function() {
									$("#append_parent").hide();
								}, 1000)
							} else {
								$("#append_parent").show();
								$("#showMsg").text(data.tip);
								setTimeout(function() {
									$("#append_parent").hide();
								}, 2000)
							}
						},
						error : function() {
							$("#append_parent").show();
							$("#showMsg").text("系统发生错误");
							setTimeout(function() {
								$("#append_parent").hide();
							}, 2000)
						}
					})
				})
		//升降
		$("#udzz").click(function() {
			if ($("#udsort").is(":hidden")) {
				$("#udsort").show();
			} else {
				$("#udsort").hide();
			}
		})
		//升还是降降
		$(".udsorts").click(
				function() {
					var t = $(this).prop("id");
					var i = 0;
					if ("${fu.fa_ishost}" == 2
							|| "${fu.fa_sectionid}" == "${faSection.fa_id}") {
						i = 1;
					}
					$.ajax({
						url : "/note/udNote.do",
						data : {
							"ids" : "${fn.fa_id}",
							"ishost" : i,
							"typeid" : t
						},
						type : "post",
						dataType : "json",
						success : function(data) {
							if (data.tip == "success") {
								$("#append_parent").show();
								$("#showMsg").text("设置成功");
								setTimeout(function() {
									$("#append_parent").hide();
								}, 1000)
							} else {
								$("#append_parent").show();
								$("#showMsg").text(data.tip);
								setTimeout(function() {
									$("#append_parent").hide();
								}, 2000)
							}
						},
						error : function() {
							$("#append_parent").show();
							$("#showMsg").text("系统发生错误");
							setTimeout(function() {
								$("#append_parent").hide();
							}, 2000)
						}
					})
				})
		//导出
		$('#excelbtn')
				.click(
						function() {
							window.location.href = "${path}/note/excelToActive.do?id=${fn.fa_id}";
						});
		//我要报名
		$("#myjoin").click(function() {
			$.ajax({
				url : "/note/myjoin.do",
				data : {
					"nid" : "${fn.fa_id}",
					"total" : "${fn.fa_total_people}"
				},
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data.tip == "success") {
						$("#append_parent").show();
						$("#showMsg").text("报名成功");
						setTimeout(function() {
							$("#append_parent").hide();
						}, 1000)
					} else {
						$("#append_parent").show();
						$("#showMsg").text(data.tip);
						setTimeout(function() {
							$("#append_parent").hide();
						}, 2000)
					}
				},
				error : function() {
					$("#append_parent").show();
					$("#showMsg").text("系统发生错误");
					setTimeout(function() {
						$("#append_parent").hide();
					}, 2000)
				}
			})
		})
		//标签
		$("#biaoqian").click(function() {
			if ($("#biaoqians").is(":hidden")) {
				$("#biaoqians").show();
			} else {
				$("#biaoqians").hide();
			}
		})
		$(".biaoqianss").click(
				function() {
					var t = $(this).prop("id");
					var i = 0;
					if ("${fu.fa_ishost}" == 2
							|| "${fu.fa_sectionid}" == "${faSection.fa_id}") {
						i = 1;
					}
					$.ajax({
						url : "/note/biaoqianNote.do",
						data : {
							"ids" : "${fn.fa_id}",
							"ishost" : i,
							"typeid" : t
						},
						type : "post",
						dataType : "json",
						success : function(data) {
							if (data.tip == "success") {
								$("#append_parent").show();
								$("#showMsg").text("设置成功");
								setTimeout(function() {
									$("#append_parent").hide();
								}, 1000)
							} else {
								$("#append_parent").show();
								$("#showMsg").text(data.tip);
								setTimeout(function() {
									$("#append_parent").hide();
								}, 2000)
							}
						},
						error : function() {
							$("#append_parent").show();
							$("#showMsg").text("系统发生错误");
							setTimeout(function() {
								$("#append_parent").hide();
							}, 2000)
						}
					})
				})
		if (Number("${issign}") > 0) {
			$("#qiandao").text("已签到")
		} else {
			$("#qiandao").html("签&nbsp;到")
		}
		//签到
		$("#qiandao").click(function() {
			if ("${fu}" != null && "${fu}" != "") {
				$.ajax({
					url : "/note/signIsTrue.do",
					type : "post",
					dataType : "json",
					success : function(data) {
						if (data.tip == "success") {
							$(".tips_signin").show();
							$("#tipz").html('恭喜你，签到成功')
							setTimeout(function() {
								$(".tips_signin").hide();
							}, 2000)
						} else {
							$(".tips_signin").show();
							$("#tipz").html(data.tip)
							setTimeout(function() {
								$(".tips_signin").hide();
							}, 2000)
						}
					},
					error : function() {
						$(".tips_signin").show();
						$("#tipz").html('系统发生异常,请稍后再操作')
						setTimeout(function() {
							$(".tips_signin").hide();
						}, 2000)
					}
				})

			} else {
				$(".tips_signin").show();
				$("#tipz").html('请先<a href="/login.do">登录</a>')
				setTimeout(function() {
					$(".tips_signin").hide();
				}, 2000)
			}

		})
		//预览
		$("#bianji1").click(function() {
			$("#bj1").hide();
			$("#bj2").show();

		})

		//编辑
		$("#bianji2").click(function() {
			$("#bj2").hide();
			$("#bj1").show();

		})
		//确认编辑编辑
		$("#suredese").click(function() {
			$.ajax({
				url : "/note/updateSectionMsg.do",
				data : {
					"nid" : "${faSection.fa_id}",
					"desc" : $("#descss").val()
				},
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data.tip == "success") {
						$("#append_parent").show();
						$("#showMsg").text("修改成功");
						$(".eeeee").html($("#descss").val())

						setTimeout(function() {
							$("#append_parent").hide();
						}, 1000)
					} else {
						$("#append_parent").show();
						$("#showMsg").text(data.tip);
						setTimeout(function() {
							$("#append_parent").hide();
						}, 2000)
					}
				},
				error : function() {
					$("#append_parent").show();
					$("#showMsg").text("系统发生异常，请重新操作");
					setTimeout(function() {
						$("#append_parent").hide();
					}, 2000)
				}
			})

		})
		//回复
		$("#fabiaos").click(
				function() {
					document.getElementById("content1").value = KE.util
							.getData('content1');
					$.ajax({
						url : "/note/createCommentByNote.do",
						data : $("#userForm").serialize(),
						type : "post",
						dataType : "json",
						success : function(data) {
							if (data.tip == "success") {
								$("#append_parent").show();
								$("#closeTip").hide();
								$("#showMsg").text("发表成功");
								var cp = Number(($("#fifthpage").text()))
								$("#vmss").trigger("click");
								pageData({
									"curpage" : cp,
									"id" : "${fn.fa_id}"
								}, url)
								setTimeout(function() {
									$("#closeTip").show();
									$("#append_parent").hide();
								}, 1000)
							} else {
								$("#append_parent").show();
								$("#showMsg").text(data.tip);
								setTimeout(function() {
									$("#append_parent").hide();
								}, 2000)
							}
						},
						error : function() {
							$("#append_parent").show();
							$("#showMsg").text("系统发生错误");
							setTimeout(function() {
								$("#append_parent").hide();
							}, 2000)
						}
					})
				})
		$("#fj_btns").blur(function() {
			$("#tzs").val($("#fj_btns").val())
			pageData({
				"curpage" : 1,
				"id" : "${fn.fa_id}",
				"floor" : $("#fj_btns").val()
			}, url)

		})
	})
	function pageData(data, url) {
		$
				.ajax({
					url : url,
					data : data,
					type : "post",
					dataType : "json",
					success : function(data) {
						var vas = "";
						/* 
						
						 */
						if (data.rows != null && data.rows.length > 0) {
							for (i in data.rows) {
								var vat = '<div  class="item_postlist graybar_postlist" id="'+data.rows[i].floor+'s"><table  cellspacing="0" cellpadding="0"><col width="64px" /><col width="594px" /><tr><td class="pls" rowspan="2"><div><div class="avatar head_uinfo"><img src="'+data.rows[i].image+'" /><span class="shadowbox_avatar"> </span></div></div></td><td class="plc"><div class="pi infobar_post"><div class="barr_post"><strong class="z floor_infobar"> <a href="javascript:void(0)" >'
										+ data.rows[i].floor
										+ '楼</a></strong></div><div class="pti barl_post"><div class="pdbt"></div><div class="authi"><a class="name_uinfo" href="/fiioer/showMemberMsg.do?id='
										+ data.rows[i].uid
										+ '" class="xw1">'
										+ data.rows[i].uname
										+ '</a><em class="userlevel_uinfo"> <a class="mzvip" href="javascript:void(0)"><img src="'+data.rows[i].rimage+'" width="15px"></a><a href="javascript:void(0)" class="mzpower"><font color="#999999">'
										+ data.rows[i].rname
										+ '</font></a> <span class="cr"></span></em> <span ><span>'
										+ data.rows[i].day
										+ '</span></span></div></div></div><div class="pct postcont_postlist fontsizelimit"><div class="pcb"><div class="pcbs"><table cellspacing="0" cellpadding="0"><tr><td class="t_f" ><div>'
										+ data.rows[i].msg
										+ '</div></td></tr></table></div></div></div></td></tr><tr><td class="plc plm"></td></tr><tr><td class="pls"></td><td class="plc cbar_postlist"><div class="score_post"><a href="javascript:void(0)" class="xi2"></a></div><div class="po cbarbox_postlist"><div class="pob"><a class="fastre hfs" href="javascript:;">回复</a> <a id="'+data.rows[i].uid+'hf" class="support_oppose fanduis" href="javascript:;" id="'+data.rows[i].uid+'fd" > <i></i></a> <a id="recommend_add_157768709" class="support_oppose zhichis" href="javascript:;" id="'+data.rows[i].uid+'zc"> <i></i></a> <em> </em><div class="cr"></div></div></div><div class="cr"></div></td></tr><tr class="ad"></td></tr></table>';
								vat = vat
										+ '<div  style="display: none;width: 658px;" class="flw_replybox cl ct owenpl" id="'+data.rows[i].floor+'z"><span class="cnr" style="margin-right: 5px;"></span><form id="'+data.rows[i].id+'forms" class="mbm"><input type="hidden" name="iscode" value="${iscode}" ><input type="hidden" name="pid" value="'+data.rows[i].id+'" ><input type="hidden" name="rid" value="${fn.fa_id}" > <span class="flw_autopt"> <textarea name="desc" class="pts" cols="80" rows="4"></textarea></span><div style="margin: 30px 0px;"><button type="button" style="float:right; margin-left:20px;    background: #11b1e5 !important;"  class="pn pnc qrhf"><span>回复</span></button><div class="cr"></div><div class="mtm">'
								if (Number("${iscode}") > 0) {
									vat = vat
											+ '<ul><li><em class="d">验证码</em><span id="seccodeSA0"><input name="vode" id="seccodeverify_SA0" type="text" style="ime-mode: disabled; width: 100px" class="txt px vm"> <span id="seccode_SA0_secshow" class="seccode_image"><img width="150" height="60" src="${path}/verify/show.do" class="vm vmss"></span>  <span id="checkseccodeverify_SA0" class="seccheck_status"></span></span></li></ul>'
								}

								vat = vat
										+ '</div></form><ul id="'+data.rows[i].id+'ul" class="list_replybox"><input type="hidden" id="'+data.rows[i].id+'ip" value="1" /></ul><div class="cl closebar_replybox"><a href="javascript:;" class="y xg1 xg2 qwertyus"></a><a href="javascript:void(0)" id="'
										+ data.rows[i].id
										+ 'aa"   class="xi2 ggcv">加载更多》》》</a></div></div></div></div>';
								vas = vas + vat;

							}

							$("#sessionMsg").html(vas)
							if (data.curpage == 1) {
								$("#postlist").show();
							} else {
								$("#postlist").hide();
							}
							if (data.isfloor > 0) {
								location.href = "#" + $("#tzs").val() + "s"
								$("#" + $("#tzs").val() + "z").show();
								var id = $("#" + $("#tzs").val() + "s").find(
										'ul.list_replybox').prop("id");
								id = id.substring(0, id.length - 2)
								//加载
								$
										.ajax({
											url : "/fiioer/getMoreMoodMsg.do",
											data : {
												"id" : id,
												"curpage" : $("#" + id + "ip")
														.val()
											},
											type : "post",
											dataType : "json",
											success : function(data) {
												var vaq = "";
												if (data.rows != null
														&& data.rows.length > 0) {
													for (i in data.rows) {
														var vat = '<li><a href="javascript:void(0)" class="d xi2">'
																+ data.rows[i].name
																+ '&nbsp;&nbsp;</a>'
																+ data.rows[i].msg
																+ '</li>';
														vaq = vaq + vat
													}

													//追加到页面
													if ($("#" + data.id + "ip")
															.val() >= data.totalpage) {
														$("#" + data.id + "aa")
																.hide();
													} else {
														$("#" + data.id + "aa")
																.show();
													}
													$("#" + data.id + "ip")
															.val(
																	Number($(
																			"#"
																					+ data.id
																					+ "ip")
																			.val()) + 1);
													$("#" + data.id + "ul")
															.append(vaq)

												} else {

													$("#" + data.id + "aa")
															.hide();

												}
											}

										})

							}

						} else {
							$("#sessionMsg")
									.html(
											'<div class="item_postlist graybar_postlist"><br>该帖子还没有任何评论<br></div>')
						}

						//加到分页页面curpage
						$("#curpage").text(data.curpage);
						$("#totalsize").val(data.totalsize);
						$("#secondpage").text(Number(data.curpage) + 1);
						$("#thirdpage").text(Number(data.curpage) + 2);
						$("#forthpage").text(Number(data.curpage) + 3);
						$("#fifthpage").text(Number(data.totalpage));
						if (data.curpage == 1) {
							$("#lastpage").hide();
						} else {
							$("#lastpage").show();
						}
						if (data.curpage >= data.totalpage) {
							$("#nextpage").hide();
							$("#secondpage").hide();
						} else {
							$("#nextpage").show();
							$("#secondpage").show();
						}
						if (Number(data.curpage) + 2 > data.totalpage) {
							$("#thirdpage").hide();
						} else {
							$("#thirdpage").show();
						}
						if (Number(data.curpage) + 3 > data.totalpage) {
							$("#forthpage").hide();
						} else {
							$("#forthpage").show();
						}
						if (Number(data.curpage) + 3 >= Number(data.totalpage)) {
							$("#fifthpage").hide();
						} else {
							$("#fifthpage").show();
						}

						//关闭
						$(".qwertyus").click(function() {
							$(this).parent().parent().parent().parent().hide();
						})
						//加载更多
						$(".ggcv")
								.click(
										function() {

											var idz = $(this).prop("id");
											idz = idz.substring(0,
													idz.length - 2)
											//加载
											$
													.ajax({
														url : "/fiioer/getMoreMoodMsg.do",
														data : {
															"id" : idz,
															"curpage" : $(
																	"#"
																			+ idz
																			+ "ip")
																	.val()
														},
														type : "post",
														dataType : "json",
														success : function(data) {
															var vaq = "";
															if (data.rows != null
																	&& data.rows.length > 0) {
																for (i in data.rows) {
																	var vat = '<li><a href="javascript:void(0)" class="d xi2">'
																			+ data.rows[i].name
																			+ '&nbsp;&nbsp;</a>'
																			+ data.rows[i].msg
																			+ '</li>';
																	vaq = vaq
																			+ vat
																}

																//追加到页面
																if ($(
																		"#"
																				+ data.id
																				+ "ip")
																		.val() >= data.totalpage) {
																	$(
																			"#"
																					+ data.id
																					+ "aa")
																			.hide();
																} else {
																	$(
																			"#"
																					+ data.id
																					+ "aa")
																			.show();
																}
																$(
																		"#"
																				+ data.id
																				+ "ip")
																		.val(
																				Number($(
																						"#"
																								+ data.id
																								+ "ip")
																						.val()) + 1);
																$(
																		"#"
																				+ data.id
																				+ "ul")
																		.append(
																				vaq)

															} else {

																$(
																		"#"
																				+ data.id
																				+ "aa")
																		.hide();

															}
														}

													})
										})
						//点击回复
						$(".hfs")
								.click(
										function() {
											var divs = $(this).parent()
													.parent().parent().parent()
													.parent().parent().parent()
													.find('div.owenpl');
											if (divs.is(":hidden")) {
												divs.show();
											} else {
												divs.hide();
											}
											var id = $(this).parent().parent()
													.parent().parent().parent()
													.parent().parent().find(
															'div.owenpl').find(
															'ul.list_replybox')
													.prop("id");
											id = id.substring(0, id.length - 2)
											//加载
											$
													.ajax({
														url : "/fiioer/getMoreMoodMsg.do",
														data : {
															"id" : id,
															"curpage" : $(
																	"#"
																			+ id
																			+ "ip")
																	.val()
														},
														type : "post",
														dataType : "json",
														success : function(data) {
															var vaq = "";
															if (data.rows != null
																	&& data.rows.length > 0) {
																for (i in data.rows) {
																	var vat = '<li><a href="javascript:void(0)" class="d xi2">'
																			+ data.rows[i].name
																			+ '&nbsp;&nbsp;</a>'
																			+ data.rows[i].msg
																			+ '</li>';
																	vaq = vaq
																			+ vat
																}

																//追加到页面
																if ($(
																		"#"
																				+ data.id
																				+ "ip")
																		.val() >= data.totalpage) {
																	$(
																			"#"
																					+ data.id
																					+ "aa")
																			.hide();
																} else {
																	$(
																			"#"
																					+ data.id
																					+ "aa")
																			.show();
																}
																$(
																		"#"
																				+ data.id
																				+ "ip")
																		.val(
																				Number($(
																						"#"
																								+ data.id
																								+ "ip")
																						.val()) + 1);
																$(
																		"#"
																				+ data.id
																				+ "ul")
																		.append(
																				vaq)

															} else {

																$(
																		"#"
																				+ data.id
																				+ "aa")
																		.hide();

															}
														}

													})
										})
						//确认回复
						$(".qrhf")
								.click(
										function() {

											var divs = $(this).parent()
													.parent().prop("id");

											$
													.ajax({
														url : "/fiioer/sureReply.do",
														data : $("#" + divs)
																.serialize()
																+ "&fid=${fu.fa_id}",
														type : "post",
														dataType : "json",
														success : function(data) {
															if (data.tip == "success") {
																$(
																		"#append_parent")
																		.show();
																$("#showMsg")
																		.text(
																				"回复成功");
																$(".vmss")
																		.trigger(
																				"click");
																var vat = '<li><a href="javascript:void(0)" class="d xi2">${fu.fa_username}&nbsp;&nbsp;</a>'
																		+ data.msg
																		+ '</li>';
																$(
																		"#"
																				+ data.id
																				+ "ul")
																		.prepend(
																				vat)
																setTimeout(
																		function() {
																			$(
																					"#append_parent")
																					.hide();
																		}, 2000)
															} else {
																$(
																		"#append_parent")
																		.show();
																$("#showMsg")
																		.text(
																				data.tip);
																$(".vmss")
																		.trigger(
																				"click");
																setTimeout(
																		function() {
																			$(
																					"#append_parent")
																					.hide();
																		}, 2000)
															}
														},
														error : function() {
															$("#append_parent")
																	.show();
															$("#showMsg").text(
																	"系统发生错误");
															setTimeout(
																	function() {
																		$(
																				"#append_parent")
																				.hide();
																	}, 2000)
														}

													})
										})

						//验证码
						$(".vmss").click(
								function() {
									$(".vmss").attr(
											"src",
											"${path}/verify/show.do?random="
													+ Math.random());
								})

					},
					error : function() {
						$("#append_parent").show();
						$("#showMsg").text("系统发生错误");
						setTimeout(function() {
							$("#append_parent").hide();
						}, 2000)
					}
				})
				
	}
	function trueorfalse(id, tor) {
		$.ajax({
					url : "/note/trueOrFalseByNote.do",
					data : {
						"id" : id,
						"tof" : tor
					},
					type : "post",
					dataType : "json",
					success : function(data) {

						$("#append_parent").show();
						$("#showMsg").text(data.tip);
						setTimeout(
								function() {
									$("#append_parent").hide();
									window.location.href = "/note/showNoteContent.do?id=${fn.fa_id}";
								}, 2000)

					},
					error : function() {
						$("#append_parent").show();
						$("#showMsg").text("系统发生错误");
						setTimeout(function() {
							$("#append_parent").hide();
						}, 2000)
					}

				})
	}
</script>
</html>
