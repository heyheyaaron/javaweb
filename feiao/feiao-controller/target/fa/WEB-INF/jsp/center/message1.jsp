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
<link rel="stylesheet" href="${path}/css/OwenLch.css">
</head>
<body>

	<c:import url="${path}/feiiohead.jsp"></c:import>
	<div id="wp" class="wp">
	<input type="hidden" id="curpage" value="1" />
		<div id="ct" class="ct2_a wp cl">
			<c:import url="${path}/feiiombright.jsp"></c:import>
			<div class="mn cont_wp wp_space_pm float_l">
				<div class="bm bw0 space">
					<div>
						<div class="bm cl breadnav_space" id="pt">
							<div class="z">
								<a href="/fiioer/myGetMsg.do">个人消息</a> <em>&gt;</em> <a
									href="javascript:void(0);">我与
									<c:if test="${fuf.fa_username==null}">${fuf.fa_email}</c:if>
									<c:if test="${fuf.fa_username!=null}">${fuf.fa_username}</c:if>
									的对话</a>
							</div>
						</div>
					</div>


					<!-- 对话 发布框 -->
					<a name="last"></a>
					<div id="pm_ul_post" class="xld xlda pml space_pm_post">
						<form id="userForm" >
							<input type="hidden" name="users" value="${fuf.fa_id}" />
							<dl class="cl self_msgdetail">
								<dd class="avt head_msgdetail">
									<a href="/fiioer/myGetMsg.do"><img
										src="${fu.fa_title_img}"
										 /></a>
								</dd>
								<dd class="cont_msgdetail">
									<div class="tedt">
										<div class="area">
											<textarea rows="3" cols="40" name="descs" class="pt"
												></textarea>
										</div>
									</div>
									<div class="arrow_msgdetail"></div>
								</dd>
							</dl>
							<p class="mtn btnbar_space_pm">
								<a class="normalbtn bluebtn"><button type="button"
										name="pmsubmit" id="pmsubmit_btn" value="true">
										<strong>发送</strong>
									</button></a><span id="pmforum_return"></span>
							</p>
						</form>
					</div>



					<!-- 双方会话 -->
					<div id="pm_ul" class="xld xlda mbm pml">
						

						
					</div>
					<div class="bm bw0 pgs cl pagebar"></div>
					<div id="loadingfeed" class="flw_moress">
						<a href="javascript:void(0)" class="xi2" >更多》》</a>
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
		var urlz = null;
		var transports = [];
		var ws = null;
		var urlPath ="/websocket";
		if (urlPath.indexOf('sockjs') != -1) {  
            urlz = urlPath;    
        }  
        else {  
          if (window.location.protocol == 'http:') {  
              urlz = 'ws://' + window.location.host + urlPath;  
          } else {  
              urlz = 'wss://' + window.location.host + urlPath;  
          }    
        }  
		ws =  (urlz.indexOf('sockjs') != -1) ?   
                new SockJS(urlz, undefined, {protocols_whitelist: transports}) :new WebSocket(urlz+"?toid=${fuf.fa_id}");
		 
        ws.onmessage = function (event) {
        	var id =event.data.substring(0,20);
        	var ed = event.data.substring(21);
        	var day =ed.substring(0,ed.indexOf(","));
        	var msg =ed.substring(ed.indexOf(",")+1); 
        	
			var vat = '<dl  class="bbda cl other_msgdetail"><dd class="avt head_msgdetail"><a href="/fiioer/showMemberMsg.do?id=${fuf.fa_id}" target="_blank"><img src="${fuf.fa_title_img}"></a></dd><dd class="cont_msgdetail"><div class="msg_msgdetail"><em class="uname_msgdetail"> <a href="/fiioer/showMemberMsg.do?id=${fuf.fa_id}" target="_blank">${fuf.fa_username}</a></em>'+msg+'</div><div class="conbar_msgdetail"><div class="time_msgdetail"><span class="xg1"> <span title="'+day+'">'+day+'</span></span></div><div class="btn_msgdetail"><a href="javascript:;" id="'+id+'"  onclick="deletes(this.id)" title="删除">删除</a></div><div class="arrow_msgdetail"></div></dd></dl>';
			$("#pm_ul").prepend(vat)
			/* $.ajax({
				url : "/fiioer/MsgIsReadById.do",
				data : {"id":id},
				type : "post",
				success : function() {
					
					
				},
				error : function() {
					
				}
			}) */
        };  
        
        
		
		
		
		
		
		var url = "/fiioer/selectMyFriendAndMeMsgByPage.do";
		moreLongData({"curpage":$("#curpage").val(),"mid":"${fu.fa_id}","fid":"${fuf.fa_id}"},url)
		//加载更多
		$("#loadingfeed").click(function(){
			moreLongData({"curpage":$("#curpage").val(),"mid":"${fu.fa_id}","fid":"${fuf.fa_id}"},url)
		})
		//发送
		$("#pmsubmit_btn").click(function() {
			
			$.ajax({
				url : "/fiioer/sendMyMsgToMyOnlyFriend.do",
				data : $("#userForm").serialize(),
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data.tip == "success") {
						echo(ws,data)
						var vat = '<dl class="bbda cl self_msgdetail"><dd class="avt head_msgdetail"><a href="/fiioer/myGetMsg.do" target="_blank"> <img src="${fu.fa_title_img}"></a></dd><dd class="cont_msgdetail"><div class="msg_msgdetail"><em class="uname_msgdetail"> <span class="xi2">我</span></em>'+data.msg+'</div><div class="conbar_msgdetail"><div class="time_msgdetail"><span class="xg1"> <span title="'+data.day+'">'+data.day+'</span></span></div><div class="btn_msgdetail"><a href="javascript:;" id="'+data.id+'" onclick="deletes(this.id)"  title="删除">删除</a></div></div><div class="arrow_msgdetail"></div></dd></dl>';
						$("#pm_ul").prepend(vat)
						
					} else {
						$("#append_parent").show();
						$("#showMsg").text(data.tip);
						setTimeout(function() {
							$("#append_parent").hide();
						}, 2000)
					}
					
				},
				error : function() {
					$("#append_parent").show();
					$("#showMsg").text("系统发生错误");
					setTimeout(function() {
						$("#append_parent").hide();
					}, 2000)
				}
			})

		})
	})
	/*
						
						
						
	
	*/
	function moreLongData(data,url){
		$.ajax({
			url:url,
			data:data,
			type:"post",
			dataType:"json",
			success:function(data){
				var vas = "";
				if(data.rows!=null && data.rows.length>0){
						
					for(i in data.rows){
						//判断是发送者还是接受者
						//发送者
						if(data.rows[i].sog<1){
							var vat = '<dl class="bbda cl self_msgdetail"><dd class="avt head_msgdetail"><a href="/fiioer/myGetMsg.do" target="_blank"> <img src="${fu.fa_title_img}"></a></dd><dd class="cont_msgdetail"><div class="msg_msgdetail"><em class="uname_msgdetail"> <span class="xi2">我</span></em>'+data.rows[i].msg+'</div><div class="conbar_msgdetail"><div class="time_msgdetail"><span class="xg1"> <span title="'+data.rows[i].day+'">'+data.rows[i].day+'</span></span></div><div class="btn_msgdetail"><a href="javascript:;" id="'+data.rows[i].id+'" onclick="deletes(this.id)"  title="删除">删除</a></div></div><div class="arrow_msgdetail"></div></dd></dl>';
							vas = vas+vat;
						//接受者	
						}else{
							var vat = '<dl  class="bbda cl other_msgdetail"><dd class="avt head_msgdetail"><a href="/fiioer/showMemberMsg.do?id=${fuf.fa_id}" target="_blank"><img src="${fuf.fa_title_img}"></a></dd><dd class="cont_msgdetail"><div class="msg_msgdetail"><em class="uname_msgdetail"> <a href="/fiioer/showMemberMsg.do?id=${fuf.fa_id}" target="_blank">${fuf.fa_username}</a></em>'+data.rows[i].msg+'</div><div class="conbar_msgdetail"><div class="time_msgdetail"><span class="xg1"> <span title="'+data.rows[i].day+'">'+data.rows[i].day+'</span></span></div><div class="btn_msgdetail"><a href="javascript:;" id="'+data.rows[i].id+'" onclick="deletes(this.id)" title="删除">删除</a></div><div class="arrow_msgdetail"></div></dd></dl>';
							vas = vas+vat;
						}
						
					}
					
					//追加到页面
					if($("#curpage").val()>=data.totalpage){
						$("#loadingfeed").hide();
					}else{
						$("#loadingfeed").show();
					}
					$("#curpage").val(Number($("#curpage").val())+1);
					$("#pm_ul").append(vas)
					
				}else{
					$("#loadingfeed").hide();
				}
				
				
				
			},
			error:function(){
			}
		})
	}
</script>
<script type="text/javascript"> 
        
         
  
        function disconnect(ws) {  
            if (ws != null) {  
                ws.close();  
                ws = null;  
            }  
        }  
  
        function echo(ws,data) {
            if (ws != null) {  
                var messagea = "${fu.fa_id}";  
                var messageb = "${fuf.fa_id}";
                var message = '{\"msg\":\"'+data.msg+'\",\"to\":\"'+messageb+'\",\"from\":\"'+messagea+'\",\"id\":\"'+data.idg+'\",\"day\":\"'+data.day+'\"}'
                 
                ws.send(message);  
            } else {  
                //alert('connection not established, please connect.');  
            }  
        }  
  
       
  
        function updateTransport(transport) {  
            alert(transport);  
          transports = (transport == 'all') ?  [] : [transport];  
        }  
        function deletes(id){
        	//删除
			
				
					$.ajax({
						url:"/fiioer/deleteSessionSelfMsg.do",
						data:{"mid":"${fu.fa_id}","fid":"${fuf.fa_id}","id":id},
						type:"post",
						dataType:"json",
						success:function(data){
							if(data.tip=="success"){
								$("#"+data.id).parent().parent().parent().parent().empty();
								$("#append_parent").show();
								$("#showMsg").text("删除成功");
								setTimeout(function() {
									$("#append_parent").hide();
								}, 2000)
							}else{
								$("#append_parent").show();
								$("#showMsg").text(data.tip);
								setTimeout(function() {
									$("#append_parent").hide();
								}, 2000)
							}
						},
						error:function(){
							$("#append_parent").show();
							$("#showMsg").text("系统发生错误");
							setTimeout(function() {
								$("#append_parent").hide();
							}, 2000)
						}
						
					})
				
				
			
        }  
          
    </script>  

</html>