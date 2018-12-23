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
<table class="table table-bordered ">
    
    <tr>
        <td width="10%" >热搜刷新时间</td>
        <td>每隔 <input type="number" name="pros" id="pros" value="${pros}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" style="width:50px"/> 天刷新热帖状态</td>
        
    </tr>
    <tr>
    	<td>登录固定加密字符串</td>
    	<td><input type="text" name="keepcode" value="${keepcode}" /></td>
    </tr>
    <tr>
    	<td>网站关键词</td>
    	<td><input type="text" name="keepname" value="${keepname}" /></td>
    </tr>
    <tr>
    	<td>网站描述</td>
    	<td><textarea  cols="30" name="keepdesc" >${keepdesc}</textarea></td>
    </tr>
    
    
    
    
  
    
    
    <tr>
        <td ></td>
        <td>
        <shiro:hasPermission name="basebs:update">
            <button  class="btn btn-primary" type="button" id="savebtn">保存</button> 
        </shiro:hasPermission>
            
        </td>
    </tr>
</table>
</form>
</body>
</html>
<script>
    $(function () {       
		
		$("#savebtn").click(function(){
			if($("#pros").val()>=1 && $("#pros").val()<=24){
				$.ajax({
					url:"${path}/base/updateBs.do",
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
				 			text: "数据加载失败！输入的数值不能太大",
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
		 			text: "时间范围为1~24",
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