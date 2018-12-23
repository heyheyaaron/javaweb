<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 包含弹窗提示 -->
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_common.css" />

<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_home_spacecp.css" />
<script src="/js/jquery.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<link rel="stylesheet" href="${path}/css/OwenLch.css"/>
<!-- 包含弹窗提示 -->
<link href="/resources/uc/web/base/css/base.css" type="text/css"
	rel="Stylesheet" />
<style >
.address_tit .address_mid {
    
    height: 120px;
   
    top: 50%;
    
}
.address_tit {
    display: none ;
    top: 0;
}
/* #name{
	border-style: 22px !important;
	border-color:red
} */
</style>
</head>
<body>

	<!-- 弹出框 -->
	<div class="address_tit" id="adressz"  >
        		<form id="userForm">
                <div class="address_mid">
                		<input type="hidden"  id="ids" name="idz" />
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
       <c:import url="${path}/feiiohead.jsp"></c:import>
	
	<div id="wp" class="wp">
		<div id="ct" class="ct2_a wp cl">
			<c:import url="${path}/feiiombright.jsp"></c:import>
			<div class="mn cont_wp float_l">
				<div class="bm bw0 page_frame_navigation">
					<div class="follow_feed_cover" style="left: 21px;"></div>
					<ul class="tb cl page_frame_ul" style="padding-left: 20px;">
						<li class="a"><a href="/fiioer/myFollow.do">收听</a></li>
						<li><a href="/fiioer/myListener.do">听众</a></li>
						<li><a href="/fiioer/myFriend.do">好友</a></li>
						<li ><a href="/fiioer/searchMember.do">搜索</a></li>
					</ul>
				</div>
				
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
		<c:import url="${path}/feiiombend.jsp"></c:import>
</body>
<script type="text/javascript" src="/js/commom.js"></script>
<script type="text/javascript">
	login();
	loginbox();
</script>
<script type="text/javascript">
	$(function(){
		var url = "/fiioer/selectMyFollowByPage.do";
		pageData({"curpage":1},url)
		//关闭备注框
		$("#cancelBtn").click(function(){
			$("#adressz").hide();
			var cp =Number(($("#curpage").text()))
			pageData({"curpage":cp},url)
		})
		
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
		//确认修改备注
		$("#sureBtn").click(function(){
			
			
			$.ajax({
				url:"/fiioer/updateMyFollow.do",
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
						
						var vat ='<li class="cl"><input type="hidden" id="'+data.rows[i].id+'yc" value="'+xx+'" /><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].id+'"  class="flw_avt"><em class="avatar"><img src="'+data.rows[i].image+'" style="cursor: pointer;"><span class="shadowbox_avatar"></span></em></a><a id="'+data.rows[i].id+'" href="javascript:void(0)" class="flw_btn_unfo deletes">取消收听</a><h6 class="pbn xs2 name_ulist"><a href="/fiioer/showMemberMsg.do?id='+data.rows[i].id+'" class="xi2">'+names+'</a>&nbsp;<span class="xg1 xs1 xw0"></span></h6><p class="xg1">'+data.rows[i].mood+'</p><p class="ptm xg1 bar_ulist"><a href="javascript:void(0)" id="'+data.rows[i].id+'bz" class="addBeizhu">添加备注&nbsp;&nbsp;&nbsp;&nbsp;</a>收听 <a href="/fiioer/myFollow.do"><strong class="xi2">'+data.rows[i].shouting+'</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;听众 <a href="/fiioer/myListener.do"><strong class="xi2">'+data.rows[i].tingzhong+'</strong></a></p></li>';
						vas = vas +vat
					}
					$("#myDatas").html(vas)
				}else{
					$("#myDatas").html("              <br>您还没有收听任何人哦！")
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
				
				//删除
				$(".deletes").click(function(){
					var id=$(this).prop("id");
					$.ajax({
						url:"/fiioer/deleteMyFollow.do",
						data:{"id":id},
						type:"post",
						dataType:"json",
						success:function(data){
							if(data.tip=="success"){
								$("#append_parent").show();
								$("#closeTip").hide();
								$("#showMsg").text("取消收听成功");
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
							$("#showMsg").text("系统发生异常，请重新操作");
							setTimeout(function(){
								$("#append_parent").hide();
							},2000)
						}
					})
					
				})
				//修改备注
				$(".addBeizhu").click(function(){
					var id=$(this).prop("id");
					id = id.substring(0,id.length-2);
					$("#adressz").show();
					$("#ids").val(id);
					var zz = $("#"+id+"yc").val();
					if(zz!=null){
						$("#namez").val(zz);
					}
					
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