<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_common.css" />
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_forum_post.css" />
<script src="/js/jquery.js" type="text/javascript" charset="utf-8"></script>

<script src="/static_new/pc/js/common/common-6e7c57add9.js"
	type="text/javascript"></script>
<script src="/static_new/pc/js/common/jquery-1-6da57f4a2b.7.1.min.js"
	type="text/javascript"></script>
<script src="/js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="/static_new/pc/js/common/forum-cf4dc65a50.js"
	type="text/javascript"></script>
<script src="/static_new/pc/js/common/public-208b02dac4.js"
	type="text/javascript"></script>

<link href="/resources/php/bbs/static/newstyle/main.v1.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/assets/css/amazeui.css" />
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<script src="/assets/js/amazeui.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="${path}/laydate/laydate.js"></script>
<!-- 配置文件 -->  
<script type="text/javascript" src="/ueditor/ueditor.config.js"></script>  
<!-- 编辑器源码文件 -->  
<script type="text/javascript" src="/ueditor/ueditor.all.js"></script>  
<link rel="stylesheet" type="text/css" href="/ueditor/themes/default/css/ueditor.css" /> 
<style type="">
	#edui1{
	width: 886px !important;
	/*height:660px !important;*/
	z-index: 100 !important
	}
	</style>
</head>

<body id="nv_forum" class="pg_index">
	<div id="hd">
		<div id="w_header">

			<c:import url="${path}/feiiohead.jsp"></c:import>
			<!--version: 2016-12-01 15:16:51-->
		</div>
		<div id="wp" class="wp">
			<div class="newthread_post">

				<div id="pt" class="bm cl">
					<div class="z">
						<a href="/">互动社区</a> <em>&rsaquo;</em> <a
							href="/note/showFSection.do?id=${faSection.fa_id}">${faSection.fa_name}</a>
						<em>&rsaquo;</em> 发表帖子
					</div>
				</div>
				<form id="userForm">
					<input type="hidden" name="iscode" value="${iscode}"> <input
						type="hidden" name="fa_resource" value="${faSection.fa_id}">
							<input type="hidden" name="fa_type" value="2">
					<div id="ct" class="ct2_a ct2_a_r wp cl">
						<div>
							<input type="hidden" id="formhash"> <input type="hidden"
								id="posttime"> <input type="hidden" id="e_mode">
										<div class="bm bw0 cl editorbox_post" id="editorbox">
											<ul class="tb cl mbw tab_editorbox">
												<li><a
													href="/fiioer/sendThemeNote.do?id=${faSection.fa_id}">发表帖子</a></li>
												<li class="a"><a
													href="/fiioer/sendVoteNote.do?id=${faSection.fa_id}">发表投票</a></li>
												<li><a
													href="/fiioer/sendQuestNote.do?id=${faSection.fa_id}">问题反馈</a></li>
												<%-- <li><a
													href="/fiioer/sendActiveNote.do?id=${faSection.fa_id}">活动参与</a></li> --%>
											</ul>
											<div id="postbox">
												<div class="pbt cl">
													<div class="z">
														<span><input type="text" name="fa_title"
															class="input_style3"></span> <span id="subjectchk">标题（最多可输入
															<strong id="checklen">80</strong> 个字符）
														</span>
													</div>
												</div>
												<div class="ticked">
													<h2>选项：最多可填写30个选项</h2>
													<div style="clear: both;"></div>
													<div id="InputsWrapper">
														<div class="ticked_tit">
															<input type="text"  name="details"
																class="ticked_input"> <span class="removeclass"><img
																	src="/img/close.png" onclick="deletes(this)"></span>
														</div>
													</div>
													<div style="clear: both;"></div>
													<div class="ticked_tit">
														<input type="text" id="abc" 
															class="ticked_input ticked_input1" readonly="readonly"
															value="增加一项">
													</div>
												</div>
												<div class="ticked_bot">
												
													<div >
														<span></span> <input type="radio" name="fa_dod" value="0" checked="checked"/>&nbsp;&nbsp;单选&nbsp;&nbsp;
														&nbsp;&nbsp;<input type="radio" name="fa_dod" value="1"/>&nbsp;&nbsp;多选&nbsp;&nbsp;
													</div>
													
													<br>
				<div >
														<span></span> <input type="radio" name="fa_votetype" value="0" checked="checked"/>&nbsp;&nbsp;投票后结果可见&nbsp;&nbsp;
														&nbsp;&nbsp;<input type="radio" name="fa_votetype" value="1"/>&nbsp;&nbsp;完全公开投票结果&nbsp;&nbsp;
													</div>
													<br>
													<div >
														<span></span> <input type="radio" name="fa_votemeb" value="0" checked="checked"/>&nbsp;&nbsp;不公开投票参与人&nbsp;&nbsp;
														&nbsp;&nbsp;<input type="radio" name="fa_votemeb" value="1"/>&nbsp;&nbsp;公开投票参与人&nbsp;&nbsp;
													</div>
													<br>
													<div >
														投票截止时间：<input  name="votetime"  class="input"  onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" />
													</div>
												</div>

			

		</div>


		<div class="edt" id="e_body" style="display: none;">

			<div id="e_controls_mask" style="display: none; height: 54px;"></div>
			
			<div class="area">
				<!-- <textarea id="content1" name="fa_desc" cols="100" rows="8" style="width:850px;height:700px;visibility:hidden;"></textarea> -->
														<textarea id="newsEditor"  style="width:100%;height:600px;">  </textarea>
														<script type="text/javascript">  
												           UE.getEditor('newsEditor',{
												        	   elementPathEnabled:false,
												        	   wordCount:false
												           });  
												           // var content = UE.getPlainTxt();//content就是编辑器的带格式的内容  
												           </script>
			</div>
			<link rel="stylesheet" type="text/css"
				href="/data/cache/style_1_editor.css">
		</div>
		

		<c:if test="${iscode>0}">
		<div class="mtm identifying_code"
			style="margin-top: 20px; width: 50%; float: left;"">
			 验证码 <span><input type="text" name="code"
					style="ime-mode: disabled; width: 100px"
					class="txt px vm" >

						<span id="seccode_Syn1h4v0_secshow"
						class="seccode_image"></span> <span
						 class="seccheck_status"><img
							src="${path}/verify/show.do" width="100" height="32" class="vm" id="vmss" /></span></span>
				<a href="javascript:;" class="xi2" id="hyg">换一个</a>
				
		</div>
		</c:if>


		<div class="mtm mbm pnpost" style="margin-top: 10px;">
			<a class="normalbtn bluebtn" style="width: 110px;">
				<button type="button" id="surebtn"
					style="width: 110px; margin: 0px;">
					<span>发起投票</span>
				</button>
			</a> 
				<div class="cr"></div>
		</div>
		<div class="cr "></div>
	</div>
	</div>
	</div>

	<div class="cr "></div>
	</div>
	<div class="cr "></div>
	</form>

	<div id="e_menus " class="editorrow "
		style="overflow: hidden; height: 0; border: none; background: transparent;">
		<div id="e_editortoolbar " class="editortoolbar "></div>

	</div>
	<div class="cr "></div>
	</div>


	</div>
	<c:import url="${path}/feiiombend.jsp"></c:import>

	<div id="scrolltop2 " class="scrolltop2 "></div>
</body>
<script>
	$(".login-box ").mouseover(function() {
		$(".not-login-block-sub ").show();
	});

	$(".login-box ").mouseleave(function() {
		$(".not-login-block-sub ").hide();
	});

	$(window).scroll(function() {
		var sc = $(window).scrollTop();
		var rwidth = $(window).width()
		if (sc > 0) {
			$("#scrolltop2 ").css("display ", "block ");
			$("#scrolltop2 ").css("left ", "1491.5px ")
		} else {
			$("#scrolltop2 ").css("display ", "none ");
		}
	})

	$(".scrolltop2 ").click(function() {
		$("html ").animate({
			"scrollTop " : "0px "
		}, 300); //IE,FF
		$("body ").animate({
			"scrollTop " : "0px "
		}, 300); //Webkit
	});

	$('#extra_more_b').click(function() {
		$('#extra_more_b_menu').toggle();
	});
	checkFun(".wrap_simcheck ", "checked_simcheck ");
	simSelectFun("#post_extra select ");

	$(document)
			.ready(
					function() {

						var MaxInputs = 30;
						var InputsWrapper = $("#InputsWrapper ");
						var AddButton = $("#AddMoreFileBox ");

						var x = InputsWrapper.length;
						var FieldCount = 1;

						$(AddButton)
								.click(
										function(e) {
											if (x <= MaxInputs) {
												FieldCount++;
												$(InputsWrapper)
														.append(
																'<div class="ticked_tit "><input type="text " id="field_ ' + FieldCount + ' " name=" " class="ticked_input " value="Text ' + FieldCount + ' "/><span class="removeclass "><img src="img/close.png "></span></div>');
												x++;
											}
											return false;
										});

						$("body ").on("click ", ".removeclass ", function(e) {
							if (x > 1) {
								$(this).parent('div').remove();
								x--;
							}
							return false;
						})

					});
</script>
<script type="text/javascript">
	$(function() {
		$("#hyg").click(function(){
			$("#vmss").attr("src", "${path}/verify/show.do?random=" + Math.random());
		})
		$("#abc").click(function(){
			$("#InputsWrapper").append('<div class="ticked_tit"><input type="text"   name="details" class="ticked_input"> <span class="removeclass"><img src="/img/close.png" onclick="deletes(this)"></span></div>');
		})
		
		
		$("#surebtn").click(function(){
			$.ajax({
				url:"/note/saveThemeNote.do",
				data:$("#userForm").serialize(),
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.tip=="success"){
						$("#append_parent").show();
						$("#showMsg").text("发表成功,即将跳到该帖子的展示页");
						$("#hyg").trigger("click");
						setTimeout(function(){
							$("#append_parent").hide();
							window.location.href="/note/showNoteContent.do?id="+data.id
						},2000)
					}else{
						$("#append_parent").show();
						$("#showMsg").text(data.tip);
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
		
	})
	function deletes(ss){
		$(ss).parent().parent().remove();
		
	}
</script>
</html>
