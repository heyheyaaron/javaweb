<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="description" content="${keepname}" />
    <meta name="keywords" content="${keepdesc}" />
        <title>飞傲</title>
        <link href="/resources/uc/wlogin/base/css/base.css" type="text/css" rel="Stylesheet" />
        <link href="/css/common.css" type="text/css" rel="Stylesheet" />
        <link href="/css/repwdsuccess.css" type="text/css" rel="Stylesheet" />
        <link rel="stylesheet" type="text/css" href="/css/byPhone.css"/>
        <link href="/css/media.css" type="text/css" rel="Stylesheet" />
        <script src="/js/jquery.js"></script>
        <script src="/js/commom.js"></script>
        <style >
        	.flow i {
			    background: url(/img/step4.png) no-repeat;
			    _background-image: none;
			    _filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='/img/step4.png');
        	}
        	
        	.geetest_holder.geetest_mobile.geetest_ant.geetest_popup .geetest_popup_box {
			    
			    top: 40% !important;
			    left: 74% !important;
			    
			}
         #wechatPic {
         	position: absolute;
		    background: url(${weixin}) no-repeat;
		    align:"center";
		    width: 124px;
			height: 124px;
		    _filter: progid: DXImageTransform.Microsoft.AlphaImageLoader(src='${weixin}');
		    _background-image: none;
		    z-index: 1000;
		   background-size:100% 100%;
		    display: none;
		    top:685px !important;
		    left:1340px !important;
		}
        </style>
</head>

<body>
        <div id='content' class="content">
                <div class=ucSimpleHeader id="header">
                        <a href="http://www.meizu.com" class='fiioLogo'><i class='i_icon'></i></a>
                </div>
                <div class='title'>找回登录密码</div>
                <div class='flow'><i class='i_icon'></i></div>
                <div class='middle'>
                        <form id="mainForm">
                                <div class='lineWrap done'>
                                        新密码已生效
                                        <input type="hidden" id="backUrl" value="/login.do" />
                                </div>
                                <div class='lineWrap'>
                                        <div id='time' class="blue">3</div>
                                </div>
                                <div class='lineWrap'>
                                        <a id='returnLogin' class="fullBtnBlue" href="/login.do">返回登录</a>
                                </div>
                        </form>
                </div>
        </div>
              <div id='fiioblFooter' class='footerWrap' style="background: #fff;">
                <div class='footerInner'>
                        <div class='footer-layer1'>
                                <div class='footer-innerLink'>
                                        <c:if test="${listNor!=null}">
											<c:forEach items="${listNor}" var="nor" >
												<a href="${nor['url']}">${nor['name']}</a>
                                        		<img class="foot-line" src="/resources/common/images/default/space.gif">
											</c:forEach>
										</c:if>
                                        <div href="javascript:void(0);" id="globalName" class="footer-language">
                                                简体中文&nbsp;&nbsp;&nbsp;
                                                <div id="globalContainer" class="footer-language_menu" style="height: 40px;">
                                                        <a href="javascript:void(0)" id="i18n-link" class="ClobalItem">English</a>
                                                </div>
                                        </div>
                                </div>
                                <div class='footer-outerLink'>
                                        <a class='footer-sinaMblog' href="${weibo}"><i class='i_icon'></i></a>
                                        <a id='footer-weChat' class='footer-weChat' href="javascript:void(0);"><i class='i_icon'></i></a>
                                        <a class='footer-qzone' href="${QQ}"><i class='i_icon'></i></a>
                                </div>
                        </div>
                        <div class='clear'></div>
                        <div id='fiioblCopyright' class="copyrightWrap">
                                <div class="copyrightInner">
                                        <c:if test="${listCom!=null}">
											<c:forEach items="${listCom}" var="com" >
												<a href="javascript:void(0)" class='linkAGray'>${com['name']}</a>
											</c:forEach>
										</c:if>
                                </div>
                        </div>
                </div>
        </div>
        <div id="wechatPic"></div>
        <script charset="utf-8" type="text/javascript" src="/resources/common/js/jquery-1.7.1.min.js?v=20140423"></script>
        <script type="text/javascript" src="/resources/uc/web/base/js/jquery.form.js" charset="utf-8"></script>
        <script type="text/javascript" src="/resources/uc/web/base/js/jquery.validate.js" charset="utf-8"></script>
        <script type="text/javascript" src="/resources/uc/web/base/js/utils.js" charset="utf-8"></script>
        <script type="text/javascript" src="/resources/uc/web/base/js/fiiobl.elements.js" charset="utf-8"></script>
        <script type="text/javascript" src="/resources/uc/web/base/js/base.js" charset="utf-8"></script>
        <script type="text/javascript" src="/resources/uc/web/member/js/repwdsuccess.js" charset="utf-8"></script>
        <script>
        weChat();
        </script>
</body>

</html>
