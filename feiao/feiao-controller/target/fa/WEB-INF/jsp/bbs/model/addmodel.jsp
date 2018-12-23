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
        <td >设置上级版块</td>
        <td><select class="input-md form-control" id="reid" name="fa_pid" style="width: 200px"></select></td>
    </tr>
    <tr>
        <td width="15%" >版块名字</td>
        <td><input type="text" name="fa_name"/></td>
    </tr>
    
    <tr>
           <td >描述</td>
           <td>
              <textarea  cols="30" name="fa_desc" ></textarea>
           </td>
    </tr>
    <tr>
        <td >排序</td>
        <td><input type="number" name="fa_sort" id="sort" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/><font color="red">    *0~999，数值越小排序越高</font></td>
    </tr>
    <tr>
        <td >发帖权限（会员等级）</td>
        <td id="ftr"></td>
    </tr>
    <tr>
        <td ><font color="white">发帖权限</font>（会员用户组）</td>
        <td id="ftg"></td>
    </tr>
    <tr>
        <td >回帖权限（会员等级）</td>
        <td id="htr"></td>
    </tr>
    <tr>
        <td ><font color="white">回帖权限</font>（会员用户组）</td>
        <td id="htg"></td>
    </tr>
    <tr>
        <td >点赞权限（会员等级）</td>
        <td id="dzr"></td>
    </tr>
    <tr>
        <td ><font color="white">点赞权限</font>（会员用户组）</td>
        <td id="dzg"></td>
    </tr>
    <tr>
        <td >投票权限（会员等级）</td>
        <td id="tpr"></td>
    </tr>
    <tr>
        <td ><font color="white">投票权限</font>（会员用户组）</td>
        <td id="tpg"></td>
    </tr>
    <tr>
        <td >浏览权限（会员等级）</td>
        <td id="llr"></td>
    </tr>
    <tr>
        <td ><font color="white">浏览权限</font>（会员用户组）</td>
        <td id="llg"></td>
    </tr>
    <tr>
        <td ></td>
        <td>
        <shiro:hasPermission name="bbsmodel:add">
            <button  class="btn btn-primary" type="button" id="savebtn">保存</button> 
        </shiro:hasPermission>
            &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="${path}/bbs/returnModel.do";
		 });
		$("#savebtn").click(function(){
			if($("#sort").val()!='' && Number($("#sort").val())>=0 && Number($("#sort").val())<=999){
				$.ajax({
					url:"${path}/bbs/sureAddModel.do",
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
						 		},function(){
						 			window.location.href="${path}/bbs/returnModel.do?curpage=${curpage}";
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
				 			text: "数据加载失败！",
				 			type: "error",
				 			confirmButtonColor: "#2b2e37",
				 			confirmButtonText: "确认",
				 			closeOnConfirm: false,
				 			timer:7000
				 		});
					}
				})
			}else{
				sweetAlert({
		 			title: "",
		 			text: "排序范围为0~999",
		 			type: "warning",
		 			confirmButtonColor: "#2b2e37",
		 			confirmButtonText: "确认",
		 			closeOnConfirm: false,
		 			timer:7000
		 		});
			}
				
			
			
			
		});
		
		
		/** 异步加载上级版块 */
		$.ajax({
			url : "${path}/bbs/selectAllModel.do",
			type : "post",
			dataType : "json",
			async : true,
			success : function(data){
				var options = [];
				
				options.push("<option value='0' selected='selected'>不设置上级版块</option>");
				$.each(data, function (index, value) {
					
						options.push("<option value='" + value.id + "'> " + value.name + " </option>");
					
					
			    });
			    $("#reid").append(options.join(''));
				
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
		/** 异步会员等级标签 */
		$.ajax({
			url : "${path}/member/selectAllRank.do",
			type : "post",
			dataType : "json",
			async : true,
			success : function(data){
				var vap = '<input type="checkbox" id="vap"> 全选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				var val = '<input type="checkbox" id="val"> 全选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				var vaz = '<input type="checkbox" id="vaz"> 全选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				var vae = '<input type="checkbox" id="vae"> 全选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				var vaa = '<input type="checkbox" id="vaa"> 全选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				for(i in data){
					vap=vap+'<input type="checkbox" name="fa_postr" value="'+data[i].fa_id+'"> '+data[i].fa_name+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
					val=val+'<input type="checkbox" name="fa_repliesr" value="'+data[i].fa_id+'"> '+data[i].fa_name+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
					vaz=vaz+'<input type="checkbox" name="fa_zanr" value="'+data[i].fa_id+'"> '+data[i].fa_name+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
					vae=vae+'<input type="checkbox" name="fa_voter" value="'+data[i].fa_id+'"> '+data[i].fa_name+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
					vaa=vaa+'<input type="checkbox" name="fa_readr" value="'+data[i].fa_id+'"> '+data[i].fa_name+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				}
				$("#ftr").html(vap);
				$("#htr").html(val);
				$("#dzr").html(vaz);
				$("#tpr").html(vae);
				$("#llr").html(vaa);
				$("#vap").click(function(){
					var bool = $(this).prop("checked")
					$(":checkbox[name=fa_postr]").prop("checked", bool);
				});
				$("#val").click(function(){
					var bool = $(this).prop("checked")
					$(":checkbox[name=fa_repliesr]").prop("checked", bool);
				});
				$("#vaz").click(function(){
					var bool = $(this).prop("checked")
					$(":checkbox[name=fa_zanr]").prop("checked", bool);
				});
				$("#vae").click(function(){
					var bool = $(this).prop("checked")
					$(":checkbox[name=fa_voter]").prop("checked", bool);
				});
				$("#vaa").click(function(){
					var bool = $(this).prop("checked")
					$(":checkbox[name=fa_readr]").prop("checked", bool);
				});
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
		/** 异步会员用户组标签 */
		$.ajax({
			url : "${path}/member/getAllMbGroup.do",
			type : "post",
			dataType : "json",
			async : true,
			success : function(data){
				var vap = '<input type="checkbox" id="vapi"> 全选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				var val = '<input type="checkbox" id="vali"> 全选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				var vaz = '<input type="checkbox" id="vazi"> 全选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				var vae = '<input type="checkbox" id="vaei"> 全选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				var vaa = '<input type="checkbox" id="vaai"> 全选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				for(i in data){
					vap=vap+'<input type="checkbox" name="fa_postg" value="'+data[i].id+'"> '+data[i].name+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
					val=val+'<input type="checkbox" name="fa_repliesg" value="'+data[i].id+'"> '+data[i].name+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
					vaz=vaz+'<input type="checkbox" name="fa_zang" value="'+data[i].id+'"> '+data[i].name+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
					vae=vae+'<input type="checkbox" name="fa_voteg" value="'+data[i].id+'"> '+data[i].name+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
					vaa=vaa+'<input type="checkbox" name="fa_readg" value="'+data[i].id+'"> '+data[i].name+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
				}
				$("#ftg").html(vap);
				$("#htg").html(val);
				$("#dzg").html(vaz);
				$("#tpg").html(vae);
				$("#llg").html(vaa);
				$("#vapi").click(function(){
					var bool = $(this).prop("checked")
					$(":checkbox[name=fa_postg]").prop("checked", bool);
				});
				$("#vali").click(function(){
					var bool = $(this).prop("checked")
					$(":checkbox[name=fa_repliesg]").prop("checked", bool);
				});
				$("#vazi").click(function(){
					var bool = $(this).prop("checked")
					$(":checkbox[name=fa_zang]").prop("checked", bool);
				});
				$("#vaei").click(function(){
					var bool = $(this).prop("checked")
					$(":checkbox[name=fa_voteg]").prop("checked", bool);
				});
				$("#vaai").click(function(){
					var bool = $(this).prop("checked")
					$(":checkbox[name=fa_readg]").prop("checked", bool);
				});
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
    });
 
        
</script>