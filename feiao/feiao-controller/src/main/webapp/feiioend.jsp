<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	
</head>
<body>
	<div class="tborder_foot"></div>
					<div id="Footer" class="cl">
					<div id="footer1">
						<c:if test="${listNor!=null}">
							<c:forEach items="${listNor}" var="nor" >
								<a class="bottoma" href="${nor['url']}">${nor['name']}</a>
								<img class="footline" src="/resources/php/bbs/static/common/images/default/space.gif">
							</c:forEach>
						</c:if>
						
						
						&nbsp;&nbsp;
						<c:if test="${listCom!=null}">
							<c:forEach items="${listCom}" var="com" >
								<a href="javascript:void(0)" class="bottoma">${com['name']}</a>
						&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>
						</c:if>
						
						
						
					
					</div>
				
	</div>
</body>
</html>