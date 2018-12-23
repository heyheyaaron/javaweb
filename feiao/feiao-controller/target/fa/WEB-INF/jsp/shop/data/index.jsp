<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <script type="text/javascript" src="${path}/jedate/jedate.min.js"></script>

 

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
   日期：
    <span class="datep"><input class="datainp" id="startday" name="startday" type="text" placeholder="开始日期" width="250px"  readonly></span>
	----- 
	 <span class="datep"><input class="datainp" id="endday" name="endday" type="text" placeholder="结束日期"  width="300px" readonly></span>
    &nbsp;&nbsp;  
    <select name="prizeType">
    	发货状态：<option value="0" <c:if test="${prizeType==0}">selected="selected"</c:if>>--不设置--</option>
    	<option value="1" <c:if test="${prizeType==1}">selected="selected"</c:if>>待发货</option>
    	<option value="2" <c:if test="${prizeType==2}">selected="selected"</c:if>>已发货</option>
    	<option value="3" <c:if test="${prizeType==3}">selected="selected"</c:if>>已收货</option>
    	<option value="4" <c:if test="${prizeType==4}">selected="selected"</c:if>>待退款</option>
    	<option value="5" <c:if test="${prizeType==5}">selected="selected"</c:if>>已退款</option>
    </select>&nbsp;&nbsp; 
    <button type="button" class="btn btn-primary" id="searchbtn">查询</button>&nbsp;&nbsp; 
    
    
</form>
<table class="table table-bordered " id="cmstable">
    
	     	
</table>
<div class="inline pull-right page">
		
         <font id="total" ></font> 条记录 <font id="curpage"></font>/<font id="totalpage"></font> 页  <a href='javascript:void(0)' id="firstp">首页</a>     <a href='javascript:void(0)' id="lastp">上一页</a>     <span class='current' id="curp"></span>     <a href='javascript:void(0)' id="nextfp"></a>     <a href='javascript:void(0)' id="nextsp"></a>     <a href='javascript:void(0)' id="nexttp"></a>     <a href='javascript:void(0)' id="nextp">下一页</a>     <a href='javascript:void(0)' id="endp">最后一页</a>    &nbsp;</div>
</body>
</html>

<script>
$(function(){
	//加载
	var url = "${path}/shop/selectMsg.do"
	$("#startday").val("${startday}");
	$("#endday").val("${endday}");
	cmspageMsg("curpage=${curpage}",url);
	//搜索
	$("#searchbtn").click(function(){
		cmspageMsg("curpage=1&"+$("#searchform").serialize(),url);
		
	})
	//点击首页
	$("#firstp").click(function(){
		cmspageMsg("curpage=1&"+$("#searchform").serialize(),url);
	})
	//点击上一页
	$("#lastp").click(function(){
		var cpage = Number($("#curpage").text())-1; 
		cmspageMsg("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击当前页+1
	$("#nextfp").click(function(){
		var cpage = Number($("#curpage").text())+1; 
		cmspageMsg("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击当前页+2
	$("#nextsp").click(function(){
		var cpage = Number($("#curpage").text())+2; 
		cmspageMsg("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击当前页+3
	$("#nexttp").click(function(){
		var cpage = Number($("#curpage").text())+3; 
		cmspageMsg("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击下一页
	$("#nextp").click(function(){
		var cpage = Number($("#curpage").text())+1; 
		cmspageMsg("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
	//点击最后一页
	$("#endp").click(function(){
		var cpage = Number($("#totalpage").text()); 
		cmspageMsg("curpage="+cpage+"&"+$("#searchform").serialize(),url);
	})
});

function cmspageMsg(cmsdata,url){
	
	
	$.ajax({
		url : url, // 请求URL
		data:cmsdata,
		type : "post", // 请求方式
		dataType : "json", // 服务器响应回来的数据类型json: {}、[]、[{},{}]
		async : true,
		success : function(data){
			
			if(data.tip==1){
				var vars = "<thead><tr><th>会员昵称</th><th>会员手机</th><th>商品名称</th><th>兑换时间</th><th>收货地址</th><th>状态</th><th>操作</th></tr></thead>"
					for (var i=0;i<data.rows.length;i++){
						var types = "";
						if(data.rows[i].types==1){
							types = "待发货";
						}else if(data.rows[i].types==2){
							types = "已发货";
						}else if(data.rows[i].types==3){
							types = "已收货";
						}else if(data.rows[i].types==4){
							types = "待退款";
						}else if(data.rows[i].types==5){
							types = "已退款";
						}
					
						
						var vart = '<tr><td>'+data.rows[i].username+'</td><td>'+data.rows[i].tel+'</td><td>'+data.rows[i].name+'</td><td>'+data.rows[i].times+'</td><td>'+data.rows[i].adress+'</td><td>'+types+'</td><td><shiro:hasPermission name="shopdata:view"><a href="javascript:void(0)" ><span id="'+data.rows[i].id+'" class="prizesss">查看详情</span></a>   </shiro:hasPermission></td></tr>';	
						vars = vars+vart;
						
							
						
					}
					$("#cmstable").html(vars);
					pageful(data);
					//把商品追加到JSP页面中
					$(".prizesss").click(function(){
						window.location.href="${path}/shop/viewShopGoodMsg.do?curpage="+Number($("#curpage").text())+"&id="+$(this).prop("id")+"&startday"+$("#startday").val()+"&endday"+$("#endday").val()+"&prizeType"+$("select[name='prizeType'] option:selected").val()
						
					});
					
			}else{
				sweetAlert({
		 			title: "",
		 			text: data.msg,
		 			type: "warning",
		 			confirmButtonColor: "#2b2e37",
		 			confirmButtonText: "确认",
		 			closeOnConfirm: false,
		 			timer:7000
		 		});
			}
			
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
jeDate({
	dateCell:"#startday",
	format:"YYYY年MM月DD日 hh:mm:ss",
	isinitVal:true,
	isTime:true, //isClear:false,
	minDate:"2014-09-19 00:00:00",
	okfun:function(val){alert(val)}
})
jeDate({
	dateCell:"#endday",
	format:"YYYY年MM月DD日 hh:mm:ss",
	isinitVal:true,
	isTime:false, //isClear:false,
	minDate:"2014-09-19 00:00:00",
	okfun:function(val){alert(val)}
})
</script>