<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
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

 

    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
</head>
<body>
<c:import url="${path}/feiioback.jsp"></c:import>
<form id="userForm" name="userForm" method="post"  onsubmit="return sb1();">
<input type="hidden" name="id" value="${resource.id}"/>
<input type="hidden" name="ishiddent" value="${resource.ishiddent}"/>
<table class="table table-bordered ">
	<c:if test="${resource.ishiddent==1}">
	<tr>
        <td >上级</td>
        <td><select class="input-md form-control" id="reid" name="parentId" style="width: 200px"></select> <font color="red">    提示：没有上级的栏目配置链接无效</font></td>
    </tr>
    </c:if>
    <tr>
        <td width="10%" >名称</td>
        <td><input type="text" name="name" value="${resource.name}"/></td>
    </tr>
    
    <tr>
        <td >排序</td>
        <td><input type="number" name="sort" id="sort" value="${resource.sort}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/><font color="red">    *0~999，数值最小排序越高</font></td>
    </tr>
    <c:if test="${resource.ishiddent==1}">
   <tr>
        <td >是否为其配置链接</td>
        <td><input type="radio" name="url" value="yes" <c:if test="${resource.url!='none'}">checked="checked"</c:if>/>是             <input type="radio" name="url" value="none" <c:if test="${resource.url=='none'}">checked="checked"</c:if>/>否           </td>
    </tr>
    <tr>
        <td >链接标题</td>
        <td><input type="text" name="title" value="${col.title}"/> </td>
    </tr>
    <tr>
        <td >链接内容</td>
        <td><textarea id="content1" name="descz" cols="100" rows="8" style="width:800px;height:600px;visibility:hidden;">${col.descz}</textarea></td>
    </tr>
    </c:if>
    
    
    <tr>
        <td ></td>
        <td>
            <button  class="btn btn-primary" type="button" id="savebtn">保存</button> &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="${path}/system/returnColumn.do";
		 });
		$("#savebtn").click(function(){
			if("${resource.ishiddent}"==1){
				document.getElementById("content1").value=KE.util.getData('content1');
				if(Number($("#sort").val())>=0 && Number($("#sort").val())<=999){
					$.ajax({
						url:"${path}/system/sureUpdateColumn.do",
						type:"post",
						data:$("#userForm").serialize(),
						dataType:"json",
						async : true,
						success:function(data){
							if(data.tip=="success"){
									sweetAlert({
							 			title: "",
							 			text: "保存成功！",
							 			type: "success",
							 			confirmButtonColor: "#2b2e37",
							 			confirmButtonText: "确认",
							 			closeOnConfirm: false,
							 			timer:7000
							 		},function(){
							 			window.location.href="${path}/system/returnColumn.do";
							 		});
							}else{
								sweetAlert({
						 			title: "",
						 			text: data.tip,
						 			type: "warning",
						 			confirmButtonColor: "#2b2e37",
						 			confirmButtonText: "确认",
						 			closeOnConfirm: false,
						 			timer:7000
						 		});
							}
							
						},
						error:function(){
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
					})
				}else{
					sweetAlert({
			 			title: "",
			 			text: "排序范围为0~999",
			 			type: "warning",
			 			confirmButtonColor: "#2b2e37",
			 			confirmButtonText: "确认",
			 			closeOnConfirm: false,
			 			timer:7000
			 		});
				}
			}else{
				if(Number($("#sort").val())>=0 && Number($("#sort").val())<=999){
					$.ajax({
						url:"${path}/system/sureUpdateColumn.do",
						type:"post",
						data:$("#userForm").serialize(),
						dataType:"json",
						async : true,
						success:function(data){
							if(data.tip=="success"){
									sweetAlert({
							 			title: "",
							 			text: "保存成功！",
							 			type: "success",
							 			confirmButtonColor: "#2b2e37",
							 			confirmButtonText: "确认",
							 			closeOnConfirm: false,
							 			timer:7000
							 		},function(){
							 			window.location.href="${path}/system/returnColumn.do";
							 		});
							}else{
								sweetAlert({
						 			title: "",
						 			text: data.tip,
						 			type: "warning",
						 			confirmButtonColor: "#2b2e37",
						 			confirmButtonText: "确认",
						 			closeOnConfirm: false,
						 			timer:7000
						 		});
							}
							
						},
						error:function(){
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
					})
				}else{
					sweetAlert({
			 			title: "",
			 			text: "排序范围为0~999",
			 			type: "warning",
			 			confirmButtonColor: "#2b2e37",
			 			confirmButtonText: "确认",
			 			closeOnConfirm: false,
			 			timer:7000
			 		});
				}
			}
			
			
			
			
		});
		/** 异步角色标签 */
		$.ajax({
			url : "${path}/system/selectAllRes.do",
			type : "post",
			dataType : "json",
			async : true,
			success : function(data){
				var options = [];
				
				options.push("<option value='0' >不设置上级</option>");
				$.each(data, function (index, value) {
					
					if("${resource.parentId}"==value.id){
						options.push("<option value='" + value.id + "' selected='selected' > " + value.name + " </option>");
					}else{
						options.push("<option value='" + value.id + "'> " + value.name + " </option>");
					}
					
			    });
			    $("#reid").append(options.join(''));
				
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
</script>