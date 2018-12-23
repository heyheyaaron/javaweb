<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

	<head>
		<style type="text/css">
			.panel {
			  height : 225.5;
			  width:95%;
			  
			  margin-bottom: 20px;
			  border: 1px solid transparent;
			  border-radius: 4px;
			  -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
			          box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
			}
			.panel-body {
			  padding: 15px;
			}
		</style>
	</head>

	<body>
	<c:import url="${path}/feiioback.jsp"></c:import>
		<table style="width: 100%">
			<tr >
				<td style="width: 50%">
					<div class="panel panel-primary  panel-collapse collapse in" style="border-width: 1px;border-color: #337ab7"  id="c1">
					    <div class="panel-heading" >
					        <h3 class="panel-title">面板标题<a data-toggle="collapse" data-parent="#accordion"  href="#c1"><span style="float:right;">X</span></a></h3>
					    </div>
					    <div class="panel-body">
					        这是一个基本的面板
					    </div>
					</div>
				</td>
				<td style="width: 50%">
					<div class="panel panel-success panel-collapse collapse in" style="border-width: 1px;border-color: #d6e9c6" id="c2"> 
					    <div class="panel-heading">
					        <h3 class="panel-title">面板标题<a data-toggle="collapse" data-parent="#accordion"  href="#c2"><span style="float:right;">X</span></a></h3>
					    </div>
					    <div class="panel-body">
					        这是一个基本的面板
					    </div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="panel panel-info panel-collapse collapse in" style="border-width: 1px;border-color: #d9edf7" id="c3">
					    <div class="panel-heading">
					        <h3 class="panel-title">面板标题<a data-toggle="collapse" data-parent="#accordion"  href="#c3"><span style="float:right;">X</span></a></h3>
					    </div>
					    <div class="panel-body">
					        这是一个基本的面板
					    </div>
					</div>
				</td>
				<td>
					<div class="panel panel-warning panel-collapse collapse in" style="border-width: 1px;border-color: #faebcc" id="c4">
					    <div class="panel-heading">
					        <h3 class="panel-title">面板标题<a data-toggle="collapse" data-parent="#accordion"  href="#c4"><span style="float:right;">X</span></a></h3>
					    </div>
					    <div class="panel-body">
					        这是一个基本的面板
					    </div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="panel panel-danger panel-collapse collapse in" style="border-width: 1px;border-color: #ebccd1" id="c5">
					    <div class="panel-heading">
					        <h3 class="panel-title">面板标题<a data-toggle="collapse" data-parent="#accordion"  href="#c5"><span style="float:right;">X</span></a></h3>
					    </div>
					    <div class="panel-body">
					        这是一个基本的面板
					    </div>
					</div>
				</td>
				<td>
					<div class="panel panel-default panel-collapse collapse in" style="border-width: 1px;border-color: #ddd"  id="c6">
					    <div class="panel-heading">
					        <h3 class="panel-title">面板标题<a data-toggle="collapse" data-parent="#accordion"  href="#c6"><span style="float:right;">X</span></a></h3>
					    </div>
					    <div class="panel-body">
					        这是一个基本的面板
					    </div>
					</div>
				</td>
			</tr>
		</table>
		
		
		
	  
		
		
		
	
 		
	</body>
	
	</script>
	

</html>
