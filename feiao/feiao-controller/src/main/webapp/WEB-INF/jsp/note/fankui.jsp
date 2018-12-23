<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head lang="en">
<meta charset="utf-8">
<meta name="renderer" content="webkit" />
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_common.css" />

<link rel="stylesheet" type="text/css"
	href="/data/cache/style_2_forum_forumdisplay" />
<link rel="stylesheet" type="text/css"
	href="/resources/flymebbs/flyme/style_extends.css" />
<script type="text/javascript" src="/js/jquery.js"></script>
<script type="text/javascript" src="/js/commom.js"></script>
</head>

<body id="nv_forum" class="pg_index">
	<div id="hd" style="height: 86px;">
		<div id="w_header">
			
			<!--version: 2016-12-01 15:16:51-->
			<c:import url="${path}/feiiohead.jsp"></c:import>
		</div>
	</div>
	<div style="clear: both;"></div>
	<div id="wp" class="wp">
		<link rel="stylesheet"
			href="http://bbs.res.flyme.cn/resources/flymebbs/flyme/style_extends.css"
			type="text/css"/>
		<div class="buglist_head copyr233">
			<div class="buglist_title">
				<a href="/note/showFSection.do?id=6"
					style="border-bottom: 2px solid #FF3939;">建议反馈</a>
			</div>
			<div class="buglist_nav">
				<div class="buglist_nav_module">
					<div class="pbt cl">
						<div class="z"
							style="width: 60px; height: 26px; margin-bottom: 10px;">
							<span id="subjectchk" style="height: 26px; line-height: 26px;">
								模块</span>

						</div>
						<div class="z"
							style="width: 230px; height: 26px; margin-bottom: 10px;">
							<span id="subjectchk" style="height: 26px; line-height: 26px;">
								产品类别：</span> <span> <select id="protype" name="protype"
								style="border: 1px solid #E5E5E5; background: #F5F5F5; padding: 0px 20px; font-size: 12px; color: #999;width: 120px">
									
							</select></span>
						</div>
						<div class="z"
							style="width: 230px; height: 26px; margin-bottom: 10px;">
							<span id="subjectchk" style="height: 26px; line-height: 26px;">
								产品型号：</span> <span> <select id="prostyle" name="prostyle"
								style="border: 1px solid #E5E5E5; background: #F5F5F5; padding: 0px 20px; font-size: 12px; color: #999;width: 120px">
									
							</select></span>
						</div>

						<div class="z"
							style="width: 230px; height: 26px; margin-bottom: 10px;">
							<span id="subjectchk" style="height: 26px; line-height: 26px;">
								问题类别：</span> <span> <select id="proquest" name="proquest"
								style="border: 1px solid #E5E5E5; background: #F5F5F5; padding: 0px 20px; font-size: 12px; color: #999;width: 120px">
									
							</select>
							</span>
						</div>




					</div>
				</div>
			</div>
		</div>
		<div class="buglist_body">
			<div class="buglist_classify">
				<ul class="buglist_classify_nav">
					<li id="newNote" class="active"><a href="javascript:void(0)" > <i
							class="i_icon suggestlist_classify_new"></i>
							<p>最新提交</p>
					</a></li>
					<li  id="nohandle"><a href="javascript:void(0)" > <i class="i_icon buglist_classify_pending"></i>
							<p>待处理</p>
					</a></li>
					<li id="handling"><a href="javascript:void(0)" > <i class="i_icon buglist_classify_handled"></i>
							<p>处理中</p>
					</a></li>
					<li id="handled"><a href="javascript:void(0)" > <i class="i_icon buglist_classify_solved"></i>
							<p>已处理</p>
					</a></li>
				</ul>
				<div class="buglist_btns">

					<a href="/fiioer/sendQuestNote.do?id=6" class="bug_fb"
						style="background: #FF3939; float: right;">建议反馈</a>
				</div>
			</div>
			<table cellpadding="0" cellspacing="0" class="postlist_table">
				<thead>
					<tr>
						<th class="handle_status"><a href="javascript:void(0)">处理状态</a></th>
						<th class="feedback_title">建议反馈</th>
						<th class="attention_rate"><a href="javascript:void(0)">回复/查看</a></th>
						<th class="author">提交人</th>
						<th class="post_time"><a href="javascript:void(0)">提交时间</a></th>
					</tr>
				</thead>
				<tbody id="myDatas">
				</tbody>
			</table>
		</div>
		<span id="fd_page_bottom" style="float: right; padding-top: 20px;">
		<div class="pg">
										<a class="prev" id="lastpage" ><em class="previcon"></em></a>
										<strong id="curpage">1</strong>
										<a href="javascript:void(0)" id="secondpage" >2</a>
										<a href="javascript:void(0)" id="thirdpage" >3</a>
										<a href="javascript:void(0)" id="forthpage" >4</a>
										<a href="javascript:void(0)"  >...</a>
										<a href="javascript:void(0)" id="nextpage" class="nxt"><em class="nxticon"></em></a>
										<input type="hidden" id="totalsize" />
										<input type="hidden" id="handletype" value="0" />
										
									</div>
		 </span>
		<div style="clear: both;"></div>
	</div>
	<div id="ft" class="wp cl"></div>
	<div class="focus plugin" id="ip_notice"></div>
	<!-- start goTop -->
	<div id="scrollTop">
		<a class="sclTop_share sclTop_shareWX" href="javascript:void(0);">
			<i class="icon icon_weixin"></i>
		</a> <a class="sclTop_share sclTop_shareWB" href=""> <i
			class="icon icon_weibo"></i>
		</a> <a class="sclTop_share sclTop_goTop" href="javascript:void(0);">
			<i class="icon icon_goTop"></i>
		</a>
		<div id="wechatPic"></div>
	</div>
	<!-- end goTop -->
	<c:import url="${path}/feiiombend.jsp"></c:import>
	<div id="scrolltop2" style="left: 1491.5px; display: block;"
		class="scrolltop2"></div>
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
	</script>
</body>
<script type="text/javascript">
$(function(){
	//异步加载产品类别
	$.ajax({
		url:"/note/selectNoteType.do",
		type:"post",
		dataType:"json",
		success:function(data){
			var options = [];
			options.push("<option value='0' selected='selected' > --全选-- </option>");
			$.each(data.rows, function (index, value) {
				
				
				options.push("<option value='" + value.id + "'> " + value.name + " </option>");
				
				
				
				
		    });
		    $("#protype").append(options.join(''));
		},
		error:function(){
			
		}
	})
	//异步加载产品型号
	$.ajax({
		url:"/note/selectNoteStyle.do",
		type:"post",
		dataType:"json",
		success:function(data){
			var options = [];
			options.push("<option value='0' selected='selected' > --全选-- </option>");
			$.each(data.rows, function (index, value) {
				
					options.push("<option value='" + value.id + "'> " + value.name + " </option>");
				
				
				
				
		    });
		    $("#prostyle").append(options.join(''));
		},
		error:function(){
			
		}
	})
	//异步加载产品型号
	$.ajax({
		url:"/note/selectNoteQuest.do",
		type:"post",
		dataType:"json",
		success:function(data){
			var options = [];
			options.push("<option value='0' selected='selected' > --全选-- </option>");
			$.each(data.rows, function (index, value) {
				
					options.push("<option value='" + value.id + "'> " + value.name + " </option>");
				
				
				
				
		    });
		    $("#proquest").append(options.join(''));
		},
		error:function(){
			
		}
	})
	var url = "/note/selectFankuiNoteBySection.do";
	pageData({"curpage":1,"protype":0,"prostyle":0,"proquest":0,"handletype":0},url)
	
	//上一页
	$("#lastpage").click(function(){
		var cp =Number(($("#curpage").text()))-1
		pageData({"curpage":cp,"protype":$("#protype").val(),"prostyle":$("#prostyle").val(),"proquest":$("#proquest").val(),"handletype":$("#handletype").val()},url)
	})
	//第二页
	$("#secondpage").click(function(){
		var cp =Number(($("#curpage").text()))+1
		pageData({"curpage":cp,"protype":$("#protype").val(),"prostyle":$("#prostyle").val(),"proquest":$("#proquest").val(),"handletype":$("#handletype").val()},url)

	})
	//第三页
	$("#thirdpage").click(function(){
		var cp =Number(($("#curpage").text()))+2
		pageData({"curpage":cp,"protype":$("#protype").val(),"prostyle":$("#prostyle").val(),"proquest":$("#proquest").val(),"handletype":$("#handletype").val()},url)

	})
	//第四页
	$("#forthpage").click(function(){
		var cp =Number(($("#curpage").text()))+3
		pageData({"curpage":cp,"protype":$("#protype").val(),"prostyle":$("#prostyle").val(),"proquest":$("#proquest").val(),"handletype":$("#handletype").val()},url)

	})
	
	//下一页
	$("#nextpage").click(function(){
		var cp =Number(($("#curpage").text()))+1
		pageData({"curpage":cp,"protype":$("#protype").val(),"prostyle":$("#prostyle").val(),"proquest":$("#proquest").val(),"handletype":$("#handletype").val()},url)

	})
	//类别
	$("#protype").change(function(){
		pageData({"curpage":1,"protype":$("#protype").val(),"prostyle":$("#prostyle").val(),"proquest":$("#proquest").val(),"handletype":$("#handletype").val()},url)
		//异步加载产品型号
			$.ajax({
				url:"/note/selectNoteStyleByPid.do",
				data:{"pid":$("#protype").val()},
				type:"post",
				dataType:"json",
				success:function(data){
					var options = [];
					options.push("<option value='0' selected='selected' > --全选-- </option>");
					$.each(data.rows, function (index, value) {
						
							options.push("<option value='" + value.id + "'> " + value.name + " </option>");
						
						
						
						
				    });
					$("#prostyle").html("")
					$("#prostyle").append(options.join(''));
				},
				error:function(){
					
				}
			})
	
	})
	//类型
	$("#prostyle").change(function(){
		pageData({"curpage":1,"protype":$("#protype").val(),"prostyle":$("#prostyle").val(),"proquest":$("#proquest").val(),"handletype":$("#handletype").val()},url)

	})
	//问题
	$("#proquest").change(function(){
		pageData({"curpage":1,"protype":$("#protype").val(),"prostyle":$("#prostyle").val(),"proquest":$("#proquest").val(),"handletype":$("#handletype").val()},url)

	})
	//最新
	$("#newNote").click(function(){
		$("#handletype").val(0)
		$("#newNote").addClass("active");
		$("#nohandle").removeClass("active");
		$("#handling").removeClass("active");
		$("#handled").removeClass("active");
		pageData({"curpage":1,"protype":$("#protype").val(),"prostyle":$("#prostyle").val(),"proquest":$("#proquest").val(),"handletype":0},url)

	})
	//未处理
	$("#nohandle").click(function(){
		$("#handletype").val(1)
		$("#newNote").removeClass("active");
		$("#nohandle").addClass("active");
		$("#handling").removeClass("active");
		$("#handled").removeClass("active");
		pageData({"curpage":1,"protype":$("#protype").val(),"prostyle":$("#prostyle").val(),"proquest":$("#proquest").val(),"handletype":1},url)

	})
	//处理中
	$("#handling").click(function(){
		$("#handletype").val(2)
		$("#newNote").removeClass("active");
		$("#nohandle").removeClass("active");
		$("#handling").addClass("active");
		$("#handled").removeClass("active");
		pageData({"curpage":1,"protype":$("#protype").val(),"prostyle":$("#prostyle").val(),"proquest":$("#proquest").val(),"handletype":2},url)

	})
	//已处理
	$("#handled").click(function(){
		$("#handletype").val(3)
		$("#newNote").removeClass("active");
		$("#nohandle").removeClass("active");
		$("#handling").removeClass("active");
		$("#handled").addClass("active");
		pageData({"curpage":1,"protype":$("#protype").val(),"prostyle":$("#prostyle").val(),"proquest":$("#proquest").val(),"handletype":3},url)

	})
})

function pageData(data,url){
		$.ajax({
			url:url,
			data:data,
			type:"post",
			dataType:"json",
			success:function(data){
				var vas = "";
				if(data.rows!=null &&data.rows.length>0 ){
					for(i in data.rows){
						var vat = '<tr>';
						if(data.rows[i].title.length>10){
							data.rows[i].title=data.rows[i].title.substring(0,10)+"....."
						}
						if(data.rows[i].isfinish==0){
							vat = vat+'<td class="handle_status"><span style="color: #1C7BF0">待处理</span>';
						}else if(data.rows[i].isfinish==1){
							vat = vat+'<td class="handle_status"><span style="color: #F59812">处理中</span>';
						}else{
							vat = vat+'<td class="handle_status"><span style="color: #EE1B2E">已处理</span>';
						}
						vat = vat + '</td><td class="feedback_title "><a href="/note/showNoteContent.do?id='+data.rows[i].id+'">'+data.rows[i].title+'</a></td><td class="attention_rate">'+data.rows[i].huifu+'/'+data.rows[i].readss+'</td><td class="author"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].uid+'">'+data.rows[i].uname+'</a></td><td class="post_time">'+data.rows[i].times+'</td></tr>';
						vas = vas+vat;
					
					}
					$("#myDatas").html(vas)
				}else{
					$("#myDatas").html("              <br>该板块还没有任何帖子！")
				}
				
				//加到分页页面curpage
				$("#curpage").text(data.curpage);
				$("#totalsize").val(data.totalsize);
				$("#secondpage").text(Number(data.curpage)+1);
				$("#thirdpage").text(Number(data.curpage)+2);
				$("#forthpage").text(Number(data.curpage)+3);
				$("#fifthpage").text(Number(data.totalpage));
				if(data.curpage==1){
					$("#lastpage").hide();
				}else{
					$("#lastpage").show();
				}
				if(data.curpage>=data.totalpage){
					$("#nextpage").hide();
					$("#secondpage").hide();
				}else{
					$("#nextpage").show();
					$("#secondpage").show();
				}
				if(Number(data.curpage)+2>data.totalpage){
					$("#thirdpage").hide();
				}else{
					$("#thirdpage").show();
				}
				if(Number(data.curpage)+3>data.totalpage){
					$("#forthpage").hide();
				}else{
					$("#forthpage").show();
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
	}
</script>
</html>