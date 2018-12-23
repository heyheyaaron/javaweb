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
<input type="hidden" name="fa_id" value="${faNote.fa_id}"/>
<table class="table table-bordered ">
    
    <tr>
        <td width="10%">帖子类型</td>
        <td width="90%">普通帖</td>
    </tr>
    <tr>
        <td >帖子所属版块及其分类</td>
        <td>
	        <select id="modelid" name="fa_resource" style="height: 30px"></select>&nbsp;&nbsp;&nbsp;
	        <select id="typeid" name="fa_type_re" style="height: 30px"></select>
        </td>
    </tr>
    
    <tr>
        <td >创建时间</td>
        <td><fmt:formatDate value="${faNote.fa_start_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    </tr>
    <tr>
        <td >标签</td>
        <td>${Label}</td>
    </tr>
    <tr>
        <td >发布者昵称</td>
        <td>${userName}</td>
    </tr>
    <tr>
        <td >排序</td>
        <td><input type="number" name="fa_order" id="sort" value="${faNote.fa_order}" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');"/><font color="red">    *0~999，数值最小排序越高</font></td>
    </tr>
    <tr>
    	<td>是否置顶</td>
    	<td>
    		<select name="fa_zhiding">
    			<option value="1" <c:if test="${faNote.fa_zhiding==1}">selected="selected"</c:if>>是</option>
    			<option value="0" <c:if test="${faNote.fa_zhiding==0}">selected="selected"</c:if>>否</option>
    		</select>
    	</td>
    </tr>
    <tr>
    	<td>是否为精品</td>
    	<td>
    		<select name="fa_jingpin">
    			<option value="1" <c:if test="${faNote.fa_jingpin==1}">selected="selected"</c:if>>是</option>
    			<option value="0" <c:if test="${faNote.fa_jingpin==0}">selected="selected"</c:if>>否</option>
    		</select>
    	</td>
    </tr>
    <tr>
    	<td>是否设为高亮</td>
    	<td>
    		<select name="fa_gaoliang">
    			<option value="1" <c:if test="${faNote.fa_gaoliang==1}">selected="selected"</c:if>>是</option>
    			<option value="0" <c:if test="${faNote.fa_gaoliang==0}">selected="selected"</c:if>>否</option>
    		</select>
    	</td>
    </tr>
    <tr>
    	<td>是否可上热搜</td>
    	<td>
    		<input type="radio" name="fa_nohot" value="0"  <c:if test="${faNote.fa_nohot==0}">checked="checked"</c:if> />  是&nbsp;&nbsp;<input type="radio" name="fa_nohot" value="1"  <c:if test="${faNote.fa_nohot==1}">checked="checked"</c:if> />  否&nbsp;&nbsp;
    	</td>
    </tr>
    <tr>
        <td >阅读量</td>
        <td>${faNote.fa_ping}</td>
    </tr>
    <tr>
        <td >帖子标题</td>
        <td>${faNote.fa_title}</td>
    </tr>
    <tr>
        <td >帖子内容</td>
        <td>${faNote.fa_desc}</td>
    </tr>
    
    
    
    <tr>
        <td ></td>
        <td>
        <shiro:hasPermission name="bbsmodel:update">
            <button  class="btn btn-primary" type="button" id="savebtn">保存</button> 
        </shiro:hasPermission> 
            &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
    <tr>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td>
					
					<table class="table table-bordered " id="cmstable">
					</table>
					<div class="inline pull-right page">

						<font id="total"></font> 条记录 <font id="curpage"></font>/<font
							id="totalpage"></font> 页 <a href='javascript:void(0)' id="firstp">首页</a>
						<a href='javascript:void(0)' id="lastp">上一页</a> <span
							class='current' id="curp"></span> <a href='javascript:void(0)'
							id="nextfp"></a> <a href='javascript:void(0)' id="nextsp"></a> <a
							href='javascript:void(0)' id="nexttp"></a> <a
							href='javascript:void(0)' id="nextp">下一页</a> <a
							href='javascript:void(0)' id="endp">最后一页</a> &nbsp;
					</div>
				</td>

			</tr>
</table>
</form>
</body>
</html>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="${path}/bbs/returnNote.do?curpage=${curpage}";
		 });
		/** 异步加载所有版块 */
		$.ajax({
			url : "${path}/bbs/selectAllModel.do",
			type : "post",
			dataType : "json",
			async : true,
			success : function(data){
				var options = [];
				
				
				$.each(data, function (index, value) {
						if("${faNote.fa_resource}"==value.id){
							options.push("<option value='" + value.id + "' selected='selected'  > " + value.name + " </option>");
						}else{
							options.push("<option value='" + value.id + "'> " + value.name + " </option>");
						}
						
			    });
			    $("#modelid").append(options.join(''));
				
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
		/** 异步加载该版块下的分类 */
		$.ajax({
			url : "${path}/bbs/selectAllReType.do",
			data:{"id":"${faNote.fa_resource}"},
			type : "post",
			dataType : "json",
			async : true,
			success : function(data){
				var options = [];
				if(data==null|| data==''){
					options.push("<option value='' selected='selected'>该版块下还没设置分类</option>");
				}else{
					if("${faNote.fa_type_re}"==null ||"${faNote.fa_type_re}"==''){
						options.push("<option value='' selected='selected'>不设置该版块下的分类</option>");
					}else{
						options.push("<option value='' >不设置该版块下的分类</option>");
					}
					$.each(data, function (index, value) {
							if("${faNote.fa_type_re}"==value.id){
								options.push("<option value='" + value.id + "'  selected='selected'  > " + value.name + " </option>");
							}else{
								options.push("<option value='" + value.id + "'> " + value.name + " </option>");
							}
							
				    });
				}
				
			    $("#typeid").append(options.join(''));
				
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
		//改变板坏而改变该分类
		$("#modelid").change(function(){
			$.ajax({
				url : "${path}/bbs/selectAllReType.do",
				data:{"id":$(this).val()},
				type : "post",
				dataType : "json",
				async : true,
				success : function(data){
					var options = [];
					if(data==null|| data==''){
						options.push("<option value='' selected='selected'>该版块下还没设置分类</option>");
					}else{
						
						options.push("<option value='' selected='selected'>不设置该版块下的分类</option>");
						
						$.each(data, function (index, value) {
								
								options.push("<option value='" + value.id + "'> " + value.name + " </option>");
								
								
					    });
					}
					$("#typeid").html("");
				    $("#typeid").append(options.join(''));
					
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
		})
		$("#savebtn").click(function(){
			
			if($("#sort").val()!='' && Number($("#sort").val())>=0 && Number($("#sort").val())<=999){
				$.ajax({
					url:"${path}/bbs/sureUpdateNote.do",
					type:"post",
					data:$("#userForm").serialize(),
					dataType:"json",
					async : true,
					success:function(data){
						if(data.tip=="success"){
								sweetAlert({
						 			title: "",
						 			text: "修改成功！",
						 			type: "success",
						 			confirmButtonColor: "#2b2e37",
						 			confirmButtonText: "确认",
						 			closeOnConfirm: false,
						 			timer:7000
						 		},function(){
						 			window.location.href="${path}/bbs/returnNote.do?curpage=${curpage}";
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
		
		
		var url = "${path}/bbs/findCommentById.do";
		cmspageInte({"id" : "${faNote.fa_id}","curpage" : "1"}, url)
		
		//点击首页
		$("#firstp").click(function() {
			cmspageInte({
				"id" : "${faNote.fa_id}",
				"curpage" : "1"
			}, url);
		})
		//点击上一页
		$("#lastp").click(function() {
			var cpage = Number($("#curpage").text()) - 1;
			cmspageInte({
				"id" : "${faNote.fa_id}",
				"curpage" : cpage
			}, url);
		})
		//点击当前页+1
		$("#nextfp").click(function() {
			var cpage = Number($("#curpage").text()) + 1;
			cmspageInte({
				"id" : "${faNote.fa_id}",
				"curpage" : cpage
			}, url);
		})
		//点击当前页+2
		$("#nextsp").click(function() {
			var cpage = Number($("#curpage").text()) + 2;
			cmspageInte({
				"id" : "${faNote.fa_id}",
				"curpage" : cpage
			}, url);
		})
		//点击当前页+3
		$("#nexttp").click(function() {
			var cpage = Number($("#curpage").text()) + 3;
			cmspageInte({
				"id" : "${faNote.fa_id}",
				"curpage" : cpage
			}, url);
		})
		//点击下一页
		$("#nextp").click(function() {
			var cpage = Number($("#curpage").text()) + 1;
			cmspageInte({
				"id" : "${faNote.fa_id}",
				"curpage" : cpage
			}, url);
		})
		//点击最后一页
		$("#endp").click(function() {
			var cpage = Number($("#totalpage").text());
			cmspageInte({
				"id" : "${faNote.fa_id}",
				"curpage" : cpage
			}, url);
		})
	
		
    });
    function cmspageInte(cmsdata, url) {

		$.ajax({
					url : url, // 请求URL
					data : cmsdata,
					type : "post", // 请求方式
					dataType : "json", // 服务器响应回来的数据类型json: {}、[]、[{},{}]
					async : true,
					success : function(data) {
						if (data.rows!=null) {
							var vars = "<thead><tr><th>用户</th><th>楼层</th><th>内容</th><th>评论时间</th><th>操作</th></tr></thead>"
							

							for (var i = 0; i < data.rows.length; i++) {
								
								var vart = '<tr><td>' + data.rows[i].name
										+ '</td><td>' + data.rows[i].ceng + '</td><td>'
										+ data.rows[i].descs + '</td><td>'
										+ data.rows[i].times + '</td><td><a href="javascript:void(0)" class="deletez" id="'+ data.rows[i].id +'scc" onclick="deletepl(this.id)"  >删除</a></td></tr>';
								vars = vars + vart;
							}
							$("#cmstable").html(vars);
							pageful(data);
						}else {
							sweetAlert({
								title : "",
								text : "服务器错误！",
								type : "error",
								confirmButtonColor : "#2b2e37",
								confirmButtonText : "确认",
								closeOnConfirm : false,
								timer : 7000
							});
						}

					},
					error : function() {
						sweetAlert({
							title : "",
							text : "数据加载失败！",
							type : "error",
							confirmButtonColor : "#2b2e37",
							confirmButtonText : "确认",
							closeOnConfirm : false,
							timer : 7000
						});
					}

				});

	}
    function deletepl(id){
		id = id.substring(0, id.length - 3)
		
		$.ajax({
			url:"/bbs/deletepl.do",
			data:{"id":id,"nid":"${faNote.fa_id}"},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.tip=="success"){
					$("#"+id+"scc").parent().parent().hide();
					$("#append_parent").show();
					$("#showMsg").text("删除成功");
					setTimeout(function() {
						$("#append_parent").hide();
					}, 2000)
				}else{
					$("#append_parent").show();
					$("#showMsg").text(data.tip);
					setTimeout(function() {
						$("#append_parent").hide();
					}, 2000)
				}
			},
			error:function(){
				$("#append_parent").show();
				$("#showMsg").text("系统发生错误");
				setTimeout(function() {
					$("#append_parent").hide();
				}, 2000)
			}
		}) 
		
	}
</script>