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
<link rel="stylesheet" type="text/css" href="/css/header.css"/>
	<script type="text/javascript" src="/js/commom.js"></script>
	<script src="/static_new/pc/js/common/jquery-1-6da57f4a2b.7.1.min.js"
		type="text/javascript"></script>
	<script src="/js/jquery-1.11.2.min.js" type="text/javascript"></script>
	<style >
	.latestreply_list a, .latestreply_list span {
    font-size: 10px !important;
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
			<div class="boardnav">
				<div id="ct" class="wp cl">
				
				
				
				
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
								版主 : <span class="xi2">
								<c:if test="${sns!=null && !empty sns}">
									<c:forEach items="${sns}" var="sn">
										<a href="/fiioer/showMemberMsg.do?id=${sn['id']}" class="notabs"><font color="red" style="font-weight:bold;font-style:italic;">${sn['name']}</font></a>
									</c:forEach>
								</c:if>
								<c:if test="${sns==null || empty sns}">
									该板块还没有设立版主
								</c:if>
								
									
									</span>
							</div>
							<c:if test="${fu.fa_ishost>1 || fu.fa_sectionid==faSection.fa_id}">
								<div id="bj1" style="display: none">
									<a href="javascript:void(0)" id="bianji1"  >预览</a>
									<div class="ptn xg2">
											<textarea rows="6" cols="37" id="descss" >${faSection.fa_desc}</textarea>
									</div>
									<a href="javascript:void(0)" style="float: right;" id="suredese">确认</a>
								</div>
								<div id="bj2">
									<a href="javascript:void(0)" id="bianji2">编辑</a>
									<div class="ptn xg2 eeeee">
											${faSection.fa_desc}
									</div>
								</div>
							</c:if>
							<c:if test="${fu.fa_ishost<=1 && fu.fa_sectionid!=faSection.fa_id}">
								<div id="bj2">
								
									<div class="ptn xg2 eeeee" >
											${faSection.fa_desc}
									</div>
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
														src="${hi['fa_image']}" width="124"
														height="100"></a> <a href="${hi['fa_url']}">
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
					
					
					
					
					
					<div class="mn plate_mn">
					<c:if test="${lz!=null &&!empty lz}">
						<div class="bm  fl child_forum" style="border: none;">
								<div class="bm_h cl cf_title" style="overflow: inherit;">
									<span class="o"></span>
									<h2>${faSection.fa_name}的子模块</h2>
								</div>
								<div id="subforum_22" class="bm_c cf_content bm_c1" style="">
									<ul>
										<c:forEach items="${lz}" var="lz">
											<li>
												<a href="/note/showFSection.do?id=${lz['id']}">${lz['name']}</a>
											</li>
										</c:forEach>
										
										
									</ul>
								</div>
							</div>
							<div style="clear: both;"></div>
							<div class="boxspacing_10"></div>
					</c:if>
						<div id="threadlist" class="tl bm bmw">
							<div class="th" style="position: relative;">
								<table cellspacing="0" cellpadding="0">
									<tr>
										<th class="filbarwrap_thread" colspan="2">
											<div class="tf filterbar_thread cl">
												<span style="margin-right: 30px;">当前版块 : <a
													style="float: none; color: #000" href="javascript:void(0)">${faSection.fa_name}</a></span>
												<a href="javascript:void(0)" class="xi2 " id="qbs" >全部</a> <span
													class="pipe2"> </span> <a href="javascript:void(0)" class="xi2 " id="jps">精品</a> <span
													class="pipe2"> </span> <a href="javascript:void(0)" class="xi2 " id="rms">热门</a> <span
													style="margin-left: 24px;">&nbsp;</span> <a
													id="filter_orderby" href="javascript:;"
													class="showmenu xi2" onclick="showMenu(this.id)"> 排序方式
													<em class="arrow_dark"></em>
												</a>
												<div id="filter_orderby_menu" class="p_pop"
													style="display: none; position: absolute; left: 300px; top: 55px;">
													<ul>
														<input type="hidden" id="sortss" value="0" />
														<input type="hidden" id="types" value="0" />
														<li><a class="showmenu_elect" href="javascript:void(0)" id="m1">默认排序</a></li>
														<li><a class="" href="javascript:void(0)" id="m2">发帖时间</a></li>
														<li><a class="" href="javascript:void(0)" id="m4">阅读数</a></li>
														<li><a class="" href="javascript:void(0)" id="m5">最新回复</a></li>
														<li><a class="" href="javascript:void(0)" id="m6">热度</a></li>
														<ul>
												</div>
												<a href="javascript:void(0)"
													class="bluebtn normalbtn fatiebtn" >发帖</a>
											</div>
										</th>

									</tr>
								</table>
							</div>
							<div class="bm_c">
								<form id="moderate">
									<input type="hidden"> <input type="hidden">
											<table cellspacing="0" cellpadding="0" id="myDatas">
												
												
												
												
												
												

											</table>
								</form>
							</div>
							<div class="bm bw0 pgs cl pagebar">
								<span id="fd_page_bottom"><div class="pg">
										<a class="prev" id="lastpage" ><em class="previcon"></em></a>
										<strong id="curpage">1</strong>
										<a href="javascript:void(0)" id="secondpage" >2</a>
										<a href="javascript:void(0)" id="thirdpage" >3</a>
										<a href="javascript:void(0)" id="forthpage" >4</a>
										<a href="javascript:void(0)"  >...</a>
										<a href="javascript:void(0)" id="nextpage" class="nxt"><em class="nxticon"></em></a>
										<input type="hidden" id="totalsize" />
									</div></span> <a href="javascript:void(0)" 
									class="bluebtn normalbtn fatiebtn" id="newspecialtmp">发帖</a>
							</div>
						</div>

					</div>
				</div>
			</div>
			<c:import url="${path}/feiiombend.jsp"></c:import>
			<div id="scrolltop2" style="left: 1491.5px; display: block;"
				class="scrolltop2"></div>
</body>
<script type="text/javascript">
	show();
	showmenu();
	attention_expand();
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
	})
</script>
<script>
$(function(){
	var a = new Array("日", "一", "二", "三", "四", "五", "六");  
	var week = new Date().getDay();  
	var str = "星期"+ a[week];
	$("#weekday").html(str)
	
	if(Number("${issign}")>0){
		$("#qiandao").text("已签到")
	}else{
		$("#qiandao").html("签&nbsp;到")
	}
	//签到
	$("#qiandao").click(function(){
		if("${fu}"!=null && "${fu}"!=""){
			$.ajax({
				url:"/note/signIsTrue.do",
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.tip=="success"){
						$(".tips_signin").show();
						$("#tipz").html('恭喜你，签到成功')
						setTimeout(function(){
							$(".tips_signin").hide();
						},2000)
					}else{
						$(".tips_signin").show();
						$("#tipz").html(data.tip)
						setTimeout(function(){
							$(".tips_signin").hide();
						},2000)
					}
				},
				error:function(){
					$(".tips_signin").show();
					$("#tipz").html('系统发生异常,请稍后再操作')
					setTimeout(function(){
						$(".tips_signin").hide();
					},2000)
				}
			})
			
			
			
		}else{
			$(".tips_signin").show();
			$("#tipz").html('请先<a href="/login.do">登录</a>')
			setTimeout(function(){
				$(".tips_signin").hide();
			},2000)
		}
		
		
		
		
		
		
		
		
		
	})
	var url = "/note/selectAllNoteBySection.do";
	pageData({"curpage":1,"pid":"${faSection.fa_id}","types":$("#types").val(),"sort":$("#sortss").val()},url)
	
	//上一页
	$("#lastpage").click(function(){
		var cp =Number(($("#curpage").text()))-1
		pageData({"curpage":cp,"pid":"${faSection.fa_id}","types":$("#types").val(),"sort":$("#sortss").val()},url)
	})
	//第二页
	$("#secondpage").click(function(){
		var cp =Number(($("#curpage").text()))+1
		pageData({"curpage":cp,"pid":"${faSection.fa_id}","types":$("#types").val(),"sort":$("#sortss").val()},url)
	})
	//第三页
	$("#thirdpage").click(function(){
		var cp =Number(($("#curpage").text()))+2
		pageData({"curpage":cp,"pid":"${faSection.fa_id}","types":$("#types").val(),"sort":$("#sortss").val()},url)
	})
	//第四页
	$("#forthpage").click(function(){
		var cp =Number(($("#curpage").text()))+3
		pageData({"curpage":cp,"pid":"${faSection.fa_id}","types":$("#types").val(),"sort":$("#sortss").val()},url)
	})
	
	//下一页
	$("#nextpage").click(function(){
		var cp =Number(($("#curpage").text()))+1
		pageData({"curpage":cp,"pid":"${faSection.fa_id}","types":$("#types").val(),"sort":$("#sortss").val()},url)
	})
	//全部
	$("#qbs").click(function(){
		$("#types").val("0")
		var cp =1;;
		pageData({"curpage":cp,"pid":"${faSection.fa_id}","types":"0","sort":$("#sortss").val()},url)
	})
	//精品
	$("#jps").click(function(){
		$("#types").val("1")
		var cp =1;;
		pageData({"curpage":cp,"pid":"${faSection.fa_id}","types":"1","sort":$("#sortss").val()},url)
	})
	//热门
	$("#rms").click(function(){
		$("#types").val("2")
		var cp =1;;
		pageData({"curpage":cp,"pid":"${faSection.fa_id}","types":"2","sort":$("#sortss").val()},url)
	})
	//默认排序
	$("#m1").click(function(){
		$("#m1").addClass("showmenu_elect")
		$("#m2").removeClass("showmenu_elect")
		$("#m3").removeClass("showmenu_elect")
		$("#m4").removeClass("showmenu_elect")
		$("#m5").removeClass("showmenu_elect")
		$("#m6").removeClass("showmenu_elect")
		$("#sortss").val("0")
		var cp =Number(($("#curpage").text()))
		pageData({"curpage":cp,"pid":"${faSection.fa_id}","types":$("#types").val(),"sort":"0"},url)
	})
	//发帖时间
	$("#m2").click(function(){
		$("#m2").addClass("showmenu_elect")
		$("#m1").removeClass("showmenu_elect")
		$("#m3").removeClass("showmenu_elect")
		$("#m4").removeClass("showmenu_elect")
		$("#m5").removeClass("showmenu_elect")
		$("#m6").removeClass("showmenu_elect")
		$("#sortss").val("1")
		var cp =Number(($("#curpage").text()))
		pageData({"curpage":cp,"pid":"${faSection.fa_id}","types":$("#types").val(),"sort":"1"},url)
	})
	//阅读
	$("#m4").click(function(){
		$("#m4").addClass("showmenu_elect")
		$("#m2").removeClass("showmenu_elect")
		$("#m3").removeClass("showmenu_elect")
		$("#m1").removeClass("showmenu_elect")
		$("#m5").removeClass("showmenu_elect")
		$("#m6").removeClass("showmenu_elect")
		$("#sortss").val("3")
		var cp =Number(($("#curpage").text()))
		pageData({"curpage":cp,"pid":"${faSection.fa_id}","types":$("#types").val(),"sort":"3"},url)
	})
	//最新回复
	$("#m5").click(function(){
		$("#m5").addClass("showmenu_elect")
		$("#m2").removeClass("showmenu_elect")
		$("#m3").removeClass("showmenu_elect")
		$("#m4").removeClass("showmenu_elect")
		$("#m1").removeClass("showmenu_elect")
		$("#m6").removeClass("showmenu_elect")
		$("#sortss").val("4")
		var cp =Number(($("#curpage").text()))
		pageData({"curpage":cp,"pid":"${faSection.fa_id}","types":$("#types").val(),"sort":"4"},url)
	})
	//热度
	$("#m6").click(function(){
		$("#m6").addClass("showmenu_elect")
		$("#m2").removeClass("showmenu_elect")
		$("#m3").removeClass("showmenu_elect")
		$("#m4").removeClass("showmenu_elect")
		$("#m5").removeClass("showmenu_elect")
		$("#m1").removeClass("showmenu_elect")
		$("#sortss").val("5")
		var cp =Number(($("#curpage").text()))
		pageData({"curpage":cp,"pid":"${faSection.fa_id}","types":$("#types").val(),"sort":"5"},url)
	})
	//发帖
	$(".fatiebtn").click(function(){
		if("${fu}"!=null && "${fu}"!=""){
			window.location.href="/fiioer/sendThemeNote.do?id=${faSection.fa_id}";
		}else{
			$("#append_parent").show();
			$("#showMsg").text("您还没有登陆，登陆后才能发帖");
			setTimeout(function(){
				$("#append_parent").hide();
			},2000)
		}
	})
	//预览
	$("#bianji1").click(function(){
		$("#bj1").hide();
		$("#bj2").show();
		
	})
	//编辑
	$("#bianji2").click(function(){
		$("#bj2").hide();
		$("#bj1").show();
		
	})
	//确认编辑编辑
	$("#suredese").click(function(){
		$.ajax({
			url:"/note/updateSectionMsg.do",
			data:{"nid":"${faSection.fa_id}","desc":$("#descss").val()},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.tip=="success"){
					$("#append_parent").show();
					$("#showMsg").text("修改成功");
					$(".eeeee").html($("#descss").val())
					setTimeout(function(){
						$("#append_parent").hide();
					},1000)
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
				$("#showMsg").text("系统发生异常，请重新操作");
				setTimeout(function(){
					$("#append_parent").hide();
				},2000)
			}
		})
		
	
		
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
						var vat ='<tbody ><tr><td class="userhead"><a class="avatar"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].puid+'"><img src="'+data.rows[i].image+'"></a></a></td><th class="lock padding0 itemcont_threadlist"><div class="maincont_list" >';
						//if(data.rows[i].title.length>30){
							//data.rows[i].title=data.rows[i].title.substring(0,30)+"....."
						//}
						
						//if(data.rows[i].huifu.length>5){
							//data.rows[i].huifu=data.rows[i].huifu.substring(0,5)+"....."
							data.rows[i].huifu="";
						
						if(data.rows[i].zhiding==1){
							if(data.rows[i].jingpin==1){
								vat = vat +'<a href="/note/showNoteContent.do?id='+data.rows[i].id+'" style="font-weight: bold; color: #EE1B2E" class="xst ">'+data.rows[i].title+'<font color="red" size="1px">&nbsp;顶</font><font color="blue" size="1px">&nbsp;精</font></a>';
								
							}else{
								vat = vat +'<a href="/note/showNoteContent.do?id='+data.rows[i].id+'" style="font-weight: bold; color: #EE1B2E" class="xst ">'+data.rows[i].title+'<font color="red" size="1px">&nbsp;顶</font></a>';

							}
						}else{
							if(data.rows[i].jingpin==1){
								vat = vat +'<a href="/note/showNoteContent.do?id='+data.rows[i].id+'" style="font-weight: bold; color: #996600" class="xst ">'+data.rows[i].title+'<font color="blue" size="1px">&nbsp;精</font></a>';

							}else{
								if(data.rows[i].gaoliang==1){
									vat = vat +'<a href="/note/showNoteContent.do?id='+data.rows[i].id+'" style="font-weight: bold; color: #2897C5" class="xst ">'+data.rows[i].title+'<font color="red" size="1px">&nbsp;顶</font><font color="blue" size="1px">&nbsp;精</font></a>';

								}else{
									//普通帖子
									vat = vat+'<a href="/note/showNoteContent.do?id='+data.rows[i].id+'" style="font-weight: bold;  class="xst ">'+data.rows[i].title+'</a>'
									
								}
							}
						}
						/*  */
						
						
						vat = vat+'<span><br>'+data.rows[i].huifu+'</span><span class="cr"> </span></div></th><td class="latestreply_list"><span> <a href="/fiioer/showMemberMsg.do?id='+data.rows[i].uid+'" class="author_list">'+data.rows[i].uname+'</a></span><br /><span class="date_list"><span>'+data.rows[i].day+'</span></span><div class="" style="margin-top: -18px;"><span style="position: relative;top:26px;left: -124px;"><a href="">${faSection.fa_name}&nbsp;&nbsp;<font>'
						if(data.rows[i].types==1){
							vat = vat+'主题帖'
						}else if(data.rows[i].types==2){
							vat = vat+'投票帖'
						}else if(data.rows[i].types==3){
							vat = vat+'反馈贴'
						}else{
							vat = vat+'活动贴'
						}	
						vat = vat+'</font></a></span><div class="" style="float: left;margin-top: 10px;"><span class="xi1" style="vertical-align: top;">回复：'+data.rows[i].pls+'</span><span class="xi1" style="float:right;">阅读：'+data.rows[i].ping+'</span></div></div>	</td></tr></tbody>';
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
