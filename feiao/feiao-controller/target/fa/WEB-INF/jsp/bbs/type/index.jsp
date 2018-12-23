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
    <shiro:hasPermission name="bbsmodel:type">
    <button type="button" class="btn btn-success" id="addnew">为该版块新增分类</button>&nbsp;&nbsp; 
    <br>
    <br>
    </shiro:hasPermission>

<table class="table table-bordered " id="cmstable">
    
	     	
</table>
<div class="inline pull-right page">
		
         <font id="total"></font> 条记录 <font id="curpage"></font>/<font id="totalpage"></font> 页  <a href='javascript:void(0)' id="firstp">首页</a>     <a href='javascript:void(0)' id="lastp">上一页</a>     <span class='current' id="curp"></span>     <a href='javascript:void(0)' id="nextfp"></a>     <a href='javascript:void(0)' id="nextsp"></a>     <a href='javascript:void(0)' id="nexttp"></a>     <a href='javascript:void(0)' id="nextp">下一页</a>     <a href='javascript:void(0)' id="endp">最后一页</a>    &nbsp;</div>

<div>
	<button type="button" class="btn btn-danger"  id="backid">返回</button>
</div>
</body>
</html>

<script>
$(function(){
	$('#backid').click(function(){
		window.location.href="${path}/bbs/returnModel.do";
 	});
	//加载
	var url = "${path}/bbs/selectMlType.do"
	
	cmspagemltype("curpage=${curpage}&id=${sid}",url);
	
	//点击首页
	$("#firstp").click(function(){
		cmspagemltype("curpage=1&id=${sid}",url);
	})
	//点击上一页
	$("#lastp").click(function(){
		var cpage = Number($("#curpage").text())-1; 
		cmspagemltype("curpage="+cpage+"&id=${sid}",url);
	})
	//点击当前页+1
	$("#nextfp").click(function(){
		var cpage = Number($("#curpage").text())+1; 
		cmspagemltype("curpage="+cpage+"&id=${sid}",url);
	})
	//点击当前页+2
	$("#nextsp").click(function(){
		var cpage = Number($("#curpage").text())+2; 
		cmspagemltype("curpage="+cpage+"&id=${sid}",url);
	})
	//点击当前页+3
	$("#nexttp").click(function(){
		var cpage = Number($("#curpage").text())+3; 
		cmspagemltype("curpage="+cpage+"&id=${sid}",url);
	})
	//点击下一页
	$("#nextp").click(function(){
		var cpage = Number($("#curpage").text())+1; 
		cmspagemltype("curpage="+cpage+"&id=${sid}",url);
	})
	//点击最后一页
	$("#endp").click(function(){
		var cpage = Number($("#totalpage").text()); 
		cmspagemltype("curpage="+cpage+"&id=${sid}",url);
	})
	//新增版块分类
	$("#addnew").click(function(){
		window.location.href="${path}/bbs/addMlType.do?curpage="+$("#curpage").text()+"&id=${sid}";
	});
		
});

function cmspagemltype(cmsdata,url){
	$.ajax({
		url : url, // 请求URL
		data:cmsdata,
		type : "post", // 请求方式
		dataType : "json", // 服务器响应回来的数据类型json: {}、[]、[{},{}]
		async : true,
		success : function(data){
			var vars = "<thead><tr><th>版块分类主键</th><th>版块分类名字</th><th>操作</th></tr></thead>"
			for (var i=0;i<data.rows.length;i++){
					var vart = '<tr><td>'+data.rows[i].fa_id+'</td><td>'+data.rows[i].fa_name+'</td><td><shiro:hasPermission name="bbsmodel:type"><a href="/bbs/updateMlType.do?curpage='+data.curpage+'&id='+data.rows[i].fa_id+'">编辑</a></shiro:hasPermission>    <shiro:hasPermission name="bbsmodel:type"><a href="javascript:void(0)" ><span id="'+data.rows[i].fa_id+'" class="deletes">删除</span></a></shiro:hasPermission></td></tr>';	
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
						url:"/bbs/deleteMlType.do",
						data:{"id":zid,"curpage":data.curpage},
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
						 			
						 			window.location.href ="/bbs/returnModelType.do?curpage=1&id=${sid}";
						 			
						 		});
							}else if(data.tip==2){
								sweetAlert({
						 			title: "",
						 			text: "删除失败！该等级下有会员存在！不能删除",
						 			type: "error",
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