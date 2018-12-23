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
				</div>
				<form id="userForm">
					<input type="hidden" name="iscode" value="${iscode}">
					
				<input type="hidden" name="fa_resource" value="${fn.fa_resource}" >
				<input type="hidden" name="fa_type" value="${fn.fa_type}" >
				<input type="hidden" name="fa_id" value="${fn.fa_id}" >
					<div id="ct" class="ct2_a ct2_a_r wp cl">
						<div>
							<input type="hidden" id="formhash"> <input type="hidden"
								id="posttime"> <input type="hidden" id="e_mode">
										<div class="bm bw0 cl editorbox_post" id="editorbox">
											<div id="postbox">
												<div class="pbt cl">
													<div class="z">
														<span><input type="text" name="fa_title"  value="${fn.fa_title}"
															class="input_style3"></span> <span id="subjectchk">标题（最多可输入
															<strong id="checklen">80</strong> 个字符）
														</span>
													</div>
												</div>
												<div class="ticked">
													<h2>选项：最多可填写30个选项(已存在的选项不得修改)</h2>
													<div style="clear: both;"></div>
													<div id="InputsWrapper">
														<c:if test="${fnv!=null && !empty fnv}">
															<c:forEach items="${fnv}" var="fv" >
																<div class="ticked_tit" id="${fv['id']}">
																	<input type="text" disabled="disabled"  value="${fv['answer']}"
																		class="ticked_input"> <span class="removeclass"><img
																			src="/img/close.png" onclick="deletesz(this)"></span>
																</div>
															</c:forEach>
														</c:if>
														
														<%-- <c:forEach items="${mfnv}" var="mf">
															<div class="ticked_tit"><input type="text"   name="details" class="ticked_input"> <span class="removeclass"><img src="/img/close.png" onclick="deletes(this)"></span></div>
														</c:forEach> --%>
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
														<span></span> <input type="radio" name="fa_dod" value="0" <c:if test="${fn.fa_dod==0}">checked="checked"</c:if> />&nbsp;&nbsp;单选&nbsp;&nbsp;
														&nbsp;&nbsp;<input type="radio" name="fa_dod" value="1"   <c:if test="${fn.fa_dod==1}">checked="checked"</c:if>/>&nbsp;&nbsp;多选&nbsp;&nbsp;
													</div>
													
													<br>
				<div >
														<span></span> <input type="radio" name="fa_votetype" value="0" <c:if test="${fn.fa_votetype==0}">checked="checked"</c:if>/>&nbsp;&nbsp;投票后结果可见&nbsp;&nbsp;
														&nbsp;&nbsp;<input type="radio" name="fa_votetype" value="1" <c:if test="${fn.fa_votetype==1}">checked="checked"</c:if>/>&nbsp;&nbsp;完全公开投票结果&nbsp;&nbsp;
													</div>
													<br>
													<div >
														<span></span> <input type="radio" name="fa_votemeb" value="0" <c:if test="${fn.fa_votemeb==0}">checked="checked"</c:if>/>&nbsp;&nbsp;不公开投票参与人&nbsp;&nbsp;
														&nbsp;&nbsp;<input type="radio" name="fa_votemeb" value="1" <c:if test="${fn.fa_votemeb==1}">checked="checked"</c:if>/>&nbsp;&nbsp;公开投票参与人&nbsp;&nbsp;
													</div>
													<br>
													<div >
														投票截止时间：<input  name="votetime"  class="input"  onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" <c:if test="${fudate!=null}">value="${fudate}"</c:if>/>
													</div>
												</div>
												

			

		</div>


		<div class="edt" id="e_body" style="display: none;">

			<div id="e_controls_mask" style="display: none; height: 54px;"></div>
			
			<div class="area">
<!-- <textarea id="content1" name="fa_desc" cols="100" rows="8" style="width:850px;height:700px;visibility:hidden;"></textarea> -->
														<textarea id="newsEditor"  style="width:100%;height:600px;">${fn.fa_desc}</textarea>
														<script type="text/javascript">  
														 UE.getEditor('newsEditor',{
												        	   elementPathEnabled:false,
												        	   wordCount:false
												           });  
												           // var content = UE.getPlainTxt();//content就是编辑器的带格式的内容  
												          /* UE.getEditor('newsEditor').setContent("wwwww",true); */
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
			if($('#InputsWrapper').children().length>=30){
				$("#append_parent").show();
				$("#showMsg").text("最多填写30个");
				setTimeout(function(){
					$("#append_parent").hide();
				},2000)
		}else{
			$("#InputsWrapper").append('<div class="ticked_tit"><input type="text"   name="details" class="ticked_input"> <span class="removeclass"><img src="/img/close.png" onclick="deletes(this)"></span></div>');

		}
		
		})
		
		
		$("#surebtn").click(function(){
			
			$.ajax({
				url:"/note/updateThemeNote.do",
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
	function deletesz(ss){
		$(ss).parent().parent().remove();
		$("#InputsWrapper").append('<input type="hidden" name="delids" value="'+$(ss).parent().parent().prop("id")+'" />')
		/* $.ajax({
			url:"/note/deleteNoteVote.do",
			data:{"id":$(ss).parent().parent().prop("id")},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.tip=="success"){
					
					$(ss).parent().parent().remove();
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
		}) */
		
	}
	function deletes(ss){
		$(ss).parent().parent().remove();
		
	}
</script>
</html>
