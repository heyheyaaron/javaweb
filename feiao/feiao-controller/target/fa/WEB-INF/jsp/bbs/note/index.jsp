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
        td, th {
   			 width:5px;
		}


    </style>
</head>
<body>
<c:import url="${path}/feiioback.jsp"></c:import>
<form  id="searchform">  
  
   帖子名称：
    <input type="text" name="searchname" id="username" placeholder="" value="" style="height: 30px">&nbsp;&nbsp;  
    <select name="noteTpye" style="height: 30px">&nbsp;&nbsp; 
    	<option value="0" selected="selected">--不设置帖子类型--</option>
    	<option value="1">普通帖</option>
    	<option value="2">投票调查贴</option>
    	<option value="3">反馈贴</option>
    	<option value="4">活动贴</option>
    </select>
    <select id="modelid" name="modelid" style="height: 30px"></select>&nbsp;&nbsp; 
    <button type="button" class="btn btn-primary" id="searchbtn">查询</button>&nbsp;&nbsp; 
    <shiro:hasPermission name="bbsnote:zd">
   	 <button type="button" class="btn btn-success" id="zdbtn">置顶</button>
    </shiro:hasPermission>
    <shiro:hasPermission name="bbsnote:jh">
   	 <button type="button" class="btn btn-info" id="jhbtn">精华</button>
    </shiro:hasPermission>
    <shiro:hasPermission name="bbsnote:gl">
   	 <button type="button" class="btn btn-warning" id="glbtn">高亮</button>
    </shiro:hasPermission>
    <shiro:hasPermission name="bbsnote:delete">
    	<button type="button" class="btn btn-danger" id="deletebtn">删除帖子</button>
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
	var url = "${path}/bbs/selectNote.do"
	
	cmspagenote("curpage=${curpage}",url);
	
	
	
	//搜索
	$("#searchbtn").click(function(){
		cmspagenote("curpage=1&"+$("#searchform").serialize(),url);
		
	})
	//点击首页
	$("#firstp").click(function(){
		cmspagenote("curpage=1&"+$("#searchform").serialize(),url);
	})
	//点击上一页
	$("#lastp").click(function(){
		var cpage = Number($("#curpage").text())-1; 
		cmspagenote("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击当前页+1
	$("#nextfp").click(function(){
		var cpage = Number($("#curpage").text())+1; 
		cmspagenote("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击当前页+2
	$("#nextsp").click(function(){
		var cpage = Number($("#curpage").text())+2; 
		cmspagenote("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击当前页+3
	$("#nexttp").click(function(){
		var cpage = Number($("#curpage").text())+3; 
		cmspagenote("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击下一页
	$("#nextp").click(function(){
		var cpage = Number($("#curpage").text())+1; 
		cmspagenote("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击最后一页
	$("#endp").click(function(){
		var cpage = Number($("#totalpage").text()); 
		cmspagenote("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	/** 异步加载所有版块 */
	$.ajax({
		url : "${path}/bbs/selectAllModel.do",
		type : "post",
		dataType : "json",
		async : true,
		success : function(data){
			var options = [];
			
			options.push("<option value='0' selected='selected'>不设置查询版块</option>");
			$.each(data, function (index, value) {
				
					options.push("<option value='" + value.id + "'> " + value.name + " </option>");
				
				
		    });
		    $("#modelid").append(options.join(''));
			
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
	
	//删除
	$("#deletebtn").click(function(){
		
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
 			var userIds = new Array();
 			$("input[name='ids']:checkbox").each(function(){ 
 				if(true == $(this).prop("checked")){
 					userIds.push($(this).prop('value'));
 				}
 			});
 			$.ajax({
				url:"/bbs/deleteNote.do",
				data:{"ids":userIds.join(",")},
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
				 			window.location.href ="/bbs/returnNote.do?curpage=1";
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
	});
	//置顶
	$("#zdbtn").click(function(){
		
		sweetAlert({
 			title: "确定要置顶吗？",
 			text: "",
 			type: "warning",
 			confirmButtonColor: "#2b2e37",
 			confirmButtonText: "确认置顶",
 			closeOnConfirm: false,
 			showCancelButton:true,
 			cancelButtonText:"不置顶了",
 		},function(){
 			var userIds = new Array();
 			$("input[name='ids']:checkbox").each(function(){ 
 				if(true == $(this).prop("checked")){
 					userIds.push($(this).prop('value'));
 				}
 			});
 			$.ajax({
				url:"/bbs/zdNote.do",
				data:{"ids":userIds.join(",")},
				type:"post",
				dataType:"json",
				async:true,
				success:function(data){
					if(data.tip){
						sweetAlert({
				 			title: "",
				 			text: "置顶成功！",
				 			type: "success",
				 			confirmButtonColor: "#2b2e37",
				 			confirmButtonText: "确认",
				 			closeOnConfirm: false,
				 			timer:7000
				 		},function(){
				 			window.location.href ="/bbs/returnNote.do?curpage=1";
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
				 			text: "置顶失败！",
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
	//精华
	$("#jhbtn").click(function(){
		
		sweetAlert({
 			title: "",
 			text: "确定要为选中的帖子设为精华帖吗？",
 			type: "warning",
 			confirmButtonColor: "#2b2e37",
 			confirmButtonText: "确认",
 			closeOnConfirm: false,
 			showCancelButton:true,
 			cancelButtonText:"不了",
 		},function(){
 			var userIds = new Array();
 			$("input[name='ids']:checkbox").each(function(){ 
 				if(true == $(this).prop("checked")){
 					userIds.push($(this).prop('value'));
 				}
 			});
 			$.ajax({
				url:"/bbs/jhNote.do",
				data:{"ids":userIds.join(",")},
				type:"post",
				dataType:"json",
				async:true,
				success:function(data){
					if(data.tip){
						sweetAlert({
				 			title: "",
				 			text: "设置成功！",
				 			type: "success",
				 			confirmButtonColor: "#2b2e37",
				 			confirmButtonText: "确认",
				 			closeOnConfirm: false,
				 			timer:7000
				 		},function(){
				 			window.location.href ="/bbs/returnNote.do?curpage=1";
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
				 			text: "设置失败！",
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
	//高亮
	$("#glbtn").click(function(){
		
		sweetAlert({
 			title: "",
 			text: "确定要将选中的帖子设为高亮帖吗？",
 			type: "warning",
 			confirmButtonColor: "#2b2e37",
 			confirmButtonText: "确认设置",
 			closeOnConfirm: false,
 			showCancelButton:true,
 			cancelButtonText:"不设置了",
 		},function(){
 			var userIds = new Array();
 			$("input[name='ids']:checkbox").each(function(){ 
 				if(true == $(this).prop("checked")){
 					userIds.push($(this).prop('value'));
 				}
 			});
 			$.ajax({
				url:"/bbs/glNote.do",
				data:{"ids":userIds.join(",")},
				type:"post",
				dataType:"json",
				async:true,
				success:function(data){
					if(data.tip){
						sweetAlert({
				 			title: "",
				 			text: "设置成功！",
				 			type: "success",
				 			confirmButtonColor: "#2b2e37",
				 			confirmButtonText: "确认",
				 			closeOnConfirm: false,
				 			timer:7000
				 		},function(){
				 			window.location.href ="/bbs/returnNote.do?curpage=1";
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
				 			text: "设置失败！",
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
});

function cmspagenote(cmsdata,url){
	
	
	$.ajax({
		url : url, // 请求URL
		data:cmsdata,
		type : "post", // 请求方式
		dataType : "json", // 服务器响应回来的数据类型json: {}、[]、[{},{}]
		async : true,
		success : function(data){
			
			var vars = "<thead><tr><th ><input type='checkbox' id='qx'>  全选</th><th >帖子名称</th><th>帖子类型</th><th>所属板块</th><th>发布者</th><th>创建时间</th><th>浏览量</th><th>置顶</th><th>精华</th><th>高亮</th><th>操作</th></tr></thead>"
			
			
			for (var i=0;i<data.rows.length;i++){
					var noteType = "";
					if(data.rows[i].type==1){
						noteType = "普通帖";
					}else if(data.rows[i].type==2){
						noteType = "投票调查贴";
					}else if(data.rows[i].type==3){
						noteType = "反馈贴";
					}else if(data.rows[i].type==4){
						noteType = "活动贴";
					}
						
					var zds ='<font color="red">否</font>';
					if(data.rows[i].zds=="1"){
						zds ='<font color="green">是</font>'
					}
					var jhs ='<font color="red">否</font>';
					if(data.rows[i].jhs=="1"){
						jhs ='<font color="green">是</font>'
					}
					var gls ='<font color="red">否</font>';
					if(data.rows[i].gls=="1"){
						gls ='<font color="green">是</font>'
					}
					var titlename = data.rows[i].name;
					if(titlename.length>25){
						titlename = titlename.substring(0,25)+"......"
					}
					var vart = '<tr><td><input type="checkbox" name="ids" value="'+data.rows[i].id+'"></td><td title="'+data.rows[i].name+'">'+titlename+'</td><td>'+noteType+'</td><td>'+data.rows[i].mons+'</td><td>'+data.rows[i].username+'</td><td>'+data.rows[i].crtime+'</td><td>'+data.rows[i].readss+'</td><td>'+zds+'</td><td>'+jhs+'</td><td>'+gls+'</td><td><shiro:hasPermission name="bbsnote:update"><a href="/bbs/updateNote.do?curpage='+data.curpage+'&id='+data.rows[i].id+'">查看/编辑</a></shiro:hasPermission>    </td></tr>';	
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