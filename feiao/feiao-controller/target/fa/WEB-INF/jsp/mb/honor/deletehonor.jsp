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
<input type="hidden" name="fa_id" value="${faHonor.fa_id}"/>
<table class="table table-bordered ">
    
    
    <tr>
        <td width="10%" >勋章名字</td>
        <td>${faHonor.fa_name}</td>
    </tr>
    <tr>
           <td >描述</td>
           <td>
              ${faHonor.fa_desc}
           </td>
    </tr>
    <tr>
        <td >获取条件</td>
        <td><c:if test="${faHonor.fa_condition==0}">手动发放</c:if><c:if test="${faHonor.fa_condition==1}">注册任意产品</c:if></td>
    </tr>
    <tr>
        <td >图片</td>
        <td>
        	<img src="${faHonor.fa_image}" id="pic_target" >
        </td>
    </tr>
    <tr>
        <td >删除勋章会员邮箱/手机号</td>
        <td>
        	<input type="text" name="username">
        </td>
    </tr>
    
    
    <tr>
        <td ></td>
        <td>
        <shiro:hasPermission name="mbhonor:delmb">
            <button  class="btn btn-primary" type="button" id="savebtn">删除</button> 
        </shiro:hasPermission> 
            &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>
<script>
    $(function () {       
		$('#backid').click(function(){
			alert
				window.location.href="${path}/member/returnHonor.do?curpage=${curpage}";
		 });
		$("#savebtn").click(function(){
			
			
				$.ajax({
					url:"${path}/member/sureDelMbHonor.do",
					type:"post",
					data:$("#userForm").serialize(),
					dataType:"json",
					async : true,
					success:function(data){
						if(data.tip=="success"){
							sweetAlert({
					 			title: "",
					 			text: "删除成功！",
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
				 			text: "数据加载失败！",
				 			type: "error",
				 			confirmButtonColor: "#2b2e37",
				 			confirmButtonText: "确认",
				 			closeOnConfirm: false,
				 			timer:7000
				 		});
					}
				})
			
			
			
		});
		
		
		

    });
   
</script>