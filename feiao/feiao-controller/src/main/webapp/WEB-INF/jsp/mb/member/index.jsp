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
  
   会员昵称/手机/会员邮箱：
    <input type="text" name="searchname" id="username" placeholder="" value="" style="height: 30px">&nbsp;&nbsp;  
    <select id="rankid" name="rankid" style="height: 30px"></select>&nbsp;&nbsp; 
    <select id="groupid" name="groupid" style="height: 30px"></select>&nbsp;&nbsp; 
    <select id="telid" name="telid" style="height: 30px"></select>&nbsp;&nbsp; 
    <button type="button" class="btn btn-primary" id="searchbtn">查询</button>&nbsp;&nbsp; 
    <shiro:hasPermission name="mbmember:add">
   	 <button type="button" class="btn btn-success" id="addnew">新增会员</button>
    </shiro:hasPermission>
    <shiro:hasPermission name="mbmember:delete">
    	<button type="button" class="btn btn-danger" id="deletenew">删除会员</button>
    </shiro:hasPermission>
</form>
<table class="table table-bordered " id="cmstable">
    
	     	
</table>
<div class="inline pull-right page" >
		
         <font id="total" ></font> 条记录 <font id="curpage"></font>/<font id="totalpage"></font> 页  <a href='javascript:void(0)' id="firstp">首页</a>     <a href='javascript:void(0)' id="lastp">上一页</a>     <span class='current' id="curp"></span>     <a href='javascript:void(0)' id="nextfp"></a>     <a href='javascript:void(0)' id="nextsp"></a>     <a href='javascript:void(0)' id="nexttp"></a>     <a href='javascript:void(0)' id="nextp">下一页</a>     <a href='javascript:void(0)' id="endp">最后一页</a>    &nbsp;</div>
</body>
</html>

<script>
$(function(){
	//加载
	var url = "${path}/member/selectMember.do"
	
	cmspageuser("curpage=${curpage}",url);
	/** 异步会员等级标签 */
	$.ajax({
		url : "${path}/member/selectAllRank.do",
		type : "post",
		dataType : "json",
		async : true,
		success : function(data){
			
			var options = [];
			options.push("<option value='0' selected='selected' >----会员等级----</option>");
			$.each(data, function (index, value) {
				
				options.push("<option value='" + value.fa_id + "'> " + value.fa_name + " </option>");
				
				
		    });
		    $("#rankid").append(options.join(''));
			
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
	/** 异步手机型号 */
	$.ajax({
		url : "${path}/pro/getAllPro.do",
		type : "post",
		dataType : "json",
		async : true,
		success : function(data){
			
			var options = [];
			options.push("<option value='0' selected='selected' >----手机用户组----</option>");
			$.each(data, function (index, value) {
				options.push("<option value='" + value.id + "'> " + value.title+"("+value.name + ") </option>");
				
				
		    });
		    $("#telid").append(options.join(''));
			
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
	/** 异步会员用户组标签 */
	$.ajax({
		url : "${path}/member/getAllMbGroup.do",
		type : "post",
		dataType : "json",
		async : true,
		success : function(data){
			
			var options = [];
			options.push("<option value='0' selected='selected' >----会员用户组----</option>");
			$.each(data, function (index, value) {
				
				options.push("<option value='" + value.id + "'> " + value.name + " </option>");
				
				
		    });
		    $("#groupid").append(options.join(''));
			
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
		window.location.href="${path}/member/addMember.do?curpage="+$("#curpage").text();
	});
	//删除用户
	
	$("#deletenew").click(function(){
		var userIds = new Array();
			$("input[name='ids']:checkbox").each(function(){ 
				if(true == $(this).prop("checked")){
					userIds.push($(this).prop('value'));
				}
			});
		if(userIds.length>0){
			sweetAlert({
	 			title: "确定要删除吗？",
	 			text: "该操作为永久删除,涉及的数据比较多，一旦删除，与其关联的数据可能会出现显示错误,慎用！！！",
	 			type: "warning",
	 			confirmButtonColor: "#2b2e37",
	 			confirmButtonText: "确认删除",
	 			closeOnConfirm: false,
	 			showCancelButton:true,
	 			cancelButtonText:"不删除了",
	 		},function(){
 			
	 			$.ajax({
					url:"/member/deleteMember.do",
					data:{"ids":userIds.join(",")},
					type:"post",
					dataType:"json",
					async:true,
					success:function(data){
						if(data.tip){
							sweetAlert({
					 			title: "",
					 			text: "删除成功！",
					 			type: "success",
					 			confirmButtonColor: "#2b2e37",
					 			confirmButtonText: "确认",
					 			closeOnConfirm: false,
					 			timer:7000
					 		},function(){
					 			window.location.href ="/member/returnMember.do?curpage=1";
					 		});
						}else if(data.tip==5){
							sweetAlert({
					 			title: "",
					 			text: "请勾选至少一行数据！",
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
		}else{
			sweetAlert({
	 			title: "",
	 			text: "请选择至少一条数据！",
	 			type: "warning",
	 			confirmButtonColor: "#2b2e37",
	 			confirmButtonText: "确认",
	 			closeOnConfirm: false,
	 			timer:7000
	 		});
		}
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
			
			var vars = "<thead><tr><th width='50px'><input type='checkbox' id='qx'>  全选</th><th>uid</th><th>昵称</th><th>手机</th><th>邮箱</th><th>积分</th><th>飞镖</th><th>会员等级</th><th>状态</th><th>操作</th></tr></thead>"
			
			
			for (var i=0;i<data.rows.length;i++){
					
						
					var status ='<font color="green">正常</font>'
					if(data.rows[i].status=="1"){
						status ='<font color="red">停用</font>'
					}
					
					var vart = '<tr><td><input type="checkbox" name="ids" value="'+data.rows[i].id+'"></td><td>'+data.rows[i].id+'</td><td>'+data.rows[i].name+'</td><td>'+data.rows[i].tel+'</td><td>'+data.rows[i].email+'</td><td>'+data.rows[i].inte+'</td><td>'+data.rows[i].bf+'</td><td>'+data.rows[i].rank+'</td><td>'+status+'</td><td><shiro:hasPermission name="mbmember:update"><a href="/member/updateMember.do?curpage='+data.curpage+'&id='+data.rows[i].id+'">查看/编辑</a></shiro:hasPermission>    </td></tr>';	
					vars = vars+vart; 
			}
			
			$("#cmstable").html(vars);
			pageful(data);
			//全选
			$("#qx").click(function(){
				var bool = $("#qx").prop("checked");
				$("#qx").prop("checked", bool);
				$(":checkbox[name=ids]").prop("checked", bool); 
				
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