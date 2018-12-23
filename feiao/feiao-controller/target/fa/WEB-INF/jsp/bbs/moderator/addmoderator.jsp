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
        <td width="10%" >新增版主手机/邮箱</td>
        <td><input type="text" name="userId" id="userId"/>   <font id="tip"></font></td>
    </tr>
    <tr>
        <td >版主类别</td>
        <td>
        	<select name="typeMo" id="typeMo">
        		<option value="1" selected="selected">模块版主</option>
        		<option value="2">超级版主</option>
        	</select>
        </td>
    </tr>
    <tr id="dfs">
    	<td>设置需要管理的模块</td>
    	<td><select  id="reid" name="oneMo" style="height: 30px"></select></td>
    </tr>
    
    
    <tr>
        <td ></td>
        <td>
        <shiro:hasPermission name="bbsmoderator:add">
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
    	//判断版主类别
    	$("#typeMo").change(function(){
			var sv = $(this).val() 
			if(sv==1){
				document.getElementById("dfs").style.display="";
			}else{
				document.getElementById("dfs").style.display="none";
			}
		})
    	//判断该会员是否存在
    	$("#userId").blur(function(){
    		$.ajax({
    			url : "${path}/bbs/selectUserByTelOrEmail.do",
    			data:{"userId":$("#userId").val()},
    			type : "post",
    			dataType : "text",
    			async : true,
    			success : function(data){
    				if(data==1){
    					$("#tip").attr("color","green")
    					$("#tip").text("√")
    				}else{
    					$("#tip").attr("color","red")
    					$("#tip").text("*该会员不存在")
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
	    /** 异步加载所有版块 */
		$.ajax({
			url : "${path}/bbs/selectAllModel.do",
			type : "post",
			dataType : "json",
			async : true,
			success : function(data){
				var options = [];
				
				
				$.each(data, function (index, value) {
						if(index==0){
							options.push("<option value='" + value.id + "'  selected='selected'> " + value.name + " </option>");
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
    	
    	
		$('#backid').click(function(){
				window.location.href="${path}/bbs/returnModerator.do";
		 });
		$("#savebtn").click(function(){
			
			if($("#tip").text()=="√"){
				$.ajax({
					url:"${path}/bbs/sureAddModerator.do",
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
						 			window.location.href="${path}/bbs/returnModerator.do?curpage=${curpage}";
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
		 			text: "该会员不存在，请核实！",
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