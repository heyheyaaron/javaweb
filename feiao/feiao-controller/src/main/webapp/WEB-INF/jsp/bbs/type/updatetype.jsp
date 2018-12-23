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
	<input type="hidden" name="fa_id" value="${fst.fa_id}" />
    <table class="table table-bordered ">
        <tr>
            <td width="10%" >版块分类名称</td>
            <td><input type="text" name="fa_name" value="${fst.fa_name}"/></td>
        
        
        
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
	
    $(function () {
    	
    	$('#backid').click(function(){
			window.location.href="${path}/bbs/returnModelType.do?id=${fst.fa_pid}";
	 	});
    	
		
		 //保存
		 $("#savebtn").click(function(){
			 
			 $.ajax({
				url:"${path}/bbs/sureUpdateMlType.do",
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
				 			window.location.href="${path}/bbs/returnModelType.do?curpage=${curpage}&id=${fst.fa_pid}";
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