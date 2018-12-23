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
<table class="table table-bordered ">
    <tr>
        <td width="10%" >会员昵称</td>
        <td><input type="text" name="fa_username" id="nbl"/>  <font id="ntip" color="red">*</font></td>
    </tr>
    <tr>
        <td >会员手机</td>
        <td><input type="tel" name="fa_telphone" id="tbl" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/>  <font id="ttip" color="red">*</font></td>
    </tr>
    <tr>
        <td >绑定邮箱</td>
        <td><input type="text" name="fa_email" id="ebl"/>  <font id="etip" color="red">*</font></td>
    </tr>
    <tr>
        <td >密码</td>
        <td><input type="password" name="fa_password" id="pbl"/>  <font id="ptip" color="red">*</font></td>
    </tr>
    <tr>
        <td >确认密码</td>
        <td><input type="password" id="sbl" />  <font id="stip" color="red">*</font></td>
    </tr>
    
    <tr>
        <td ></td>
        <td>
        <shiro:hasPermission name="mbmember:add">
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
				window.location.href="${path}/member/returnMember.do";
		 });
		//验证昵称
		$("#nbl").blur(function(){
			if($("#nbl").val()!=null){
				$("#ntip").attr("color","green")
				$("#ntip").text("√")
			}else{
				$("#ntip").attr("color","red")
				$("#ntip").text("昵称不能为空")
			}
			
		});
		//验证手机号
		$("#tbl").blur(function(){
			if($("#tbl").val()!=null && /^\w{11,11}$/.test($.trim($("#tbl").val()))){
				$.ajax({
					url:"${path}/member/validateTelIsTrue.do",
					type:"post",
					data:{"tel":$("#tbl").val()},
					dataType:"json",
					async:true,
					success:function(data){
						if(data.tip){
							$("#ttip").attr("color","green")
							$("#ttip").text("√")
						}else{
							$("#ttip").attr("color","red")
							$("#ttip").text("手机号码重复")
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
			}else{
				$("#ttip").attr("color","red")
				$("#ttip").text("手机号码长度应为11位")
			}
			
		});
		//验证邮箱
		$("#ebl").blur(function(){
			 var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
			if(myreg.test($("#ebl").val())){
				$.ajax({
					url:"${path}/member/validateEmailIsTrue.do",
					type:"post",
					data:{"email":$("#ebl").val()},
					dataType:"json",
					async:true,
					success:function(data){
						if(data.tip){
							$("#etip").attr("color","green")
							$("#etip").text("√")
						}else{
							$("#etip").attr("color","red")
							$("#etip").text("邮箱重复")
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
			}else{
				$("#etip").attr("color","red")
				$("#etip").text("邮箱格式不正确")
			}
			
		});
		//密码格式
		$("#pbl").blur(function(){
			if($("#sbl").val()!=null && $("#sbl").val()!=""){
				if($("#pbl").val()!=null &&/^\w{6,18}$/.test($.trim($("#pbl").val()))){
					$("#ptip").attr("color","green")
					$("#ptip").text("√")
					
					if($("#sbl").val()==$("#pbl").val()){
						$("#stip").attr("color","green")
						$("#stip").text("√")
					}else{
						$("#stip").attr("color","red")
						$("#stip").text("两次密码长度不一样")
					}
					
				}else{
					$("#ptip").attr("color","red")
					$("#ptip").text("密码长度为6到18位")
				}
				
			}else{
				if($("#pbl").val()!=null &&/^\w{6,18}$/.test($.trim($("#pbl").val()))){
					$("#ptip").attr("color","green")
					$("#ptip").text("√")
				}else{
					$("#ptip").attr("color","red")
					$("#ptip").text("密码长度为6到18位")
				}
			}
			
			
		});
		//确认密码
		$("#sbl").blur(function(){
			if($("#sbl").val()==$("#pbl").val()){
				$("#stip").attr("color","green")
				$("#stip").text("√")
			}else{
				$("#stip").attr("color","red")
				$("#stip").text("输入两次密码不一致")
			}
		});
		$("#savebtn").click(function(){
			if($("#ntip").text()=="√"){
				if($("#ttip").text()=="√"){
					if($("#etip").text()=="√"){
						if($("#ptip").text()=="√"){
							if($("#stip").text()=="√"){
								$.ajax({
									url:"${path}/member/sureAddMember.do",
									type:"post",
									data:$("#userForm").serialize(),
									dataType:"json",
									async : true,
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
										 			window.location.href="${path}/member/returnMember.do?curpage=${curpage}";
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
							}else{
								sweetAlert({
						 			title: "",
						 			text: "输入的两次密码不正确！",
						 			type: "info",
						 			confirmButtonColor: "#2b2e37",
						 			confirmButtonText: "确认",
						 			closeOnConfirm: false,
						 			timer:7000
						 		});
							}
						}else{
							sweetAlert({
					 			title: "",
					 			text: "密码格式输入有误！",
					 			type: "info",
					 			confirmButtonColor: "#2b2e37",
					 			confirmButtonText: "确认",
					 			closeOnConfirm: false,
					 			timer:7000
					 		});
						}
					}else{
						sweetAlert({
				 			title: "",
				 			text: "邮箱输入有误！",
				 			type: "info",
				 			confirmButtonColor: "#2b2e37",
				 			confirmButtonText: "确认",
				 			closeOnConfirm: false,
				 			timer:7000
				 		});
					}
				}else{
					sweetAlert({
			 			title: "",
			 			text: "手机号码输入有误！",
			 			type: "info",
			 			confirmButtonColor: "#2b2e37",
			 			confirmButtonText: "确认",
			 			closeOnConfirm: false,
			 			timer:7000
			 		});
				}
			}else{
				sweetAlert({
		 			title: "",
		 			text: "昵称不能为空！",
		 			type: "info",
		 			confirmButtonColor: "#2b2e37",
		 			confirmButtonText: "确认",
		 			closeOnConfirm: false,
		 			timer:7000
		 		});
			}
			
				
			
			
			
		});
		
		

    });
</script>