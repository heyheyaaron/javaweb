<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_common.css">
	<link rel="stylesheet" type="text/css"
		href="/data/cache/style_1_forum_forumdisplay.css" />

	<link rel="stylesheet" type="text/css"
		href="/data/cache/style_1_home_follow.css-wxr.css" />

	<link rel="stylesheet" type="text/css" href="/css/header.css" />
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<style>
	.flw_replybox .pnc span {
    line-height: 33px;
}
</style>
</head>
<body>
	<c:import url="${path}/feiiohead.jsp"></c:import>
	
	<div id="wp" class="wp">
		<style id="diy_style" type="text/css"></style>

		<div class="wp">
			<!--[diy=diy1]-->
			<div id="diy1" class="area"></div>
			<!--[/diy]-->
		</div>
		<div id="ct" class="ct2_a wp cl">
			<c:import url="${path}/feiiombright.jsp"></c:import>
			<div class="mn ct1_feed float_l" style="background-color: #F2F2F2;">
				<div id="diycontenttop" class="area"></div>

				<div class=" follow_feed_boxval ">




					<div class="flw_feed">
						<ul id="pm_ul" >
						</ul>
						

					</div>

					<!--[diy=diycontentbottom]-->
					<div id="diycontentbottom" class="area"></div>
					<!--[/diy]-->
				</div>
			</div>
		</div>

		<div class="wp mtn">
			<!--[diy=diy3]-->
			<div id="diy3" class="area"></div>
			<!--[/diy]-->
		</div>



		<c:import url="${path}/feiiombend.jsp"></c:import>
</body>
<script type="text/javascript" src="../js/commom.js"></script>

<script type="text/javascript">
	var nofollowfeed = 1;
	var userdatakey = cookiepre + 'fastpost139168029';
	function showSyncInfo(flag) {
		if (flag) {
			document.getElementById("wrap_simcheck").setAttribute("class",
					"wrap_simcheck checked_simcheck");
		} else {
			document.getElementById("wrap_simcheck").setAttribute("class",
					"wrap_simcheck");
		}
		display('flw_post_subject');
		display('forumlistdev');

		var sObj = $('subject');
		sObj.value = '';
		strLenCalc(sObj, 'checklen', 70);
	}
	function fastpostvalidateextra() {
		var sObj = $('subject');
		if (!$('syncbbs').checked) {
			$('subject').value = '  ';
		}
		return true;
	};
</script>
<script>
	login();
	loginbox();
	$(".follow_avatar").hover(function() {

		$(".follow_avatar_absolute").toggle();

	});
</script>
<script type="text/javascript">
	var nofollowfeed = 1;
	var userdatakey = cookiepre + 'fastpost139168029';
	function showSyncInfo(flag) {
		if (flag) {
			document.getElementById("wrap_simcheck").setAttribute("class",
					"wrap_simcheck checked_simcheck");
		} else {
			document.getElementById("wrap_simcheck").setAttribute("class",
					"wrap_simcheck");
		}
		display('flw_post_subject');
		display('forumlistdev');

		var sObj = $('subject');
		sObj.value = '';
		strLenCalc(sObj, 'checklen', 70);
	}
	function fastpostvalidateextra() {
		var sObj = $('subject');
		if (!$('syncbbs').checked) {
			$('subject').value = '  ';
		}
		return true;
	};
</script>
<script>
	login();
	loginbox();
	$(".follow_avatar").hover(function() {

		$(".follow_avatar_absolute").toggle();

	});
</script>
<script type="text/javascript">
$(function(){
	var zbdiv='<div id="" style="display: block" class="flw_replybox cl"><span class="cnr" style="margin: -23px 135px 0 0;"></span><form id="postform_6706512"><input type="hidden"> <input type="hidden"><input type="hidden"> <input type="hidden"><input type="hidden"> <span class="flw_autopt"> <textarea id="note_6706512" class="pts" cols="80" rows="4"></textarea></span><div style="margin: 30px 0px;"><div class="mtm sec identifying_code" style="float: left; width: 400px;"> <input type="hidden"> 验证码 <span id="seccodeSA0"><input id="seccodeverify_SA0" type="text" style="ime-mode: disabled; width: 100px" class="txt px vm"> <span id="seccode_SA0_secshow" class="seccode_image"><img width="150" height="60" src="${path}/verify/show.do" class="vm"></span> <a href="javascript:;" class="xi2">换一个</a> <span id="checkseccodeverify_SA0" class="seccheck_status"></span></span><div id="seccodeSA0_menu" class="p_pop p_opt" style="display: none; height: 0px; width: 0px; border-width: 0px;"><span id="seccode_SA0" style="display: none;"></span></div></div><button style="float: right; margin-left: 20px;" type="submit" id="relaysubmit_btn" class="pn pnc"><span>转播</span></button><label class="y wrap_simcheck checked_simcheck" style="margin-top: 8px;"><span class="box_simcheck"></span><input type="checkbox"class="pc" checked="checked">同时回复</label><div style="float: right; margin: 8px 20px 0 0;">还能输入<span id="checklen6706512" class="xg1">140</span>字</div><div class="cr"></div></div><div id="return_qrelay_58556994"></div></form><div class="cl closebar_replybox"><a href="javascript:;" class="y xg1"></a></div></div>';
	var hfdiv='<div id="" style="display: block" class="flw_replybox cl ct"><span class="cnr"></span><form id="postform_58556994" class="mbm"><input type="hidden" id="formhash"> <input type="hidden"> <span class="flw_autopt"> <textarea id="postmessage_6706512_58556994" class="pts" cols="80" rows="4"></textarea></span><div style="margin: 30px 0px;"><button type="submit" style="float: right; margin-left: 20px;" id="postsubmit" class="pn pnc"><span>回复</span></button><div class="cr"></div><div class="mtm"><input type="hidden"><ul><li><em class="d">验证码</em><span id="seccodeSA0"><input id="seccodeverify_SA0" type="text" style="ime-mode: disabled; width: 100px" class="txt px vm"> <span id="seccode_SA0_secshow" class="seccode_image"><img width="150" height="60" src="img/pic.png" class="vm"></span> <a href="javascript:;" class="xi2">换一个</a> <span id="checkseccodeverify_SA0" class="seccheck_status"></span></span></li></ul></div></form><ul id="newreply_6706512_58556994" class="list_replybox"><li><a href="#" class="d xi2">lchlovetxl&nbsp;&nbsp;</a>。。。</li></ul><div class="cl closebar_replybox"><a href="javascript:;" class="y xg1 xg2"></a></div></div>';
	
	var url = "/fiioer/selectFriendMoodByOne.do";
	moreLongData({
		"id" : "${id}"
	}, url)
	
})
function moreLongData(data, url) {
		
				$.ajax({
					url : url,
					data : data,
					type : "post",
					dataType : "json",
					success : function(data) {
						var vas = "";
						if (data != null) {
							
								//转播
								if(data.isreturn==1){
									var vat ='<li class="cl" ><div class="feed_li_box" ><div align="right"><a href="javascript:;" id="'+data.id+'de" class="des"  > &nbsp;<font color="gray">X</font> </a></div><div class="flw_article" style="margin-left: 0; padding-left: 0px;"><div class="flw_author"><a class="name_feedlist" href="/fiioer/showMemberMsg.do?id='+data.uid+'">'+data.uname+'&nbsp;&nbsp;</a>发表于 <span>'+data.day+'</span> &nbsp;&nbsp;</div><div class="flw_quotenote xs2 pbw">'+data.msg+'</div><div class="flw_quote guide_list_replay"><div class="arrow_guidelist"></div><h2 class="wx pbn"><a href="/note/showNoteContent.do?id='+data.pid+'">'+data.pname+'</a></h2><div class="pbm c cl atcont_flwlist">'+data.pmsg+'</div><div class="xg1 cl"><div class="y flw_btnbar"><span class="y"> <a href="javascript:;" id="'+data.pid+'zb" class="zbs">转播&nbsp; </a> <a href="javascript:;" id="'+data.id+'hf" class="hfs"> 回复&nbsp; </a></span></div></div></div></div></div>';
									
									vat =vat + '<div  style="display: none" class="flw_replybox cl owenzb"><span class="cnr" style="margin: -23px 135px 0 0;"></span><form id="'+data.id+'form"><input type="hidden" name="iscode" value="${iscode}" ><input type="hidden" name="pid" value="'+data.pid+'" ><span class="flw_autopt"> <textarea name="desc" class="pts" cols="80" rows="4"></textarea></span><div style="margin: 30px 0px;"><div class="mtm sec identifying_code" style="float: left; width: 400px;">'
									if(Number("${iscode}")>0){
										vat=vat+'  验证码 <span ><input name="vode" type="text" style="ime-mode: disabled; width: 100px" class="txt px vm"> <span id="seccode_SA0_secshow" class="seccode_image"><img width="150" height="60" src="${path}/verify/show.do" class="vm vmss"></span>'
									}
									vat = vat +'<span  class="seccheck_status"></span></span><div id="seccodeSA0_menu" class="p_pop p_opt" style="display: none; height: 0px; width: 0px; border-width: 0px;"><span id="seccode_SA0" style="display: none;"></span></div></div><button style="float: right; margin-left: 20px;" type="button"  class="pn pnc qrzb"><span>转播</span></button><label class="y wrap_simcheck checked_simcheck" style="margin-top: 8px;"></label><div class="cr"></div></div><div id="return_qrelay_58556994"></div></form><div class="cl closebar_replybox"><a href="javascript:;" class="y xg1 qwertyu"></a></div></div>';
									
									
									vat =vat + '<div  style="display: none" class="flw_replybox cl ct owenpl"><span class="cnr"></span><form id="'+data.id+'forms" class="mbm"><input type="hidden" name="iscode" value="${iscode}" ><input type="hidden" name="pid" value="'+data.id+'" > <span class="flw_autopt"> <textarea name="desc" class="pts" cols="80" rows="4"></textarea></span><div style="margin: 30px 0px;"><button type="button" style="float: right; margin-left: 20px;"  class="pn pnc qrhf"><span>回复</span></button><div class="cr"></div><div class="mtm"></div>'
									if(Number("${iscode}")>0){
										vat=vat+'<ul><li><em class="d">验证码</em><span id="seccodeSA0"><input name="vode" id="seccodeverify_SA0" type="text" style="ime-mode: disabled; width: 100px" class="txt px vm"> <span id="seccode_SA0_secshow" class="seccode_image"><img width="150" height="60" src="${path}/verify/show.do" class="vm vmss"></span>  <span id="checkseccodeverify_SA0" class="seccheck_status"></span></span></li></ul>'
									}
									
									vat =vat +'</form><ul id="'+data.id+'ul" class="list_replybox"><input type="hidden" id="'+data.id+'ip" value="1" /></ul><div class="cl closebar_replybox"><a href="javascript:;" class="y xg1 xg2 qwertyus"></a><a href="javascript:void(0)" id="'+data.id+'aa"   class="xi2 ggcv">加载更多》》》</a></div></div></li>';

									vas = vas +vat
									
								//不是转播	
								}else{
									var vat ='<li><div class="feed_li_box" ><div align="right"><a href="javascript:;" id="'+data.id+'de" class="des"  > &nbsp;<font color="gray">X</font> </a></div><div class="flw_article" style="margin-left: 0; padding-left: 0px;"><div class="flw_author"><a class="name_feedlist" href="/fiioer/showMemberMsg.do?id='+data.uid+'">'+data.uname+'&nbsp;&nbsp;</a>发表于 <span>'+data.day+'</span> &nbsp;&nbsp</div><div class="flw_quote guide_list_replay"><div class="arrow_guidelist"></div><div class="pbm c cl atcont_flwlist">'+data.msg+'</div><div class="xg1 cl"><div class="y flw_btnbar"><span class="y"> <a href="javascript:;" id="'+data.id+'zb" class="zbs">转播&nbsp; </a> <a href="javascript:;" id="'+data.id+'hf" class="hfs"> 回复&nbsp; </a></span></div></div></div></div></div>';
									vat =vat + '<div  style="display: none" class="flw_replybox cl owenzb"><span class="cnr" style="margin: -23px 135px 0 0;"></span><form id="'+data.id+'form"><input type="hidden" name="iscode" value="${iscode}" ><input type="hidden" name="pid" value="'+data.id+'" ><span class="flw_autopt"> <textarea name="desc" class="pts" cols="80" rows="4"></textarea></span><div style="margin: 30px 0px;"><div class="mtm sec identifying_code" style="float: left; width: 400px;">'
									if(Number("${iscode}")>0){
										vat=vat+'  验证码 <span ><input name="vode" type="text" style="ime-mode: disabled; width: 100px" class="txt px vm"> <span id="seccode_SA0_secshow" class="seccode_image"><img width="150" height="60" src="${path}/verify/show.do" class="vm vmss"></span>'
									}
									vat = vat +'<span  class="seccheck_status"></span></span><div id="seccodeSA0_menu" class="p_pop p_opt" style="display: none; height: 0px; width: 0px; border-width: 0px;"><span id="seccode_SA0" style="display: none;"></span></div></div><button style="float: right; margin-left: 20px;" type="button"  class="pn pnc qrzb"><span>转播</span></button><label class="y wrap_simcheck checked_simcheck" style="margin-top: 8px;"></label><div class="cr"></div></div><div id="return_qrelay_58556994"></div></form><div class="cl closebar_replybox"><a href="javascript:;" class="y xg1 qwertyu"></a></div></div>';
									
									
									vat =vat + '<div  style="display: none" class="flw_replybox cl ct owenpl"><span class="cnr"></span><form id="'+data.id+'forms" class="mbm"><input type="hidden" name="iscode" value="${iscode}" ><input type="hidden" name="pid" value="'+data.id+'" > <span class="flw_autopt"> <textarea name="desc" class="pts" cols="80" rows="4"></textarea></span><div style="margin: 30px 0px;"><button type="button" style="float: right; margin-left: 20px;"  class="pn pnc qrhf"><span>回复</span></button><div class="cr"></div><div class="mtm"></div>'
									if(Number("${iscode}")>0){
										vat=vat+'<ul><li><em class="d">验证码</em><span id="seccodeSA0"><input name="vode" id="seccodeverify_SA0" type="text" style="ime-mode: disabled; width: 100px" class="txt px vm"> <span id="seccode_SA0_secshow" class="seccode_image"><img width="150" height="60" src="${path}/verify/show.do" class="vm vmss"></span>  <span id="checkseccodeverify_SA0" class="seccheck_status"></span></span></li></ul>'
									}
									
									vat =vat +'</form><ul id="'+data.id+'ul" class="list_replybox"><input type="hidden" id="'+data.id+'ip" value="1" /></ul><div class="cl closebar_replybox"><a href="javascript:;" class="y xg1 xg2 qwertyus"></a><a href="javascript:void(0)" id="'+data.id+'aa"   class="xi2 ggcv">加载更多》》》</a></div></div></li>';

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
							$("#pm_ul").append("<tr><td colspan='5' align='center'><br>这里没有内容啦<br>&nbsp;</td></tr>")
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
											var vat ='<li><a href="javascript:void(0)" class="d xi2">'+data.name+'&nbsp;&nbsp;</a>'+data.msg+'</li>';
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
								data:$("#"+divs).serialize()+"&fid=${fu.fa_id}",
								type:"post",
								dataType:"json",
								success:function(data){
									if(data.tip=="success"){
										$("#append_parent").show();
										$("#showMsg").text("转发成功,请刷新页面查看");
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
								data:$("#"+divs).serialize()+"&fid=${fu.fa_id}",
								type:"post",
								dataType:"json",
								success:function(data){
									if(data.tip=="success"){
										$("#append_parent").show();
										$("#showMsg").text("回复成功");
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
						//删除
						$(".des").click(function(){
							
							var id =$(this).prop("id");
							id = id.substring(0,id.length-2);
							
							$.ajax({
								url:"/fiioer/deleteMyMood.do",
								data:{"id":id},
								type:"post",
								dataType:"json",
								success:function(data){
									if(data.tip=="success"){
										$("#append_parent").show();
										$("#showMsg").text("删除成功");
										$(".vmss").trigger("click");
										$("#"+id+"de").parent().parent().parent().hide()
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
