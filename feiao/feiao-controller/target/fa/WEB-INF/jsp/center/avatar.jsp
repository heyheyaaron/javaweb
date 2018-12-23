<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        
        <link rel="stylesheet" type="text/css" href="/data/cache/style_1_common.css" />
        <link rel="stylesheet" type="text/css" href="/data/cache/style_1_home_spacecp.css"/>
        <script src="/js/jquery.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="/css/header.css"/>
</head>
<body>
        
          <c:import url="${path}/feiiohead.jsp"></c:import>
        <div id="wp" class="wp">
		<c:import url="${path}/feiiombright.jsp"></c:import>
<ul class="main_wp settinglist" >	
<li class="items_setlist " style="border:none;" >
<a class="stitle" href="/fiioer/mySelfMsg.do"><span>个人资料</span><span class="collapsed" ></span></a><span class="itemicon_setlist"> </span>
            </li>
            
<li class="items_setlist a"  >
            	<a class="stitle" href="/fiioer/myTitleImage.do"><span>头像与安全</span><span class="collapsed" ></span></a><span class="itemicon_setlist"> </span>
            </li>
            <li>
                             
                <form >
                    <div class="avatar_content">
                        <div class="current_l">
                            <div class="marking" >
                        
                            
                           <c:if test="${fu.fa_title_img!=null && fu.fa_title_img!=''}">当前头像</c:if> 
                           <c:if test="${fu.fa_title_img==null || fu.fa_title_img==''}">未设置头像</c:if>
                            </div>
                            <div class="avatar">
                            	<c:if test="${fu.fa_title_img!=null && fu.fa_title_img!=''}">
                            		<img src="${fu.fa_title_img}"  ><span class="shadowbox_avatar"> </span>
                            	</c:if>
                            	<c:if test="${fu.fa_title_img==null || fu.fa_title_img==''}">
                            		<img src="/img/download/uc/13/91/68/02/90/139168029/w200h200.jpg"  ><span class="shadowbox_avatar"> </span>
                            	</c:if>
                                
                            </div>
                        </div>
                        <div class="new_r">
                        	<div class="marking" >设置新头像已搬家</div>
                                <div>
                                    <a href="/fiioer/myTitleImage.do"><font size="+1" color="#0DAAEA">点击这里</font></a><font size="+1">&nbsp;前往修改</p>
               </div>
                        </div>
                        <div class="cr" ></div>
                    </div>
                    <input type="hidden">
                </form>

            </li>
            
<li class="items_setlist " >
            	<a class="stitle" href="/fiioer/myInte.do"><span>积分</span><span class="collapsed" ></span></a><span class="itemicon_setlist"> </span>
            </li>
<li class="items_setlist " >
            	<a class="stitle" href="/fiioer/myGroup.do"><span>用户组与标签</span><span class="collapsed" ></span></a><span class="itemicon_setlist"> </span>
            </li>
<li class="items_setlist " >
            	<a class="stitle" href="/fiioer/myPrivacy.do"><span>隐私筛选</span><span class="collapsed" ></span></a><span class="itemicon_setlist"> </span>
            </li>
</ul>
</div>
</div>
</div>
<c:import url="${path}/feiiombend.jsp"></c:import>
        </body>
             <script type="text/javascript" src="/js/commom.js"></script>
   <script type="text/javascript">
              
                    login();
                       loginbox();
                </script>
</html>