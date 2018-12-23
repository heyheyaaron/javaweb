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
 <script type="text/javascript" charset="utf-8" src="${path}/kindeditor/kindeditor.js"></script>
 <script type="text/javascript">
	KE.show({
		id : 'content1',
		imageUploadJson : '../../jsp/upload_json.jsp',
		fileManagerJson : '../../jsp/file_manager_json.jsp',
		allowFileManager : false,
		afterCreate : function(id) {
			KE.event.ctrl(document, 13, function() {
				KE.util.setData(id);
				document.forms['userForm'].submit();
			});
			KE.event.ctrl(KE.g[id].iframeDoc, 13, function() {
				KE.util.setData(id);
				document.forms['userForm'].submit();
			});
		},
		
		
	});


	//});

	function sb1(){
	     
	     
	  // jquery 表单提交 
	     $("#userForm").ajaxSubmit(function(data) { 
	     	
	     }); 

	     return false; // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转 
	 }
	</script>
</head>

<body id="nv_forum" class="pg_index">
	<div id="hd">
		<div id="w_header">

			<c:import url="${path}/feiiohead.jsp"></c:import>
			<!--version: 2016-12-01 15:16:51-->
		</div>
		<div id="wp" class="wp">
			<div class="newthread_post">
				<script src="/static_new/pc/js/common/forum_post-e28797466b.js"
					type="text/javascript"></script>
				<div id="pt" class="bm cl">
					<div class="z">
						<a href="/">互动社区</a> <em>&rsaquo;</em> <a
							href="/note/showFSection.do?id=${faSection.fa_id}">${faSection.fa_name}</a>
						<em>&rsaquo;</em> 发表帖子
					</div>
				</div>
				<form id="userForm">
				<input type="hidden" name="iscode" value="${iscode}" >
				<input type="hidden" name="fa_resource" value="${faSection.fa_id}" >
				<input type="hidden" name="fa_type" value="4" >
					<div id="ct" class="ct2_a ct2_a_r wp cl">
						<div>
							
										<div class="bm bw0 cl editorbox_post" >
											<ul class="tb cl mbw tab_editorbox">
												<li ><a href="/fiioer/sendThemeNote.do?id=${faSection.fa_id}">发表帖子</a></li>
												<li><a href="/fiioer/sendVoteNote.do?id=${faSection.fa_id}">发表投票</a></li>
												<li ><a href="/fiioer/sendQuestNote.do?id=${faSection.fa_id}">问题反馈</a></li>
												<%-- <li class="a"><a href="/fiioer/sendActiveNote.do?id=${faSection.fa_id}">活动参与</a></li> --%>
											</ul>
											<div >
												<div class="pbt cl">
													<div class="z">
														<span><input type="text" name="fa_title"
															class="input_style3"></span> 标题（<span id="subjectchk">最多可输入
															<strong id="checklen">80</strong> 个字符）
														</span>
													</div>
													<hr color="white"/>
													<div class="z">
														<span><input type="num" name="fa_total_people" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" 
															class="input_style3"></span> 活动参与人数
														</span>
													</div>
													
													
												</div>
												

												<div class="edt" id="e_body"
													style="display: none; margin-top: 20px;">
													
													
													
													<div class="area">

														<textarea id="content1" name="fa_desc" cols="100" rows="8" style="width:850px;height:700px;visibility:hidden;"></textarea>
														
													</div>
													
													<link rel="stylesheet" type="text/css"
														href="/data/cache/style_1_editor.css">
														<script src="/static_new/pc/js/common/editor-5ec7a9279e.js"
															type="text/javascript"></script>
														<script src="/static_new/pc/js/common/bbcode-ead169033f.js"
															type="text/javascript"></script>
												</div>
												<script type="text/javascript" reload="1">
													checkFun(".wrap_simcheck",
															"checked_simcheck");
													simSelectFun("#post_extra select");
												</script>
												
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
															<span>发表帖子</span>
														</button>
													</a> 
														<div class="cr"></div>
												</div>
												<div class="cr"></div>
											</div>
										</div>
						</div>
						<script type="text/javascript" reload="1">
							checkFun(".wrap_simcheck", "checked_simcheck");
							simSelectFun("#post_extra select");
						</script>
						<div class="cr"></div>
					</div>
					<div class="cr"></div>
				</form>

				<div id="e_menus" class="editorrow"
					style="overflow: hidden; height: 0; border: none; background: transparent;">
					<div id="e_editortoolbar" class="editortoolbar"></div>
					<script type="text/javascript">
						smilies_show('smiliesdiv', 8, editorid + '_');
					</script>
					<script src="/static_new/pc/js/common/swfupload-d6e7d991af.js"
						type="text/javascript"></script>
					<script src="/static_new/pc/js/common/swfupload-d9868d2cdb.queue.js"
						type="text/javascript"></script>
					<script src="/static_new/pc/js/common/handlers-d0d854516b.js"
						type="text/javascript"></script>
					<script src="/static_new/pc/js/common/fileprogress-f2b907e67b.js"
						type="text/javascript"></script>
					<script type="/text/javascript">
						function switchImagebutton(btn) {
							switchButton(btn, 'image');
							$(editorid + '_image_menu').style.height = '';
							doane();
						}

						function switchAttachbutton(btn) {
							switchButton(btn, 'attach');
							doane();
						}
					</script>

				</div>
				<div class="cr"></div>
			</div>
			<c:import url="${path}/feiiombend.jsp"></c:import>
			<div id="scrolltop2" class="scrolltop2"></div>
			<script>
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
				$('#extra_more_b').click(function() {
					$('#extra_more_b_menu').toggle();
				});
			</script>
</body>
<script type="text/javascript">
	$(function() {
		$("#hyg").click(function(){
			$("#vmss").attr("src", "${path}/verify/show.do?random=" + Math.random());
		})
		$("#surebtn").click(function(){
			document.getElementById("content1").value=KE.util.getData('content1');
			
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
</script>
</html>
