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
    
    <tr >
        <td width="10%">商品名称</td>
        <td>${fsm.fa_goodname}</td>
    </tr>
    <tr >
        <td >兑换单价（飞镖）</td>
        <td>${fsm.fa_cost}</td>
    </tr>
    <tr >
        <td >兑换数量</td>
        <td>${fsm.fa_num}</td>
    </tr>
    <tr >
        <td >合计（飞镖）</td>
        <td>${fsm.fa_num*fsm.fa_cost}</td>
    </tr>
    <tr>
        <td >兑换时间</td>
        <td><fmt:formatDate value="${fsm.fa_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    </tr>
    <tr>
        <td >收货地址</td>
        <td>${fsm.fa_adress}</td>
    </tr>
    <tr>
        <td >状态</td>
        <td>
        	<c:if test="${fsm.fa_type==1}">待发货</c:if>
        	<c:if test="${fsm.fa_type==2}">已发货</c:if>
        	<c:if test="${fsm.fa_type==3}">已收货</c:if>
        	<c:if test="${fsm.fa_type==4}">待退款</c:if>
        	<c:if test="${fsm.fa_type==5}">已退款</c:if>
        </td>
    </tr>
    
    
    
    
    
    <tr>
        <td ></td>
        <td>
        <shiro:hasPermission name="shopdata:view">
        	<c:if test="${fsm.fa_type==1}">
        		<button  class="btn btn-primary" type="button" id="savebtn">发货</button> 
        	</c:if>
        	<c:if test="${fsm.fa_type==4}">
        		<button  class="btn btn-primary" type="button" id="savebtn">退款</button> 
        	</c:if>
            
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
				window.location.href="${path}/shop/returnMsg.do?curpage=${curpage}&startday=${startday}&endday=${endday}&prizeType=${prizeType}";
		 });
		$("#savebtn").click(function(){
			
				$.ajax({
					url:"${path}/shop/changeShopData.do",
					type:"post",
					data:{"id":"${fsm.fa_id}","type":"${fsm.fa_type}"},
					dataType:"json",
					async : true,
					success:function(data){
						if(data.tip=="success"){
								sweetAlert({
						 			title: "",
						 			text: "操作成功！",
						 			type: "success",
						 			confirmButtonColor: "#2b2e37",
						 			confirmButtonText: "确认",
						 			closeOnConfirm: false,
						 			timer:7000
						 		},function(){
									window.location.href="${path}/shop/returnMsg.do?curpage=${curpage}&startday=${startday}&endday=${endday}&prizeType=${prizeType}";
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
			
			
			
		});
		
		

    });
   
</script>