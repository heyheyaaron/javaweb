<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		
	</head>
<script type="text/javascript" charset="utf-8" src="${path}/kindeditor/kindeditor.js"></script>
	<script type="text/javascript">
	 //$(function(){
		KE.show({
			id : 'content1',
			imageUploadJson : '../../jsp/upload_json.jsp',
			fileManagerJson : '../../jsp/file_manager_json.jsp',
			allowFileManager : false,
			afterCreate : function(id) {
				KE.event.ctrl(document, 13, function() {
					KE.util.setData(id);
					document.forms['userForm'].submit();
				});
				KE.event.ctrl(KE.g[id].iframeDoc, 13, function() {
					KE.util.setData(id);
					document.forms['userForm'].submit();
				});
			}
			
		});
		
        
	//});
	
		function sb1(){
	         
	         
	      // jquery 表单提交 
	         $("#userForm").ajaxSubmit(function(data) { 
	         	
	         }); 

	         return false; // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转 
	     }
	</script>
	<body >
	<c:import url="${path}/feiioback.jsp"></c:import>
		<form id="userForm" name="userForm" method="post"  onsubmit="return sb1();">
		
		<div align="left">
			<table class="table table-bordered ">
				<tr>
					<td >推送方式：</td>
					<td >
						<select id="sendtype" name="sendtype" style="width: 185px">
							<option value="1" selected="selected">------指定用户推送------</option>
							<option value="2">------群发推送用户------</option>
						</select>
					</td>
				</tr>
				<tr id="dfs" >
					<td >推送会员手机/邮箱：</td>
					<td >
						<input type="text" name="sendemail"><font color="red"> *发送给多人请用英文 ; 号隔开</font>
					</td>
				</tr>
				<tr id="qfs" style="display: none;">
					<td >群发会员类型：</td>
					<td >
						会员等级：<select id="rankid" name="rankid" style="width: 110px"></select>&nbsp;&nbsp;&nbsp;&nbsp;
						会员组：<select id="groupid" name="groupid"  style="width: 110px"></select>&nbsp;&nbsp;&nbsp;&nbsp;
						会员标签：<select id="labelid" name="labelid"  style="width: 110px"></select>&nbsp;&nbsp;&nbsp;&nbsp;
						手机信息分组：<select id="telid" name="telid"  style="width: 110px"></select>&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td width="10%">标题：</td>
					<td ><input type="text" name="title"/></td>
				</tr>
				
				<tr>
				<td >内容：</td>
					<td ><textarea id="content1" name="descz" cols="100" rows="8" style="width:800px;height:600px;visibility:hidden;"></textarea></td>
				</tr>
				<tr>
					
					<td ></td>
					<td >
						<!-- <button type="button" class="btn" id="sendemail">发送邮件</button>
						<button type="button" class="btn btn-primary" id="sendemail">发送邮件</button> -->
						<button type="button" class="btn btn-info" id="sendemail">发送信息</button>
						<!-- <button type="button" class="btn btn-success" id="sendemail">发送邮件</button>
						<button type="button" class="btn btn-warning" id="sendemail">发送邮件</button>
						<button type="button" class="btn btn-danger" id="sendemail">发送邮件</button>
						<button type="button" class="btn btn-inverse" id="sendemail">发送邮件</button> -->
					
					</td>
				</tr>
			
			</table>
			
		</div>
		</form>
	</body>
	
	<script type="text/javascript">
		$(function(){
			//选择推送方式
			$("#sendtype").change(function(){
				var sv = $(this).val() 
				if(sv==1){
					document.getElementById("dfs").style.display="";
					document.getElementById("qfs").style.display="none";
					
				}else{
					document.getElementById("dfs").style.display="none";
					document.getElementById("qfs").style.display="";
				}
			})
			/** 异步会员等级标签 */
			$.ajax({
				url : "${path}/member/selectAllRank.do",
				type : "post",
				dataType : "json",
				async : true,
				success : function(data){
					
					var options = [];
					options.push("<option value='0' selected='selected' >----不设置----</option>");
					$.each(data, function (index, value) {
						
						options.push("<option value='" + value.fa_id + "'> " + value.fa_name + " </option>");
						
						
				    });
				    $("#rankid").append(options.join(''));
					
				},
				error : function(){
					sweetAlert({
			 			title: "",
			 			text: "数据加载失败！",
			 			type: "error",
			 			confirmButtonColor: "#2b2e37",
			 			confirmButtonText: "确认",
			 			closeOnConfirm: false,
			 			timer:7000
			 		});
				}
			});
			/** 异步手机型号 */
			$.ajax({
				url : "${path}/pro/getAllPro.do",
				type : "post",
				dataType : "json",
				async : true,
				success : function(data){
					
					var options = [];
					options.push("<option value='0' selected='selected' >----不设置----</option>");
					$.each(data, function (index, value) {
						options.push("<option value='" + value.id + "'> " + value.title+"("+value.name + ") </option>");
						
						
				    });
				    $("#telid").append(options.join(''));
					
				},
				error : function(){
					sweetAlert({
			 			title: "",
			 			text: "数据加载失败！",
			 			type: "error",
			 			confirmButtonColor: "#2b2e37",
			 			confirmButtonText: "确认",
			 			closeOnConfirm: false,
			 			timer:7000
			 		});
				}
			});
			/** 异步会员用户组标签 */
			$.ajax({
				url : "${path}/member/getAllMbGroup.do",
				type : "post",
				dataType : "json",
				async : true,
				success : function(data){
					
					var options = [];
					options.push("<option value='0' selected='selected' >----不设置----</option>");
					$.each(data, function (index, value) {
						
						options.push("<option value='" + value.id + "'> " + value.name + " </option>");
						
						
				    });
				    $("#groupid").append(options.join(''));
					
				},
				error : function(){
					sweetAlert({
			 			title: "",
			 			text: "数据加载失败！",
			 			type: "error",
			 			confirmButtonColor: "#2b2e37",
			 			confirmButtonText: "确认",
			 			closeOnConfirm: false,
			 			timer:7000
			 		});
				}
			});
			/** 异步会员关注标签 */
			$.ajax({
				url : "${path}/member/getAllLabel.do",
				type : "post",
				dataType : "json",
				async : true,
				success : function(data){
					
					var options = [];
					options.push("<option value='0' selected='selected' >----不设置----</option>");
					$.each(data, function (index, value) {
						
						options.push("<option value='" + value.fa_id + "'> " + value.fa_name + " </option>");
						
						
				    });
				    $("#labelid").append(options.join(''));
					
				},
				error : function(){
					sweetAlert({
			 			title: "",
			 			text: "数据加载失败！",
			 			type: "error",
			 			confirmButtonColor: "#2b2e37",
			 			confirmButtonText: "确认",
			 			closeOnConfirm: false,
			 			timer:7000
			 		});
				}
			});
			
			
			
			//发站内信息
			$("#sendemail").click(function(){
				document.getElementById("content1").value=KE.util.getData('content1');
				$.ajax({
					url : "${path}/member/sendMsg.do",
					type : "post",
					data:$("#userForm").serialize(),
					dataType : "json",
					async : true,
					beforeSend:function(){ 
						swal({
							  title: "正在发送，请耐心等候！",
							  text: "<img src='/image/jzt.gif' width='300px' heigth='50px'></img>",
							  html: true,
							  showConfirmButton: false
							});
					},
					success : function(data){
						//swal.close();
						if(data.tip==1){
							sweetAlert({
					 			title: "",
					 			text: "推送成功",
					 			type: "success",
					 			confirmButtonColor: "#2b2e37",
					 			confirmButtonText: "确认",
					 			closeOnConfirm: false,
					 			timer:7000
					 		});
						}else if(data.tip==2){
							sweetAlert({
					 			title: "",
					 			text: "请使用英文  ; 号分隔",
					 			type: "warning",
					 			confirmButtonColor: "#2b2e37",
					 			confirmButtonText: "确认",
					 			closeOnConfirm: false,
					 			timer:7000
					 		});
						}else if(data.tip==3){
							sweetAlert({
					 			title: "",
					 			text: "标题不能为空",
					 			type: "warning",
					 			confirmButtonColor: "#2b2e37",
					 			confirmButtonText: "确认",
					 			closeOnConfirm: false,
					 			timer:7000
					 		});
						}else if(data.tip==4){
							sweetAlert({
					 			title: "",
					 			text: "内容不能为空",
					 			type: "warning",
					 			confirmButtonColor: "#2b2e37",
					 			confirmButtonText: "确认",
					 			closeOnConfirm: false,
					 			timer:7000
					 		});
						}else if(data.tip==5){
							sweetAlert({
					 			title: "",
					 			text: "请填写发送的会员邮箱",
					 			type: "warning",
					 			confirmButtonColor: "#2b2e37",
					 			confirmButtonText: "确认",
					 			closeOnConfirm: false,
					 			timer:7000
					 		});
						}else if(data.tip==6){
							sweetAlert({
					 			title: "",
					 			text: "该分类组合没有会员",
					 			type: "warning",
					 			confirmButtonColor: "#2b2e37",
					 			confirmButtonText: "确认",
					 			closeOnConfirm: false,
					 			timer:7000
					 		});
						}else{
							sweetAlert({
					 			title: "",
					 			text: "数据加载失败！",
					 			type: "error",
					 			confirmButtonColor: "#2b2e37",
					 			confirmButtonText: "确认",
					 			closeOnConfirm: false,
					 			timer:7000
					 		});
						}
						
					},
					error : function(){
						sweetAlert({
				 			title: "",
				 			text: "数据加载失败！",
				 			type: "error",
				 			confirmButtonColor: "#2b2e37",
				 			confirmButtonText: "确认",
				 			closeOnConfirm: false,
				 			timer:7000
				 		});
					}
				});
			});
			
		})
	
	</script>
	

</html>