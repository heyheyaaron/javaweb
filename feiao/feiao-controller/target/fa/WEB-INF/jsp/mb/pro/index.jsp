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
   产品名称/型号：
    <input type="text" name="searchname" id="username" placeholder="" value="">&nbsp;&nbsp;  
    <button type="button" class="btn btn-primary" id="searchbtn">查询</button>&nbsp;&nbsp; 
    <shiro:hasPermission name="cppro:add">
    <button type="button" class="btn btn-success" id="addnew" >新增产品</button>
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
	var url = "${path}/pro/selectPro.do"
	
	cmspagePro("curpage=${curpage}",url);
	//搜索
	$("#searchbtn").click(function(){
		cmspagePro("curpage=1&"+$("#searchform").serialize(),url);
		
	})
	//点击首页
	$("#firstp").click(function(){
		cmspagePro("curpage=1&"+$("#searchform").serialize(),url);
	})
	//点击上一页
	$("#lastp").click(function(){
		var cpage = Number($("#curpage").text())-1; 
		cmspagePro("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击当前页+1
	$("#nextfp").click(function(){
		var cpage = Number($("#curpage").text())+1; 
		cmspagePro("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击当前页+2
	$("#nextsp").click(function(){
		var cpage = Number($("#curpage").text())+2; 
		cmspagePro("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击当前页+3
	$("#nexttp").click(function(){
		var cpage = Number($("#curpage").text())+3; 
		cmspagePro("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击下一页
	$("#nextp").click(function(){
		var cpage = Number($("#curpage").text())+1; 
		cmspagePro("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击最后一页
	$("#endp").click(function(){
		var cpage = Number($("#totalpage").text()); 
		cmspagePro("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//新增产品
	$("#addnew").click(function(){
		window.location.href="${path}/pro/addPro.do?curpage="+$("#curpage").text();
	});
});

function cmspagePro(cmsdata,url){
	
	
	$.ajax({
		url : url, // 请求URL
		data:cmsdata,
		type : "post", // 请求方式
		dataType : "json", // 服务器响应回来的数据类型json: {}、[]、[{},{}]
		async : true,
		success : function(data){
			var vars = "<thead><tr><th>产品id</th><th>产品名称</th><th>产品型号</th><th>产品图片</th><th>产品条形码</th><th>操作</th></tr></thead>"
			
			
			for (var i=0;i<data.rows.length;i++){
				var condition = "手动发放";
				if(data.rows[i].fa_condition==2){
					condition = "注册任意产品";
				}
				var vart = '<tr><td>'+data.rows[i].fa_id+'</td><td>'+data.rows[i].fa_title+'</td><td>'+data.rows[i].fa_type+'</td><td><img  src="'+data.rows[i].fa_image+'" width="40px"  ></td><td>'+data.rows[i].fa_ma+'</td><td><shiro:hasPermission name="cppro:update"><a href="/pro/updatePro.do?curpage='+data.curpage+'&id='+data.rows[i].fa_id+'">编辑/导入注册码</a></shiro:hasPermission>    <shiro:hasPermission name="cppro:delete"><a href="javascript:void(0)" ><span id="'+data.rows[i].fa_id+'" class="deletes">删除</span></a></shiro:hasPermission></td></tr>';	
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
						url:"/pro/deletePro.do",
						data:{"id":zid,"curpage":data.curpage},
						type:"post",
						dataType:"json",
						async:true,
						success:function(data){
							if(data.tip){
								if((Number($("#total").text())-1)%50==0){
					 				//window.location.href ="/pro/returnPro.do?curpage="+(Number(data.curpage)-1);
					 				var cpage = (Number(data.curpage)-1); 
					 				cmspagePro("curpage="+cpage+"&"+$("#searchform").serialize(),"${path}/pro/selectPro.do");
					 			}else{
					 				var cpage = (Number(data.curpage)); 
					 				cmspagePro("curpage="+cpage+"&"+$("#searchform").serialize(),"${path}/pro/selectPro.do");
					 				//window.location.href ="/pro/returnPro.do?curpage="+(Number(data.curpage));
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