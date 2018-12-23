<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_common.css">
	<link rel="stylesheet" type="text/css"
		href="/data/cache/style_1_forum_forumdisplay.css">
		<link rel="stylesheet" type="text/css" href="/css/header.css"/>
			<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
			<script type="text/javascript" src="/js/commom.js"></script>
			<script type="text/javascript" src="/js/jquery.js"></script>
			<link rel="stylesheet" href="${path}/css/OwenLch.css">
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
			<c:import url="${path}/feiiombright2.jsp"></c:import>
			<div id="ct" class="ct1 wp cl personal_onfo">
				<div class="mn">
					<!--[diy=diycontenttop]-->
					<div id="diycontenttop" class="area"></div>
					<!--[/diy]-->
					<div class="bm bw0">
						<div class="page_frame_navigation">
							<div class="follow_feed_cover" style="left: 236px;"></div>
							<ul class="mbw tb cl page_frame_ul" style="padding-left: 20px;">
								<li><a href="/fiioer/showMemberMsg.do?id=${fuf.fa_id}">个人资料</a></li>
								<li><a href="/fiioer/showMemberbroadcast.do?id=${fuf.fa_id}">广播</a></li>
								<li class="a"><a href="/fiioer/showMemberNote.do?id=${fuf.fa_id}">主题</a></li>

								<li class="manage_frame_nav"
									style="float: right; width: 200px; position: relative"></li>
							</ul>
						</div>
						<div class="bm_c">
							<div class="tl">
								<form id="delform">
									<input type="hidden"> <input type="hidden">
											<table cellspacing="0" cellpadding="0"
												class="space_thread_table" id="pm_ul">
											</table>
								</form>
							</div>
							<div class="bm bw0 pgs cl pagebar"></div>
							<div id="loadingfeed" class="flw_moress">
								<a href="javascript:void(0)" class="xi2">更多》》</a> <input
									type="hidden" id="curpage" value="1" />
							</div>
							<div id="diycontentbottom" class="area"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="cr"></div>
			<div class="wp mtn">
				<div id="diy3" class="area"></div>
			</div>
			<c:import url="${path}/feiiombend.jsp"></c:import>
			
			<!--fwinmask end-->
			<div id="scrolltop2" style="left: 1491.5px; display: block;"
				class="scrolltop2"></div>
</body>
<script type="text/javascript">
	a_friend_li_2();
	flbc();
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
	$(function() {
		var url = "/fiioer/selectMemberReply.do";
		  moreLongData({
			"curpage" : $("#curpage").val(),
			"id" : "${fuf.fa_id}"
		}, url)  
		//加载更多
		$("#loadingfeed").click(function() {
			moreLongData({
				"curpage" : $("#curpage").val(),
				"id" : "${fuf.fa_id}"
			}, url)
		})
	})
	function moreLongData(data, url) {
		$
				.ajax({
					url : url,
					data : data,
					type : "post",
					dataType : "json",
					success : function(data) {
						var vas = '';
						if($("#curpage").val()==1){
							vas = '<tr class="space_th"><td class="icn">&nbsp;</td><th><p class="space_tbmu"><a href="/fiioer/showMemberNote.do?id=${fuf.fa_id}" >发帖</a> <span class="pipe">|</span> <a class="a" href="/fiioer/showMemberReplies.do?id=${fuf.fa_id}">回复</a></p></th><td class="frm">版块</td><td class="num" style="padding-right: 20px;">回复/查看</td><td class="by"><cite>发表时间</cite></td></tr>';

						}else{
							vas = '<tr style="display: none;" class="space_th"><td class="icn">&nbsp;</td><th><p class="space_tbmu"><a href="/fiioer/showMemberNote.do?id=${fuf.fa_id}" >发帖</a> <span class="pipe">|</span> <a class="a" href="/fiioer/showMemberReplies.do?id=${fuf.fa_id}">回复</a></p></th><td class="frm">版块</td><td class="num" style="padding-right: 20px;">回复/查看</td><td class="by"><cite>发表时间</cite></td></tr>';

						}
						if (data.rows != null && data.rows.length > 0) {

							for (i in data.rows) {
								
								var vat ='<td class="icn">&nbsp;</td><th class="scontent"><a href="/note/showNoteContent.do?id='+data.rows[i].pid+'">'+data.rows[i].name+'</a></th><td><a href="javascript:void(0)" class="forum">'+data.rows[i].model+'</a></td><td class="num"><div class="sreply"><a href="" class="xi2">'+data.rows[i].pinglun+'</a></div><div class="sview">'+data.rows[i].readss+'</div></td><td class="by"><div class="sview"><a href="javascript:void(0)">'+data.rows[i].day+'</a></div></td></tr>';
								vat = vat +'<tr><td colspan="5" class="xg1"><div class="guide_list_replay"><div class="tl_reply"><a href="/note/showNoteContent.do?id='+data.rows[i].pid+'&floor='+data.rows[i].ceng+'">回复主题&nbsp;:&nbsp;'+data.rows[i].msg+'</a></div><div class="arrow_guidelist"></div></div></td></tr>';
								vas = vas +vat
							}

							//追加到页面
							if ($("#curpage").val() >= data.totalpage) {
								$("#loadingfeed").hide();
							} else {
								$("#loadingfeed").show();
							}
							$("#curpage").val(Number($("#curpage").val()) + 1);
							$("#pm_ul").append(vas)

						} else {
							$("#pm_ul").append("<tr><td colspan='5' align='center'><br>该会员还未回复过帖子<br>&nbsp;</td></tr>")
							$("#loadingfeed").hide();
							
						}

					},
					error : function() {
					}
				})
	}
</script>
</html>
