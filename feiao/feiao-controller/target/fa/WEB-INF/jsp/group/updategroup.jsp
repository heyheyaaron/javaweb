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
	<input type="hidden" name="id" value="${group.id}"/>
    <table class="table table-bordered ">
        <tr>
            <td width="10%" >用户组名称</td>
            <td><input type="text" name="name" value="${group.name}"/></td>
        
        
        <tr>
            <td >权限</td>
            <td>
                <ul id="quanxians">
                	
                </ul>
            </td>
        </tr>
        <tr>
            <td ></td>
            <td>
                <button  class="btn btn-primary" type="button" id="savebtn">保存</button> &nbsp;&nbsp;<button type="button" class="btn btn-success"  id="backid">返回列表</button>
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
				 var qxsp="${groupForRe}";
				 
				 qxsp =qxsp.substring(1,qxsp.length-1);
				 
				 qxsp= qxsp.split(",");
				 var istrues = 0;
				 for(var sp in qxsp){
					 
					 if(qxsp[sp]==data[j].id){
						 istrues = 1;
						 break;
					 }
				 }
				 if(istrues){
					 
					 var vas="<ul><li><label class='checkbox inline'><input type='checkbox' name='groups' value='"+data[j].id+"' checked='checked' />"+data[j].name+"</label>";
					 vas = xunhuan(data[j].id,data,vas)+"</ul>";
					 vat = vat+vas;
				 }else{
					 var vas="<ul><li><label class='checkbox inline'><input type='checkbox' name='groups' value='"+data[j].id+"' />"+data[j].name+"</label>";
					 vas = xunhuan(data[j].id,data,vas)+"</ul>";
					 vat = vat+vas; 
				 }
				 
			 }
		 }
		return vat;
		
		 
	}
    $(function () {
    	
    	$('#backid').click(function(){
			window.location.href="${path}/system/returnGroup.do";
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
						 var qxsp="${groupForRe}";
						 
						 qxsp =qxsp.substring(1,qxsp.length-1);
						 
						 qxsp= qxsp.split(",");
						 var istrues = 0;
						 for(var sp in qxsp){
							 
							 if(qxsp[sp]==data[i].id){
								 istrues = 1;
								 break;
							 }
						 }
						 if(istrues){
							 var vat="<li><label class='checkbox inline'>"+data[i].name+"</label>";
							 
							 vat = xunhuan(data[i].id,data,vat)+"</li>";
							 
							 vars=vars+vat;
						 }else{
							 var vat="<li><label class='checkbox inline'>"+data[i].name+"</label>";
							 
							 vat = xunhuan(data[i].id,data,vat)+"</li>";
							 
							 vars=vars+vat; 
						 }
						 
						 
					 }
					 
				 }
				 
				 $("#quanxians").html(vars);
				 
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
		 //保存
		 $("#savebtn").click(function(){
			 
			 $.ajax({
				url:"${path}/system/sureUpdateGroup.do",
				data:$("#saveForm").serialize(),
				type:"post",
				dataType:"json",
				async:true,
				success:function(data){
					if(data.tip=="success"){
						sweetAlert({
				 			title: "",
				 			text: "保存成功！",
				 			type: "success",
				 			confirmButtonColor: "#2b2e37",
				 			confirmButtonText: "确认",
				 			closeOnConfirm: false,
				 			timer:7000
				 		},function(){
				 			window.location.href="${path}/system/returnGroup.do?curpage=${curpage}";
				 		});
				}else{
					sweetAlert({
			 			title: "",
			 			text: data.tip,
			 			type: "warning",
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
			 });
		 });
    });
</script>