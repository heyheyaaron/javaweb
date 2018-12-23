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
    <table class="table table-bordered ">
       <shiro:hasPermission name="mblabel:add">
        <tr>
           <td>
                 <button type="button" class="btn btn-success" id="addnew">新增内容分类</button>
            </td>
        </tr>
        </shiro:hasPermission>
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
		 
		 if(id==data[j].fa_pid){
			 var vas="<ul><li><label class='checkbox inline'>"+data[j].fa_name+"            <shiro:hasPermission name='contenttype:update'><a href='/con/updateConType.do?id="+data[j].fa_id+"'><font size='1' style='font-weight:normal'>   修改</font></a></shiro:hasPermission>      <shiro:hasPermission name='contenttype:delete'><a href='javascript:void(0)'><font size='1' style='font-weight:normal' ><span id='"+data[j].fa_id+"' class='deletes'>   删除</span></font></a></shiro:hasPermission>     </label>";
			 vas = xunhuan(data[j].fa_id,data,vas)+"</ul>";
			 vat = vat+vas;
		 }
	 }
	return vat;
	
	 
}
$(function(){
	//加载
	var url = "${path}/con/getAllConType.do"
	//新增用户
	$("#addnew").click(function(){
		window.location.href="${path}/con/addConType.do";
	});
	$.ajax({
		url : url, // 请求URL
		type : "post", // 请求方式
		dataType : "json", // 服务器响应回来的数据类型json: {}、[]、[{},{}]
		async : true,
		success : function(data){
			var vars = "";
			 for(var i=0;i<data.length;i++){
				
				 if(data[i].fa_pid==0){
					 
					 var vat="<li><label class='checkbox inline'>"+data[i].fa_name+"            <shiro:hasPermission name='contenttype:update'><a href='/con/updateConType.do?id="+data[i].fa_id+"'><font size='1' style='font-weight:normal'>   修改</font></a></shiro:hasPermission>      <shiro:hasPermission name='contenttype:delete'><a href='javascript:void(0)'><font size='1' style='font-weight:normal' ><span id='"+data[i].fa_id+"' class='deletes'>   删除</span></font></a></shiro:hasPermission>      </label>";
					 
					 vat = xunhuan(data[i].fa_id,data,vat)+"</li>";
					 
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
							url:"/con/deleteConType.do",
							data:{"id":zid},
							type:"post",
							dataType:"json",
							async:true,
							success:function(data){
								if(data.tip==1){
									sweetAlert({
							 			title: "",
							 			text: "删除成功！",
							 			type: "success",
							 			confirmButtonColor: "#2b2e37",
							 			confirmButtonText: "确认",
							 			closeOnConfirm: false,
							 			timer:7000
							 		},function(){
							 			window.location.href ="/con/returnConType.do";
							 		});
								}else if(data.tip==2){
									sweetAlert({
							 			title: "",
							 			text: "该分类里还存有内容，无法删除！",
							 			type: "error",
							 			confirmButtonColor: "#2b2e37",
							 			confirmButtonText: "确认",
							 			closeOnConfirm: false,
							 			timer:7000
							 		});
								}else if(data.tip==3){
									sweetAlert({
							 			title: "",
							 			text: "该分类里下还有分类存在，无法删除",
							 			type: "error",
							 			confirmButtonColor: "#2b2e37",
							 			confirmButtonText: "确认",
							 			closeOnConfirm: false,
							 			timer:7000
							 		});
								}else if(data.tip==4){
									sweetAlert({
							 			title: "",
							 			text: "该分类不能被删除",
							 			type: "error",
							 			confirmButtonColor: "#2b2e37",
							 			confirmButtonText: "确认",
							 			closeOnConfirm: false,
							 			timer:7000
							 		});
								}else{
									sweetAlert({
							 			title: "删除失败！",
							 			text: "",
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
});


	
	
	
	

</script>