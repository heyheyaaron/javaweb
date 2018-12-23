<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <meta content="width=1080" name="viewport" />
        <title>飞傲</title>
        <link href="../resources/uc/wlogin/base/css/base.css" rel="stylesheet" />
        <link href="../resources/uc/wlogin/base/css/cycode.css" rel="stylesheet" />
        <link href="../resources/uc/wlogin/member/css/vCodeLogin.css" rel="stylesheet" />
</head>

<body>
        <div id='content' class="content">
                <div class=ucSimpleHeader id="header">
                        <a href="../index.html" class='fiioLogo'><i class='i_icon'></i></a>
                </div>
                <img src="resources/uc/wlogin/member/images/fiiobl.png" class="logo hide" id="logo" />
                <div class="banner-box">
                        <div class="banner"></div>
                        <form id="mainForm" class="main-form">
                                <div class="tab-title">
                                        <a class="linkAGray " id="toAccountLogin" href="../login/index.html">账号登录</a>
                                        <span class="register-line"></span>
                                        <a class="linkABlue" id="toVCodeLogin" href="../login/Vcodelogin.html">验证码登录</a>
                                </div>
                                <div class="tip-box visiblility-hidden">
                                        <i class="err-ico"></i>
                                        <span class="tip-font"></span>
                                        <span class="close-ico"></span>
                                </div>
                                <div class='normalInput cycode-box show-cycode' id="cycode-box">
                                        <div class="cycode-selectbox phoneText" sytle="height: 36px;">
                                                <span class="cycode-selected cycode-height cycodePhone">
                            <input readonly="" class="ipt-cycode phone_num" id="cycode" value="+86">
                            <i class="arrow-down"></i>
                        </span>
                                        </div>
                                        <div id="cycode-container" class="cycode-container"></div>

                                </div>
                                <div class="normalInput box-input">
                                        <input type="text" class="pswInput inp-focus" id="kapkey" maxlength="6" placeholder='验证码'>
                                        <span class="form-line"></span>
                                        <a id="getKey" href="javascript:void(0);" class="linkABlue">获取验证码</a>
                                </div>
                                <div class='normalInput fieldInput' style='display:none;'>
                                        <input id="tips-show" />
                                </div>
                                <div style="padding-bottom: 17px;">
                                        <a class="hide a_acount_login" id="a_login" href="../login/index.html">普通登录</a>
                                </div>
                                <a id="register" class="fullBtnBlue" href="../center/credit.html">登录</a>
                                <div class='transferField'>
                                        <a class="go2forgetpwd linkABlue rememberFieldForA" href="../forgetpwd/index.html">忘记密码?</a>
                                        <a class="go2register linkABlue" href="../register/index.html" class="linkAGray" id="toRegister">注册</a>
                                </div>
                                <a href="javascript:void(0)" id="qr-btn" class="qr-btn"></a>
                                <div id="qr-panel" class="qr-panel hide">
                                        <h3>扫描安全登录</h3>
                                        <div class="qr-img-box">
                                                <img alt="" />
                                        </div>
                                        <p class="tips">请使用最新fiiobl系统相机扫码功能，扫码登录</p>
                                        <p class="qr-success-tips hide">扫描成功，请在手机点击“确认登录”</p>
                                </div>
                        </form>
                </div>
                <input type="hidden" id="appuri" />
                <input type="hidden" id="useruri" />
                <input type="hidden" id="service" />
                <input type="hidden" id="sid" />
        </div>
                    <div id='fiioblFooter' class='footerWrap' style="background: #fff;">
                <div class='footerInner'>
                        <div class='footer-layer1'>
                                <div class='footer-innerLink'>
                                        <a href="">关于飞傲</a>
                                        <img class="foot-line" src="../resources/common/images/default/space.gif">
                                        <a href="">工作机会</a>
                                        <img class="foot-line" src="../resources/common/images/default/space.gif">
                                        <a href="">联系我们</a>
                                        <img class="foot-line" src="../resources/common/images/default/space.gif">
                                        <a href="">法律声明</a>
                                        <img class="foot-line" src="../resources/common/images/default/space.gif">
                                        <div href="javascript:void(0);" id="globalName" class="footer-language">
                                                简体中文&nbsp;&nbsp;&nbsp;
                                                <div id="globalContainer" class="footer-language_menu" style="height: 40px;">
                                                        <a href="javascript:void(0)" id="i18n-link" class="ClobalItem">English</a>
                                                </div>
                                        </div>
                                </div>
                                <div class='footer-service'>
                                        <span class='service-label'>全国服务热线</span>
                                        <span class='service-num'>4000 426 826 </span>
                                        <a id='service-online' class='service-online' href="javascript:void(0);">在线客服</a>
                                </div>
                                <div class='footer-outerLink'>
                                        <a class='footer-sinaMblog' href="http://weibo.com/meizumobile"><i class='i_icon'></i></a>
                                        <a id='footer-weChat' class='footer-weChat' href="javascript:void(0);"><i class='i_icon'></i></a>
                                        <a class='footer-qzone' href="http://user.qzone.qq.com/2762957059"><i class='i_icon'></i></a>
                                </div>
                        </div>
                        <div class='clear'></div>
                        <div id='fiioblCopyright' class="copyrightWrap">
                                <div class="copyrightInner">
                                        <span>FiiO Electronic Technology Co., Ltd. All rights reserved. </span>
                                        <a href="" class='linkAGray'>粤ICP备07072214号-2</a>
                                        <a href="" class='linkAGray'>粤公网安备 44049102496009 号</a>
                                        <a href="" class="linkAGray">营业执照</a>
                                </div>
                        </div>
                </div>
        </div>
        <div id="wechatPic"></div>
        <script type="text/javascript" src="../resources/common/js/jquery-1.7.1.min.js" charset="utf-8"></script>

        <script type="text/javascript" src="../resources/uc/wlogin/base/js/jquery.form.js" charset="utf-8"></script>
        <script type="text/javascript" src="../resources/uc/wlogin/base/js/jquery.validate.js" charset="utf-8"></script>
        <script type="text/javascript" src="../resources/uc/wlogin/base/js/utils.js" charset="utf-8"></script>
        <script type="text/javascript" src="../resources/uc/wlogin/base/js/fiiobl.elements.js" charset="utf-8"></script>
        <script type="text/javascript" src="../resources/uc/wlogin/base/js/base.js" charset="utf-8"></script>
        <script src="../resources/uc/wlogin/base/js/cycode.js"></script>
 
        <!--接入风控sh.min.js-->
        <script type="text/javascript" src="../resources/uc/wlogin/base/js/sh.min.js" charset="utf-8"></script>
          <script type="text/javascript" src="../resources/uc/wlogin/member/js/vCodeLogin.js" charset="utf-8"></script>
        
</body>

</html>
