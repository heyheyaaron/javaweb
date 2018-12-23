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
	width: 15px;
	height: 15px;
	position: absolute;
	right: -6px;
	bottom: -6px;
}
#append_parent{
	position: absolute;
	z-index: 701;
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
						<div class="follow_feed_cover" style="left: 22px;"></div>
						<ul class="tb cl page_frame_ul" style="padding-left: 20px;">
							<li class="y"><a href="javascript:void(0)" >短消息设置</a></li>
							<li class="a"><a href="/fiioer/myGetMsg.do">个人消息</a></li>
							<li><a href="/fiioer/mySystemMsg.do">系统消息</a></li>
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
							</span> <a class="normalbtn bluebtn" style="float: right;" href="/fiioer/sendForAllFriend.do"><strong>发消息</strong></a>
							<div class="cr"></div>
						</div>
						<div class="xld xlda pml mtm mbm" id="sessionMsg">
							
						</div>	
					</form>
					<br />
					<div class="bm_c">
					<ul class="flw_ulist relat_ulist" id="myDatas">
					</ul>
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
		
		<!--屏蔽消息弹窗  -->
		<div class="close" id="closeRoom"  style="display: none;">
			<div id="mzBlockLayer3" class="mzBlockLayer"
				style="z-index: 10005; height: 955px; width: 1539px; display: block;">
			</div>
			<div class="mzdialog" id="mzdialog2"
				style="width: 560px; height: 560px; z-index: 10005; position: fixed; left: 50%; top: 50%; margin-left: -280px; margin-top: -280px;">
				<div class="wrap_mzdialog" id="msgSetting">
					<div class="head_mzdialog">
						<h3>消息设置</h3>
					</div>
					<div class="cont_mzdialog">
						<form id="userForm" >
							<span class="checkbox_msgset"> <label 
								>  <input type="checkbox"
									name="isFriendMsg" value="1" <c:if test="${fu.fa_isfriendmsg==1}">checked="checked"</c:if> > 只接收好友的短消息</label>
							</span>
							<div class="cont_msgset">
								<h5>忽略列表</h5>&nbsp;<font id="tipz" color="red"></font>
								<div class="cl">
									<div class=" un_selector un_selector2"
										onclick="$('#ignoreName').focus();">
										<!-- 搜索结果框 -->
										<c:if test="${listignore!=null && !empty listignore}">
											<c:forEach items="${listignore}" var="lg">
												<span class="unamecard_msg" >
													<em class="z" >${lg['name']}</em>
													<a href="javascript:;" class="deletehh" ><font color="gray">x</font></a>
													<input name="users" value="${lg['id']}"  type="hidden">
												</span>
											</c:forEach>
										</c:if>
										<span id="ignoreNameWp"> <input id="ignoreName"
											 type="text">
											
											<!-- 搜索框 -->
											<div id="ignoreName_menu" style="position: absolute; z-index: 701;display: none" initialized="true">
												<ul id="friends" class="pmfrndl">
													
												</ul>
											</div>
												<div id="ignoreName_menu" style="display: none;">
													<ul id="friends" class="pmfrndl"></ul>
												</div></span>
										
									</div>
								</div>
								<div class="conttip_msgset">
									<p>如果你不希望收到某人的消息,可以把他加入到忽略列表</p>
									<p>修改后点击保存方能保存你修改的信息</p>
								</div>
							</div>
							<div class="p_pof" id="showSelectBox_menu" unselectable="on"
								style="display: none;">
								<div class="pbm">
									<select class="ps"
										onchange="clearlist2=1;getUser(1, this.value)">
										<option value="-1">全部好友</option>
									</select>
								</div>
								<div id="selBox" class="ptn pbn">
									<ul id="selectorBox" class="xl xl2 cl"></ul>
								</div>
								<div class="cl">
									<button type="button" class="y pn"
										onclick="fs2.showPMFriend('showSelectBox_menu','selectorBox', $('showSelectBox'));doane(event)">
										<span>关闭</span>
									</button>
								</div>
							</div>
							<div class="btnbar_mzdialog">
								<button type="button" name="settingsubmit" id="sureBtn" value="true"
									class="normalbtn bluebtn">
									<strong>保存修改</strong>
								</button>
								<button type="button" class="normalbtn graybtn mzCancelBtn" id="cancelBtn">取消</button>&nbsp;<font id="tipa" color="red"></font>
								
							</div>
						</form>
					</div>
				</div>
				<div class="mzClose"></div>
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
		// 头像浮动
		adrift = new avatar_drift();
		adrift.init();

		public.box_simcheck('pc');
		hoverAdd(".cont_msgdetail", "conth_msgdetail")
		showBox('#msgSettingBtn', '#msgSetting', 560, 560, true, true)
		focusBox(".cont_msgset textarea");
		checkFun(".wrap_simcheck", "checked_simcheck");
		checkControlBtn("#checkAllPm", "#deletepmform .checked_simcheck",
				"#deletePm", "disabledgraybtn", "#deletepmform");
		checkControlBtn("#deletepmform .box_simcheck",
				"#deletepmform .checked_simcheck", "#deletePm",
				"disabledgraybtn", "#deletepmform");
	</script>
	<script>
		$(function(){
			var url="/fiioer/selectMySendOrGetMsg.do"
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
						url:"/fiioer/deleteSessionRoom.do",
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
					$("#showMsg").text("请选择至少一条对话信息");
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
						url:"/fiioer/msgHasRead.do",
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
					$("#showMsg").text("请选择至少一条对话信息");
					setTimeout(function(){
						$("#append_parent").hide();
					},2000)
				}
				
			});
			/* 弹出框内容改变事件 */
			$('#ignoreName').bind('input propertychange', function(){
				$.ajax({
					url:"/fiioer/searchMemberByVague.do",
					data:{"username":$(this).val()},
					type:"post",
					dataType:"json",
					success:function(data){
						if(data!=null && data.length>0){
							$("#ignoreName_menu").show();
							var vas = "";
							for(i in data){
								var vat = '<li><a href="javascript:;"   class="a qwer" id="'+data[i].id+'s"><strong>'+data[i].name+'</strong></a></li>';
								vas=vas+vat;
							}
							$("#friends").html(vas);
							
							$(".qwer").click(function(){
								var id = $(this).prop("id");
								id = id.substring(0,id.length-1);
								var name = $(this).text();
								$("#ignoreName_menu").hide();
								$("#ignoreName").val("")
								var bl = false;
								$("input[name='users']").each(function(){
									if($(this).val()==id){
										bl=true;
										return false;
									}
								})
								if(bl){
									$("#tipz").text("您已经选择该好友，不能重复选中");
									setTimeout(function(){
										$("#tipz").text("");
									},3000)
								}else{
									$("#ignoreNameWp").before('<span class="unamecard_msg" "><em class="z" >'+name+'</em><a href="javascript:void(0)" class="deletehh"  ><font color="gray">x</font></a><input name="users" value="'+id+'"  type="hidden"></span>')
									//删除
									 $(".deletehh").click(function(){
										$(this).parent().remove();
									}) 
								}
								
								
								
							})
							
							
						}else{
							$("#ignoreName").val("")
							$("#tipz").text("您的好友列表中，没有该昵称的好友");
							setTimeout(function(){
								$("#tipz").text("");
							},3000)
						}
					},
					error:function(){
						$("#tipz").text("系统发生错误");
						setTimeout(function(){
							$("#tipz").text("");
						},2000)
					}
				})
				
				
			}); 
			/* 弹出框里的搜索弹框点击事件 */
			$(".qwer").click(function(){
				var id = $(this).prop("id");
				id = id.substring(0,id.length-1);
				var name = $(this).text();
				$("#ignoreName_menu").hide();
				$("#ignoreName").val("")
				$("#ignoreNameWp").before('<span class="unamecard_msg" "><em class="z" title="'+name+'">'+name+'</em><a href="javascript:;"  ><font color="gray">x</font></a><input name="users" value="'+id+'"  type="hidden"></span>')
			 
			 /* 删除某元素的上一个元素 */
			/*  $("#ignoreNameWp").prev().remove(); */
			
			})
			//删除
			$(".deletehh").click(function(){
				$(this).parent().remove();
			})
			/* 弹出框确认事件 */
			$("#sureBtn").click(function(){
				 $.ajax({
					url:"/fiioer/saveIgnoreFriend.do",
					data:$("#userForm").serialize(),
					type:"post",
					dataType:"json",
					success:function(data){
						if(data.tip=="success"){
							$("#tipa").text("保存成功");
							setTimeout(function(){
								$("#tipa").text("");
								window.location.href='/fiioer/myGetMsg.do';
							},1000)
						}else{
							$("#tipa").text(data.tip);
							setTimeout(function(){
								$("#tipa").text("");
							},2000)
						}
					},
					error:function(){
						$("#tipa").text("系统发生错误");
						setTimeout(function(){
							$("#tipa").text("");
						},2000)
					}
				})
				
			});
			/* 弹出框取消事件 */
			$("#cancelBtn").click(function(){
				$("#closeRoom").hide()
			});
		});
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
							var names = data.rows[i].name;
							if(names==null){
								names="该会员还没有昵称";
							}
							var vat ='<dl  class="bbda cur1 cl"><dd class="m avt"><input type="checkbox" name="myFris" class="checked" value="'+data.rows[i].id+'" /><div class="im" style="position: relative"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].friendid+'" class="avatar"><img src="'+data.rows[i].image+'"> </span></a>';
							if(data.rows[i].newMsg>0){
								vat = vat+'<div class="pm_isnew png_bg hasmsgsession"></div>';
							}
							
							vat = vat+'</div></dd><dd class="ptm pm_c">发给&nbsp;<a class="name_pmlist" href="/fiioer/answerForFriend.do?id='+data.rows[i].friendid+'">'+names+'</a><span class="xg1"><span>'+data.rows[i].day+'</span></span> <br><p>'+data.rows[i].msg+'</p></dd><div class="cr"></div><div class="mtop10 operation"><div class="y msg_btnbar"><a href="javascript:void(0)" id="'+data.rows[i].friendid+'"  class="ignoress">忽略</a> &nbsp;&nbsp;&nbsp;<span class="xg1">共 '+data.rows[i].count+' 条</span> &nbsp;&nbsp;&nbsp; <a href="/fiioer/answerForFriend.do?id='+data.rows[i].friendid+'" >回复</a>&nbsp;&nbsp;&nbsp; <a href="javascript:;" class="deletesz" id="'+data.rows[i].id+'s" >删除</a></div><div class="cr"></div></div></dl>';
							vas = vas +vat;
						}
						
						$("#sessionMsg").html(vas)	
						//忽略
						$(".ignoress").click(function(){
							var id = $(this).prop("id");
							$.ajax({
								url:"/fiioer/ignoreByFriendId.do",
								data:{"id":id},
								type:"post",
								dataType:"json",
								success:function(data){
									if(data.tip=="success"){
										$("#append_parent").show();
										$("#closeTip").hide();
										$("#showMsg").text("忽略成功");
										setTimeout(function(){
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
										$("#showMsg").text("系统发生错误");
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
						$(".deletesz").click(function(){
							var id = $(this).prop("id");
							id = id.substring(0,id.length-1)
							$.ajax({
								url:"/fiioer/deleteSessionRoom.do",
								data:"ids="+id,
								type:"post",
								dataType:"json",
								success:function(data){
									if(data.tip=="success"){
										$("#append_parent").show();
										$("#closeTip").hide();
										$("#showMsg").text("删除成功");
										setTimeout(function(){
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
						$("#sessionMsg").html("<br>您还没有任何对话<br>")
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
