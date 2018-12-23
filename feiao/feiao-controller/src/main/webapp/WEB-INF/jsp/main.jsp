<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

	<head>
		<title>后台管理系统</title>
	    <link rel="stylesheet" href="${path}/layout/css/sccl.css">
		<link rel="stylesheet" type="text/css" href="${path}/layout/skin/qingxin/skin.css" id="layout-skin"/>
		
		
		
		
		
	</head>
	
	<body >
	<c:import url="${path}/feiioback.jsp"></c:import>

		<div class="layout-admin">
			<header class="layout-header" >
				&nbsp;&nbsp;&nbsp;&nbsp;<img src="${path}/images/login1.jpg" width="30px" height="30px" style="border-radius:5px">
				<span class="header-logo">后台管理系统</span> 
				<a class="header-menu-btn" href="javascript:;"><i class="icon-font">&#xe600;</i></a>
				<ul class="header-bar">
					<li class="header-bar-role"><a href="javascript:;"><font size="3">${role.name}</font></a></li>
					<li class="header-bar-nav">
						<a href="javascript:;"><font size="3">${user.name}</font><i class="icon-font" style="margin-left:5px;">&#xe60c;</i></a>
						<ul class="header-dropdown-menu">
							<li><a href="javascript:;" id="grzl">个人资料</a></li>
							<li><a href="${path}/logout.do">切换账户</a></li>
							<li><a href="${path}/logout.do">退出</a></li><font ></font>
						</ul>
					</li>
					<li class="header-bar-nav"> 
						<a href="javascript:;" title="换肤"><i class="icon-font">&#xe608;</i></a>
						<ul class="header-dropdown-menu right dropdown-skin">
							<li><a href="javascript:;" data-val="qingxin" title="经典">经典</a></li>
							<li><a href="javascript:;" data-val="blue" title="优雅">优雅</a></li>
							
							
						</ul>
					</li>
				</ul>
			</header>
			
			<aside class="layout-side">
				
				<ul class="side-menu">
				  
				</ul>
			</aside>
			
			<div class="layout-side-arrow" style="background-color: #003A58"><div class="layout-side-arrow-icon" ><i class="icon-font" >&#xe60d;</i></div></div>
			
			<section class="layout-main">
				<div class="layout-main-tab" >
					<button class="tab-btn btn-left"><i class="icon-font">&#xe60e;</i></button>
	                <nav class="tab-nav">
	                    <div class="tab-nav-content">
	                        <a href="javascript:;" class="content-tab active" data-id="home.jsp" >首页</a>
	                    
	                    </div>
	                </nav>
	                <button class="tab-btn btn-right"><i class="icon-font">&#xe60f;</i></button>
				</div>
				<div class="layout-main-body">
					<iframe  class="body-iframe" name="iframe0" width="100%" height="99%" src="/home.jsp" frameborder="0" data-id="home.jsp" seamless></iframe>
								
				</div>
			</section>
			<div class="layout-footer">Copyright © 2015 爱橙科技 All rights reserved.    服务网站：www.aiorange.cn</div>
		</div>
		<!-- 弹出个人资料页面 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">个人资料</h4>
					</div>
				<div class="modal-body">
					<form id="grzlbtn">
					<input type="hidden" name="username" value="${user.username}"/>
						<div class="form-group">
							<label for="txt_departmentname">登录名</label>
							<input type="text" value="${user.username}" class="form-control" id="txt_departmentname" disabled="disabled">
						</div>
						<div class="form-group">
							<label for="txt_parentdepartment">姓名</label>
							<input type="text" name="name" class="form-control" id="txt_parentdepartment" value="${user.name}">
						</div>
						<div class="form-group">
							<label for="txt_departmentlevel">旧密码</label>
							<input type="password" name="oldpsw" class="form-control" id="txt_departmentlevel" placeholder="不修改密码则不用填写">
						</div>
						<div class="form-group">
							<label for="txt_departmentlevel">新密码</label>
							<input type="password" name="password" class="form-control" id="txt_departmentlevel" placeholder="不修改密码则不用填写">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
					</button>
					<button type="button" id="xggrxx" class="btn btn-primary" data-dismiss="modal">
						<span class="glyphicon glyphicon-floppy-disk"  ></span>修改
					</button>
				</div>
			</div>
		</div>
	</div> 
		
		
	</body>
	
	<script type="text/javascript">
	/*
	  初始化加载
	*/
	$(function(){
			
			
		$("#grzl").click(function(){
			$('#myModal').modal('show');
		})
		$("#xggrxx").click(function(){
			$.ajax({
				url:"${path}/system/updateMyMsg.do",
				type:"post",
				data:$("#grzlbtn").form2JSON(),
				dataType : "json",
				async:true,
				success : function(data){
					if(data.tip=="success"){
						sweetAlert({
				 			title: "",
				 			text: "修改成功！",
				 			type: "success",
				 			confirmButtonColor: "#2b2e37",
				 			confirmButtonText: "确认",
				 			closeOnConfirm: false,
				 			timer:7000
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
			})
		});
			
		
			
		
		
		getSkinByCookie();
		/*获取皮肤*/
		//getSkinByCookie();

		/*菜单json*/
		$.ajax({
			url:"${path}/system/menu.do",
			type:"post",
			dataType : "json",
			async:true,
			success : function(data){
				var menu = data
				initMenu(menu,$(".side-menu"));
				$(".side-menu > li").addClass("menu-item");
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
			
		})
		 
		
		
		/*获取菜单icon随机色*/
		//getMathColor();
	}); 
	
	/*左侧菜单点击*/
	$(".side-menu").on('click', 'li a', function(e) {
		
		var animationSpeed = 300;
		var $this = $(this);
		var checkElement = $this.next();
		
		
		if (checkElement.is('.menu-item-child') && checkElement.is(':visible')) {
		  checkElement.slideUp(animationSpeed, function() {
			checkElement.removeClass('menu-open');
		  });
		  checkElement.parent("li").removeClass("active");
		}
		
		//如果菜单是不可见的
		else if ((checkElement.is('.menu-item-child')) && (!checkElement.is(':visible'))) {
		  //获取上级菜单
		  var parent = $this.parents('ul').first();
		  //从父级开始找所有打开的菜单并关闭
		  var ul = parent.find('ul:visible').slideUp(animationSpeed);
		  //在父级中移出menu-open标记
		  ul.removeClass('menu-open');
		  //获取父级li
		  var parent_li = $this.parent("li");
		  //打开菜单时添加menu-open标记
		  checkElement.slideDown(animationSpeed, function() {
			//添加样式active到父级li
			checkElement.addClass('menu-open');
			parent.find('li.active').removeClass('active');
			parent_li.addClass('active');
		  });
		}
		//防止有链接跳转
		e.preventDefault();
		if($(this).attr("href")!="javascript:void(0)"){
			addIframe($this);
		}
		
	});
	
	</script>
	<script type="text/javascript" src="${path}/layout/js/sccl.js"></script>
	<script type="text/javascript" src="${path}/layout/js/sccl-util.js"></script>

</html>