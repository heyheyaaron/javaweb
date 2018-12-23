<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    

 

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
<form id="userForm">
<table class="table table-bordered ">
    <tr>
        <th width="10%" >项目</th>
        <th>积分奖励额</th>
        <th>飞镖奖励额</th>
        <th width="10%">计算周期</th>
        <th width="24%">每周期最高奖励次数</th>
    </tr>
    <tr>
        <td  >发表回复</td>
        <td><input type="number" name="respeakInte" value="${rp.respeakInte}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
        <td><input type="number" name="respeakFb" value="${rp.respeakFb}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
        <td >
        	<select name="respeakz">
        		<option value="0" <c:if test="${rp.respeakz==0}">selected="selected"</c:if>>不限</option>
        		<option value="1" <c:if test="${rp.respeakz==1}">selected="selected"</c:if>>一次</option>
        		<option value="2" <c:if test="${rp.respeakz==2}">selected="selected"</c:if>>一天</option>
        	</select>
        </td>
        <td ><input type="number" name="respeakt" value="${rp.respeakt}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/><font color="red"> *不限次数则填写0</font></td>
    </tr>
    <tr>
        <td>发表主题帖子</td>
        <td> <input type="number" name="themeInte" value="${rp.themeInte}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
        <td> <input type="number" name="themeFb" value="${rp.themeFb}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
         <td >
        	<select name="themez">
        		<option value="0" <c:if test="${rp.themez==0}">selected="selected"</c:if>>不限</option>
        		<option value="1" <c:if test="${rp.themez==1}">selected="selected"</c:if>>一次</option>
        		<option value="2" <c:if test="${rp.themez==2}">selected="selected"</c:if>>一天</option>
        	</select>
        </td>
        <td ><input type="number" name="themet" value="${rp.themet}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/><font color="red"> *不限次数则填写0</font></td>
    </tr>
    <tr>
        <td>帖子加精</td>
        <td> <input type="number" name="jingInte" value="${rp.jingInte}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
        <td> <input type="number" name="jingFb" value="${rp.jingFb}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
         <td >
        	<select name="jingz">
        		<option value="0" <c:if test="${rp.jingz==0}">selected="selected"</c:if>>不限</option>
        		<option value="1" <c:if test="${rp.jingz==1}">selected="selected"</c:if>>一次</option>
        		<option value="2" <c:if test="${rp.jingz==2}">selected="selected"</c:if>>一天</option>
        	</select>
        </td>
        <td ><input type="number" name="jingt" value="${rp.jingt}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/><font color="red"> *不限次数则填写0</font></td>
    </tr>
    <tr>
        <td>帖子被删</td>
        <td> <input type="number" name="deleteInte" value="${rp.deleteInte}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
        <td> <input type="number" name="deleteFb" value="${rp.deleteFb}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
         <td >
        	<select name="deletez">
        		<option value="0" <c:if test="${rp.deletez==0}">selected="selected"</c:if>>不限</option>
        		<option value="1" <c:if test="${rp.deletez==1}">selected="selected"</c:if>>一次</option>
        		<option value="2" <c:if test="${rp.deletez==2}">selected="selected"</c:if>>一天</option>
        	</select>
        </td>
        <td ><input type="number" name="deletet" value="${rp.deletet}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/><font color="red"> *不限次数则填写0</font></td>
    </tr>
    <tr>
        <td>登录</td>
        <td> <input type="number" name="loginInte" value="${rp.loginInte}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
        <td> <input type="number" name="loginFb" value="${rp.loginFb}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
         <td >
        	<select name="loginz">
        		<option value="0" <c:if test="${rp.loginz==0}">selected="selected"</c:if>>不限</option>
        		<option value="1" <c:if test="${rp.loginz==1}">selected="selected"</c:if>>一次</option>
        		<option value="2" <c:if test="${rp.loginz==2}">selected="selected"</c:if>>一天</option>
        	</select>
        </td>
        <td ><input type="number" name="logint" value="${rp.logint}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/><font color="red"> *不限次数则填写0</font></td>
    </tr>
    <tr>
        <td>签到</td>
        <td> <input type="number" name="signInte" value="${rp.signInte}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
        <td> <input type="number" name="signFb" value="${rp.signFb}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
         <td >
        	<select name="signz">
        		<option value="0" <c:if test="${rp.signz==0}">selected="selected"</c:if>>不限</option>
        		<option value="1" <c:if test="${rp.signz==1}">selected="selected"</c:if>>一次</option>
        		<option value="2" <c:if test="${rp.signz==2}">selected="selected"</c:if>>一天</option>
        	</select>
        </td>
        <td ><input type="number" name="signt" value="${rp.signt}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/><font color="red"> *不限次数则填写0</font></td>
    </tr>
    <tr>
        <td>参与投票</td>
        <td> <input type="number" name="voteInte" value="${rp.voteInte}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
        <td> <input type="number" name="voteFb" value="${rp.voteFb}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
         <td >
        	<select name="votez">
        		<option value="0" <c:if test="${rp.votez==0}">selected="selected"</c:if>>不限</option>
        		<option value="1" <c:if test="${rp.votez==1}">selected="selected"</c:if>>一次</option>
        		<option value="2" <c:if test="${rp.votez==2}">selected="selected"</c:if>>一天</option>
        	</select>
        </td>
        <td ><input type="number" name="votet" value="${rp.votet}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/><font color="red"> *不限次数则填写0</font></td>
    </tr>
    <tr>
        <td>设置头像</td>
        <td> <input type="number" name="titleInte" value="${rp.titleInte}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
        <td> <input type="number" name="titleFb" value="${rp.titleFb}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
         <td >
        	<select name="titlez">
        		<option value="0" <c:if test="${rp.titlez==0}">selected="selected"</c:if>>不限</option>
        		<option value="1" <c:if test="${rp.titlez==1}">selected="selected"</c:if>>一次</option>
        		<option value="2" <c:if test="${rp.titlez==2}">selected="selected"</c:if>>一天</option>
        	</select>
        </td>
        <td width="15%"><input type="number" name="titlet" value="${rp.titlet}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/><font color="red"> *不限次数则填写0</font></td>
    </tr>
    <tr>
        <td>邮箱认证</td>
        <td><input type="number" name="emailInte" value="${rp.emailInte}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
        <td><input type="number" name="emailFb" value="${rp.emailFb}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
         <td >
        	<select name="emailz">
        		<option value="0" <c:if test="${rp.emailz==0}">selected="selected"</c:if>>不限</option>
        		<option value="1" <c:if test="${rp.emailz==1}">selected="selected"</c:if>>一次</option>
        		<option value="2" <c:if test="${rp.emailz==2}">selected="selected"</c:if>>一天</option>
        	</select>
        </td>
        <td ><input type="number" name="emailt" value="${rp.emailt}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/><font color="red"> *不限次数则填写0</font></td>
    </tr>
    <tr>
        <td>产品注册</td>
        <td><input type="number" name="proInte" value="${rp.proInte}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
        <td><input type="number" name="proFb" value="${rp.proFb}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/></td>
         <td >
        	<select name="proz">
        		<option value="0" <c:if test="${rp.proz==0}">selected="selected"</c:if>>不限</option>
        		<option value="1" <c:if test="${rp.proz==1}">selected="selected"</c:if>>一次</option>
        		<option value="2" <c:if test="${rp.proz==2}">selected="selected"</c:if>>一天</option>
        	</select>
        </td>
        <td ><input type="number" name="prot" value="${rp.prot}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/><font color="red"> *不限次数则填写0</font></td>
    </tr>
    
    
    
    
  
    
    
    <tr>
        <td ></td>
        <td colspan="4">
        <shiro:hasPermission name="baserp:update">
            <button  class="btn btn-primary" type="button" id="savebtn">保存</button> 
        </shiro:hasPermission>
            
        </td>
    </tr>
</table>
</form>
</body>
</html>
<script>
    $(function () {       
		
		$("#savebtn").click(function(){
			
				$.ajax({
					url:"${path}/base/updateRps.do",
					type:"post",
					data:$("#userForm").serialize(),
					dataType:"json",
					async : true,
					success:function(data){
						if(data.tip=="success"){
								sweetAlert({
						 			title: "",
						 			text: "保存成功！",
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
					error:function(){
						sweetAlert({
				 			title: "",
				 			text: "数据加载失败！输入的数值不能太大",
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
    
</script>