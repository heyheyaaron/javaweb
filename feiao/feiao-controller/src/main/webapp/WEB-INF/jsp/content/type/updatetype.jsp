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
<form id="userForm">
<input type="hidden" name="fa_id" value="${faConType.fa_id}"/>
<table class="table table-bordered ">
    <tr>
        <td >上级内容分类</td>
        <td><select class="input-md form-control" id="reid" name="fa_pid" style="width: 200px"></select></td>
    </tr>
    
    <tr>
        <td width="10%" >标签名字</td>
        <td><input type="text" name="fa_name" value="${faConType.fa_name}"/></td>
    </tr>
    <tr>
           <td >描述</td>
           <td>
              <textarea  cols="30" name="fa_desc" >${faConType.fa_desc}</textarea>
           </td>
    </tr>
    <tr>
        <td >排序</td>
        <td><input type="number" name="fa_sort" id="sort" value="${faConType.fa_sort}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/><font color="red">    *0~999，数值最小排序越高</font></td>
    </tr>
    
    
    
    <tr>
        <td ></td>
        <td>
        <shiro:hasPermission name="contenttype:update">
            <button  class="btn btn-primary" type="button" id="savebtn">保存</button> 
        </shiro:hasPermission> 
            &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="${path}/con/returnConType.do";
		 });
		$("#savebtn").click(function(){
			
			if(Number($("#sort").val())<0 || Number($("#sort").val())>999){
				sweetAlert({
		 			title: "",
		 			text: "排序范围为0~999！",
		 			type: "info",
		 			confirmButtonColor: "#2b2e37",
		 			confirmButtonText: "确认",
		 			closeOnConfirm: false,
		 			timer:7000
		 		});
			}else{
				$.ajax({
					url:"${path}/con/sureUpdateConType.do",
					type:"post",
					data:$("#userForm").serialize(),
					dataType:"json",
					async : true,
					success:function(data){
						if(data.tip=="success"){
								sweetAlert({
						 			title: "",
						 			text: "修改成功！",
						 			type: "success",
						 			confirmButtonColor: "#2b2e37",
						 			confirmButtonText: "确认",
						 			closeOnConfirm: false,
						 			timer:7000
						 		},function(){
						 			window.location.href="${path}/con/returnConType.do";
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
				})
			}
			
			
		});
		
		
		/** 异步加载版块信息 */
		$.ajax({
			url : "${path}/con/getAllConType.do",
			type : "post",
			dataType : "json",
			async : true,
			success : function(data){
				var options = [];
				
				options.push("<option value='0' >不设置上级版块</option>");
				$.each(data, function (index, value) {
					
					if("${faConType.fa_pid}"==value.fa_id){
						options.push("<option value='" + value.fa_id + "' selected='selected' > " + value.fa_name + " </option>");
					}else{
						options.push("<option value='" + value.fa_id + "'> " + value.fa_name + " </option>");
					}
					
			    });
			    $("#reid").append(options.join(''));
				
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