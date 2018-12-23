<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/data/cache/style_1_common.css" />
<link rel="stylesheet" type="text/css" href="/data/cache/style_1_forum_forumdisplay.css">
<link rel="stylesheet" type="text/css" href="/css/header.css">
<link rel="stylesheet" type="text/css" href="/data/cache/mystyle.css" />
		<script src="/js/jquery-1.11.2.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="/js/commom.js"></script>
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
			<div id="ct" class="ct2_a wp cl">
				<c:import url="${path}/feiiombright2.jsp"></c:import>
				<div class="ct1 wp cl personal_onfo" style="margin-top: 0px;">
					<div class=" ">
						<!-- 个人中心 -->
						<div class="page_frame_navigation">
							<div class="follow_feed_cover" style="left: 129px;"></div>
							<ul class="mbw tb cl page_frame_ul" style="padding-left: 20px;">
								<li><a href="/fiioer/showMemberMsg.do?id=${fuf.fa_id}">个人资料</a></li>
								<li class="a"><a
									href="/fiioer/showMemberbroadcast.do?id=${fuf.fa_id}">广播</a></li>
								<li><a href="/fiioer/showMemberNote.do?id=${fuf.fa_id}">主题</a></li>
								<li class="manage_frame_nav"
									style="float: right; width: 200px; position: relative"></li>
							</ul>
						</div>
						<div class="flw_feed">
							<ul id="pm_ul" >
							</ul>
							<div id="loadingfeed" class="flw_moress">
								<a href="javascript:void(0)" class="xi2">更多》》</a> <input
									type="hidden" id="curpage" value="1" />
							</div>
						</div>
					</div>
				</div>
				<div class="wp mtn"  >
					<!--[diy=diy3]-->
					<div id="diy3" class="area"></div>
					<!--[/diy]-->
				</div>
			</div>
			</span>
		</div>
		<c:import url="${path}/feiiombend.jsp"></c:import>
		<div id="scrolltop2" style="left: 1491.5px; display: block;"
			class="scrolltop2"></div>
</body>

<script type="text/javascript">
	a_friend_li_2();
	flbc();
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
	});
	/* var on = $(this).parents().find("#relaybox_58556994").is(':hidden');
	$("#relay_56094647").click(function() {
		$(this).parents().find("#relaybox_58556994").show();

	});
	$(".closebar_replybox").click(function() {
		$(this).parents().find("#relaybox_58556994").hide();
	})

	var on = $(this).parents().find("#replybox_58556994").is(':hidden');
	$("#relay_56094644").click(function() {
		$(this).parents().find("#replybox_58556994").show();

	});

	$("#relay_56094644").click(function() {
		$(".ct").show();

	});
	$('.xg2').click(function() {
		$(".ct").hide();
	}) */
</script>
<script>
$(function(){
	var zbdiv='<div id="" style="display: block" class="flw_replybox cl"><span class="cnr" style="margin: -23px 135px 0 0;"></span><form id="postform_6706512"><input type="hidden"> <input type="hidden"><input type="hidden"> <input type="hidden"><input type="hidden"> <span class="flw_autopt"> <textarea id="note_6706512" class="pts" cols="80" rows="4"></textarea></span><div style="margin: 30px 0px;"><div class="mtm sec identifying_code" style="float: left; width: 400px;"> <input type="hidden"> 验证码 <span id="seccodeSA0"><input id="seccodeverify_SA0" type="text" style="ime-mode: disabled; width: 100px" class="txt px vm"> <span id="seccode_SA0_secshow" class="seccode_image"><img width="150" height="60" src="${path}/verify/show.do" class="vm"></span> <a href="javascript:;" class="xi2">换一个</a> <span id="checkseccodeverify_SA0" class="seccheck_status"></span></span><div id="seccodeSA0_menu" class="p_pop p_opt" style="display: none; height: 0px; width: 0px; border-width: 0px;"><span id="seccode_SA0" style="display: none;"></span></div></div><button style="float: right; margin-left: 20px;" type="submit" id="relaysubmit_btn" class="pn pnc"><span>转播</span></button><label class="y wrap_simcheck checked_simcheck" style="margin-top: 8px;"><span class="box_simcheck"></span><input type="checkbox"class="pc" checked="checked">同时回复</label><div style="float: right; margin: 8px 20px 0 0;">还能输入<span id="checklen6706512" class="xg1">140</span>字</div><div class="cr"></div></div><div id="return_qrelay_58556994"></div></form><div class="cl closebar_replybox"><a href="javascript:;" class="y xg1"></a></div></div>';
	var hfdiv='<div id="" style="display: block" class="flw_replybox cl ct"><span class="cnr"></span><form id="postform_58556994" class="mbm"><input type="hidden" id="formhash"> <input type="hidden"> <span class="flw_autopt"> <textarea id="postmessage_6706512_58556994" class="pts" cols="80" rows="4"></textarea></span><div style="margin: 30px 0px;"><button type="submit" style="float: right; margin-left: 20px;" id="postsubmit" class="pn pnc"><span>回复</span></button><div class="cr"></div><div class="mtm"><input type="hidden"><ul><li><em class="d">验证码</em><span id="seccodeSA0"><input id="seccodeverify_SA0" type="text" style="ime-mode: disabled; width: 100px" class="txt px vm"> <span id="seccode_SA0_secshow" class="seccode_image"><img width="150" height="60" src="img/pic.png" class="vm"></span> <a href="javascript:;" class="xi2">换一个</a> <span id="checkseccodeverify_SA0" class="seccheck_status"></span></span></li></ul></div></form><ul id="newreply_6706512_58556994" class="list_replybox"><li><a href="#" class="d xi2">lchlovetxl&nbsp;&nbsp;</a>。。。</li></ul><div class="cl closebar_replybox"><a href="javascript:;" class="y xg1 xg2"></a></div></div>';
	
	var url = "/fiioer/selectMemberMood.do";
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
		
				$.ajax({
					url : url,
					data : data,
					type : "post",
					dataType : "json",
					success : function(data) {
						var vas = "";
						if (data.rows != null && data.rows.length > 0) {
							for (i in data.rows) {
								//转播
								if(data.rows[i].isreturn==1){
									var vat ='<li class="cl" ><div class="feed_li_box" ><div class="flw_article" style="margin-left: 0; padding-left: 0px;"><div class="flw_author"><a class="name_feedlist" href="/fiioer/showMemberMsg.do?id=${fuf.fa_id}">${fuf.fa_username}&nbsp;&nbsp;</a>发表于 <span>'+data.rows[i].day+'</span> &nbsp;&nbsp;</div><div class="flw_quotenote xs2 pbw">'+data.rows[i].msg+'</div><div class="flw_quote guide_list_replay"><div class="arrow_guidelist"></div><h2 class="wx pbn"><a href="/note/showNoteContent.do?id='+data.rows[i].pid+'">'+data.rows[i].pname+'</a></h2><div class="pbm c cl atcont_flwlist">'+data.rows[i].pmsg+'</div><div class="xg1 cl"><div class="y flw_btnbar"><span class="y"> <a href="javascript:;" id="'+data.rows[i].pid+'zb" class="zbs">转播&nbsp; </a> <a href="javascript:;" id="'+data.rows[i].pid+'hf" class="hfs"> 回复&nbsp; </a></span></div></div></div></div></div>';
									
									vat =vat + '<div  style="display: none" class="flw_replybox cl owenzb"><span class="cnr" style="margin: -23px 135px 0 0;"></span><form id="'+data.rows[i].id+'form"><input type="hidden" name="iscode" value="${iscode}" ><input type="hidden" name="pid" value="'+data.rows[i].pid+'" ><span class="flw_autopt"> <textarea name="desc" class="pts" cols="80" rows="4"></textarea></span><div style="margin: 30px 0px;"><div class="mtm sec identifying_code" style="float: left; width: 400px;">'
									if(Number("${iscode}")>0){
										vat=vat+'  验证码 <span ><input name="vode" type="text" style="ime-mode: disabled; width: 100px" class="txt px vm"> <span id="seccode_SA0_secshow" class="seccode_image"><img width="150" height="60" src="${path}/verify/show.do" class="vm vmss"></span>'
									}
									vat = vat +'<span  class="seccheck_status"></span></span><div id="seccodeSA0_menu" class="p_pop p_opt" style="display: none; height: 0px; width: 0px; border-width: 0px;"><span id="seccode_SA0" style="display: none;"></span></div></div><button style="float: right; margin-left: 20px;" type="button"  class="pn pnc qrzb"><span>转播</span></button><label class="y wrap_simcheck checked_simcheck" style="margin-top: 8px;"></label><div class="cr"></div></div><div id="return_qrelay_58556994"></div></form><div class="cl closebar_replybox"><a href="javascript:;" class="y xg1 qwertyu"></a></div></div>';
									
									
									vat =vat + '<div  style="display: none" class="flw_replybox cl ct owenpl"><span class="cnr"></span><form id="'+data.rows[i].id+'forms" class="mbm"><input type="hidden" name="iscode" value="${iscode}" ><input type="hidden" name="pid" value="'+data.rows[i].id+'" > <span class="flw_autopt"> <textarea name="desc" class="pts" cols="80" rows="4"></textarea></span><div style="margin: 30px 0px;"><button type="button" style="float: right; margin-left: 20px;"  class="pn pnc qrhf"><span>回复</span></button><div class="cr"></div><div class="mtm"></div>'
									if(Number("${iscode}")>0){
										vat=vat+'<ul><li><em class="d">验证码</em><span id="seccodeSA0"><input name="vode" id="seccodeverify_SA0" type="text" style="ime-mode: disabled; width: 100px" class="txt px vm"> <span id="seccode_SA0_secshow" class="seccode_image"><img width="150" height="60" src="${path}/verify/show.do" class="vm vmss"></span>  <span id="checkseccodeverify_SA0" class="seccheck_status"></span></span></li></ul>'
									}
									
									vat =vat +'</form><ul id="'+data.rows[i].id+'ul" class="list_replybox"><input type="hidden" id="'+data.rows[i].id+'ip" value="1" /></ul><div class="cl closebar_replybox"><a href="javascript:;" class="y xg1 xg2 qwertyus"></a><a href="javascript:void(0)" id="'+data.rows[i].id+'aa"   class="xi2 ggcv">加载更多》》》</a></div></div></li>';

									vas = vas +vat
									
								//不是转播	
								}else{
									var vat ='<li><div class="feed_li_box" ><div class="flw_article" style="margin-left: 0; padding-left: 0px;"><div class="flw_author"><a class="name_feedlist" href="/fiioer/showMemberMsg.do?id=${fuf.fa_id}">${fuf.fa_username}&nbsp;&nbsp;</a>发表于 <span>'+data.rows[i].day+'</span> &nbsp;&nbsp</div><div class="flw_quote guide_list_replay"><div class="arrow_guidelist"></div><div class="pbm c cl atcont_flwlist">'+data.rows[i].msg+'</div><div class="xg1 cl"><div class="y flw_btnbar"><span class="y"> <a href="javascript:;" id="'+data.rows[i].id+'zb" class="zbs">转播&nbsp; </a> <a href="javascript:;" id="'+data.rows[i].id+'hf" class="hfs"> 回复&nbsp; </a></span></div></div></div></div></div>';
									vat =vat + '<div  style="display: none" class="flw_replybox cl owenzb"><span class="cnr" style="margin: -23px 135px 0 0;"></span><form id="'+data.rows[i].id+'form"><input type="hidden" name="iscode" value="${iscode}" ><input type="hidden" name="pid" value="'+data.rows[i].id+'" ><span class="flw_autopt"> <textarea name="desc" class="pts" cols="80" rows="4"></textarea></span><div style="margin: 30px 0px;"><div class="mtm sec identifying_code" style="float: left; width: 400px;">'
									if(Number("${iscode}")>0){
										vat=vat+'  验证码 <span ><input name="vode" type="text" style="ime-mode: disabled; width: 100px" class="txt px vm"> <span id="seccode_SA0_secshow" class="seccode_image"><img width="150" height="60" src="${path}/verify/show.do" class="vm vmss"></span>'
									}
									vat = vat +'<span  class="seccheck_status"></span></span><div id="seccodeSA0_menu" class="p_pop p_opt" style="display: none; height: 0px; width: 0px; border-width: 0px;"><span id="seccode_SA0" style="display: none;"></span></div></div><button style="float: right; margin-left: 20px;" type="button"  class="pn pnc qrzb"><span>转播</span></button><label class="y wrap_simcheck checked_simcheck" style="margin-top: 8px;"></label><div class="cr"></div></div><div id="return_qrelay_58556994"></div></form><div class="cl closebar_replybox"><a href="javascript:;" class="y xg1 qwertyu"></a></div></div>';
									
									
									vat =vat + '<div  style="display: none" class="flw_replybox cl ct owenpl"><span class="cnr"></span><form id="'+data.rows[i].id+'forms" class="mbm"><input type="hidden" name="iscode" value="${iscode}" ><input type="hidden" name="pid" value="'+data.rows[i].id+'" > <span class="flw_autopt"> <textarea name="desc" class="pts" cols="80" rows="4"></textarea></span><div style="margin: 30px 0px;"><button type="button" style="float: right; margin-left: 20px;"  class="pn pnc qrhf"><span>回复</span></button><div class="cr"></div><div class="mtm"></div>'
									if(Number("${iscode}")>0){
										vat=vat+'<ul><li><em class="d">验证码</em><span id="seccodeSA0"><input name="vode" id="seccodeverify_SA0" type="text" style="ime-mode: disabled; width: 100px" class="txt px vm"> <span id="seccode_SA0_secshow" class="seccode_image"><img width="150" height="60" src="${path}/verify/show.do" class="vm vmss"></span>  <span id="checkseccodeverify_SA0" class="seccheck_status"></span></span></li></ul>'
									}
									
									vat =vat +'</form><ul id="'+data.rows[i].id+'ul" class="list_replybox"><input type="hidden" id="'+data.rows[i].id+'ip" value="1" /></ul><div class="cl closebar_replybox"><a href="javascript:;" class="y xg1 xg2 qwertyus"></a><a href="javascript:void(0)" id="'+data.rows[i].id+'aa"   class="xi2 ggcv">加载更多》》》</a></div></div></li>';

									vas = vas +vat
								}
								
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
							$("#pm_ul").append("<tr><td colspan='5' align='center'><br>该会员还未广播任何内容<br>&nbsp;</td></tr>")
							$("#loadingfeed").hide();
							
						}
						//点击转播
						$(".zbs").click(function(){
							
							var divs = $(this).parent().parent().parent().parent().parent().parent().parent().find('div.owenzb');
							var divz = $(this).parent().parent().parent().parent().parent().parent().parent().find('div.owenpl');
							if(divs.is(":hidden")){
								divs.show();
								divz.hide();
								
							}else{
								divs.hide();
								divz.hide();
							}
						})
						//关闭
						$(".qwertyu").click(function(){
							$(this).parent().parent().hide();
						})
						//关闭
						$(".qwertyus").click(function(){
							$(this).parent().parent().parent().parent().hide();
						})
						//加载更多
						$(".ggcv").click(function(){
							
							var idz = $(this).prop("id");
							idz =idz.substring(0,idz.length-2)
							//加载
							$.ajax({
								url:"/fiioer/getMoreMoodMsg.do",
								data:{"id":idz,"curpage":$("#"+idz+"ip").val()},
								type:"post",
								dataType:"json",
								success:function(data){
									var vaq = "";
									if (data.rows != null && data.rows.length > 0) {
										for (i in data.rows) {
											var vat ='<li><a href="javascript:void(0)" class="d xi2">'+data.rows[i].name+'&nbsp;&nbsp;</a>'+data.rows[i].msg+'</li>';
											vaq = vaq +vat
										}

										//追加到页面
										if ($("#"+data.id+"ip").val() >= data.totalpage) {
											$("#"+data.id+"aa").hide();
										} else {
											$("#"+data.id+"aa").show();
										}
										$("#"+data.id+"ip").val(Number($("#"+data.id+"ip").val()) + 1);
										$("#"+data.id+"ul").append(vaq)

									} else {
										
										$("#"+data.id+"aa").hide();
										
									}
								}
								
							})
						})
						//点击回复
						$(".hfs").click(function(){
							
							var divs = $(this).parent().parent().parent().parent().parent().parent().parent().find('div.owenpl');
							var divz = $(this).parent().parent().parent().parent().parent().parent().parent().find('div.owenzb');
							if(divs.is(":hidden")){
								divs.show();
								divz.hide();
							}else{
								divs.hide();
								divz.hide();
							}
							var id = $(this).parent().parent().parent().parent().parent().parent().parent().find('div.owenpl').find('ul.list_replybox').prop("id");
							id=id.substring(0,id.length-2)
							//加载
							$.ajax({
								url:"/fiioer/getMoreMoodMsg.do",
								data:{"id":id,"curpage":$("#"+id+"ip").val()},
								type:"post",
								dataType:"json",
								success:function(data){
									var vaq = "";
									if (data.rows != null && data.rows.length > 0) {
										for (i in data.rows) {
											var vat ='<li><a href="javascript:void(0)" class="d xi2">'+data.rows[i].name+'&nbsp;&nbsp;</a>'+data.rows[i].msg+'</li>';
											vaq = vaq +vat
										}

										//追加到页面
										if ($("#"+data.id+"ip").val() >= data.totalpage) {
											$("#"+data.id+"aa").hide();
										} else {
											$("#"+data.id+"aa").show();
										}
										$("#"+data.id+"ip").val(Number($("#"+data.id+"ip").val()) + 1);
										$("#"+data.id+"ul").append(vaq)

									} else {
										
										$("#"+data.id+"aa").hide();
										
									}
								}
								
							})
						})
						//确认转播
						$(".qrzb").click(function(){
							
							var divs = $(this).parent().parent().prop("id");
							$.ajax({
								url:"/fiioer/sureReturn.do",
								data:$("#"+divs).serialize()+"&fid=${fuf.fa_id}",
								type:"post",
								dataType:"json",
								success:function(data){
									if(data.tip=="success"){
										$("#append_parent").show();
										$("#showMsg").text("转发成功");
										$(".vmss").trigger("click");
										setTimeout(function(){
											$("#append_parent").hide();
										},2000)
									}else{
										$("#append_parent").show();
										$("#showMsg").text(data.tip);
										$(".vmss").trigger("click");
										setTimeout(function(){
											$("#append_parent").hide();
										},2000)
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
						})
						//确认回复
						$(".qrhf").click(function(){
							
							var divs = $(this).parent().parent().prop("id");
							
							$.ajax({
								url:"/fiioer/sureReply.do",
								data:$("#"+divs).serialize()+"&fid=${fuf.fa_id}",
								type:"post",
								dataType:"json",
								success:function(data){
									if(data.tip=="success"){
										$("#append_parent").show();
										$("#showMsg").text("转发成功");
										$(".vmss").trigger("click");
										var vat ='<li><a href="javascript:void(0)" class="d xi2">${fu.fa_username}&nbsp;&nbsp;</a>'+data.msg+'</li>';
										$("#"+data.id+"ul").prepend(vat)
										setTimeout(function(){
											$("#append_parent").hide();
										},2000)
									}else{
										$("#append_parent").show();
										$("#showMsg").text(data.tip);
										$(".vmss").trigger("click");
										setTimeout(function(){
											$("#append_parent").hide();
										},2000)
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
						})
						
						
						
						//验证码
						$(".vmss").click(function(){
							$(".vmss").attr("src", "${path}/verify/show.do?random=" + Math.random());
						})
					},
					error : function() {
					}
				})
	}
</script>

</html>
