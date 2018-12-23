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
<body class="easyui-layout">
<c:import url="${path}/feiioback.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="${path}/js/easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="${path}/js/easyui/themes/icon.css"/>
	<link rel="stylesheet" type="text/css" href="${path}/js/ztree/css/zTreeStyle/zTreeStyle.css"/>
	
	
	<script type="text/javascript" src="${path}/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${path}/js/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${path}/js/ztree/jquery.ztree.all.min.js"></script>
	<input type="hidden" id="baseId"  >
	<!-- 西部区域 -->
		<div data-options="region:'west',split:true,width:168" >
			<ul id="res_tree" class="ztree"></ul>
		</div>
		
		<!-- 中间区域 -->
		<div data-options="region:'center'">
		<div id="addOrUpdate" style="width: 100%;height: 100%">
		<iframe   src="" id="ifcid" width="100%" height="100%" frameborder="0"></iframe>
			
		</div>
		<div id="zjqy">
   			<shiro:hasPermission name="contentmsg:add">
   				<br>
    			&nbsp;&nbsp;<button type="button" class="btn btn-info" id="addnew">新增内容</button>
    		</shiro:hasPermission>
   			<shiro:hasPermission name="contentmsg:update">
    			&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="updatenew">修改内容</button>
    		</shiro:hasPermission>
   			<shiro:hasPermission name="contentmsg:delete">
    			&nbsp;&nbsp;<button type="button" class="btn btn-danger" id="delnew">删除内容</button>
    		</shiro:hasPermission>
    		<font id="contip" color="red"></font>
    		<hr color="white" >
			<table class="table table-bordered " id="editor_grid"></table>
		</div>
		
		
		</div>


		
</body>
</html>
<script type="text/javascript">

/** 设置ztree全局的配置信息 */
var settings = {
	async : { // 异步请求设置
		enable : true, // 开启
		type : "post", // 请求方式
		dataType : "json", // 指定服务器响应回来的数据类型
		url : "${path}/con/loadConmsgTree.do" // 指定请求的URL
	},
	data : { // ztree数据设置
		simpleData : { // 简单的数据格式
			enable : true, // 开启
			idKey : "id", // json格化中的id为key
			pIdKey : "pid" // json格化中的pId为key
		}
	},
	callback : {
		onClick : function(event, treeId, treeNode){ // 为树节点绑定点击事件
			if(treeNode.isParent==false){
				document.getElementById('zjqy').style.display = '';
				document.getElementById('addOrUpdate').style.display = 'none';
				//清空新增或保存的数据
				/* $("#fa_pid").val("");
				$("#fa_id").val("");
				$("#fa_url").val("")
				//$("#fa_desc").text("")
				$("#sort").val("")
				$("#sou").val("")
				$("#fa_name").val("")
				$("#pic_hidden").val("")
				$("#pic_target").prop("src",""); */
				
				$("#baseId").val(treeNode.id);
				$("#contip").html(treeNode.descs);
				$("#editor_grid").datagrid("reload", {"id" : treeNode.id});
				

			}
			
		}
	}
};
/** 定义树节点的数据 json数组格式 : [{},{}] */
var zNodes = [
     {id : 0, pid : -1, name: "内容分类", isParent : true}
 ];

$(function(){
	
	$.fn.zTree.init($("#res_tree"), settings, zNodes);

	document.getElementById('addOrUpdate').style.display = 'none';
	 /** 初始化数据表格 */
	$("#editor_grid").datagrid({
		border : false, // 不加边框
		fitColumns : true, //  自适应父容器
		fit : false, // 自适应父容器
		rownumbers : true, // 显示行号
		url : "${path}/con/selectConMsg.do", // 请求URL返回响应数据 (json格式) {"total" : 10, "rows" : [{"id":1,"name":"","remark" : ""},{}]}
		columns : [[ // 表头(定义列的相关信息)
		   {field: "id", checkbox : true}, // code列
		   {field: "eid", title : "内容编号", width : 70, formatter : function(value,rowData){
			   /**
			    * value : 当前r_code对应的值
			    * rowData : 这一行对应的json对象
			    */
			   return rowData.id;
		   }}, // id列
		   {field: "name", title : "内容名称", width : 100}, // name列
		   {field: "url", title : "链接", width : 100}, // name列
		   {field: "images", title : "内容图片", width : 150, formatter : function(value,rowData){
			  
			   if(rowData.images==""){
					return ""
				}
			   return  rowData.images==null?"":"<img src='" +  rowData.images + "  '"+" width='50' height='50'"+ "/>"      /* '<img src="${path}/targetFiles/Tulips.jpg"/>' */   
		   }}
		]],
		pagination : true, // 显示分页工具条
		pageList : [50], // 改变分页下拉列表中的数据
		pageSize : 50, // 设置初始化每页显示的记录条数
		pageNumber : 1 // 设置初始化当前页码(第一页)
		
	});
	document.getElementById('zjqy').style.display = 'none';
	
	//新增
	$("#addnew").click(function(){
		$("#ifcid").prop("src","${path}/con/addConMsg.do?id="+$("#baseId").val())
		//document.getElementById("ifcid").src="${path}/con/addConMsg.do?id="+$("#baseId").val();
		document.getElementById('zjqy').style.display = 'none';
		document.getElementById('addOrUpdate').style.display = '';
		
	});
	//修改
	$("#updatenew").click(function(){
		/** 获取用户选中的所有行 */
		var rows = $("#editor_grid").datagrid("getSelections");
		/** 判断用户是否选中了行 */
		 if (rows.length != 1){
			 sweetAlert({
		 			title: "",
		 			text: "请选择一条数据进行修改",
		 			type: "warning",
		 			confirmButtonColor: "#2b2e37",
		 			confirmButtonText: "确认",
		 			closeOnConfirm: false,
		 			timer:7000
		 		});
		}else{
			$("#ifcid").prop("src","${path}/con/updateConMsg.do?id="+$("#baseId").val()+"&bid="+rows[0].id)
			document.getElementById('zjqy').style.display = 'none';
			document.getElementById('addOrUpdate').style.display = '';
		}
	});
	//删除
	$("#delnew").click(function(){
		var rows = $("#editor_grid").datagrid("getSelections");
		if (rows.length < 1){
			 sweetAlert({
		 			title: "",
		 			text: "请选择至少一条数据进行删除",
		 			type: "warning",
		 			confirmButtonColor: "#2b2e37",
		 			confirmButtonText: "确认",
		 			closeOnConfirm: false,
		 			timer:7000
		 		});
		}else{
			var codes = new Array();
			/** 循环用户选择的所有的行 */
			$.each(rows, function(){
				// i : 索引号
				codes.push(this.id);
			});
			sweetAlert({
	 			title: "确定要删除吗？",
	 			text: "该操作为永久删除,一旦删除将不得恢复！！！",
	 			type: "warning",
	 			confirmButtonColor: "#2b2e37",
	 			confirmButtonText: "确认删除",
	 			closeOnConfirm: false,
	 			showCancelButton:true,
	 			cancelButtonText:"不删除了",
	 		},function(){
	 			
	 			$.ajax({
					url:"/con/deleteConMsg.do",
					data:{"id":codes.join(",")},
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
					 		
					 			
					 		});
							$("#editor_grid").datagrid("reload", {"id" : $("#baseId").val()});
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
		}
	});
	
});
function parentRefresh(id){
	$("#editor_grid").datagrid("reload", {"id" : id});
}

</script>