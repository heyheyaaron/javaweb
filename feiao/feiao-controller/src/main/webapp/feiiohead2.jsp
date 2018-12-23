<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


</head>
<body>
	<div id="flw_header" class="mbw bbs cl"
		style="background-color: #FFFFFF; border: #e6e6e6 1px solid;">
		<div class="follow_avatar" style="position: relative;">
			<a class="avatar" href="javascript:void(0)"> <img
				src="${fu.fa_title_img}"><span
				class="shadowbox_avatar"> </span></a>
			<div class="follow_avatar_absolute" style="display: none;">
				<a href="/fiioer/myTitleImage.do">修改头像</a>
			</div>

		</div>
		<div class="broadcast"
			style="width: 578px; _width: 577px; border-left: #e6e6e6 1px solid;">
			<div class="broadcast_top">
				<div class="uname_broadcast">
					<span class="inner_uname">${fu.fa_username}</span> <span class="cl"></span>
				</div>
				<div style="float: right; padding-top: 5px;">
					<span class="c">广播</span><span class="f"><a
						href="javascript:void(0)">${moods}</a></span> <span class="c">收听</span><span
						class="f"><a href="javascript:void(0)">${follows}</a></span> <span
						class="c">听众</span><span class="f"><a
						href="javascript:void(0)">${fanss}</a></span>
				</div>
				<div class="cr"></div>
			</div>



			<form id="userForm">
				<input type="hidden" name="iscode" value="${iscode}" >
				<div id="fastpostreturn" style="margin: -5px 0 5px"></div>
				<div style="position: relative; z-index: 9;">
					<div id="flw_post_extra" class="mtn cl"
						style="width: 578px; _width: 577px;">
						<div id="fastposteditor">
							<div class="tedt2"
								style="background-color: #f9f9f9; _width: 576px; _overflow: hidden;">
								<div class="area" style="background-color: #f9f9f9;">
									<textarea
										style="height: 55px; width: 554px; font-size: 14px; padding: 5px 0 0 20px; outline: none;"
										cols="70" name="desc" class="pt2 xs2"></textarea>
								</div>
								<div id="flw_bar" class="bar2"
									style="_width: 569px; height: 39px; *height: 39px;">
									<div style="float: left; width: 120px; margin-top: 8px;">
										<div class="fpd">
											<!-- 标签 -->
											<!-- <a href="javascript:;" class="fsml" id="fastpostsml"><em></em></a> -->


										</div>


									</div>
									<div
										style="float: right; margin: 0px; padding: 0px; width: 435px;">
										<button type="button" id="fastpostsubmit" class="pn pnc"
											style="float: right;">发表</button>
										

										<div class="cr"></div>
									</div>
									<div class="cr"></div>
								</div>
							</div>
						</div>



						<div class="upfl">
							<div id="attachlist" class="fieldset flash cl">
								<span style="font-size: 0"></span>
							</div>
						</div>
						<c:if test="${iscode>0}">
						<div class="mtm sec">
							<input type="hidden"> 验证码 <span id="seccodeSUk32lc0"><input
								id="seccodeverify_SUk32lc0" type="text" name="vode"  class="txt px vm">

								<span id="seccode_SUk32lc0_secshow" class="seccode_image"></span>
								<span id="checkseccodeverify_SUk32lc0" class="seccheck_status"><img
									src="${path}/verify/show.do" width="100" height="32" class="vm " id="vmss"></span>
								<a href="javascript:;" class="xi2" id="hyg">换一个</a></span>
						</div>
						</c:if>
						<input type="hidden">
					</div>

				</div>
			</form>
		</div>


	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#hyg").click(function(){
			$("#vmss").attr("src", "${path}/verify/show.do?random=" + Math.random());
		})
		//确认发表
		$("#fastpostsubmit").click(function(){
			
			$.ajax({
				url:"/fiioer/sureSendMyGood.do",
				data:$("#userForm").serialize(),
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.tip=="success"){
						$("#append_parent").show();
						$("#closeTip").hide();
						$("#showMsg").text("发表成功");
						$(".vmss").trigger("click");
						setTimeout(function(){
							window.location.href="/fiioer/mySelfMood.do";
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
	})
</script>
</html>