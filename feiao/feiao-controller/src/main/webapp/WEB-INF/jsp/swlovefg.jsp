<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		
	</head>

	<body>
	<c:import url="${path}/feiioback.jsp"></c:import>
	<input type="button" id="excelbtn" value="cccccccccccccccccccccccc">
	</body>
	<script type="text/javascript" src="${path}/js/jquery/jquery_ocupload.js"></script>
	<script type="text/javascript">
		$(function(){
			/** 为导入的按钮绑定一键上传 (异步) */
			$("#excelbtn").upload({
				name : "upFile", // 上传的文件名 <input type='file' name='regionFile'/>
				action : "${path}/pro/excelToPro.do", // 请求URL
			 	params: {"id":"4"},//请求时额外传递的参数，默认为空
	            autoSubmit: true,//是否自动提交，即当选择了文件，自动关闭了选择窗口后，是否自动提交请求。
	            enctype: 'multipart/form-data',
	            onComplete: function() {
	            	alert("2");
	            }//提交表单完成后触发的事件
	            //当用户选择了一个文件后触发事件
	            
			});
		})
	</script>
	

</html>