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
<script src="/js/jquery.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<style >
.pm_isnew {
	background: url("/resources/php/bbs/static/image/common/pm_unread.png") no-repeat 0px 0px;
}
</style>
</head>
<body>
	<c:import url="${path}/feiiohead.jsp"></c:import>

	<div id="wp" class="wp">
		<div id="ct" class="ct2_a wp cl">
			<c:import url="${path}/feiiombright.jsp"></c:import>

			<div class="mn cont_wp wp_space_pm float_l">
				<div class="bm bw0 space">

					<div class="page_frame_navigation">
						<div class="follow_feed_cover" style="left: 129px;"></div>
						<ul class="tb cl page_frame_ul" style="padding-left: 20px;">

							<li class="y"><a href="javascript:void(0)"
								id="msgSettingBtn" class="xi2 msgsetbtn_nav"></a></li>
							<li><a href="/fiioer/myGetMsg.do">个人消息</a></li>
							<li class="a"><a href="/fiioer/mySystemMsg.do">系统消息</a></li>
							<li><a href="/fiioer/myRemind.do">提醒</a></li>
						</ul>
					</div>

					<form id="deletepmform">
					
					
						<div class="pagebar_space">
							<label id="checkAllPm" class="but1 pn normalbtn graybtn"
								style="padding: 7px 8px;"> <strong>全选</strong>
							</label>
							<label id="checkAllPmf" class="but1 pn normalbtn graybtn"
								style="padding: 7px 8px;display: none"> <strong>取消选择</strong>
							</label> 
							 <span class="normalbtn graybtn" style="margin-left: 20px;">
								<button id="deletePm" class="pn but1 disabledgraybtn"
									type="button">
									<strong>删除</strong>
								</button>
							</span> <span class="normalbtn graybtn" style="margin-left: 20px;">
								<button class="pn but1" type="button" id="hasReadBtn">
									<strong>标记已读</strong>
								</button>
							</span>
							<div class="cr"></div>
						</div>


						<div class="xld xlda pml mtm mbm" id="sessionMsg">
							
						</div>
							
					</form>
					<div class="bm bw0 pgs cl pagebar" >
						<div class="pg">
							<a class="prev" id="lastpage" ><em class="previcon"></em></a>
							<strong id="curpage">1</strong>
							<a href="javascript:void(0)" id="secondpage" >2</a>
							<a href="javascript:void(0)" id="thirdpage" >3</a>
							<a href="javascript:void(0)" id="forthpage" >4</a>
							<a href="javascript:void(0)"  >...</a>
							<a href="javascript:void(0)" id="fifthpage" >5</a>
							<a href="javascript:void(0)" id="nextpage" class="nxt"><em class="nxticon"></em></a>
							<input type="hidden" id="totalsize" />
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<div class="wp mtn">
		<!--[diy=diy3]-->
		<div id="diy3" class="area"></div>
		<!--[/diy]-->
	</div>
	<c:import url="${path}/feiiombend.jsp"></c:import>
	<script src="/js/jquery.js" type="text/javascript"></script>
	<script src="/js/commom.js" type="text/javascript"></script>
	<script>
		argument();
		argument1();
		login();
		loginbox();
	</script>
	<script type="text/javascript">
		$(function(){
			var url="/fiioer/selectSystemMsg.do"
				pageData({"curpage":1},url)
				//上一页
				$("#lastpage").click(function(){
					var cp =Number(($("#curpage").text()))-1
					pageData({"curpage":cp},url)
				})
				//第二页
				$("#secondpage").click(function(){
					var cp =Number(($("#curpage").text()))+1
					pageData({"curpage":cp},url)
				})
				//第三页
				$("#thirdpage").click(function(){
					var cp =Number(($("#curpage").text()))+2
					pageData({"curpage":cp},url)
				})
				//第四页
				$("#forthpage").click(function(){
					var cp =Number(($("#curpage").text()))+3
					pageData({"curpage":cp},url)
				})
				//第末页
				$("#fifthpage").click(function(){
					var cp =Number(($("#fifthpage").text()))
					pageData({"curpage":cp},url)
				})
				//下一页
				$("#nextpage").click(function(){
					var cp =Number(($("#curpage").text()))+1
					pageData({"curpage":cp},url)
				})
				//全选
				$("#checkAllPm").click(function(){
					
					$("input[name='myFris']").prop("checked",true);
					$("#checkAllPm").hide()
					$("#checkAllPmf").show()
				});
				//反选
				$("#checkAllPmf").click(function(){
					
					$("input[name='myFris']").prop("checked",false);
					$("#checkAllPmf").hide()
					$("#checkAllPm").show()
				});
				//删除
				$("#deletePm").click(function(){
					var ids = new Array();
					var longs = $("[name='myFris']:checked").length;
					$("[name='myFris']:checked").each(function(){
						ids.push($(this).val())
					})
					if(longs>0){
						$.ajax({
							url:"/fiioer/deleteSystemMsg.do",
							data:"ids="+ids.join(","),
							type:"post",
							dataType:"json",
							success:function(data){
								if(data.tip=="success"){
									$("#append_parent").show();
									$("#closeTip").hide();
									$("#showMsg").text("删除成功");
									setTimeout(function(){
										$("#closeTip").show();
										$("#append_parent").hide();
										var cp = Number(($("#curpage").text()));
										var ts = Number(($("#totalsize").val()));
										
										if(ts%20==1){
											cp=cp-1
										}
										if(cp<1){
											cp=1
										}
										pageData({"curpage":cp},url)
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
								$("#showMsg").text("系统发生错误");
								setTimeout(function(){
									$("#append_parent").hide();
								},2000)
							}
						})
					}else{
						$("#append_parent").show();
						$("#showMsg").text("请选择至少一条信息");
						setTimeout(function(){
							$("#append_parent").hide();
						},2000)
					}
					
					
				});
				//标记已读
				$("#hasReadBtn").click(function(){
					var ids = new Array();
					var longs = $("[name='myFris']:checked").length;
					$("[name='myFris']:checked").each(function(){
						ids.push($(this).val())
					})
					if(longs>0){
						$.ajax({
							url:"/fiioer/systemMsgHasRead.do",
							data:"ids="+ids.join(","),
							type:"post",
							dataType:"json",
							success:function(data){
								if(data.tip=="success"){
									$("#append_parent").show();
									$("#closeTip").hide();
									$("#showMsg").text("操作成功");
									setTimeout(function(){
										$("#append_parent").hide();
										var cp = Number(($("#curpage").text()));
										var ts = Number(($("#totalsize").val()));
										
										pageData({"curpage":cp},url)
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
								$("#showMsg").text("系统发生错误");
								setTimeout(function(){
									$("#append_parent").hide();
								},2000)
							}
						})
					}else{
						$("#append_parent").show();
						$("#showMsg").text("请选择至少一条对话信息");
						setTimeout(function(){
							$("#append_parent").hide();
						},2000)
					}
					
				});
				
		})
		function pageData(data,url){
			$.ajax({
				url:url,
				data:data,
				type:"post",
				dataType:"json",
				success:function(data){
					var vas = "";
					
					if(data.rows!=null && data.rows.length>0){
						for(i in data.rows){
							/* 
							
							
							*/
							var vat ='<dl  class="bbda cur1 cl"><dd class="m avt"><input type="checkbox" class="checked" name="myFris" value="'+data.rows[i].id+'" /><div class="im" style="position:relative"><a href="javascript:void(0)" class="avatar"><img src="/img/logo.png"><span class="shadowbox_avatar"> </span></a>';
							if(data.rows[i].isread<=0){
								vat = vat+'<div class="pm_isnew png_bg hasmsgsession"></div>';
							}
							
							vat = vat+'</div></dd><dd class="ptm pm_c">&nbsp;&nbsp;<a class="name_pmlist" href="javascript:void(0)">飞傲论坛系统消息</a><span class="xg1"><span>'+data.rows[i].day+'</span></span> <br><p><font style="font-weight:bold;font-style:italic;">&nbsp;&nbsp;&nbsp;&nbsp;'+data.rows[i].title+'</font></p><p>&nbsp;&nbsp;&nbsp;&nbsp;'+data.rows[i].msg+'</p></dd><div class="cr"></div><div class="mtop10 operation"><div class="y msg_btnbar">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <a href="javascript:;" class="deletesz" id="'+data.rows[i].id+'" >删除</a></div><div class="cr"></div></div></dl>';
							vas = vas +vat;
						}
						
						$("#sessionMsg").html(vas)	
						
						//删除
						$(".deletesz").click(function(){
							var id = $(this).prop("id");
							$.ajax({
								url:"/fiioer/deleteSystemMsg.do",
								data:"ids="+id,
								type:"post",
								dataType:"json",
								success:function(data){
									if(data.tip=="success"){
										
										var cp = Number(($("#curpage").text()));
										var ts = Number(($("#totalsize").val()));
										
										if(ts%20==1){
											cp=cp-1
										}
										if(cp<1){
											cp=1
										}
										pageData({"curpage":cp},url)
										
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
						
						
						
						/* 有消息 */
						 setInterval(function(){
						    
							if($(".hasmsgsession").is(":hidden")){
						    	
						    	$(".hasmsgsession").show()
						    }else{
						    	$(".hasmsgsession").hide()
						    }
						    },200) 
					}else{
						$("#sessionMsg").html("<br>您还没有任何系统消息<br>")
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
					if(Number(data.curpage)+3>=Number(data.totalpage)){
						$("#fifthpage").hide();
					}else{
						$("#fifthpage").show();
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
</body>

</html>
