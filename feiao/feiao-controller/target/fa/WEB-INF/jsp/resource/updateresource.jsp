<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    

 

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
<form id="userForm">
<input type="hidden" name="id" value="${resource.id}"/>
<table class="table table-bordered ">
	<tr>
        <td >上级</td>
        <td><select class="input-md form-control" id="reid" name="parentId" style="width: 200px"></select></td>
    </tr>
    <tr>
        <td width="10%" >名称</td>
        <td><input type="text" name="name" value="${resource.name}"/></td>
    </tr>
    <tr>
        <td >url</td>
        <td><input type="text" name="url" value="${resource.url}"/><font color="red">    *没有链接则填none</font></td>
    </tr>
    <tr>
        <td >排序</td>
        <td><input type="text" name="sort" value="${resource.sort}" id="sort" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/><font color="red">    *0~999，数值最小排序越高</font></td>
    </tr>
    <tr>
        <td >权限代码</td>
        <td><input type="text" name="permission" value="${resource.permission}"/></td>
    </tr>
    <tr>
        <td >菜单/功能</td>
        <td><input type="radio" name="isbutton" value="0" <c:if test="${resource.isbutton==0}">checked="checked"</c:if> />菜单             <input type="radio" name="isbutton" value="1" <c:if test="${resource.isbutton==1}">checked="checked"</c:if>/>功能           </td>
    </tr>
    
    
    
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
				window.location.href="${path}/system/returnResource.do";
		 });
		$("#savebtn").click(function(){
			if(Number($("#sort").val())>=0 && Number($("#sort").val())<=999){
				$.ajax({
					url:"${path}/system/sureUpdateResource.do",
					type:"post",
					data:$("#userForm").form2JSON(),
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
						 			window.location.href="${path}/system/returnResource.do";
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
			
			
			
		});
		/** 异步角色标签 */
		$.ajax({
			url : "${path}/system/selectAllReNoBtn.do",
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