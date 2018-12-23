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
</head>
<style >
.address_tit .address_mid {
    
    height: 120px;
   
    top: 50%;
    
}
.address_tit {
    display: none ;
    top: 0;
}
#hyfztck{
	background: rgba(0, 0, 0, 0.4);
	position: fixed;
	z-index: 999;
}
</style>
<body>
	<c:import url="${path}/feiiohead.jsp"></c:import>
	<!-- 分组弹框 -->
	<div id="hyfztck" class="fwinmask" style="position: absolute; z-index: 601; left: 758.5px; top: 126px;display: none" initialized="true">
		<table class="fwin" cellspacing="0" cellpadding="0">
			
			<tbody>
				<tr>
					<td class="m_c"   fwin="friend_group_3612043">
					<h3 class="flb" id="fctrl_friend_group_3612043" style="cursor: move;">
						<em id="return_friend_group_3612043" fwin="friend_group_3612043">好友分组</em>
						<span>
							<a href="javascript:;"  id="hyfzgb" class="flbc" title="关闭">关闭</a>
						</span>
					</h3>
					<form  id="typeForm" autocomplete="off"  name="changegroupform_3612043"   fwin="friend_group_3612043">
						<input type="hidden"  id="idx" name="idx" />
						<div class="c">
							<div  fwin="friend_group_3612043">
							<table>
								<c:forEach items="${listft}" var="ft" varStatus="vs">
									<c:if test="${vs.index%2==1 }">
										
											<td>
												<label class="radiowrapper">
												
													<span class="text_pway" width="150px"><input name="groups" value="${ft['fa_id']}"   type="radio">${ft['fa_name']}</span>
													
												</label>
											</td>
										</tr>
										
									</c:if>				
									<c:if test="${vs.index%2==0 }">
										<tr>
											<td>
												<label class="radiowrapper">
													<span class="text_pway" width="150px"><input name="groups" value="${ft['fa_id']}"   type="radio">${ft['fa_name']}</span>
													
												</label>
											</td>
										
										
										
									</c:if>				
								</c:forEach>
							</table>
								
								
									<p class="o pns btnbar_fwin_l">
										<a class="normalbtn bluebtn">
											<button type="button" id="typesureBtn" value="true" class="">
												<strong>确定</strong>
											</button> 
										</a>&nbsp;&nbsp;<font color="red" id="tipz" ></font>
									</p>
							</div>
						</div>
					</form>
				</td>
			</tr>
		</tbody>
	</table>
</div>
	<!-- 弹出框 -->
	<div class="address_tit" id="adressz"  >
        		<form id="userForm">
                <div class="address_mid">
                		<input type="hidden"  id="ids" name="ids" />
                        <div class="address_s" >
                        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;备注名称：&nbsp;&nbsp;&nbsp;
                        		<input type="text"  id="namez" name="namez" style="border:#FF7116 1px solid" />
                        	
                        </div>
                        <div class="address_bot">
                                <input type="button" class="but" id="sureBtn" value="确认">
                                <input type="button" class="but quxiao" value="返回" id="cancelBtn"><font color="red" id="tip" style="float: right;"></font>&nbsp;&nbsp;&nbsp;
                        </div>
                </div>
                </form>
       </div>
	<div id="wp" class="wp">
		<div id="ct" class="ct2_a wp cl">
			<c:import url="${path}/feiiombright.jsp"></c:import>
			<div class="mn cont_wp float_l">
				<div class="bm bw0">
					<div class="bm bw0 page_frame_navigation">
						<div class="follow_feed_cover" style="left: 235px;"></div>
						<ul class="tb cl page_frame_ul" style="padding-left: 20px;">
							<li ><a href="/fiioer/myFollow.do">收听</a></li>
							<li ><a href="/fiioer/myListener.do">听众</a></li>
							<li class="a"><a href="/fiioer/myFriend.do">好友</a></li>
							<li ><a href="/fiioer/searchMember.do">搜索</a></li>
						</ul>
					</div>
					<input  type="hidden" id="typegroup" value="0" />
					<div class="bar_flist">
						<div style="float: left;">
							<!-- //下面是 所有联系人 的下拉帅选框-->
							<div class="common" style="float: left; display: inline;">
								<div class="select_box select_box_3"
									style="float: left; position: relative; margin-right: 40px; _margin-right: 20px;">
									<div class="box_menu box_menu1">
										所有联系人<span class="arrow_dark" style="bottom: 3px;"></span>
									</div>
									<div class="son_menu son_menu1"
										style="position: absolute; width: 118px; display: none;">
										<ul>
											<li class="OwenLCHLi"  id="0" >所有联系人</li>
											<c:forEach items="${listft}" var="ft" >
												<li class="OwenLCHLi"  id="${ft['fa_id']}" >${ft['fa_name']}</li>
											</c:forEach>
											
										</ul>
									</div>
								</div>
							</div>
							<div class="common" style="float: left; display: inline;">
								<div class="select_box select_box_4"
									style="float: left; position: relative;">
									<div class="box_menu box_menu2">
										移动到<span class="arrow_dark" style="bottom: 3px;"></span>
									</div>
									<div class="son_menu son_menu2"
										style="position: absolute; width: 118px; display: none;">
										<ul>
											<c:forEach items="${listft}" var="ft" >
												<li class="OwenLCHLiz"  id="${ft['fa_id']}z" >${ft['fa_name']}</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div style="float: right; display: inline;">
							<div class="bm mtm">
								<div class="bm_c">
									<form class="pns">
										<input type="hidden"> <input type="hidden"> <input
												type="hidden"> <input type="hidden">
														<div class="scbox_flist">
															<input type="text" class="px vm scbox_txt" id="searchname"  size="20" />
															<button type="button" id="searchBtn" class="vm scbox_btn"></button>
														</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="cr"></div>
					<div>
						<div id="friend_ul">
							<ul class="buddy cl relat_ulist" id="myDatas">
								
								
							</ul>
						</div>
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
			<!--[diy=diycontentbottom]-->
			<div id="diycontentbottom" class="area"></div>
			<!--[/diy]-->
		</div>
	</div>
	<div class="wp mtn">
		<!--[diy=diy3]-->
		<div id="diy3" class="area"></div>
		<!--[/diy]-->
	</div>
	<c:import url="${path}/feiiombend.jsp"></c:import>
</body>
<script type="text/javascript" src="/js/commom.js"></script>
<script type="text/javascript">
	$(".box_menu1").click(function() {
		$(".son_menu1").toggle();
	});
	$(".box_menu2").click(function() {
		$(".son_menu2").toggle();
	});

	login();
	loginbox();
</script>
<script type="text/javascript">
	$(function(){
		
		var url = "/fiioer/selectMyFriendByPage.do";
		pageData({"curpage":$("#curpage").text(),"searchname":$("#searchname").val(),"searchtype":$("#typegroup").val()},url)
		//搜索
		$("#searchBtn").click(function(){
			
			pageData({"curpage":"1","searchname":$("#searchname").val(),"searchtype":$("#typegroup").val()},url)
		})
		//上一页
		$("#lastpage").click(function(){
			var cp =Number(($("#curpage").text()))-1
			pageData({"curpage":cp,"searchname":$("#searchname").val(),"searchtype":$("#typegroup").val()},url)
		})
		//第二页
		$("#secondpage").click(function(){
			var cp =Number(($("#curpage").text()))+1
			pageData({"curpage":cp,"searchname":$("#searchname").val(),"searchtype":$("#typegroup").val()},url)
		})
		//第三页
		$("#thirdpage").click(function(){
			var cp =Number(($("#curpage").text()))+2
			pageData({"curpage":cp,"searchname":$("#searchname").val(),"searchtype":$("#typegroup").val()},url)
		})
		//第四页
		$("#forthpage").click(function(){
			var cp =Number(($("#curpage").text()))+3
			pageData({"curpage":cp,"searchname":$("#searchname").val(),"searchtype":$("#typegroup").val()},url)
		})
		//第末页
		$("#fifthpage").click(function(){
			var cp =Number(($("#fifthpage").text()))
			pageData({"curpage":cp,"searchname":$("#searchname").val(),"searchtype":$("#typegroup").val()},url)
		})
		//下一页
		$("#nextpage").click(function(){
			var cp =Number(($("#curpage").text()))+1
			pageData({"curpage":cp,"searchname":$("#searchname").val(),"searchtype":$("#typegroup").val()},url)
		})
		//移动分组
		$(".OwenLCHLiz").click(function(){
			var rt = $(this).prop("id");
			rt=rt.substring(0,rt.length-1);
			var cv = $("input[name='idzs']:checked").length;
			if(cv>0){
				var ids = new Array();
				$("input[name='idzs']:checked").each(function(i){
					ids.push($(this).val())
				})
				$.ajax({
					url:"/fiioer/changeMyGroups.do",
					data:"ids="+ids.join(",")+"&tid="+rt,
					type:"post",
					dataType:"json",
					success:function(data){
						if(data.tip=="success"){
							$("#append_parent").show();
							$("#closeTip").hide();
							$("#showMsg").text("移动成功");
							setTimeout(function(){
								$("#closeTip").show();
								$("#append_parent").hide();
								pageData({"curpage":"1","searchname":$("#searchname").val(),"searchtype":$("#typegroup").val()},url)
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
						$("#showMsg").text("系统发生异常");
						setTimeout(function(){
							$("#append_parent").hide();
						},2000)
					}
				})
			}else{
				$("#append_parent").show();
				$("#showMsg").text("请选择需要移动的好友");
				setTimeout(function(){
					$("#append_parent").hide();
				},2000)
			}
			
		})
		
		//备注弹框取消
		$("#cancelBtn").click(function(){
			
			$("#adressz").hide()
			var cp =Number(($("#curpage").text()))
			pageData({"curpage":cp,"searchname":$("#searchname").val(),"searchtype":$("#typegroup").val()},url)
		})
		//备注弹框确认
		$("#sureBtn").click(function(){
			$.ajax({
				url:"/fiioer/updateMyFriend.do",
				data:$("#userForm").serialize(),
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.tip=="success"){
						$("#tip").text("修改备注成功");
						setTimeout(function(){
							$("#tip").text("");
							
						},2000)
					}else{
						$("#tip").text(data.tip);
						setTimeout(function(){
							$("#tip").text("");
							
						},2000)
					}
				},
				error:function(){
					$("#tip").text("系统出现异常");
					setTimeout(function(){
						$("#tip").text("");
						
					},2000)
				}
			})
		})
		//选择分组
		$(".OwenLCHLi").click(function(){
			$("#typegroup").val($(this).prop("id"))
			pageData({"curpage":"1","searchname":$("#searchname").val(),"searchtype":$("#typegroup").val()},url)
		})
		
		//分组弹框确认
		$("#typesureBtn").click(function(){
			$.ajax({
				url:"/fiioer/updateMyFriendType.do",
				data:$("#typeForm").serialize(),
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.tip=="success"){
						$("#tipz").text("修改分组成功");
						setTimeout(function(){
							$("#tipz").text("");
							
						},2000)
					}else{
						$("#tipz").text(data.tip);
						setTimeout(function(){
							$("#tipz").text("");
							
						},2000)
					}
				},
				error:function(){
					$("#tipz").text("系统出现异常");
					setTimeout(function(){
						$("#tipz").text("");
						
					},2000)
				}
			})
		})
		//分组弹框取消
		$("#hyfzgb").click(function(){
			$("#hyfztck").hide()
			var cp =Number(($("#curpage").text()))
			pageData({"curpage":cp,"searchname":$("#searchname").val(),"searchtype":$("#typegroup").val()},url)
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
						var names = "";
						var namea = data.rows[i].name;
						if(namea==null){
							namea = "该用户还没有昵称"
						}
						var xx =data.rows[i].beizhu;
						if(data.rows[i].beizhu!=null && data.rows[i].beizhu!=''){
							names = data.rows[i].beizhu+"("+namea+")"
						}else{
							xx=""
							names =namea
						}
						
						var vat='<li  class="cl" attribute="2307777"><input type="hidden" id="'+data.rows[i].id+'yc" value="'+xx+'" /><input type="checkbox" name="idzs"  value="'+data.rows[i].id+'" class="checkbox" /> <a class="flw_btn_unfo deletes" href="javascript:void(0)" id="'+data.rows[i].id+'" >删除好友</a><a class="flw_avt" href="/fiioer/showMemberMsg.do?id='+data.rows[i].id+'"> <em class="avatar"><img src="'+data.rows[i].image+'"><span class="shadowbox_avatar"></span></em></a><div class="cont_ulist"><h4 class="name_ulist"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].id+'" style="color: #999999;">'+names+'</a><span class="note xw0"></span></h4><p class="maxh">'+data.rows[i].mood+'</p><div class="xg1" style="*border: 1px solid #FFFFFF;"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].id+'" class="showmenu">去串门</a><a href="/fiioer/answerForFriend.do?id='+data.rows[i].id+'"  class="showmenu">发送消息</a><a href="javascript:;" id="'+data.rows[i].id+'bz" class="showmenu bzc">&nbsp;&nbsp;&nbsp;备注</a><a href="javascript:;" id="'+data.rows[i].id+'fz" class="showmenu fzc">分组</a><input type="hidden" id="'+data.rows[i].id+'hh" value="'+data.rows[i].typeid+'" /></div></div></li>';
						vas = vas+vat;
					}
					$("#myDatas").html(vas)
				}else{
					$("#myDatas").html("              <br>该好友分组您还没有好友哦！")
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
				
				//取消好友
				$(".deletes").click(function(){
					id=$(this).prop("id");
					$.ajax({
						url:"/fiioer/deleteMyFriend.do",
						data:{"id":id},
						type:"post",
						dataType:"json",
						success:function(data){
							if(data.tip=="success"){
								$("#append_parent").show();
								$("#closeTip").hide();
								$("#showMsg").text("取消好友成功");
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
									pageData({"curpage":cp,"searchname":$("#searchname").val(),"searchtype":$("#typegroup").val()},url)
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
				
				//备注弹框
				$(".bzc").click(function(){
					
					var id=$(this).prop("id");
					id = id.substring(0,id.length-2);
					$("#adressz").show();
					$("#ids").val(id);
					var zz = $("#"+id+"yc").val();
					if(zz!=null){
						$("#namez").val(zz);
					}
				})
				//分组弹框
				$(".fzc").click(function(){
					var id=$(this).prop("id");
					id = id.substring(0,id.length-2);
					var idz = $("#"+id+"hh").val();
					$("#hyfztck").show()
					$("#idx").val(id);
					$("input[name='groups']").each(function(i){
						if($(this).val()==idz){
							$(this).prop("checked",true);
						}
					})
				})
				
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
