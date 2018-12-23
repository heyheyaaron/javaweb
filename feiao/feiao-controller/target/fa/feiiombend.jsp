<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	
</head>
<body>
	<div id="Footer" class="cl">
                        <div id="footer1">
                               <c:if test="${listNor!=null}">
									<c:forEach items="${listNor}" var="nor" >
										<a class="bottoma" href="${nor['url']}">${nor['name']}</a>
										<img class="footline" src="/resources/php/bbs/static/common/images/default/space.gif">
									</c:forEach>
								</c:if>
                                
                                <span class="globalName"><a id="globalName" class="bottoma language" href="javascript:void(0);">
            <img src="/resources/php/bbs/static/common/images/default/earth/earth.jpg">简体中文&nbsp;&nbsp;</a>
            <div style="right: 31px; height: 328px; display: none;top:-330px;" id="globalContainer">
                <p style="height: 40px; line-height: 40px; font-size: 16px;font-weight:bold; text-align: left; padding-left: 15px;border-bottom: 1px solid #ddd;background: #f3f3f3;">国家或者地区</p>
            
                <a href="" class="ClobalItem">繁體中文</a>
                <a href="" class="ClobalItem">台灣繁體</a>
                <a href="" class="ClobalItem">English</a>
                <a href="" class="ClobalItem">Indonesia</a>
                <a href="" class="ClobalItem">Русский</a>
                <a href="" class="ClobalItem">עברית</a>
                <a href="" class="ClobalItem" style="border-width:0px;">India</a>
            </div>
            </span>
                         
                        </div>
                <div id="footer2" class="copyright" style="line-height: 2;">
                			<c:if test="${listMbEnd!=null}">
									<c:forEach items="${listMbEnd}" var="nor" >
										<span>${nor['name']}</span>
                                		<br>
									</c:forEach>
								</c:if>
                               
                        </div>
                </div>
</body>
</html>