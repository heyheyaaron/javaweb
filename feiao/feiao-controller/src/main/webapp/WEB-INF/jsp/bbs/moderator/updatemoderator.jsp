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
<input type="hidden" name="id" value="${faUser.fa_id}"/>
<table class="table table-bordered ">
    
    
    <tr>
        <td width="10%" >版主昵称</td>
        <td>${faUser.fa_username}</td>
    </tr>
    <tr>
        <td >版主头像</td>
        <td>
        	<img src="${faUser.fa_title_img}"  width="70px" height="70px">
        	
        </td>
    </tr>
    <tr>
        <td  >版主手机</td>
        <td>${faUser.fa_telphone}</td>
    </tr>
    <tr>
        <td  >版主邮箱</td>
        <td>${faUser.fa_email}</td>
    </tr>
    <tr>
        <td >版主类别</td>
        <td>
        	<select name="typeMo" id="typeMo">
        		<option value="1"  <c:if test="${faUser.fa_ishost==1}">selected="selected"</c:if>>模块版主</option>
        		<option value="2" <c:if test="${faUser.fa_ishost==2}">selected="selected"</c:if>>超级版主</option>
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
        <shiro:hasPermission name="bbsmoderator:update">
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
				window.location.href="${path}/bbs/returnModerator.do?curpage=${curpage}";
		 });
		if("${faUser.fa_ishost}"==1){
			document.getElementById("dfs").style.display="";
		}else{
			document.getElementById("dfs").style.display="none";
		}
		//判断版主类别
    	$("#typeMo").change(function(){
			var sv = $(this).val() 
			if(sv==1){
				document.getElementById("dfs").style.display="";
			}else{
				document.getElementById("dfs").style.display="none";
			}
		})
		$("#savebtn").click(function(){
			
				$.ajax({
					url:"${path}/bbs/sureUpdateModerator.do",
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
						if("${faUser.fa_sectionid}"==value.id){
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
    });
   
</script>