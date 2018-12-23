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
    登录名/用户姓名：
    <input type="text" name="searchname" id="username" placeholder="" value="">&nbsp;&nbsp;  
    <button type="button" class="btn btn-primary" id="searchbtn">查询</button>&nbsp;&nbsp; 
    <shiro:hasPermission name="sysuser:add">
    <button type="button" class="btn btn-success" id="addnew">新增用户</button>
    </shiro:hasPermission>
    
</form>
<table class="table table-bordered " id="cmstable">
    
	     	
</table>
<div class="inline pull-right page">
		
         <font id="total"></font> 条记录 <font id="curpage"></font>/<font id="totalpage"></font> 页  <a href='javascript:void(0)' id="firstp">首页</a>     <a href='javascript:void(0)' id="lastp">上一页</a>     <span class='current' id="curp"></span>     <a href='javascript:void(0)' id="nextfp"></a>     <a href='javascript:void(0)' id="nextsp"></a>     <a href='javascript:void(0)' id="nexttp"></a>     <a href='javascript:void(0)' id="nextp">下一页</a>     <a href='javascript:void(0)' id="endp">最后一页</a>    &nbsp;</div>
</body>
</html>

<script>
$(function(){
	//加载
	var url = "${path}/system/selectUser.do"
	
	cmspageuser("curpage=${curpage}",url);
	//搜索
	$("#searchbtn").click(function(){
		cmspageuser("curpage=1&"+$("#searchform").serialize(),url);
		
	})
	//点击首页
	$("#firstp").click(function(){
		cmspageuser("curpage=1&"+$("#searchform").serialize(),url);
	})
	//点击上一页
	$("#lastp").click(function(){
		var cpage = Number($("#curpage").text())-1; 
		cmspageuser("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击当前页+1
	$("#nextfp").click(function(){
		var cpage = Number($("#curpage").text())+1; 
		cmspageuser("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击当前页+2
	$("#nextsp").click(function(){
		var cpage = Number($("#curpage").text())+2; 
		cmspageuser("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击当前页+3
	$("#nexttp").click(function(){
		var cpage = Number($("#curpage").text())+3; 
		cmspageuser("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击下一页
	$("#nextp").click(function(){
		var cpage = Number($("#curpage").text())+1; 
		cmspageuser("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击最后一页
	$("#endp").click(function(){
		var cpage = Number($("#totalpage").text()); 
		cmspageuser("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//新增用户
	$("#addnew").click(function(){
		window.location.href="${path}/system/addUser.do?curpage="+$("#curpage").text();
	});
});

function cmspageuser(cmsdata,url){
	
	
	$.ajax({
		url : url, // 请求URL
		data:cmsdata,
		type : "post", // 请求方式
		dataType : "json", // 服务器响应回来的数据类型json: {}、[]、[{},{}]
		async : true,
		success : function(data){
			
			var vars = "<thead><tr><th>登陆名</th><th>姓名</th><th>角色</th><th>状态</th><th>停用时间</th><th>操作</th></tr></thead>"
			
			/*
			<thead>
			    <tr>
			        <th>登陆名</th>
			        <th>姓名</th>
			        <th>角色</th>
			        <th>状态</th>
			        <th>停用时间</th>
			        <th>操作</th>
			    </tr>
			 </thead>
			 
			 
			 <tr><td>'+data.rows[i].username+'</td><td>'+data.rows[i].name+'</td><td>'+data.rows[i].rname+'</td><td>'+status+'</td><td>'+timecur+'</td><td><a href="${path}/system/updateUser.do?curpage='+data.curpage+'">编辑</a></td></tr>
			
			*/
			for (var i=0;i<data.rows.length;i++){
					
					var timecur = "";
					if(data.rows[i].deltime!=null){
						timecur = data.rows[i].deltime;
					}
						
						
						
					var status ='<font color="green">正常</font>'
					if(data.rows[i].isdel=="1"){
						status ='<font color="red">停用</font>'
					}
					var rname = data.rows[i].rname;
					if(rname==null){
						rname ='<font color="red">该角色已不存在</font>'
					}
					var vart = '<tr><td>'+data.rows[i].username+'</td><td>'+data.rows[i].name+'</td><td>'+rname+'</td><td>'+status+'</td><td>'+timecur+'</td><td><shiro:hasPermission name="sysuser:update"><a href="/system/updateUser.do?curpage='+data.curpage+'&id='+data.rows[i].username+'">编辑</a></shiro:hasPermission>    <shiro:hasPermission name="sysuser:delete"><a href="javascript:void(0)" ><span id="'+data.rows[i].username+'" class="deletes">删除</span></a></shiro:hasPermission></td></tr>';	
					vars = vars+vart;
			}
			
			$("#cmstable").html(vars);
			pageful(data);
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
						url:"/system/deleteUser.do",
						data:{"username":zid,"curpage":data.curpage},
						type:"post",
						dataType:"json",
						async:true,
						success:function(data){
							if(data.tip){
								if((Number($("#total").text())-1)%50==0){
					 				
					 				var cpage = (Number(data.curpage)-1); 
									cmspageuser("curpage="+cpage+"&"+$("#searchform").serialize(),"${path}/system/selectUser.do");
					 			}else{
					 				var cpage = (Number(data.curpage)); 
									cmspageuser("curpage="+cpage+"&"+$("#searchform").serialize(),"${path}/system/selectUser.do");
					 				
					 			}
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