<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit" />
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_common.css" />
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_forum_forumdisplay.css" />
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/commom.js"></script>
<script type="text/javascript" src="/js/jquery.js"></script>
<script src="${path}/laydate/laydate.js"></script>
</head>

<body id="nv_forum" class="pg_index">
	<div id="hd">
		<div id="w_header">
			
			<c:import url="${path}/feiiohead.jsp"></c:import>
			<!--version: 2016-12-01 15:16:51-->
		</div>
		<form id="searchForm">
		<div class="am_best">
				<div id="wp" class="wp">
					<div class="guanjian">
						关键词
						<input type="text" name="sname"   placeholder='请输入搜索内容' >
					</div>
					<div class="am_tiezi">
						<label>
							<input type="radio" name="tieOrUser" value="0" />
							帖子
						</label>
						<label>
							<input type="radio" name="tieOrUser" value="1" />
							用户
						</label>
					</div>
						<div class="am_paixu">
						搜索时间
						<div class="am_paixu_r">
						<input  name="startDay"  class="input"  onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" />
						<b>至</b>
							<input  name="endDay"   class="input"  onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"/>
						</div>
					</div>
					<div class="am_paixu">
						排序类型
						<div class="am_paixu_r">
							<select name="types">
								<option value="0">回复时间</option>
								<option value="1">发布时间</option>
								<option value="2">回复数量</option>
								<option value="3">浏览次数</option>
							</select>
							<label>
							<input type="radio" name="sorts" value="0" />
							按升序排列
						</label>
							<label>
							<input type="radio" name="sorts" value="1"  />
								按降序排列
						</label>
						</div>
					</div>
					<div class="am_paixu">
						搜索范围
						<div class="am_paixu_r">
							<select name="section" id="section">
								
							</select>
						</div>
						
					</div>
					<input type="button" value="搜索" class="am_suis" id="searchzz">
				</div>
			</div>
			</form>
		<div id="wp" class="wp">
			<!--国-->
			<div class="cl w">
				<div class="mw">
					<div class="tl">
						<div class="pgs cl mbm"
							style="padding: 10px 0 20px 0; float: right;"></div>
						<div class="cr"></div>
						<div class="mainbox threadlist" style="margin: 0">
							<table class="tsearch" cellspacing="0" cellpadding="0"
								width="100%" id="myDatas">
								
								
							</table>
						</div>
						<div class="pgs cl mbm" style="padding: 20px 0 0 0; float: right;">
							<div class="pg">
										<a class="prev" id="lastpage" ><em class="previcon"></em></a>
										<strong id="curpage">1</strong>
										<a href="javascript:void(0)" id="secondpage" >2</a>
										<a href="javascript:void(0)" id="thirdpage" >3</a>
										<a href="javascript:void(0)" id="forthpage" >4</a>
										<a href="javascript:void(0)"  >...</a>
										<a href="javascript:void(0)" id="nextpage" class="nxt"><em class="nxticon"></em></a>
										<input type="hidden" id="totalsize" />
									</div>
						</div>
					</div>
				</div>
			</div>
			<c:import url="${path}/feiiombend.jsp"></c:import>
			<link rel="stylesheet" type="text/css" id="css_mobile"
				href="/template/default/common/index.css"/>
				<div id="scrolltop2" style="left: 1491.5px; display: block;"
					class="scrolltop2"></div>
</body>
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
<script>
$(function(){
	var url = "/note/searchNoteBySearchName.do";
	
	
	$.ajax({
		url:"/note/selectAllModel.do",
		type:"post",
		dataType:"json",
		success:function(data){
			var options = [];
			options.push("<option value='0' selected='selected' > 全部板块 </option>");
			$.each(data, function (index, value) {
				
					options.push("<option value='" + value.id + "'> " + value.name + " </option>");
				
				
				
				
		    });
			$("#section").append(options.join(''));
		},
		error:function(){
			
		}
	})
	
	
	pageData({"curpage":1,"search":"${search}"},url)
	//高级搜索
	$("#searchzz").click(function(){
		var cp =Number(($("#curpage").text()))-1
		pageData("curpage="+cp+"&search=${search}&"+$("#searchForm").serialize(),url)
	})
	//上一页
	$("#lastpage").click(function(){
		var cp =Number(($("#curpage").text()))-1
		pageData("curpage="+cp+"&search=${search}&"+$("#searchForm").serialize(),url)
	})
	//第二页
	$("#secondpage").click(function(){
		var cp =Number(($("#curpage").text()))+1
		pageData("curpage="+cp+"&search=${search}&"+$("#searchForm").serialize(),url)
	})
	//第三页
	$("#thirdpage").click(function(){
		var cp =Number(($("#curpage").text()))+2
		pageData("curpage="+cp+"&search=${search}&"+$("#searchForm").serialize(),url)
	})
	//第四页
	$("#forthpage").click(function(){
		var cp =Number(($("#curpage").text()))+3
		pageData("curpage="+cp+"&search=${search}&"+$("#searchForm").serialize(),url)
	})
	
	//下一页
	$("#nextpage").click(function(){
		var cp =Number(($("#curpage").text()))+1
		pageData("curpage="+cp+"&search=${search}&"+$("#searchForm").serialize(),url)
	})
})
function pageData(data,url){
	$.ajax({
		url:url,
		data:data,
		type:"post",
		dataType:"json",
		success:function(data){
			var vas = '<thead><tr style="background-color: #E6EAEB;"><th>标题</th><td class="forum" width="95" style="width: 95px;">板块</td><td class="forum" width="95" style="width: 95px;">类型</td><td class="author" width="130" style="width: 130px;">作者</td><td class="nums" width="60" style="width: 60px;">回复</td><td class="nums" width="60" style="width: 60px;">查看</td><td class="lastpost" width="130" style="width: 130px;">最后更新</td></tr></thead>';
			
			if(data.rows!=null &&data.rows.length>0 ){
				var searcher = "${search}"
				for(i in data.rows){
					var titlename =data.rows[i].name.replace(new RegExp(searcher,"gm"), '<font color="red">'+searcher+'</font>');
					var typessz = '主题帖'
					if(data.rows[i].types==2){
						typessz = '投票帖'
					}else if(data.rows[i].types==3){
						typessz = '反馈贴'
					}else if(data.rows[i].types==4){
						typessz = '活动贴'
					}
					var vat ='<tbody><tr><th><a href="/note/showNoteContent.do?id='+data.rows[i].id+'">'+titlename+'</a></th><td class="forum"><a href="/note/showFSection.do?id='+data.rows[i].sid+'">'+data.rows[i].sname+'</a></td><td class="forum"><a href="javascript:void(0)">'+typessz+'</a></td><td class="author"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].uid+'">'+data.rows[i].uname+'</a> <br /><em>'+data.rows[i].times+'</em></td><td class="nums"><strong>'+data.rows[i].huifu+'</strong></td><td class="nums"><em>'+data.rows[i].readed+'</em></td><td class="lastpost"><em><a href="index.html"><span>'+data.rows[i].day+'</span></a></em><br /> <cite><a href="/note/showNoteContent.do?id='+data.rows[i].id+'&floor="'+data.rows[i].ceng+'>'+data.rows[i].nname+'</a></cite></td></tr></tbody>';
					vas = vas+vat;
				
				}
				$("#myDatas").html(vas)
			}else{
				$("#myDatas").html("              <br>没有搜到符合条件的帖子！")
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
