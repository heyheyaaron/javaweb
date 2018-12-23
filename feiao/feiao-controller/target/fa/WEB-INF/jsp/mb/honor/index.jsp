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
   勋章名字：
    <input type="text" name="searchname" id="username" placeholder="" value="">&nbsp;&nbsp;  
    <button type="button" class="btn btn-primary" id="searchbtn">查询</button>&nbsp;&nbsp; 
    <shiro:hasPermission name="mbhonor:add">
    <button type="button" class="btn btn-success" id="addnew" >新增勋章</button>
    </shiro:hasPermission>
    
</form>
<table class="table table-bordered " id="cmstable">
    
	     	
</table>
<div class="inline pull-right page">
		
         <font id="total" ></font> 条记录 <font id="curpage"></font>/<font id="totalpage"></font> 页  <a href='javascript:void(0)' id="firstp">首页</a>     <a href='javascript:void(0)' id="lastp">上一页</a>     <span class='current' id="curp"></span>     <a href='javascript:void(0)' id="nextfp"></a>     <a href='javascript:void(0)' id="nextsp"></a>     <a href='javascript:void(0)' id="nexttp"></a>     <a href='javascript:void(0)' id="nextp">下一页</a>     <a href='javascript:void(0)' id="endp">最后一页</a>    &nbsp;</div>
</body>
</html>

<script>
$(function(){
	//加载
	var url = "${path}/member/selectHonor.do"
	
	cmspageHonor("curpage=${curpage}",url);
	//搜索
	$("#searchbtn").click(function(){
		cmspageHonor("curpage=1&"+$("#searchform").serialize(),url);
		
	})
	//点击首页
	$("#firstp").click(function(){
		cmspageHonor("curpage=1&"+$("#searchform").serialize(),url);
	})
	//点击上一页
	$("#lastp").click(function(){
		var cpage = Number($("#curpage").text())-1; 
		cmspageHonor("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击当前页+1
	$("#nextfp").click(function(){
		var cpage = Number($("#curpage").text())+1; 
		cmspageHonor("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击当前页+2
	$("#nextsp").click(function(){
		var cpage = Number($("#curpage").text())+2; 
		cmspageHonor("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击当前页+3
	$("#nexttp").click(function(){
		var cpage = Number($("#curpage").text())+3; 
		cmspageHonor("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击下一页
	$("#nextp").click(function(){
		var cpage = Number($("#curpage").text())+1; 
		cmspageHonor("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击最后一页
	$("#endp").click(function(){
		var cpage = Number($("#totalpage").text()); 
		cmspageHonor("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//新增用户
	$("#addnew").click(function(){
		window.location.href="${path}/member/addHonor.do?curpage="+$("#curpage").text();
	});
});

function cmspageHonor(cmsdata,url){
	
	
	$.ajax({
		url : url, // 请求URL
		data:cmsdata,
		type : "post", // 请求方式
		dataType : "json", // 服务器响应回来的数据类型json: {}、[]、[{},{}]
		async : true,
		success : function(data){
			var vars = "<thead><tr><th>勋章id</th><th>勋章名字</th><th>勋章描述</th><th>勋章图片</th><th>获取条件</th><th>操作</th></tr></thead>"
			
			
			for (var i=0;i<data.rows.length;i++){
				var condition = "手动发放";
				if(data.rows[i].fa_condition==1){
					condition = "注册任意产品";
				}
				var vart = '<tr><td>'+data.rows[i].fa_id+'</td><td>'+data.rows[i].fa_name+'</td><td>'+data.rows[i].fa_desc+'</td><td><img  src="'+data.rows[i].fa_image+'"  ></td><td>'+condition+'</td><td><shiro:hasPermission name="mbhonor:update"><a href="/member/updateHonor.do?curpage='+data.curpage+'&id='+data.rows[i].fa_id+'">编辑</a></shiro:hasPermission>    <shiro:hasPermission name="mbhonor:delete"><a href="javascript:void(0)" ><span id="'+data.rows[i].fa_id+'" class="deletes">&nbsp;&nbsp;&nbsp;&nbsp;删除</span></a></shiro:hasPermission>   <shiro:hasPermission name="mbhonor:send"><a href="/member/sendHonor.do?curpage='+data.curpage+'&id='+data.rows[i].fa_id+'">&nbsp;&nbsp;&nbsp;&nbsp;发放勋章</a></shiro:hasPermission>   <shiro:hasPermission name="mbhonor:delmb"><a href="/member/delMbHonor.do?curpage='+data.curpage+'&id='+data.rows[i].fa_id+'">   &nbsp;&nbsp;&nbsp;&nbsp;除去某会员的勋章</a></shiro:hasPermission></td></tr>';	
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
						url:"/member/deleteHonor.do",
						data:{"id":zid,"curpage":data.curpage},
						type:"post",
						dataType:"json",
						async:true,
						success:function(data){
							if(data.tip){
								if((Number($("#total").text())-1)%50==0){
					 				//window.location.href ="/member/returnHonor.do?curpage="+(Number(data.curpage)-1);
					 				var cpage = (Number(data.curpage)-1); 
					 				cmspageHonor("curpage="+cpage+"&"+$("#searchform").serialize(),"${path}/member/selectHonor.do");
					 			}else{
					 				var cpage = (Number(data.curpage)); 
					 				cmspageHonor("curpage="+cpage+"&"+$("#searchform").serialize(),"${path}/member/selectHonor.do");
					 				//window.location.href ="/member/returnHonor.do?curpage="+(Number(data.curpage));
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