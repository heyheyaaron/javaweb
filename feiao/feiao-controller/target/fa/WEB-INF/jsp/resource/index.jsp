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
<form id="saveForm">
	
    <table class="table table-bordered ">
        
        <tr>
           <td>
                <button type="button" class="btn btn-success" id="addnew">新增权限</button>
            </td>
        </tr>
        <tr>
            
            
            <td>
                <ul id="quanxians">
                	
                </ul>
            </td>
        </tr>
        
    </table>
</form>
</body>
</html>
<script>
	function xunhuan(id,data,vat){
		for(var j=0;j<data.length;j++){
			 if(id==data[j].pid){
				 var vas="<ul><li><label class='checkbox inline'>"+data[j].name+"            <a href='/system/updateResource.do?id="+data[j].id+"'><font size='1' style='font-weight:normal'>   修改</font></a>      <a href='javascript:void(0)'><font size='1' style='font-weight:normal' ><span id='"+data[j].id+"' class='deletes'>   删除</span></font></a></label>";
				 vas = xunhuan(data[j].id,data,vas)+"</ul>";
				 vat = vat+vas;
			 }
		 }
		return vat;
		
		 
	}
    $(function () {
    	$("#addnew").click(function(){
    		window.location.href="${path}/system/addResource.do";
    	});
		 //查询所有资源
		 $.ajax({
			 url:"${path}/system/selectAllReasource.do",
			 type:"post",
			 dataType:"json",
			 success:function(data){
				 var vars = "";
				 for(var i=0;i<data.length;i++){
					 if(data[i].pid==0){
						 
						 var vat="<li><label class='checkbox inline'>"+data[i].name+"            <a href='/system/updateResource.do?id="+data[i].id+"'><font size='1' style='font-weight:normal'>   修改</font></a>      <a href='javascript:void(0)'><font size='1' style='font-weight:normal' ><span id='"+data[i].id+"' class='deletes'>   删除</span></font></a></label>";
						 
						 vat = xunhuan(data[i].id,data,vat)+"</li>";
						 
						 vars=vars+vat;
						 
					 }
					 
				 }
				 
						
				 $("#quanxians").html(vars);
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
								url:"/system/deleteResource.do",
								data:{"id":zid},
								type:"post",
								dataType:"json",
								async:true,
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
								 		},function(){
								 			window.location.href ="/system/returnResource.do";
								 		});
									}else{
										sweetAlert({
								 			title: "删除失败！",
								 			text: data.tip,
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