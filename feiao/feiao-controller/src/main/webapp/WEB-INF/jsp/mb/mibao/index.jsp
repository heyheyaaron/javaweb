<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    

 

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
<form  id="searchform">    
  
    <shiro:hasPermission name="mbmibao:add">
    <button type="button" class="btn btn-success" id="addnew">新增密保问题</button>
    </shiro:hasPermission>
    
</form>
<table class="table table-bordered " id="cmstable">
    
	     	
</table>

</html>

<script>
$(function(){
	//加载
	var url = "${path}/member/getAllMibao.do"
	
	cmspagemibao(url);
	
	
	//新增用户
	$("#addnew").click(function(){
		window.location.href="${path}/member/addMibao.do";
	});
});

function cmspagemibao(url){
	
	
	$.ajax({
		url : url, // 请求URL
		type : "post", // 请求方式
		dataType : "json", // 服务器响应回来的数据类型json: {}、[]、[{},{}]
		async : true,
		success : function(data){
			
			var vars = "<thead><tr><th>uid</th><th>密保问题</th><th>排序</th><th>操作</th></tr></thead>"
			
			for (var i=0;i<data.length;i++){
					var vart = '<tr><td>'+data[i].fa_id+'</td><td>'+data[i].fa_name+'</td><td>'+data[i].fa_sort+'</td><td><shiro:hasPermission name="mbmibao:update"><a href="/member/updateMibao.do?id='+data[i].fa_id+'">编辑</a></shiro:hasPermission>    <shiro:hasPermission name="mbmibao:delete"><a href="javascript:void(0)" ><span id="'+data[i].fa_id+'" class="deletes">删除</span></a></shiro:hasPermission></td></tr>';	
					vars = vars+vart;
			}
			
			$("#cmstable").html(vars);
			//把商品追加到JSP页面中
			$(".deletes").click(function(){
				var zid = $(this).attr("id")
				
				sweetAlert({
		 			title: "确定要删除吗？",
		 			text: "该操作为永久删除，一旦删除将不得恢复！",
		 			type: "warning",
		 			confirmButtonColor: "#2b2e37",
		 			confirmButtonText: "确认删除",
		 			closeOnConfirm: false,
		 			showCancelButton:true,
		 			cancelButtonText:"不删除了",
		 		},function(){
		 			$.ajax({
						url:"/member/deleteMibao.do",
						data:{"id":zid},
						type:"post",
						dataType:"json",
						async:true,
						success:function(data){
							if(data.tip){
								
					 				
					 			cmspagemibao("${path}/member/getAllMibao.do");
					 				
					 			
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
						 			text: "删除失败！",
						 			type: "error",
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
	
}
</script>