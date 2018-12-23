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
 
    <shiro:hasPermission name="lotteryPrize:add">
    <button type="button" class="btn btn-success" id="addnew" >新增奖品</button>
    </shiro:hasPermission>
    
</form>
<table class="table table-bordered " id="cmstable">
    
	     	
</table>

		
</body>
</html>

<script>
$(function(){
	//加载
	var url = "${path}/lottery/selectPrize.do"
	
	cmspageHonor(url);
	
	//新增奖品
	$("#addnew").click(function(){
		window.location.href="${path}/lottery/addPrize.do";
	});
});

function cmspageHonor(url){
	
	
	$.ajax({
		url : url, // 请求URL
		type : "post", // 请求方式
		dataType : "json", // 服务器响应回来的数据类型json: {}、[]、[{},{}]
		async : true,
		success : function(data){
			var vars = "<thead><tr><th>奖品id</th><th>奖品名称</th><th>奖品类型</th><th>奖品数量</th><th>图片</th><th>概率</th><th>操作</th></tr></thead>"
			
			var sum = 0.0;
			for(i in data.rows){
				sum = sum+data.rows[i].fa_percent;
			}
			for (var i=0;i<data.rows.length;i++){
				var types = "<font color='red'>物品</font>";
				if(data.rows[i].fa_type==0){
					types = "<font color='green'>飞镖</font>";
				}
				var percent = (data.rows[i].fa_percent/sum*100).toFixed(4); 
				
				var vart = '<tr><td>'+data.rows[i].fa_id+'</td><td>'+data.rows[i].fa_name+'</td><td>'+types+'</td><td>'+data.rows[i].fa_num+'</td><td><img  src="'+data.rows[i].fa_img+'" width="40px" height="40px" ></td><td>'+percent+'%</td><td><shiro:hasPermission name="lotteryprize:update"><a href="/lottery/updatePrize.do?id='+data.rows[i].fa_id+'">编辑</a></shiro:hasPermission>    <shiro:hasPermission name="lotteryprize:delete"><a href="javascript:void(0)" ><span id="'+data.rows[i].fa_id+'" class="deletes">删除</span></a></shiro:hasPermission>   </td></tr>';	
				vars = vars+vart;
			}
			$("#cmstable").html(vars);
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
						url:"/lottery/deletePrize.do",
						data:{"id":zid},
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
						 			
						 			window.location.href ="/lottery/returnPrize.do";
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