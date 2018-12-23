<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_common.css" />
<link rel="stylesheet" type="text/css"
	href="/data/cache/style_1_forum_forumdisplay.css">
	<link rel="stylesheet" type="text/css" href="/css/header.css">
		<link rel="stylesheet" type="text/css" href="/data/cache/mystyle.css" />
		<link rel="stylesheet" type="text/css" href="/data/cache/style_1_forum_viewthread.css" />
		<script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="/js/commom.js"></script>
		<script type="text/javascript" src="/js/aa.js"></script>
		<!-- 配置文件 -->  
<script type="text/javascript" src="/ueditor/ueditor.config.js"></script>  
<!-- 编辑器源码文件 -->  
<script type="text/javascript" src="/ueditor/ueditor.all.js"></script>  
<link rel="stylesheet" type="text/css" href="/ueditor/themes/default/css/ueditor.css" /> 
<style type="">
	#edui1{
	width: 650px !important;
	/*height:400px !important;*/
	z-index: 100 !important
	}
	</style>
		
</head>

<body id="nv_forum" class="pg_viewthread">

	<div id="hd">
		<div id="w_header">

			<c:import url="${path}/feiiohead.jsp"></c:import>
			<!--version: 2016-12-01 15:16:51-->
		</div>
		<div id="wp" class="wp">
			<link rel="stylesheet"
				href="/static_new/pc/css/forum/lottery-48900a4070.css">
				<script type="text/javascript">
					var fid = parseInt('22'), tid = parseInt('2493275');
				</script>
				<script src="/static_new/pc/js/common/forum_moderate-b3cb01d5c8.js"
					type="text/javascript"></script>
				<script src="/static_new/pc/js/forum/forum_all-638680fae2.js"
					type="text/javascript"></script>
				<script type="text/javascript">
					zoomstatus = parseInt(0);
					var imagemaxwidth = '700';
					var aimgcount = new Array();
				</script>
				<style id="diy_style" type="text/css"></style>
				<!--[diy=diynavtop]-->
				<div id="diynavtop" class="area"></div>
				<!--[/diy]-->
				<style id="diy_style" type="text/css"></style>
				<div class="wp">
					<!--[diy=diy1]-->
					<div id="diy1" class="area"></div>
					<!--[/diy]-->
				</div>
				<div class="wp cl">
					<div id="expandBox" class="expandbox_mn" style="">
						<div class="signinwrap_expand">
							<div class="signin_expand signin_expand_2 " style="width: 272px;">
								<a attribute="">
									<div class="week_ban" id="weekday"></div>
									<div class="btncont_signin btncont_signin_2" id="qiandao">签&nbsp;到</div>
									<div class="cr"></div>
								</a>
							</div>
							<div class="tips_signin"
								style="display: none; left: 0; top: 65px;">
								<span class="tipcont_signin" id="tipz"></span><em
									class="point_signtip"></em>
							</div>
						</div>
						<div class="titlebar_expand">
							<h3>版块信息</h3>
							<span>发帖总量&nbsp;:&nbsp;${totalCount}</span>
						</div>
						<div class="readblock_expand rules_expand">
							<div class="bm_pintro">
								版主 : <span class="xi2"> <c:if
										test="${sns!=null && !empty sns}">
										<c:forEach items="${sns}" var="sn">
											<a href="/fiioer/showMemberMsg.do?id=${sn['id']}"
												class="notabs">${sn['name']}</a>
										</c:forEach>
									</c:if> <c:if test="${sns==null || empty sns}">
									该板块还没有设立版主
								</c:if>


								</span>
							</div>
							<c:if
								test="${fu.fa_ishost>1 || fu.fa_sectionid==faSection.fa_id}">
								<div id="bj1" style="display: none">
									<a href="javascript:void(0)" id="bianji1">预览</a>
									<div class="ptn xg2">
										<textarea rows="6" cols="37" id="descss">${faSection.fa_desc}</textarea>
									</div>
									<a href="javascript:void(0)" style="float: right;"
										id="suredese">确认</a>
								</div>
								<div id="bj2">
									<a href="javascript:void(0)" id="bianji2">编辑</a>
									<div class="ptn xg2 eeeee">${faSection.fa_desc}</div>
								</div>
							</c:if>
							<c:if
								test="${fu.fa_ishost<=1 && fu.fa_sectionid!=faSection.fa_id}">
								<div id="bj2">

									<div class="ptn xg2 eeeee">${faSection.fa_desc}</div>
								</div>

							</c:if>


						</div>
						<div class="titlebar_expand">
							<h3>推荐阅读</h3>
						</div>
						<div class="readblock_expand recread_expand">
							<div id="portal_block_701" class="inrotate_img block move-span">
								<div id="portal_block_701_content" class="dxb_bc">
									<ul class="toprec_recread cl">
										<c:if test="${hasImage!=null &&!empty hasImage}">
											<c:forEach items="${hasImage}" var="hi">
												<li><a href="${hi['fa_url']}"><img
														src="${hi['fa_image']}" width="124" height="100"></a> <a
													href="${hi['fa_url']}">
														<p>${hi['fa_name']}</p>
												</a></li>
											</c:forEach>

										</c:if>


									</ul>
								</div>
							</div>
							<div id="portal_block_761"
								class="padding_margin0 block move-span">
								<div class="bread_line">
									<div class="line"></div>
									<div class="cr"></div>
								</div>
								<div id="portal_block_761_content" class="dxb_bc">
									<ul class="recitems_recread cl">
										<c:if test="${noImage!=null &&!empty noImage}">
											<c:forEach items="${noImage}" var="ni">
												<li class="thread"><a href="${ni['fa_url']}">${ni['fa_name']}</a></li>
											</c:forEach>
										</c:if>



									</ul>
								</div>
							</div>
						</div>


					</div>


















					<div id="ct" class="plate_mn postcontbox_mn">
						<div id="postlist" class="pl bm wp_postlist">
							<div class="headdiv_post">
								<div id="pt" class="bm cl bread_post">
									<div class="z">
										<a href="/">互动社区</a> <em>></em> <a
											href="/note/showFSection.do?id=${faSection.fa_id}">${faSection.fa_name}</a>
									</div>
								</div>
								<c:if
									test="${fu.fa_ishost>1 || fu.fa_sectionid==faSection.fa_id}">
									<div id="modmenu" class="xi2 pbm modmenu cl"
										style="position: relative">
										<a class="modmenu_h">操作&nbsp;:&nbsp;</a><a
											class="modmenu_l topic" href="javascript:;" id="deleteNote">删除主题</a>
										<a class="modmenu_l move" href="javascript:;" id="moveNote">移动</a><a
											class="modmenu_l sj" href="javascript:;" id="udzz">升降</a><a
											class="modmenu_l light" href="javascript:;" id="biaoqian">标签</a><a
											id="moreMod " style="cursor: pointer;"><span class="more">更多</span><em
											class="arrow_dark "></em></a>
										<div id="moreMod_menu " class="p_pop p_pop2 "
											style="display: block; position: absolute; left: 260px; top: 25px; z-index: 99; display: none;">
											<ul>
												<li><a href="javascript:; " id="zhiding"> <c:if
															test="${fn.fa_zhiding>0}">
											取消置顶
											</c:if> <c:if test="${fn.fa_zhiding<=0}">
											置顶
											</c:if>

												</a></li>
												<li><a href="javascript:; " id="jingpin"> <c:if
															test="${fn.fa_jingpin>0}">
											取消精品
											</c:if> <c:if test="${fn.fa_jingpin<=0}">
											精品
											</c:if>
												</a></li>
												<li><a href="javascript:; " id="gaoliang"> <c:if
															test="${fn.fa_gaoliang>0}">
											取消高亮
											</c:if> <c:if test="${fn.fa_gaoliang<=0}">
											高亮
											</c:if>
												</a></li>
												<li><a href="javascript:; " id="resou"> <c:if
															test="${fn.fa_nohot>0}">
											上热搜
											</c:if> <c:if test="${fn.fa_nohot<=0}">
											不上热搜
											</c:if>
												</a></li>
											</ul>
										</div>
										<div id="moveModel" class="p_pop  "
											style="display: none; position: absolute; left: 100px; top: 25px; z-index: 99;">
											<ul>
												<c:forEach var="sm" items="${sm}">
													<li><a href="javascript:;" class="moveModels"
														id="${sm['id']}">${sm['name']}</a></li>
												</c:forEach>
											</ul>
										</div>
										<div id="udsort" class="p_pop"
											style="display: block; position: absolute; left: 130px; top: 25px; z-index: 99; display: none;">
											<ul>
												<li><a href="javascript:; " class="udsorts" id="0">升</a></li>
												<li><a href="javascript:; " class="udsorts" id="1">降</a></li>
											</ul>
										</div>
										<div id="biaoqians" class="p_pop  "
											style="display: none; position: absolute; left: 160px; top: 25px; z-index: 99;">
											<ul>
												<c:forEach var="sm" items="${sms}">
													<li><a href="javascript:;" class="biaoqianss"
														id="${sm['fa_id']}">${sm['fa_name']}</a></li>
												</c:forEach>
											</ul>
										</div>
										<div class="cr "></div>
									</div>
								</c:if>
								
							</div>
							<div id="post_39920445"
								class="item_postlist graybar_postlist firstitem_postlist">
								<table id="pid39920445" cellspacing="0" cellpadding="0">
									<col width="64px" />
									<col width="594px" />
									<tr>
										<!--第一个帖子-->
										<td class="plc" colspan="2">
											<div class="thread_postlist">
												<div class="posttitlewrap ">
													<div class="avatar head_uinfo ">
														<img src="${fuf.fa_title_img}" /><span
															class="shadowbox_avatar "> </span>
													</div>
													<div class="posttitle ">
														<a id="thread_subject " href="javascript:void(0)"
															style="font-size: 24px;">${fn.fa_title} </a>
															<c:if test="${fu.fa_ishost>1 || fu.fa_sectionid==faSection.fa_id || fu.fa_id==fn.fa_userid}">
																<a class="modmenu_l topic" id="updateBtns"  href="javascript:void(0)">&nbsp;&nbsp;<font color="gray" size="2">修改</font></a>
															
															</c:if>
													</div>
												</div>
												<div class="pi infobar_post">
													<div class="barr_post">
														<span class="xi1">回复：${huifuCount}</span>
														<span class="xi1">阅读：${fn.fa_ping} </span>
														 <span id="authorposton39920445"><span> &nbsp;&nbsp;<fmt:formatDate
																	value="${fn.fa_start_time}"
																	pattern="yyyy-MM-dd HH:mm:ss" /></span></span>
													</div>
													<div class="pti barl_post ">
														<div class="pdbt "></div>
														<div class="authi ">
															<a class="name_uinfo "
																href="/fiioer/showMemberMsg.do?id=${fuf.fa_id}"
																class="xw1 ">${fuf.fa_username}</a> <em
																class="userlevel_uinfo "> <a class="mzvip "
																href="javascript:void(0)">
																<c:if test="${fr.fa_image!=null && fr.fa_image!=''}">
																<img src="${fr.fa_image}" width="10px">
																</c:if>
																</a>

																<a href="javascript:void(0)" class="mzpower "><font
																	color="#999999 ">${fr.fa_name}</font></a> <span class="cr "></span>
															</em>
																<div class="share-part ">
                                                                                                                       	 分享到：<img class="share-pic " src="/static_new/pc/img/forum/share.png ">
                                                                                                                        <div id="soshid" class="share-box sosh" style="display: none;">
                                                                                                                                <div class="sosh-item weibo"><a  target="_blank"  href="http://service.weibo.com/share/share.php?title=${fn.fa_title}&url=http://bbs.fiio.net/note/showNoteContent.do?id=${fn.fa_id}" ><span class="sosh-item-icon"><img src="/img/weibo.png"></span><span class="sosh-item-text">微博</span></a></div>
                                                                                                                                <!-- <div class="sosh-item weixin"><span class="sosh-item-icon"><img src="/img/weixin1.png"></span><span class="sosh-item-text">微信</span></div> -->
                                                                                                                                <div class="sosh-item douban"><a href="http://www.douban.com/recommend/?title=${fn.fa_title}&url=http://bbs.fiio.net/note/showNoteContent.do?id%3D${fn.fa_id}"><span class="sosh-item-icon"><img src="/img/dou.png"></span><span class="sosh-item-text">豆瓣</span></a></div>
                                                                                                                                <div class="sosh-item qzone"><a  target="_blank" href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?title=${fn.fa_title}&url=http://bbs.fiio.net/note/showNoteContent.do?id%3D${fn.fa_id}" ><span class="sosh-item-icon"><img src="/img/qq.png"></span><span class="sosh-item-text">QQ空间</span></a></div>
                                                                                                                                <div class="sosh-item tieba"><a target="_blank"  href="http://tieba.baidu.com/f/commit/share/openShareApi?title=${fn.fa_title}&url=http://bbs.fiio.net/note/showNoteContent.do?id%3D${fn.fa_id}"><span class="sosh-item-icon"><img src="/img/tieba.png"></span><span class="sosh-item-text">百度贴吧</span></a></div>
                                                                                                                        </div>
                                                                                                                </div>
														</div>
													</div>
												</div>
												<div class="pct postcont_postlist fontsizelimit">
													<div class="pcb">
														<div class="t_fsz">
															<table cellspacing="0" cellpadding="0">
																<c:if test="${fn.fa_type==3}">
																	<tr>
																		<td class="t_f" id="postmessage_39920445">
																			<div>产品类别:&nbsp;&nbsp;${protype}</div>
																		</td>
																	</tr>
																	<tr>
																		<td class="t_f" id="postmessage_39920445">
																			<div>产品型号:&nbsp;&nbsp;${prostyle}</div>
																		</td>
																	</tr>
																	<tr>
																		<td class="t_f" id="postmessage_39920445">
																			<div>产品问题:&nbsp;&nbsp;${proquest}</div>
																		</td>
																	</tr>
																	<tr>
																		<td class="t_f" id="postmessage_39920445">
																			<div>模块:&nbsp;&nbsp;${fn.fa_protype}</div>
																		</td>
																	</tr>
																	<tr>
																		<td class="t_f" id="postmessage_39920445">
																			<div>使用环境:&nbsp;&nbsp;${fn.fa_proversion}</div>
																		</td>
																	</tr>
																	<tr>
																		<td class="t_f" id="postmessage_39920445">
																			<div>固体版本:&nbsp;&nbsp;${fn.fa_version}</div>
																		</td>
																	</tr>
																	<tr>
																		<td class="t_f" id="postmessage_39920445">
																			<div>处理状态:&nbsp;&nbsp;
																			<c:if test="${fn.fa_prodel==0}"><font color="blue">待处理</font></c:if>
																			<c:if test="${fn.fa_prodel==1}"><font color="red">处理中</font></c:if>
																			<c:if test="${fn.fa_prodel==2}"><font color="green">已处理</font></c:if>
																			
																			</div>
																		</td>
																	</tr>
																	
																	<c:if test="${fu.fa_ishost>1 || fu.fa_sectionid==faSection.fa_id}">
																		<tr>
																			<td class="t_f" id="postmessage_39920445">
																				<div>修改处理状态:&nbsp;&nbsp;<select id="selectids" >
																					<option value="0" <c:if test="${fn.fa_prodel==0}">checked="checked"</c:if> >未处理</option>
																					<option value="1" <c:if test="${fn.fa_prodel==1}">checked="checked"</c:if>>处理中</option>
																					<option value="2" <c:if test="${fn.fa_prodel==2}">checked="checked"</c:if>>已处理</option>
																				</select>
																				<input type="button" value="确认" id="xgclzt"/>
																				</div>
																			</td>
																		</tr>
																	
																	</c:if>
																	


																</c:if>
																<c:if test="${fn.fa_type==4}">
																	<tr>
																		<td class="t_f" id="postmessage_39920445">
																			<div>报名人数:${fn.fa_total_people}</div>
																		</td>
																	</tr>
																</c:if>

																<tr>
																	<td class="t_f" id="postmessage_39920445">
																		<div>${fn.fa_desc}</div>
																		<c:if test="${fn.fa_type==2}">
																		<c:if test="${fnv!=null && !empty fnv}">
																		<c:if test="${mfnv==null || empty mfnv}">
																		
																		<ul>
																			

																		</ul>

																		<div class="pcht">
																			<form id="voteForm">
																			<input name="nid"  type="hidden" value="${fn.fa_id}" />
																			<input name="dod" type="hidden" value="${fn.fa_dod}" />
																			<table cellspacing="0" cellpadding="0" width="100%">
																			<c:if test="${fn.fa_dod==1}">
																				<c:forEach items="${fnv}" var="fnv">
																			
																				<tr>
																					<td class="pvt"><input type="checkbox"
																						name="bbss" value="${fnv['id']}" style="margin-right: 10px; margin-top: 10px; margin-left: 25px;"><label
																							for="option_1">${fnv['answer']}</label></td>
																					<td class="pvts"></td>
																				</tr>
																				</c:forEach>
																			</c:if>
																			<c:if test="${fn.fa_dod==0}">
																				<c:forEach items="${fnv}" var="fnv">
																			
																				<tr>
																					<td class="pvt"><input type="radio"
																						name="bbss" value="${fnv['id']}" style="margin-right: 10px; margin-top: 10px; margin-left: 25px;"><label
																							for="option_1">${fnv['answer']}</label></td>
																					<td class="pvts"></td>
																				</tr>
																				</c:forEach>
																			</c:if>


																			</table>
																			</form>
																		</div>
																		<input type="button" value="提交" id="tijiao">
																			<font color="#00bfff"> <br />
																		</font>
																		</c:if>
																		</c:if>
																		</c:if>
																	</td>
																</tr>

															</table>
														</div>





														<c:if test="${fn.fa_type==2}">
														<c:if test="${fnv!=null && !empty fnv}">
														<c:if test="${fn.fa_biaoqian==1}">
															<input type="hidden">
																<div class="pinf">
																	<strong>
																	<c:if test="${fn.fa_dod==0}">单选</c:if>
																	<c:if test="${fn.fa_dod==1}">多选</c:if>
																	
																	
																	投票</strong>, 共有 ${fnv[0].sum} 人参与投票
																</div>
																<div class="pcht">
																	<table cellspacing="0" cellpadding="0" width="100%">
																		<c:forEach items="${fnv}" var="fnv">
																		<tr>
																			<td class="pvt"><label for="option_1">${fnv['answer']}</label></td>
																			<td class="pvts"></td>
																		</tr>
																		<tr>
																			<td>
																				<div class="pbg">
																					<div class="pbr"
																						style="width: ${fnv['percent']}; background-color: #E92725"></div>
																				</div>
																			</td>
																			<td>${fnv['percent']} <em style="color: #E92725">(${fnv['count']})</em></td>
																		</tr>
																		</c:forEach>
																		
																	
																	</table>
																</div>
																
														</form>
														</c:if>
														<c:if test="${fn.fa_biaoqian==0}">
														<c:if test="${mfnv!=null &&! empty mfnv}">
															<input type="hidden">
																<div class="pinf">
																	<strong>
																	<c:if test="${fn.fa_dod==0}">单选</c:if>
																	<c:if test="${fn.fa_dod==1}">多选</c:if>
																	
																	
																	投票</strong>, 共有 ${fnv[0].sum} 人参与投票
																</div>
																<div class="pcht">
																	<table cellspacing="0" cellpadding="0" width="100%">
																		<c:forEach items="${fnv}" var="fnv">
																		<tr>
																			<td class="pvt"><label for="option_1">${fnv['answer']}</label></td>
																			<td class="pvts"></td>
																		</tr>
																		<tr>
																			<td>
																				<div class="pbg">
																					<div class="pbr"
																						style="width: ${fnv['percent']}; background-color: #E92725"></div>
																				</div>
																			</td>
																			<td>${fnv['percent']} <em style="color: #E92725">(${fnv['count']})</em></td>
																		</tr>
																		</c:forEach>
																		
																	
																	</table>
																</div>
														</form>
														</c:if>
														</c:if>
														</c:if>	
														</c:if>

<c:if test="${votemb!=null && ! empty votemb}">
																<div class="pcht">
																	<table cellspacing="0" cellpadding="0" width="100%">
																	<c:forEach items="${votemb}" var="vb">
																		<tr>
																			<td class="pvt"><font color="red">${vb['uname']}</font>&nbsp;&nbsp;&nbsp;投给了&nbsp;&nbsp;&nbsp;<font color="green">${vb['nname']}</font></td>
																			
																		</tr>
																	</c:forEach>
																	</table>
																</div>
																</c:if>











														<div style="clear: both;"></div>
														<table border="" cellspacing="" cellpadding=""
															style="border: none;">
															<c:if test="${fn.fa_type==4}">
																<tr>
																	<td colspan="2" class="plc cbar_postlist"
																		style="border: none;">

																		<div class="po cbarbox_postlist">
																			<!--删除的帖子不显示-->
																			<div class="pob">
																				<c:if test="${fu.fa_id==fn.fa_userid}">
																					<a class="fastre" id="excelbtn"
																						href="javascript:void(0)">导出报名人表</a>
																				</c:if>
																				<c:if test="${fu.fa_id!=fn.fa_userid}">
																					<a class="fastre" id="myjoin"
																						href="javascript:void(0)">我要报名</a>
																				</c:if>








																				<div class="cr"></div>
																			</div>
																		</div>
																		<div class="cr"></div>
																	</td>


																</tr>

															</c:if>

															<tr>
																<td colspan="2" class="plc cbar_postlist"
																	style="border: none;">

																	<div class="po cbarbox_postlist">
																		<!--删除的帖子不显示-->
																		<div class="pob">
																			<a class="fastre" href="#fabiaos">回复</a> <a
																				class="support_oppose" href="javascript:;"
																				onclick='trueorfalse("${fn.fa_id}",1)'> <i>${fandui}&nbsp;反对</i>
																			</a> <a class="support_oppose" href="javascript:;"
																				onclick='trueorfalse("${fn.fa_id}",0)'> <i>${zhichi}&nbsp;支持</i>
																			</a>







																			<div class="cr"></div>
																		</div>
																	</div>
																	<div class="cr"></div>
																</td>
															</tr>
														</table>

													</div>
												</div>
										</td>
									</tr>
								</table>
							</div>
						</div>

						<div class="pl replypost_postlist">
							<h3 class="head_postlist cl">
								<span class="z"><em>${huifuCount}</em>条回复</span> <span
									class="y tofloor_postlist"> <label id="fj_btn" class="z">楼层直达</label>
									<input type="text" class="p_fre z" size="4"  id="fj_btnsz"
									onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');">&nbsp;<a href="javascript:void(0)" id="fj_btns">GO!</a></span>
							</h3>
							<div id="sessionMsg"></div>
							<!--兼容删除的帖子普通用户直接跳过-->

							<div id="postlistreply"></div>

							<div class="footdiv_post">
								<form id="modactions">
									<input type="hidden"> <input type="hidden"> <input
											type="hidden"> <input type="hidden"> <input
													type="hidden">
								</form>
								<div class="dividingline"></div>
								<div class="pgs mtm mbm cl pagebar">
									<span class="y"><a class="graybtn normalbtn"
										href="/note/showNoteContent.do?id=${fn.fa_id}">返回文章</a></span>
									<div class="pg">
										<a class="prev" id="lastpage"><em class="previcon"></em></a>
										<strong id="curpage">1</strong> <a href="javascript:void(0)"
											id="secondpage">2</a> <a href="javascript:void(0)"
											id="thirdpage">3</a> <a href="javascript:void(0)"
											id="forthpage">4</a> <a href="javascript:void(0)">...</a>
										<a href="javascript:void(0)" id="fifthpage">5</a> <a
											href="javascript:void(0)" id="nextpage" class="nxt"><em
											class="nxticon"></em></a> <input type="hidden" id="totalsize" />
									</div>
								</div>
							</div>
						</div>
						<div id="diyfastposttop" class="area"></div>
						<div id="f_pst" class="pl bm bmw replybox_post"
							style="position: relative; overflow: hidden;">
							<form id="userForm">
								<input type="hidden" value="${fn.fa_id}" name="fa_pid" /> <input
									type="hidden" value="${iscode}" name="iscode" /> <span
									id="fastpostreturn"></span>
								<div class="cl">
									<div id="fastposteditor">
										<div class="tedt mtn">
											<!-- <textarea id="content1" name="fa_desc" cols="20" rows="5"
												style="width: 650px; height: 200px; visibility: hidden;"></textarea> -->
											<textarea id="newsEditor"  style="width:100%;height:250px">  </textarea>
														<script type="text/javascript">  
												           UE.getEditor('newsEditor',{
												        	   elementPathEnabled:false,
												        	   wordCount:false
												           });  
												           // var content = UE.getPlainTxt();//content就是编辑器的带格式的内容  
												           </script>
										</div>
									</div>
								</div>
								<c:if test="${iscode>0}">
									<div class="mtm identifying_code"
										style="margin: 20px 0px; width: 50%; float: left;"">
										<input type="hidden"> 验证码 <span id="seccodeSyn1h4v0"><input
												type="text" name="code" id="zxcvzz"
												style="ime-mode: disabled; width: 100px" class="txt px vm">
													<span class="seccode_image"></span> <span
													class="seccheck_status"><img
														src="${path}/verify/show.do" class="vmss" width="100"
														height="32" class="vm" /></span></span> <a href="javascript:;"
											class="xi2" id="hyg">换一个</a>
											<div id="seccodeSyn1h4v0_menu" class="p_pop p_opt"
												style="display: none; height: 0px; width: 0px; border-width: 0px;">
												<span></span>

											</div>
									</div>
									
								</c:if>
								<p class="ptm pnpost cl">
									<a href="javascript:void(0)" class="normalbtn bluebtn">
										<button type="button" id="fabiaos" class="pn">发表回复</button>
									</a> <label id="wrap_simcheck" class="wrap_simcheck"
										style="float: left; margin: 0px;"> 
									</label>


								</p>
							</form>
						</div>
					</div>
				</div>
			<div class="wp mtn">
				<div id="diy3" class="area"></div>
				<input value="${floor}" id="tzs" type="hidden" />
			</div>

		</div>
	</div>


	<c:import url="${path}/feiiombend.jsp"></c:import>
	<!--fwinmask end-->
	<div id="scrolltop2" style="left: 1491.5px; display: block;"
		class="scrolltop2"></div>

</body>
<script type="text/javascript">
	login();
	loginbox();
	$(".light").click(function() {
		$(".fwinmask1").show();
	})
	$(".more").click(function() {
		$(".p_pop2").toggle();
	});
	$(".flbc").click(function() {
		$(".fwinmask1").hide();
		$(".fwinmask2").hide();
		$(".fwinmask3").hide();
		$(".fwinmask4").hide();
		$(".fwinmask5").hide();
	})
	$(".dpbtn1").click(function() {
		$(".time").toggle();
	});
	$(".topic").click(function() {
		$(".fwinmask2").show();
	});
	$(".close").click(function() {
		$(".fwinmask3").show();
	});
	$(".sj").click(function() {
		$(".fwinmask4").show();
	});
	$(".move").click(function() {
		$(".fwinmask5").show();
	});
	$(".share-part  img").click(function() {
		$(".share-box").toggle();
	});
	$("#itemcp_digest").click(function(argument) {
		$(".dopt1").toggle();
	});
	$(".dpbtn2").click(function() {
		$(".replay").toggle();
	});
	$(window).scroll(function() {
		var _top = $(window).scrollTop();
		if (_top > document.documentElement.clientHeight) {
			$(".scrolltop2").css("opacity", "1");

		} else {
			$(".scrolltop2").css("opacity", "0");
		}
	})
	$(".scrolltop2").bind("click", function() {
		$("html, body").animate({
			"scroll-top" : 0
		}, "slow");
	})
</script>
<script>
	$(function() {
		var a = new Array("日", "一", "二", "三", "四", "五", "六");
		var week = new Date().getDay();
		var str = "星期" + a[week];
		$("#weekday").html(str)

		 $("#hyg").click(
				function() {
					$("#vmss").attr("src",
							"${path}/verify/show.do?random=" + Math.random());
				}) 
		var url = "/note/selectNoteComment.do"
		pageData({
			"curpage" : 1,
			"floor" : "${floor}",
			"id" : "${fn.fa_id}"
		}, url)
		
		//上一页
		$("#lastpage").click(function() {
			var cp = Number(($("#curpage").text())) - 1
			pageData({
				"curpage" : cp,
				"id" : "${fn.fa_id}"
			}, url)
		})
		//第二页
		$("#secondpage").click(function() {
			var cp = Number(($("#curpage").text())) + 1
			pageData({
				"curpage" : cp,
				"id" : "${fn.fa_id}"
			}, url)
		})
		//第三页
		$("#thirdpage").click(function() {
			var cp = Number(($("#curpage").text())) + 2
			pageData({
				"curpage" : cp,
				"id" : "${fn.fa_id}"
			}, url)
		})
		//第四页
		$("#forthpage").click(function() {
			var cp = Number(($("#curpage").text())) + 3
			pageData({
				"curpage" : cp,
				"id" : "${fn.fa_id}"
			}, url)
		})
		//第末页
		$("#fifthpage").click(function() {
			var cp = Number(($("#fifthpage").text()))
			pageData({
				"curpage" : cp,
				"id" : "${fn.fa_id}"
			}, url)
		})
		//下一页
		$("#nextpage").click(function() {
			var cp = Number(($("#curpage").text())) + 1
			pageData({
				"curpage" : cp,
				"id" : "${fn.fa_id}"
			}, url)
		})
		//修改处理状态
				$("#xgclzt").click(function(){
					var i =0;
					if ("${fu.fa_ishost}" == 2
							|| "${fu.fa_sectionid}" == "${faSection.fa_id}") {
						i = 1;
					}
					$.ajax({
						url:"/note/updateNoteDealStatus.do",
						data:{"status":$("#selectids").val(),"ishost":i,"id":"${fn.fa_id}"},
						type:"post",
						dataType:"json",
						success:function(data){
							if (data.tip == "success") {
								$("#append_parent").show();
								$("#closeTip").hide();
								$("#showMsg").text("设置成功,请刷新一下页面更新状态");
								setTimeout(function() {
									$("#closeTip").show();
									$("#append_parent").hide();
								}, 1000)
							} else {
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
				})
		//提交投票结果
		$("#tijiao").click(function(){
			$.ajax({
					url : "/note/tijiaovote.do",
					data : $("#voteForm").serialize(),
					type : "post",
					dataType : "json",
					success : function(data) {
						if(data.tip=="success"){
							$("#append_parent").show();
							$("#showMsg").text("投票成功");
							setTimeout(
									function() {
										$("#append_parent").hide();
										window.location.href = "/note/showNoteContent.do?id=${fn.fa_id}";
									}, 2000)
						}else{
							$("#append_parent").show();
							$("#showMsg").text(data.tip);
							setTimeout(
									function() {
										$("#append_parent").hide();
										
									}, 2000)
						}
						

					},
					error : function() {
						$("#append_parent").show();
						$("#showMsg").text("系统发生错误");
						setTimeout(function() {
							$("#append_parent").hide();
						}, 2000)
					}

				})
		})
		//修改帖子
		$("#updateBtns").click(function() {
			var i = 0;
			if ("${fu.fa_ishost}" == 2 || "${fu.fa_sectionid}" == "${faSection.fa_id}" || "${fu.fa_id}"=="${fn.fa_userid}") {
				i = 1;
			}
			if(i>0){
				window.location.href="/note/showUpdateNote.do?id=${fn.fa_id}";
			}
		})
		//删除主题
		$("#deleteNote")
				.click(
						function() {
							var i = 0;
							if ("${fu.fa_ishost}" == 2
									|| "${fu.fa_sectionid}" == "${faSection.fa_id}") {
								i = 1;
							}
							$
									.ajax({
										url : "/note/deleteNote.do",
										data : {
											"ids" : "${fn.fa_id}",
											"ishost" : i
										},
										type : "post",
										dataType : "json",
										success : function(data) {
											if (data.tip == "success") {
												$("#append_parent").show();
												$("#closeTip").hide();
												$("#showMsg").text("删除成功");
												setTimeout(
														function() {
															window.location.href = "/note/showFSection.do?id=${faSection.fa_id}";
														}, 1000)
											} else {
												$("#append_parent").show();
												$("#showMsg").text(data.tip);
												setTimeout(function() {
													$("#append_parent").hide();
												}, 2000)
											}
										},
										error : function() {
											$("#append_parent").show();
											$("#showMsg").text("系统发生错误");
											setTimeout(function() {
												$("#append_parent").hide();
											}, 2000)
										}
									})
						})
		//高亮
		$("#gaoliang").click(
				function() {
					var i = 0;
					if ("${fu.fa_ishost}" == 2
							|| "${fu.fa_sectionid}" == "${faSection.fa_id}") {
						i = 1;
					}
					var j = "${fn.fa_gaoliang}";
					if (j == 1) {
						j = 0;
					} else {
						j = 1;
					}
					$.ajax({
						url : "/note/glNote.do",
						data : {
							"ids" : "${fn.fa_id}",
							"ishost" : i,
							"types" : j
						},
						type : "post",
						dataType : "json",
						success : function(data) {
							if (data.tip == "success") {
								$("#append_parent").show();
								$("#showMsg").text("设置成功");
								setTimeout(function() {
									$("#append_parent").hide();
								}, 1000)
							} else {
								$("#append_parent").show();
								$("#showMsg").text(data.tip);
								setTimeout(function() {
									$("#append_parent").hide();
								}, 2000)
							}
						},
						error : function() {
							$("#append_parent").show();
							$("#showMsg").text("系统发生错误");
							setTimeout(function() {
								$("#append_parent").hide();
							}, 2000)
						}
					})
				})
		//精品
		$("#jingpin").click(
				function() {
					var i = 0;
					if ("${fu.fa_ishost}" == 2
							|| "${fu.fa_sectionid}" == "${faSection.fa_id}") {
						i = 1;
					}
					var j = "${fn.fa_jingpin}";
					if (j == 1) {
						j = 0;
					} else {
						j = 1;
					}
					$.ajax({
						url : "/note/jhNote.do",
						data : {
							"ids" : "${fn.fa_id}",
							"ishost" : i,
							"types" : j
						},
						type : "post",
						dataType : "json",
						success : function(data) {
							if (data.tip == "success") {
								$("#append_parent").show();
								$("#showMsg").text("设置成功");
								setTimeout(function() {
									$("#append_parent").hide();
								}, 1000)
							} else {
								$("#append_parent").show();
								$("#showMsg").text(data.tip);
								setTimeout(function() {
									$("#append_parent").hide();
								}, 2000)
							}
						},
						error : function() {
							$("#append_parent").show();
							$("#showMsg").text("系统发生错误");
							setTimeout(function() {
								$("#append_parent").hide();
							}, 2000)
						}
					})
				})
		//置顶
		$("#zhiding").click(
				function() {
					var i = 0;
					if ("${fu.fa_ishost}" == 2
							|| "${fu.fa_sectionid}" == "${faSection.fa_id}") {
						i = 1;
					}
					var j = "${fn.fa_zhiding}";
					if (j == 1) {
						j = 0;
					} else {
						j = 1;
					}
					$.ajax({
						url : "/note/zdNote.do",
						data : {
							"ids" : "${fn.fa_id}",
							"ishost" : i,
							"types" : j
						},
						type : "post",
						dataType : "json",
						success : function(data) {
							if (data.tip == "success") {
								$("#append_parent").show();
								$("#showMsg").text("设置成功");
								setTimeout(function() {
									$("#append_parent").hide();
								}, 1000)
							} else {
								$("#append_parent").show();
								$("#showMsg").text(data.tip);
								setTimeout(function() {
									$("#append_parent").hide();
								}, 2000)
							}
						},
						error : function() {
							$("#append_parent").show();
							$("#showMsg").text("系统发生错误");
							setTimeout(function() {
								$("#append_parent").hide();
							}, 2000)
						}
					})
				})
		//热搜
		$("#resou").click(
				function() {
					var i = 0;
					if ("${fu.fa_ishost}" == 2
							|| "${fu.fa_sectionid}" == "${faSection.fa_id}") {
						i = 1;
					}
					var j = "${fn.fa_nohot}";
					if (j == 1) {
						j = 0;
					} else {
						j = 1;
					}
					$.ajax({
						url : "/note/rsNote.do",
						data : {
							"ids" : "${fn.fa_id}",
							"ishost" : i,
							"types" : j
						},
						type : "post",
						dataType : "json",
						success : function(data) {
							if (data.tip == "success") {
								$("#append_parent").show();
								$("#showMsg").text("设置成功");
								setTimeout(function() {
									$("#append_parent").hide();
								}, 1000)
							} else {
								$("#append_parent").show();
								$("#showMsg").text(data.tip);
								setTimeout(function() {
									$("#append_parent").hide();
								}, 2000)
							}
						},
						error : function() {
							$("#append_parent").show();
							$("#showMsg").text("系统发生错误");
							setTimeout(function() {
								$("#append_parent").hide();
							}, 2000)
						}
					})
				})
		//移动
		$("#moveNote").click(function() {
			if ($("#moveModel").is(":hidden")) {
				$("#moveModel").show();
			} else {
				$("#moveModel").hide();
			}
		})
		//移动到哪个模块
		$(".moveModels").click(
				function() {
					var t = $(this).prop("id");
					var i = 0;
					if ("${fu.fa_ishost}" == 2
							|| "${fu.fa_sectionid}" == "${faSection.fa_id}") {
						i = 1;
					}
					$.ajax({
						url : "/note/moveNote.do",
						data : {
							"ids" : "${fn.fa_id}",
							"ishost" : i,
							"typeid" : t
						},
						type : "post",
						dataType : "json",
						success : function(data) {
							if (data.tip == "success") {
								$("#append_parent").show();
								$("#showMsg").text("移动成功");
								setTimeout(function() {
									$("#append_parent").hide();
								}, 1000)
							} else {
								$("#append_parent").show();
								$("#showMsg").text(data.tip);
								setTimeout(function() {
									$("#append_parent").hide();
								}, 2000)
							}
						},
						error : function() {
							$("#append_parent").show();
							$("#showMsg").text("系统发生错误");
							setTimeout(function() {
								$("#append_parent").hide();
							}, 2000)
						}
					})
				})
		//升降
		$("#udzz").click(function() {
			if ($("#udsort").is(":hidden")) {
				$("#udsort").show();
			} else {
				$("#udsort").hide();
			}
		})
		//升还是降降
		$(".udsorts").click(
				function() {
					var t = $(this).prop("id");
					var i = 0;
					if ("${fu.fa_ishost}" == 2
							|| "${fu.fa_sectionid}" == "${faSection.fa_id}") {
						i = 1;
					}
					$.ajax({
						url : "/note/udNote.do",
						data : {
							"ids" : "${fn.fa_id}",
							"ishost" : i,
							"typeid" : t
						},
						type : "post",
						dataType : "json",
						success : function(data) {
							if (data.tip == "success") {
								$("#append_parent").show();
								$("#showMsg").text("设置成功");
								setTimeout(function() {
									$("#append_parent").hide();
								}, 1000)
							} else {
								$("#append_parent").show();
								$("#showMsg").text(data.tip);
								setTimeout(function() {
									$("#append_parent").hide();
								}, 2000)
							}
						},
						error : function() {
							$("#append_parent").show();
							$("#showMsg").text("系统发生错误");
							setTimeout(function() {
								$("#append_parent").hide();
							}, 2000)
						}
					})
				})
		//导出
		$('#excelbtn')
				.click(
						function() {
							window.location.href = "${path}/note/excelToActive.do?id=${fn.fa_id}";
						});
		//我要报名
		$("#myjoin").click(function() {
			$.ajax({
				url : "/note/myjoin.do",
				data : {
					"nid" : "${fn.fa_id}",
					"total" : "${fn.fa_total_people}"
				},
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data.tip == "success") {
						$("#append_parent").show();
						$("#showMsg").text("报名成功");
						setTimeout(function() {
							$("#append_parent").hide();
						}, 1000)
					} else {
						$("#append_parent").show();
						$("#showMsg").text(data.tip);
						setTimeout(function() {
							$("#append_parent").hide();
						}, 2000)
					}
				},
				error : function() {
					$("#append_parent").show();
					$("#showMsg").text("系统发生错误");
					setTimeout(function() {
						$("#append_parent").hide();
					}, 2000)
				}
			})
		})
		//标签
		$("#biaoqian").click(function() {
			if ($("#biaoqians").is(":hidden")) {
				$("#biaoqians").show();
			} else {
				$("#biaoqians").hide();
			}
		})
		$(".biaoqianss").click(
				function() {
					var t = $(this).prop("id");
					var i = 0;
					if ("${fu.fa_ishost}" == 2
							|| "${fu.fa_sectionid}" == "${faSection.fa_id}") {
						i = 1;
					}
					$.ajax({
						url : "/note/biaoqianNote.do",
						data : {
							"ids" : "${fn.fa_id}",
							"ishost" : i,
							"typeid" : t
						},
						type : "post",
						dataType : "json",
						success : function(data) {
							if (data.tip == "success") {
								$("#append_parent").show();
								$("#showMsg").text("设置成功");
								setTimeout(function() {
									$("#append_parent").hide();
								}, 1000)
							} else {
								$("#append_parent").show();
								$("#showMsg").text(data.tip);
								setTimeout(function() {
									$("#append_parent").hide();
								}, 2000)
							}
						},
						error : function() {
							$("#append_parent").show();
							$("#showMsg").text("系统发生错误");
							setTimeout(function() {
								$("#append_parent").hide();
							}, 2000)
						}
					})
				})
		if (Number("${issign}") > 0) {
			$("#qiandao").text("已签到")
		} else {
			$("#qiandao").html("签&nbsp;到")
		}
		//签到
		$("#qiandao").click(function() {
			if ("${fu}" != null && "${fu}" != "") {
				$.ajax({
					url : "/note/signIsTrue.do",
					type : "post",
					dataType : "json",
					success : function(data) {
						if (data.tip == "success") {
							$(".tips_signin").show();
							$("#tipz").html('恭喜你，签到成功')
							setTimeout(function() {
								$(".tips_signin").hide();
							}, 2000)
						} else {
							$(".tips_signin").show();
							$("#tipz").html(data.tip)
							setTimeout(function() {
								$(".tips_signin").hide();
							}, 2000)
						}
					},
					error : function() {
						$(".tips_signin").show();
						$("#tipz").html('系统发生异常,请稍后再操作')
						setTimeout(function() {
							$(".tips_signin").hide();
						}, 2000)
					}
				})

			} else {
				$(".tips_signin").show();
				$("#tipz").html('请先<a href="/login.do">登录</a>')
				setTimeout(function() {
					$(".tips_signin").hide();
				}, 2000)
			}

		})
		//预览
		$("#bianji1").click(function() {
			$("#bj1").hide();
			$("#bj2").show();

		})

		//编辑
		$("#bianji2").click(function() {
			$("#bj2").hide();
			$("#bj1").show();

		})
		//确认编辑编辑
		$("#suredese").click(function() {
			$.ajax({
				url : "/note/updateSectionMsg.do",
				data : {
					"nid" : "${faSection.fa_id}",
					"desc" : $("#descss").val()
				},
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data.tip == "success") {
						$("#append_parent").show();
						$("#showMsg").text("修改成功");
						$(".eeeee").html($("#descss").val())

						setTimeout(function() {
							$("#append_parent").hide();
						}, 1000)
					} else {
						$("#append_parent").show();
						$("#showMsg").text(data.tip);
						setTimeout(function() {
							$("#append_parent").hide();
						}, 2000)
					}
				},
				error : function() {
					$("#append_parent").show();
					$("#showMsg").text("系统发生异常，请重新操作");
					setTimeout(function() {
						$("#append_parent").hide();
					}, 2000)
				}
			})

		})
		//回复
		$("#fabiaos").click(
				function() {
					
					$.ajax({
						url : "/note/createCommentByNote.do",
						data : $("#userForm").serialize(),
						type : "post",
						dataType : "json",
						success : function(data) {
							if (data.tip == "success") {
								$("#append_parent").show();
								$("#closeTip").hide();
								$("#showMsg").text("发表成功");
								$("#zxcvzz").val("");
								/* KE.html("content1", ""); */
								UE.getEditor('newsEditor').setContent("","")
								var cp = Number(($("#fifthpage").text()))
								$(".vmss").trigger("click");
								$(".owenpl").hide();
								pageData({
									"curpage" : cp,
									"id" : "${fn.fa_id}"
								}, url)
								setTimeout(function() {
									$("#closeTip").show();
									$("#append_parent").hide();
								}, 1000)
							} else {
								$("#append_parent").show();
								$("#showMsg").text(data.tip);
								setTimeout(function() {
									$("#append_parent").hide();
								}, 2000)
							}
						},
						error : function() {
							$("#append_parent").show();
							$("#showMsg").text("系统发生错误");
							setTimeout(function() {
								$("#append_parent").hide();
							}, 2000)
						}
					})
				})
		$("#fj_btns").click(function() {
			$("#tzs").val($("#fj_btnsz").val())
			pageData({
				"curpage" : 1,
				"id" : "${fn.fa_id}",
				"floor" : $("#fj_btnsz").val()
			}, url)

		})
	})
	function pageData(data, url) {
		$
				.ajax({
					url : url,
					data : data,
					type : "post",
					dataType : "json",
					success : function(data) {
						var vas = "";
						/* 
						
						 */
						if (data.rows != null && data.rows.length > 0) {
							var iaa = 0;
							if ("${fu.fa_ishost}" == 2
									|| "${fu.fa_sectionid}" == "${faSection.fa_id}" || "${fn.fa_userid}"=="${fu.fa_id}") {
								iaa = 1;
							}
							for (i in data.rows) {
								var vat = '<div  class="item_postlist graybar_postlist" id="'+data.rows[i].floor+'s"><table  cellspacing="0" cellpadding="0"><col width="64px" /><col width="594px" /><tr><td class="pls" rowspan="2"><div><div class="avatar head_uinfo"><img src="'+data.rows[i].image+'" /><span class="shadowbox_avatar"> </span></div></div></td><td class="plc"><div class="pi infobar_post"><div class="barr_post"><strong class="z floor_infobar"> <a href="javascript:void(0)" >'
										+ data.rows[i].floor
										+ '楼</a></strong></div><div class="pti barl_post"><div class="pdbt"></div><div class="authi"><a class="name_uinfo" href="/fiioer/showMemberMsg.do?id='
										+ data.rows[i].uid
										+ '" class="xw1">'
										+ data.rows[i].uname
										+ '</a><em class="userlevel_uinfo"> <a class="mzvip" href="javascript:void(0)">'
										if(data.rows[i].rimage!=null && data.rows[i].rimage!=""){
											vat = vat +'<img src="'+data.rows[i].rimage+'" width="15px">'
										}
										
										
										vat = vat +'</a><a href="javascript:void(0)" class="mzpower"><font color="#999999">'
										+ data.rows[i].rname
										+ '</font></a> <span class="cr"></span></em> <span ><span>'
										+ data.rows[i].day
										+ '</span></span></div></div></div><div class="pct postcont_postlist fontsizelimit"><div class="pcb"><div class="pcbs" id="'+data.rows[i].id+'qwer"><table cellspacing="0" cellpadding="0"><tr><td class="t_f" ><div>'
										+ data.rows[i].msg
										+ '</div></td></tr></table></div>'
										+'</div></div></td></tr><tr><td class="plc plm"></td></tr><tr><td class="pls"></td><td class="plc cbar_postlist"><div class="score_post"><a href="javascript:void(0)" class="xi2"></a></div><div class="po cbarbox_postlist"><div class="pob"><a class="fastre hfs" href="javascript:;">回复</a>';
										
										if(iaa>0){
											vat = vat + '<a class="fastre" href="javascript:;" onclick="deletepl(this.id)" id="'+data.rows[i].id+'scc" >删除</a>'

										}
										
										vat = vat
										+ 		'<a id="'+data.rows[i].uid+'hf" class="support_oppose fanduis" href="javascript:;" id="'+data.rows[i].uid+'fd" > <i></i></a> <a id="recommend_add_157768709" class="support_oppose zhichis" href="javascript:;" id="'+data.rows[i].uid+'zc"> <i></i></a> <em> </em><div class="cr"></div></div></div><div class="cr"></div></td></tr><tr class="ad"></td></tr></table>';
								vat = vat
										+ '<div  style="display: none;width: 658px;" class="flw_replybox cl ct owenpl" id="'+data.rows[i].floor+'z"><span class="cnr" style="margin-right: 5px;"></span><form id="'+data.rows[i].id+'forms" class="mbm"><input type="hidden" name="iscode" value="${iscode}" ><input type="hidden" name="pid" value="'+data.rows[i].id+'" ><input type="hidden" name="rid" value="${fn.fa_id}" > <span class="flw_autopt"> <textarea name="desc" class="pts" cols="80" rows="4"></textarea></span><div style="margin: 30px 0px;"><button type="button" style="float:right; margin-left:20px;    background: #11b1e5 !important;"  class="pn pnc qrhf"><span>回复</span></button><div class="cr"></div><div class="mtm">'
								if (Number("${iscode}") > 0) {
									vat = vat
											+ '<ul><li><em class="d">验证码</em><span id="seccodeSA0"><input name="vode" id="seccodeverify_SA0" type="text" style="ime-mode: disabled; width: 100px" class="txt px vm"> <span id="seccode_SA0_secshow" class="seccode_image"><img width="150" height="60" src="${path}/verify/show.do" class="vm vmss"></span>  <span id="checkseccodeverify_SA0" class="seccheck_status"></span></span></li></ul>'
								}

								vat = vat
										+ '</div></form><ul id="'+data.rows[i].id+'ul" class="list_replybox"><input type="hidden" id="'+data.rows[i].id+'ip" value="1" /></ul><div class="cl closebar_replybox"><a href="javascript:;" class="y xg1 xg2 qwertyus"></a>'
										+ '</div></div></div></div>';
								vas = vas + vat;

							}

							$("#sessionMsg").html(vas)
							for (i in data.rows) {
								huifus(data.rows[i].id)
							}
							
							if (data.curpage == 1) {
								$("#postlist").show();
							} else {
								$("#postlist").hide();
							}
							if (data.isfloor > 0) {
								location.href = "#" + $("#tzs").val() + "s"
								$("#" + $("#tzs").val() + "z").show();
								var id = $("#" + $("#tzs").val() + "s").find(
										'ul.list_replybox').prop("id");
								id = id.substring(0, id.length - 2)
								//加载
								$
										.ajax({
											url : "/note/getMoreMoodMsg.do",
											data : {
												"id" : id,
												"curpage" : $("#" + id + "ip")
														.val()
											},
											type : "post",
											dataType : "json",
											success : function(data) {
												var vaq = "";
												if (data.rows != null
														&& data.rows.length > 0) {
													for (i in data.rows) {
														var vat = '<li><a href="javascript:void(0)" class="d xi2">'
																+ data.rows[i].name
																+ '&nbsp;&nbsp;</a>'
																+ data.rows[i].msg
																+ '</li>';
														vaq = vaq + vat
													}

													//追加到页面
													if ($("#" + data.id + "ip")
															.val() >= data.totalpage) {
														$("#" + data.id + "aa")
																.hide();
													} else {
														$("#" + data.id + "aa")
																.show();
													}
													$("#" + data.id + "ip")
															.val(
																	Number($(
																			"#"
																					+ data.id
																					+ "ip")
																			.val()) + 1);
													$("#" + data.id + "ul")
															.append(vaq)

												} else {

													$("#" + data.id + "aa")
															.hide();

												}
											}

										})

							}

						} else {
							$("#sessionMsg")
									.html(
											'<div class="item_postlist graybar_postlist"><br>该帖子还没有任何评论<br></div>')
						
							$("#fj_btn").hide();
						}

						//加到分页页面curpage
						$("#curpage").text(data.curpage);
						$("#totalsize").val(data.totalsize);
						$("#secondpage").text(Number(data.curpage) + 1);
						$("#thirdpage").text(Number(data.curpage) + 2);
						$("#forthpage").text(Number(data.curpage) + 3);
						$("#fifthpage").text(Number(data.totalpage));
						if (data.curpage == 1) {
							$("#lastpage").hide();
						} else {
							$("#lastpage").show();
						}
						if (data.curpage >= data.totalpage) {
							$("#nextpage").hide();
							$("#secondpage").hide();
						} else {
							$("#nextpage").show();
							$("#secondpage").show();
						}
						if (Number(data.curpage) + 2 > data.totalpage) {
							$("#thirdpage").hide();
						} else {
							$("#thirdpage").show();
						}
						if (Number(data.curpage) + 3 > data.totalpage) {
							$("#forthpage").hide();
						} else {
							$("#forthpage").show();
						}
						if (Number(data.curpage) + 3 >= Number(data.totalpage)) {
							$("#fifthpage").hide();
						} else {
							$("#fifthpage").show();
						}

						//关闭
						$(".qwertyus").click(function() {
							$(this).parent().parent().parent().parent().hide();
						})
						
						//点击回复
						$(".hfs").click(function() {
							var divs = $(this).parent().parent().parent().parent().parent().parent().parent().find('div.owenpl');
							if (divs.is(":hidden")) {
								$(".vmss").trigger("click");
								divs.show();
							} else {
								divs.hide();
							}
							var id = $(this).parent().parent().parent().parent().parent().parent().parent().find('div.owenpl').find('ul.list_replybox').prop("id");
							id = id.substring(0, id.length - 2)
							
						})
						//确认回复
						$(".qrhf").click(function() {
							var divs = $(this).parent().parent().prop("id");
							if("${fu}"==null ||"${fu}"==""){
									$("#append_parent").show();
									$("#showMsg").text("请先登录");
									setTimeout(function() {
										$("#append_parent").hide();
									}, 2000)
							}else{
									$.ajax({
										url : "/fiioer/sureReply.do",
										data : $("#" + divs).serialize()+ "&fid=${fu.fa_id}",
										type : "post",
										dataType : "json",
										success : function(data) {
													if (data.tip == "success") {
														$("#append_parent").show();
														$("#showMsg").text("回复成功");
														$(".pts").val("");
														$(".vm").val("");
														$(".vmss").trigger("click");
														
														if($("#"+ data.id+ "aa").parent().parent().is(":hidden")){
															var vat = '<div class="pstl"><div class="psti"><a href="#" class="xi2 uname_pasth">${fu.fa_username}</a><a class="#">&nbsp;:&nbsp;'+ data.msg+ '</a><span class="xg1"><span>1分钟前</span></span><span class="cr"> </span></div></div>';
															
															$("#"+ data.id+ "aa").parent().parent().before(vat)
														}				
																		
														setTimeout(function() {$("#append_parent").hide();
																		}, 2000)
													} else {
														$("#append_parent").show();
														$("#showMsg").text(data.tip);
														$(".vmss").trigger("click");
														setTimeout(
															function() {
																$("#append_parent").hide();
																}, 2000)
															}
														},
														error : function() {
															$("#append_parent")
																	.show();
															$("#showMsg").text(
																	"系统发生错误");
															setTimeout(
																	function() {
																		$(
																				"#append_parent")
																				.hide();
																	}, 2000)
														}

													})
											}
										})

						//验证码
						$(".vmss").click(
								function() {
									$(".vmss").attr(
											"src",
											"${path}/verify/show.do?random="
													+ Math.random());
								})

					},
					error : function() {
						$("#append_parent").show();
						$("#showMsg").text("系统发生错误");
						setTimeout(function() {
							$("#append_parent").hide();
						}, 2000)
					}
				})
				
	}
	function trueorfalse(id, tor) {
		$.ajax({
					url : "/note/trueOrFalseByNote.do",
					data : {
						"id" : id,
						"tof" : tor
					},
					type : "post",
					dataType : "json",
					success : function(data) {

						$("#append_parent").show();
						$("#showMsg").text(data.tip);
						setTimeout(
								function() {
									$("#append_parent").hide();
									window.location.href = "/note/showNoteContent.do?id=${fn.fa_id}";
								}, 2000)

					},
					error : function() {
						$("#append_parent").show();
						$("#showMsg").text("系统发生错误");
						setTimeout(function() {
							$("#append_parent").hide();
						}, 2000)
					}

				})
	}
	function deletepl(id){
		id = id.substring(0, id.length - 3)
		
		$.ajax({
			url:"/note/deletepl.do",
			data:{"id":id,"nid":"${fn.fa_id}"},
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.tip=="success"){
					$("#"+id+"scc").parent().parent().parent().parent().parent().parent().parent().hide();
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
	function huifus(id){
		//加载
		$.ajax({
			url : "/note/getMoreMoodMsg.do",
			data : {"id" : id,"curpage" : $("#"+ id+ "ip").val()},
			type : "post",
			dataType : "json",
			success : function(data) {
						var vaq = '<div  class="cm comment_post"><div class="comminner_post"  >';
						if (data.rows != null&& data.rows.length > 0) {
							for (i in data.rows) {
								var vat = '<div class="pstl"><div class="psti"><a href="#" class="xi2 uname_pasth">'+ data.rows[i].name+ '</a><a class="#">&nbsp;:&nbsp;'+ data.rows[i].msg+ '</a><span class="xg1"><span>&nbsp;&nbsp;'+ data.rows[i].times+ '</span></span><span class="cr"> </span></div></div>';
								vaq = vaq+ vat
							}

							vaq = vaq+'<div class="pstl"><div class="psti"><a href="javascript:void(0)" id="'+id+'aa" class="xi2 uname_pasth  ggcv" onclick="zjgd(this.id)" >加载更多》》》</a><span class="xg1"></span><span class="cr"> </span></div></div>';
							
							
							
							$("#"+ id+ "qwer").append(vaq)
							//追加到页面
							if ($("#"+ data.id+ "ip").val() >= data.totalpage) {
								$("#"+ data.id+ "aa").parent().parent().hide();
							} else {
								$("#"+ data.id+ "aa").parent().parent().show();
							}
							$("#"+ data.id+ "ip").val(Number($("#"+ data.id+ "ip").val()) + 1);

						} else {
							$("#"+ data.id	+ "aa").parent().parent().hide();

						}
						
						
						
					}
			

			})
	}
	function zjgd(id){
		id = id.substring(0,id.length - 2)
		//加载
		$.ajax({
			url : "/note/getMoreMoodMsg.do",
			data : {"id" : id,"curpage" : $("#"+ id+ "ip").val()},
			type : "post",
			dataType : "json",
			success : function(data) {
						var vaq = '';
						if (data.rows != null&& data.rows.length > 0) {
							for (i in data.rows) {
								var vat = '<div class="pstl"><div class="psti"><a href="#" class="xi2 uname_pasth">'+ data.rows[i].name+ '</a><a class="#">&nbsp;:&nbsp;'+ data.rows[i].msg+ '</a><span class="xg1"><span>&nbsp;&nbsp;'+ data.rows[i].times+ '</span></span><span class="cr"> </span></div></div>';
								vaq = vaq+ vat
							}

							
							
							
							$("#"+ id+ "aa").parent().parent().before(vaq)
							 //追加到页面
							 if ($("#"+ data.id+ "ip").val() >= data.totalpage) {
								$("#"+ data.id+ "aa").parent().parent().hide();
							} else {
								$("#"+ data.id+ "aa").parent().parent().show();
							}
							$("#"+ data.id+ "ip").val(Number($("#"+ data.id+ "ip").val()) + 1);

						} else {
							$("#"+ data.id	+ "aa").parent().parent().hide();

						}
						
						
						
					}
			

			})
	}
</script>
</html>
