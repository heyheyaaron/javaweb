<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>

<script type="text/javascript" src="${path}/jedate/jedate.min.js"></script>

<style type="text/css">
body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) {
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
		<input type="hidden" name="fa_id" value="${faUser.fa_id}" />
		<div id="ibs"></div>
		<table class="table table-bordered ">


			<tr>
				<td width="10%">会员昵称</td>
				<td width="90%"><input type="text" name="fa_username"
					value="${faUser.fa_username}" id="nbl" /> <font id="ntip"
					color="red">*</font></td>
			</tr>
			<tr>
				<td>会员头像</td>
				<td><c:if
						test="${faUser.fa_title_img!=null||faUser.fa_title_img!=''}">
						<img src="${faUser.fa_title_img}">
					</c:if></td>
			</tr>
			<tr>
				<td>会员手机</td>
				<td><input type="tel" name="fa_telphone" id="tbl"
					value="${faUser.fa_telphone}"
					onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" /> <font
					id="ttip" color="red"></font></td>
			</tr>
			<tr>
				<td>绑定邮箱</td>
				<td><input type="text" name="fa_email" id="ebl"
					value="${faUser.fa_email}" /> <font id="etip" color="red"></font></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="password" name="fa_password" id="pbl" /> <font
					id="ptip" color="red"></font></td>
			</tr>
			<tr>
				<td>确认密码</td>
				<td><input type="password" id="sbl" /> <font id="stip"
					color="red"></font></td>
			</tr>
			<tr>
				<td>性别</td>
				<td><input type="radio" name="fa_sex" value="0"
					<c:if test="${faUser.fa_sex==0}">checked="checked"</c:if> /> 男 <input
					type="radio" name="fa_sex" value="1"
					<c:if test="${faUser.fa_sex==1}">checked="checked"</c:if> /> 女</td>
			</tr>
			<tr>
				<td>QQ</td>
				<td><input type="text" name="fa_qq" value="${faUser.fa_qq}"
					onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" /></td>
			</tr>
			<tr>
				<td>微博</td>
				<td><input type="text" name="fa_weibo" id="ebl"
					value="${faUser.fa_weibo}" /></td>
			</tr>
			<tr>
				<td>居住省份</td>
				<td><select name="fa_life">
						<option value="0"
							<c:if test="${faUser.fa_life==0}">selected="selected"</c:if>>北京市</option>
						<option value="1"
							<c:if test="${faUser.fa_life==1}">selected="selected"</c:if>>浙江省</option>
						<option value="2"
							<c:if test="${faUser.fa_life==2}">selected="selected"</c:if>>天津市</option>
						<option value="3"
							<c:if test="${faUser.fa_life==3}">selected="selected"</c:if>>安徽省</option>
						<option value="4"
							<c:if test="${faUser.fa_life==4}">selected="selected"</c:if>>上海市</option>
						<option value="5"
							<c:if test="${faUser.fa_life==5}">selected="selected"</c:if>>福建省</option>
						<option value="6"
							<c:if test="${faUser.fa_life==6}">selected="selected"</c:if>>重庆市</option>
						<option value="7"
							<c:if test="${faUser.fa_life==7}">selected="selected"</c:if>>江西省</option>
						<option value="8"
							<c:if test="${faUser.fa_life==8}">selected="selected"</c:if>>山东省</option>
						<option value="9"
							<c:if test="${faUser.fa_life==9}">selected="selected"</c:if>>河南省</option>
						<option value="10"
							<c:if test="${faUser.fa_life==10}">selected="selected"</c:if>>湖北省</option>
						<option value="11"
							<c:if test="${faUser.fa_life==11}">selected="selected"</c:if>>湖南省</option>
						<option value="12"
							<c:if test="${faUser.fa_life==12}">selected="selected"</c:if>>广东省</option>
						<option value="13"
							<c:if test="${faUser.fa_life==13}">selected="selected"</c:if>>海南省</option>
						<option value="14"
							<c:if test="${faUser.fa_life==14}">selected="selected"</c:if>>山西省</option>
						<option value="15"
							<c:if test="${faUser.fa_life==15}">selected="selected"</c:if>>青海省</option>
						<option value="16"
							<c:if test="${faUser.fa_life==16}">selected="selected"</c:if>>江苏省</option>
						<option value="17"
							<c:if test="${faUser.fa_life==17}">selected="selected"</c:if>>辽宁省</option>
						<option value="18"
							<c:if test="${faUser.fa_life==18}">selected="selected"</c:if>>吉林省</option>
						<option value="19"
							<c:if test="${faUser.fa_life==19}">selected="selected"</c:if>>台湾省</option>
						<option value="20"
							<c:if test="${faUser.fa_life==20}">selected="selected"</c:if>>河北省</option>
						<option value="21"
							<c:if test="${faUser.fa_life==21}">selected="selected"</c:if>>贵州省</option>
						<option value="22"
							<c:if test="${faUser.fa_life==22}">selected="selected"</c:if>>四川省</option>
						<option value="23"
							<c:if test="${faUser.fa_life==23}">selected="selected"</c:if>>云南省</option>
						<option value="24"
							<c:if test="${faUser.fa_life==24}">selected="selected"</c:if>>陕西省</option>
						<option value="25"
							<c:if test="${faUser.fa_life==25}">selected="selected"</c:if>>甘肃省</option>
						<option value="26"
							<c:if test="${faUser.fa_life==26}">selected="selected"</c:if>>黑龙江省</option>
						<option value="27"
							<c:if test="${faUser.fa_life==27}">selected="selected"</c:if>>香港特别行政区</option>
						<option value="28"
							<c:if test="${faUser.fa_life==28}">selected="selected"</c:if>>澳门特别行政区</option>
						<option value="29"
							<c:if test="${faUser.fa_life==29}">selected="selected"</c:if>>广西壮族自治区</option>
						<option value="30"
							<c:if test="${faUser.fa_life==30}">selected="selected"</c:if>>宁夏回族自治区</option>
						<option value="31"
							<c:if test="${faUser.fa_life==31}">selected="selected"</c:if>>新疆维吾尔自治区</option>
						<option value="32"
							<c:if test="${faUser.fa_life==32}">selected="selected"</c:if>>内蒙古自治区</option>
						<option value="33"
							<c:if test="${faUser.fa_life==33}">selected="selected"</c:if>>西藏自治区</option>
				</select></td>
			</tr>
			<tr>
				<td>学历</td>
				<td><select name="fa_edu">
						<option value="0"
							<c:if test="${faUser.fa_edu==0}">selected="selected"</c:if>>其他</option>
						<option value="1"
							<c:if test="${faUser.fa_edu==1}">selected="selected"</c:if>>小学</option>
						<option value="2"
							<c:if test="${faUser.fa_edu==2}">selected="selected"</c:if>>初中</option>
						<option value="3"
							<c:if test="${faUser.fa_edu==3}">selected="selected"</c:if>>高中</option>
						<option value="4"
							<c:if test="${faUser.fa_edu==4}">selected="selected"</c:if>>大专</option>
						<option value="5"
							<c:if test="${faUser.fa_edu==5}">selected="selected"</c:if>>本科</option>
						<option value="6"
							<c:if test="${faUser.fa_edu==6}">selected="selected"</c:if>>硕士</option>
						<option value="7"
							<c:if test="${faUser.fa_edu==7}">selected="selected"</c:if>>博士</option>

				</select></td>
			</tr>
			<tr>
				<td>毕业学校</td>
				<td><input type="text" name="fa_school"
					value="${faUser.fa_school}" /></td>
			</tr>
			<tr>
				<td>真实姓名</td>
				<td><input type="text" name="fa_name" value="${faUserfa_name}" /></td>
			</tr>

			<tr>
				<td>证件类型</td>
				<td><input type="radio" name="fa_idctype" value="sfz"
					<c:if test="${faUser.fa_idctype=='sfz'}">checked="checked"</c:if> />
					身份证 <input type="radio" name="fa_idctype" value="qt"
					<c:if test="${faUser.fa_idctype=='qt'}">checked="checked"</c:if> />
					其他</td>
			</tr>
			<tr>
				<td>证件号</td>
				<td><input type="text" name="fa_idc" value="${faUser.fa_idc}" /></td>
			</tr>
			<tr>
				<td>密保问题1</td>
				<td><input type="text" name="fa_mibao_qu_st"
					value="${faUser.fa_mibao_qu_st}" /></td>
			</tr>
			<tr>
				<td>密保答案1</td>
				<td><input type="text" name="fa_mibao_ar_st"
					value="${faUser.fa_mibao_ar_st}" /></td>
			</tr>
			<tr>
				<td>密保问题2</td>
				<td><input type="text" name="fa_mibao_qu_nd"
					value="${faUser.fa_mibao_qu_nd}" /></td>
			</tr>
			<tr>
				<td>密保答案2</td>
				<td><input type="text" name="fa_mibao_ar_nd"
					value="${faUser.fa_mibao_ar_nd}" /></td>
			</tr>
			<tr>
				<td>密保问题3</td>
				<td><input type="text" name="fa_mibao_qu_rd"
					value="${faUser.fa_mibao_qu_rd}" /></td>
			</tr>
			<tr>
				<td>密保答案3</td>
				<td><input type="text" name="fa_mibao_ar_rd"
					value="${faUser.fa_mibao_ar_rd}" /></td>
			</tr>
			<tr>
				<td>飞镖</td>
				<td><input type="text" name="fa_feibiao"
					value="${faUser.fa_feibiao}"
					onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" /></td>
			</tr>
			<tr>
				<td>积分</td>
				<td><input type="text" name="fa_jifen" id="jifen"
					value="${faUser.fa_jifen}"
					onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" /></td>
			</tr>
			<tr>
				<td>会员等级</td>
				<td><select id="rankid" name="fa_rank"></select></td>
			</tr>
			<tr>
				<td>设置版主</td>
				<td><select name="fa_ishost" id="typeMo">
						<option value="0"
							<c:if test="${faUser.fa_ishost==0}">selected="selected"</c:if>>会员</option>
						<option value="1"
							<c:if test="${faUser.fa_ishost==1}">selected="selected"</c:if>>模块版主</option>
						<option value="2"
							<c:if test="${faUser.fa_ishost==2}">selected="selected"</c:if>>超级版主</option>
				</select></td>
			</tr>
			<tr id="dfs">
				<td>设置需要管理的模块</td>
				<td><select id="reid" name="fa_sectionid"  style="height: 30px"></select></td>
			</tr>

			<tr>
				<td>绑定用户组</td>
				<td>
					<ul id="bingUserGroup"></ul>
				</td>
			</tr>
			<tr>
				<td>收听的数量</td>
				<td>${faUser.fa_speaker}</td>
			</tr>
			<tr>
				<td>听众的数量</td>
				<td>${faUser.fa_listener}</td>
			</tr>
			<tr>
				<td>获得的勋章</td>
				<td><c:if test="${honor!=null && honor!=''}">
						<c:forEach items="${honor}" var="hr">
							<img src="${hr['image']}" title="${hr['name']}" 
								>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        </c:forEach>
					</c:if> <c:if test="${honor==null}">
	    	暂无获得勋章
	    </c:if></td>
			</tr>
			<tr>
				<td>该会员的标签</td>
				<td><c:if test="${label!=null && label!=''}">
						<c:forEach items="${label}" var="hr">
	        	${hr['name']}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        </c:forEach>
					</c:if> <c:if test="${label==null}">
	    	暂无标签
	    </c:if></td>
			</tr>
			<tr>
				<td>状态</td>
				<td><input type="radio" name="fa_status" value="0"
					<c:if test="${faUser.fa_status==0}">checked="checked"</c:if> /> 正常
					<input type="radio" name="fa_status" value="1"
					<c:if test="${faUser.fa_status==1}">checked="checked"</c:if> /> 停用</td>
			</tr>
			<tr id="dfsz">
				<td>封停原因</td>
				<td><textarea cols="30" name="fa_delanswer"><c:if
							test="${faUser.fa_status==1}">${faUser.fa_delanswer}</c:if></textarea></td>
			</tr>
			<tr>
				<td></td>
				<td><shiro:hasPermission name="mbmember:update">
						<button class="btn btn-primary" type="button" id="savebtn">保存</button>
					</shiro:hasPermission> &nbsp;&nbsp;
					<button type="button" class="btn btn-success" name="backid"
						id="backid">返回列表</button></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<form id="searchform">

						日期： <span class="datep"><input class="datainp"
							id="startday" name="startday" type="text" placeholder="开始日期"
							width="250px" readonly></span> ----- <span class="datep"><input
							class="datainp" id="endday" name="endday" type="text"
							placeholder="结束日期" width="300px" readonly></span> &nbsp;&nbsp;

						<button type="button" class="btn btn-warning" id="searchbtn">查询</button>
						&nbsp;&nbsp;

					</form> <br>
				<font color="white">f</font>
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
	$(function() {

		if ($("#tbl").val() != null && $("#tbl").val() != "") {
			$("#ttip").attr("color", "green")
			$("#ttip").text("√")
		}
		if ($("#ebl").val() != null && $("#ebl").val() != "") {
			$("#etip").attr("color", "green")
			$("#etip").text("√")
		}
		if ($("#nbl").val() != null && $("#nbl").val() != "") {
			$("#ntip").attr("color", "green")
			$("#ntip").text("√")
		}

		//绑定用户组
		$
				.ajax({
					url : "/member/getAllMbGroup.do",
					type : "post",
					dataType : "json",
					async : true,
					success : function(data) {
						var vars = "";
						for (i in data) {
							var qxsp = "${groupIds}";
							qxsp = qxsp.substring(1, qxsp.length - 1);
							var istrues = 0;
							if (qxsp != null && qxsp != "") {
								qxsp = qxsp.split(",");
								for ( var sp in qxsp) {
									if (qxsp[sp] == data[i].id) {
										istrues = 1;
										break;
									}
								}
							}
							if (istrues) {
								var vat = "<li><label ><input type='checkbox' name='groups' value='"+data[i].id+"' checked='checked'   />    "
										+ data[i].name + "</label>" + "</li>";

							} else {
								var vat = "<li><label ><input type='checkbox'  name='groups' value='"+data[i].id+"' />    "
										+ data[i].name + "</label>" + "</li>";

							}
							vars = vars + vat;
						}
						$("#bingUserGroup").html(vars);
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
		//验证昵称
		$("#nbl").blur(function() {
			if ($("#nbl").val() != null) {
				$("#ntip").attr("color", "green")
				$("#ntip").text("√")
			} else {
				$("#ntip").attr("color", "red")
				$("#ntip").text("昵称不能为空")
			}

		});

		//验证手机号
		$("#tbl").blur(
				function() {
					if ($("#tbl").val() != null
							&& /^\w{11,11}$/.test($.trim($("#tbl").val()))) {
						$.ajax({
							url : "${path}/member/validateTelIsTrueMe.do",
							type : "post",
							data : {
								"tel" : $("#tbl").val(),
								"id" : "${faUser.fa_id}"
							},
							dataType : "json",
							async : true,
							success : function(data) {
								if (data.tip) {
									$("#ttip").attr("color", "green")
									$("#ttip").text("√")
								} else {
									$("#ttip").attr("color", "red")
									$("#ttip").text("手机号码重复")
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
					} else {
						$("#ttip").attr("color", "red")
						$("#ttip").text("手机号码长度应为11位")
					}

				});
		//验证邮箱
		$("#ebl")
				.blur(
						function() {
							var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
							if (myreg.test($("#ebl").val())) {
								$
										.ajax({
											url : "${path}/member/validateEmailIsTrueMe.do",
											type : "post",
											data : {
												"email" : $("#ebl").val(),
												"id" : "${faUser.fa_id}"
											},
											dataType : "json",
											async : true,
											success : function(data) {
												if (data.tip) {
													$("#etip").attr("color",
															"green")
													$("#etip").text("√")
												} else {
													$("#etip").attr("color",
															"red")
													$("#etip").text("邮箱重复")
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
							} else {
								$("#etip").attr("color", "red")
								$("#etip").text("邮箱格式不正确")
							}

						});
		$('#backid')
				.click(
						function() {
							window.location.href = "${path}/member/returnMember.do?curpage=${curpage}";
						});
		$("#savebtn")
				.click(
						function() {
							if ($("#sbl").val() == $("#pbl").val()) {
								if ($("#ntip").text() == "√") {
									if (true) {
										if ($("#etip").text() == "√") {
											$
													.ajax({
														url : "${path}/member/sureUpdateMember.do",
														type : "post",
														data : $("#userForm")
																.serialize(),
														dataType : "json",
														async : true,
														success : function(data) {
															if (data.tip == "success") {
																sweetAlert(
																		{
																			title : "",
																			text : "保存成功！",
																			type : "success",
																			confirmButtonColor : "#2b2e37",
																			confirmButtonText : "确认",
																			closeOnConfirm : false,
																			timer : 7000
																		},
																		function() {
																			window.location.href = "${path}/member/returnMember.do?curpage=${curpage}";
																		});
															} else {
																sweetAlert({
																	title : "",
																	text : data.tip,
																	type : "warning",
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
													})
										} else {
											sweetAlert({
												title : "",
												text : "邮箱输入有误！",
												type : "info",
												confirmButtonColor : "#2b2e37",
												confirmButtonText : "确认",
												closeOnConfirm : false,
												timer : 7000
											});
										}
									} else {
										sweetAlert({
											title : "",
											text : "手机号码输入有误！",
											type : "info",
											confirmButtonColor : "#2b2e37",
											confirmButtonText : "确认",
											closeOnConfirm : false,
											timer : 7000
										});
									}
								} else {
									sweetAlert({
										title : "",
										text : "昵称不能为空！",
										type : "info",
										confirmButtonColor : "#2b2e37",
										confirmButtonText : "确认",
										closeOnConfirm : false,
										timer : 7000
									});
								}
							} else {
								sweetAlert({
									title : "",
									text : "两次输入的密码不一致！",
									type : "info",
									confirmButtonColor : "#2b2e37",
									confirmButtonText : "确认",
									closeOnConfirm : false,
									timer : 7000
								});
							}

						});
		/** 异步加载所有版块 */
		$
				.ajax({
					url : "${path}/bbs/selectAllModel.do",
					type : "post",
					dataType : "json",
					async : true,
					success : function(data) {
						var options = [];

						$
								.each(
										data,
										function(index, value) {
											var cvb = 0;
											if ("${faUser.fa_sectionid}" == value.id) {
												options
														.push("<option value='" + value.id + "'  selected='selected'> "
																+ value.name
																+ " </option>");
												cvb = 1;
											} else {
												options
														.push("<option value='" + value.id + "'> "
																+ value.name
																+ " </option>");
											}
											if(cvb<1){
												options
												.push("<option value='0'  selected='selected'>请选择</option>");
											}

										});
						$("#reid").append(options.join(''));

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
		/** 异步会员等级标签 */
		$
				.ajax({
					url : "${path}/member/selectAllRank.do",
					type : "post",
					dataType : "json",
					async : true,
					success : function(data) {
						var options = [];
						var ibs = "";

						$
								.each(
										data,
										function(index, value) {
											ibs = ibs
													+ '<input type="hidden" id="'+value.fa_id+'s" value="'+value.fa_start+'"><input type="hidden" id="'+value.fa_id+'e" value="'+value.fa_end+'">'

											if ("${faUser.fa_rank}" == value.fa_id) {

												options
														.push("<option value='" + value.fa_id + "' selected='selected' > "
																+ value.fa_name
																+ " </option>");
												ibs = ibs
														+ '<input type="hidden" id="dfval" value="'+value.fa_id+'">';
											} else {
												options
														.push("<option value='" + value.fa_id + "'  > "
																+ value.fa_name
																+ " </option>");

											}
										});
						$("#ibs").html(ibs)
						$("#rankid").append(options.join(''));
						$("#rankid")
								.change(
										function() {
											var id = $(this).val();
											var start = $("#" + id + "s").val();
											var end = $("#" + id + "e").val()
											var dfid = $("#dfval").val();

											if (Number($("#jifen").val()) < Number(start)
													|| Number($("#jifen").val()) > Number(end)) {

												//$(":option[value="+dfid+"]").prop("selected",true);
												$(
														"#rankid option[value='"
																+ id + "']")
														.removeAttr("selected")
												$(
														"#rankid option[value='"
																+ dfid + "']")
														.prop("selected", true);
												$("#jifen").val(
														"${faUser.fa_jifen}");
												$("#jifen").focus();
												$("#jifen").select();
												sweetAlert({
													title : "",
													text : "该等级的积分范围在"
															+ start
															+ "~"
															+ end
															+ "之间，该会员的积分不在此范围，请先修改该会员的积分",
													type : "error",
													confirmButtonColor : "#2b2e37",
													confirmButtonText : "确认",
													closeOnConfirm : false,
													timer : 7000
												});

											}
										});
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
		$("#startday").val("");
		$("#endday").val("");
		var url = "${path}/member/findUserInteById.do";
		cmspageInte({
			"startday" : '',
			"endday" : '',
			"userId" : "${faUser.fa_id}",
			"curpage" : "1"
		}, url)
		$("#searchbtn").click(function() {
			cmspageInte({
				"startday" : $("#startday").val(),
				"endday" : $("#endday").val(),
				"userId" : "${faUser.fa_id}",
				"curpage" : "1"
			}, url)

		})
		//点击首页
		$("#firstp").click(function() {
			cmspageInte({
				"startday" : $("#startday").val(),
				"endday" : $("#endday").val(),
				"userId" : "${faUser.fa_id}",
				"curpage" : "1"
			}, url);
		})
		//点击上一页
		$("#lastp").click(function() {
			var cpage = Number($("#curpage").text()) - 1;
			cmspageInte({
				"startday" : $("#startday").val(),
				"endday" : $("#endday").val(),
				"userId" : "${faUser.fa_id}",
				"curpage" : cpage
			}, url);
		})
		//点击当前页+1
		$("#nextfp").click(function() {
			var cpage = Number($("#curpage").text()) + 1;
			cmspageInte({
				"startday" : $("#startday").val(),
				"endday" : $("#endday").val(),
				"userId" : "${faUser.fa_id}",
				"curpage" : cpage
			}, url);
		})
		//点击当前页+2
		$("#nextsp").click(function() {
			var cpage = Number($("#curpage").text()) + 2;
			cmspageInte({
				"startday" : $("#startday").val(),
				"endday" : $("#endday").val(),
				"userId" : "${faUser.fa_id}",
				"curpage" : cpage
			}, url);
		})
		//点击当前页+3
		$("#nexttp").click(function() {
			var cpage = Number($("#curpage").text()) + 3;
			cmspageInte({
				"startday" : $("#startday").val(),
				"endday" : $("#endday").val(),
				"userId" : "${faUser.fa_id}",
				"curpage" : cpage
			}, url);
		})
		//点击下一页
		$("#nextp").click(function() {
			var cpage = Number($("#curpage").text()) + 1;
			cmspageInte({
				"startday" : $("#startday").val(),
				"endday" : $("#endday").val(),
				"userId" : "${faUser.fa_id}",
				"curpage" : cpage
			}, url);
		})
		//点击最后一页
		$("#endp").click(function() {
			var cpage = Number($("#totalpage").text());
			cmspageInte({
				"startday" : $("#startday").val(),
				"endday" : $("#endday").val(),
				"userId" : "${faUser.fa_id}",
				"curpage" : cpage
			}, url);
		})

		//用户状态点击事件
		$("input[name='fa_status']").click(function() {
			if ($(this).val() == 1) {
				document.getElementById("dfsz").style.display = "";
			} else {
				document.getElementById("dfsz").style.display = "none";
			}
		})
		if ("${faUser.fa_status}" == 1) {
			document.getElementById("dfsz").style.display = "";
		} else {
			document.getElementById("dfsz").style.display = "none";
		}
		//判断版主类别
		if ("${faUser.fa_ishost}" == 1) {
			document.getElementById("dfs").style.display = "";
		} else {
			document.getElementById("dfs").style.display = "none";
		}

		$("#typeMo").change(function() {
			var sv = $(this).val()
			if (sv == 1) {
				document.getElementById("dfs").style.display = "";
			} else {
				document.getElementById("dfs").style.display = "none";
			}
		})
	});
	jeDate({
		dateCell : "#startday",
		format : "YYYY年MM月DD日 hh:mm:ss",
		isinitVal : true,
		isTime : true, //isClear:false,
		minDate : "2014-09-19 00:00:00",
		okfun : function(val) {
			alert(val)
		}
	})
	jeDate({
		dateCell : "#endday",
		format : "YYYY年MM月DD日 hh:mm:ss",
		isinitVal : true,
		isTime : false, //isClear:false,
		minDate : "2014-09-19 00:00:00",
		okfun : function(val) {
			alert(val)
		}
	})
	function cmspageInte(cmsdata, url) {

		$
				.ajax({
					url : url, // 请求URL
					data : cmsdata,
					type : "post", // 请求方式
					dataType : "json", // 服务器响应回来的数据类型json: {}、[]、[{},{}]
					async : true,
					success : function(data) {
						if (data.tip == 1) {
							var vars = "<thead><tr><th>用户操作</th><th>变化种类</th><th>变化数值</th><th>变化后的数值</th><th>变化时间</th><th>详细</th></tr></thead>"
							

							for (var i = 0; i < data.rows.length; i++) {
								var types = "积分";
								if (data.rows[i].typess == 1) {
									types = "飞镖";
								}
								var vart = '<tr><td>' + data.rows[i].makes
										+ '</td><td>' + types + '</td><td>'
										+ data.rows[i].changes + '</td><td>'
										+ data.rows[i].sums + '</td><td>'
										+ data.rows[i].timess + '</td><td>'
										+ data.rows[i].detail + '</td></tr>';
								vars = vars + vart;
							}
							$("#cmstable").html(vars);
							pageful(data);
						} else if (data.tip == 2) {
							sweetAlert({
								title : "",
								text : data.msg,
								type : "error",
								confirmButtonColor : "#2b2e37",
								confirmButtonText : "确认",
								closeOnConfirm : false,
								timer : 7000
							});
						} else {
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
</script>