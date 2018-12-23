<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_common.css" />
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_home_spacecp.css" />
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_home_follow.css-wxr.css" />
<script src="/js/jquery.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/css/header.css" />
</head>
<body>
	
	<c:import url="${path}/feiiohead.jsp"></c:import>
	<div id="wp" class="wp">

		<div class="boardnav">
			<!-- 个人中心 帖子 -->
			<div id="ct" class="ct2_a wp cl">
				<c:import url="${path}/feiiombright.jsp"></c:import>
				<div class="mn ct1_feed float_l">
					<!-- 列表 -->
					<div id="threadlist" class="tl bm cont_wp">
						<!-- 个人中心 帖子 -->
						<!--  -->
						<div class="thmenu">
							<div class="page_frame_navigation">
								<div class="follow_feed_cover" style="left: 22px;"></div>
								<ul class="mbw tb cl page_frame_ul" style="padding-left: 20px;">
									<li class="a"><a href="/fiioer/myNote.do">主题</a></li>
									<li><a href="/fiioer/myNoteComment.do">回复</a></li>

									<li><a href="/fiioer/myNoteCollect.do">收藏</a></li>
								</ul>
							</div>
						</div>
						<div class="bm_c">
							<div class="tl">
								<form id="delform">
									<input type="hidden"> <input type="hidden">
											<table cellspacing="0" cellpadding="0" id="pm_ul"
												class="space_thread_table">
												<tr class="space_th">
													<td class="icn">&nbsp;</td>
													<th>
														<p class="space_tbmu">
															<a href="/fiioer/showMemberNote.do?id=${fuf.fa_id}" class="a">发帖</a> <span
																class="pipe">
														</p>
													</th>
													<td class="frm">版块</td>
													<td class="num" style="padding-right: 20px;">回复/查看</td>
													<td class="by" style="width: 160px"><cite>发表时间</cite></td>
													<td class="by" width="50px"><cite>操作</cite></td>
												</tr>
												
												
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
		</div>
		<c:import url="${path}/feiiombend.jsp"></c:import>
</body>
<script src="/js/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/commom.js"></script>
<script>
	login();
	loginbox();
</script>
<script>
	$(function() {
		var url = "/fiioer/selectMemberNote.do";
		moreLongData({
			"curpage" : $("#curpage").val(),
			"id" : "${fu.fa_id}"
		}, url)
		//加载更多
		$("#loadingfeed").click(function() {
			moreLongData({
				"curpage" : $("#curpage").val(),
				"id" : "${fu.fa_id}"
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
						var vas = "";
						if (data.rows != null && data.rows.length > 0) {
							for (i in data.rows) {
								var vat ='<tr><td class="icn">&nbsp;</td><th class="scontent"><a href="/note/showNoteContent.do?id='+data.rows[i].id+'">'+data.rows[i].name+'</a></th><td><a href="javascript:void(0)" class="forum">'+data.rows[i].model+'</a></td><td class="num"><div class="sreply"><a href="javascript:void(0)" class="xi2">'+data.rows[i].pinglun+'</a></div><div class="sview">'+data.rows[i].readss+'</div></td><td class="by"><div class="sview"><a href="javascript:void(0)">'+data.rows[i].day+'</a></div></td><td><a id="'+data.rows[i].id+'" href="javascript:void(0)" class="deletes">删除</a></td></tr>';
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
							$("#pm_ul").append("<tr><td colspan='5' align='center'><br>您还未发表过帖子<br>&nbsp;</td></tr>")
							$("#loadingfeed").hide();
							
						}
						$(".deletes").click(function(){
							var id =$(this).prop("id");
							
							$.ajax({
								url:"/fiioer/deleteMyNote.do",
								data:{"id":id},
								type:"post",
								dataType:"json",
								success:function(data){
									if(data.tip=="success"){
										$("#append_parent").show();
										$("#showMsg").text("删除成功");
										$(".vmss").trigger("click");
										$("#"+id).parent().parent().hide()
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

					},
					error : function() {
					}
				})
	}
</script>
</html>
