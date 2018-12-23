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
<input type="hidden" name="id" value="${maps.id}"/>
<table class="table table-bordered ">
    
    
    <tr>
        <td width="10%" >产品问题名称</td>
        <td><input type="text" name="name" value="${maps.name}"/></td>
    </tr>
    <tr>
        <td >排序</td>
        <td><input type="number" name="sort" id="sort" value="${maps.sort}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/><font color="red">    *0~999，数值最小排序越高</font></td>
    </tr>
    
    
    
    <tr>
        <td ></td>
        <td>
        <shiro:hasPermission name="bbsnotequest:update">
            <button  class="btn btn-primary" type="button" id="savebtn">保存</button> 
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
				window.location.href="${path}/bbs/returnNoteQuest.do?curpage=${curpage}";
		 });
		$("#savebtn").click(function(){
			
			if(Number($("#sort").val())<0 || Number($("#sort").val())>999){
				sweetAlert({
		 			title: "",
		 			text: "排序范围为0~999！",
		 			type: "info",
		 			confirmButtonColor: "#2b2e37",
		 			confirmButtonText: "确认",
		 			closeOnConfirm: false,
		 			timer:7000
		 		});
			}else{
				$.ajax({
					url:"${path}/bbs/sureUpdateNoteQuest.do",
					type:"post",
					data:$("#userForm").serialize(),
					dataType:"json",
					async : true,
					success:function(data){
						if(data.tip=="success"){
								sweetAlert({
						 			title: "",
						 			text: "修改成功！",
						 			type: "success",
						 			confirmButtonColor: "#2b2e37",
						 			confirmButtonText: "确认",
						 			closeOnConfirm: false,
						 			timer:7000
						 		},function(){
						 			window.location.href="${path}/bbs/returnNoteQuest.do?curpage=${curpage}";
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
			}
			
			
		});
		
		
		

    });
</script>