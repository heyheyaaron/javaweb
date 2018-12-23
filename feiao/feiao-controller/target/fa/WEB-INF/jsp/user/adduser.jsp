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
        <td width="10%" >登录名</td>
        <td><input type="text" name="username"/></td>
    </tr>
    <tr>
        <td >密码</td>
        <td><input type="password" name="password" id="psw1"/></td>
    </tr>
    <tr>
        <td >确认密码</td>
        <td><input type="password"  id="psw2"/></td>
    </tr>
    <tr>
        <td >真实姓名</td>
        <td><input type="text" name="name"/></td>
    </tr>
    
    <tr>
        <td >状态</td>
        <td>
            <input type="radio" name="isdel" value="0" checked/> 启用
           <input type="radio" name="isdel" value="1"/> 禁用
        </td>
    </tr>
    <tr>
        <td >角色</td>
        <td><select class="input-md form-control" id="roleid" name="role_id" style="width: 200px"></select></td>
    </tr>
    <tr>
            <td >配置用户组</td>
            <td>
                <ul id="quanxians">
                	
                </ul>
            </td>
        </tr>
    <tr>
        <td ></td>
        <td>
        <shiro:hasPermission name="sysuser:add">
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
				window.location.href="${path}/system/returnUser.do";
		 });
		$("#savebtn").click(function(){
			
			if($("#psw1").val()!=$("#psw2").val()){
				sweetAlert({
		 			title: "",
		 			text: "两次输入的密码不一致！",
		 			type: "info",
		 			confirmButtonColor: "#2b2e37",
		 			confirmButtonText: "确认",
		 			closeOnConfirm: false,
		 			timer:7000
		 		});
			}else{
				$.ajax({
					url:"${path}/system/sureAddUser.do",
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
						 			window.location.href="${path}/system/returnUser.do?curpage=${curpage}";
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
		/** 异步角色标签 */
		$.ajax({
			url : "${path}/system/selectAllRole.do",
			type : "post",
			dataType : "json",
			async : true,
			success : function(data){
				var options = [];
				$.each(data, function (index, value) {
					if(index==0){
						options.push("<option value='" + value.id + "' selected='selected' > " + value.name + " </option>");
					}else{
						options.push("<option value='" + value.id + "'> " + value.name + " </option>");
					}
					
			    });
			    $("#roleid").append(options.join(''));
				
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
		
		 //查询所有用户组
		 $.ajax({
			 url:"${path}/system/selectAllGroup.do",
			 type:"post",
			 dataType:"json",
			 success:function(data){
				 var vars = "";
				 for(var i=0;i<data.length;i++){
					 
						 
						 var vat="<li><label class='checkbox inline'><input type='checkbox' name='groups' value='"+data[i].id+"' />"+data[i].name+"</label>"+"</li>";
						 
						
						 
						 vars=vars+vat;
						 
					 
					 
				 }
				 
				 $("#quanxians").html(vars);
				 
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
		 });

    });
</script>