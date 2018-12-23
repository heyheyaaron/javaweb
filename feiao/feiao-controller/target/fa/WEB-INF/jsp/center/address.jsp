<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="/data/cache/style_1_common.css" />
        <link rel="stylesheet" type="text/css" href="/data/cache/style_1_home_spacecp.css"/>
        <script src="/js/jquery.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="/css/header.css"/>
        <style >
        	.address_tit .address_mid .address_s select {
			    width: 94px;
			    height: 38px;
			    line-height: 38px;
			    border: 2px solid #a8a8a8;
			    text-indent: 0em;
			  }
			  .address_mid {
				    height: 390px !important;
}
        </style>
 </head>
 <body>
        <div class="address_tit" id="adressz">
        		<form id="userForm">
                <div class="address_mid">
                		<input type="hidden" name="fa_id" id="ids" />
                        <input type="text" class="address_input" name="fa_name" id="name" placeholder="姓名">
                        <input type="text" class="address_input" name="fa_tel"  id="tel" placeholder="手机号" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');">
                        <div class="address_s" id="city">
                        <table>
                        	<tr>
                        		<td>
                        		<select name="fa_pr" class="prov">
                                        
                                </select>
                        		</td>
                        		<td>
                        		<select  name="fa_ci" class="city">
                                </select>
                        		</td>
                        		<td>
                        		<select class="dist" name="fa_ar">
                                        
                                </select>
                        		</td>
                        	</tr>
                        </table>
                        </div>
                        
                        <textarea rows="3" placeholder="详细地址" name="fa_detail" id="detail"></textarea>
                        <input type="text" class="address_input" placeholder="邮政编码" id="map" name="fa_map" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');">
                        
                        <div class="address_bot">
                                <input type="button" class="but" id="sureBtn" value="确认">
                                <input type="button" class="but quxiao" value="取消" id="cancelBtn"><font color="red" id="tip" style="float: right;"></font>&nbsp;&nbsp;&nbsp;
                        </div>
                </div>
                </form>
        </div>
        <!--address_tit end-->
        <c:import url="${path}/feiiohead.jsp"></c:import>
        
        <div id="wp" class="wp">
                <div id="ct" class="ct2_a wp cl">
                        <c:import url="${path}/feiiombright.jsp"></c:import>
                        <div class="mn cont_wp float_l">
                                <div class="bm bw0 page_frame_navigation">
                                        <ul class="tb cl page_frame_ul" style="padding-left:20px;">
                                                <li><a href="javascript:void(0)" style="font-size: 16px;">收货地址</a></li>
                                        </ul>
                                </div>
                                <div class="tips_sresult">
                                </div>
                                <div class="sresult_ulist">
                                        <ul class="buddy cl relat_ulist" id="fiioData">
                                                
                                                
                                        </ul>
                                </div>
                                <div class="mtm pgs cl pagebar">
                                </div>
                        </div>
                </div>
                <c:import url="${path}/feiiombend.jsp"></c:import>
                </body>
                <script type="text/javascript" src="/js/commom.js"></script>
                <script type="text/javascript" src="/js/city.min.js"></script>
                <script type="text/javascript" src="/js/jquery.cityselect.js"></script>
                <script type="text/javascript">
                $(".bbda").click(function() {
                        $(".address_tit").show();
                });
                $(".quxiao").click(function() {
                        $(".address_tit").hide();
                });
                    login();
                       loginbox();
                </script>
                <script type="text/javascript">
                	$(function(){
                		/* $("#city").citySelect({   
            			    url:"${path}/js/city.min.js",   
            			    prov:"${businessBase.licPr}", //省份  
            			    city:"${businessBase.licCi}", //城市  
            			    nodata:"${businessBase.licAr}" //当子集无数据时，隐藏select  
            			}); */
            			//展示数据
            			$.ajax({
            				url:"/fiioer/SelectMyAllAdress.do",
            				type:"post",
            				dataType:"json",
            				success:function(data){
            					
            					var vas = '<li class="bbda cl" style="cursor: pointer;"><div class="bbda_pic czjz"><a href="javascript:void(0)"><img src="/img/address.png"></a></div><h2><a href="javascript:void(0)" >添加新地址</a></h2></li>';
            					
            					if(data!=null && data !=''){
            						
            						for (var i=0;i<data.length;i++){
            							var faar = "";
                						if(data[i].fa_ar!=null){
                							faar =data[i].fa_ar;
                						}
                						var desv = data[i].fa_detail;
                						if(desv.length>16){
                							desv=desv.substring(0,15)+"......";
                						}
            							var vat = '<li class="cl"><h3><a href="javascript:void(0)" id="'+data[i].fa_id+'name">'+data[i].fa_name+'</a></h3><p><a href="javascript:void(0)" id="'+data[i].fa_id+'tel">'+data[i].fa_tel+'</a></p><p><a href="javascript:void(0)" id="'+data[i].fa_id+'pr">'+data[i].fa_pr+'</a> <a href="javascript:void(0)" id="'+data[i].fa_id+'ci">'+data[i].fa_ci+'</a>  <a href="javascript:void(0)" id="'+data[i].fa_id+'ar">'+faar+'</a></p><p><a href="javascript:void(0)" id="'+data[i].fa_id+'detail"  title="'+data[i].fa_detail+'">'+desv+'</a></p><p>(<a href="javascript:void(0)" id="'+data[i].fa_id+'map">'+data[i].fa_map+'</a>)</p><span class="fr"><a href="javascript:void(0)" style="padding-right: 10px;" class="updateAdress" id="'+data[i].fa_id+'">修改</a><a href="javascript:void(0)" id="'+data[i].fa_id+'del" class="deletes">删除</a></span></li>'
            							vas = vas +vat
            						}
            						
            					}
            					
            					$("#fiioData").html(vas);
            					$(".updateAdress").click(function(){
            						$("#adressz").show();
            						var id = $(this).prop("id");
            						$("#ids").val(id)
                    				$("#name").val($("#"+id+"name").text())
                    				$("#tel").val($("#"+id+"tel").text())
                    				$("#detail").val($("#"+id+"detail").text())
                    				$("#map").val($("#"+id+"map").text())
                    				$("#city").citySelect({   
        							    url:"${path}/js/city.min.js",   
        							    prov:$("#"+id+"pr").html(), //省份  
        							    city:$("#"+id+"ci").html(), //城市  
        							    dist:$("#"+id+"qu").html(), //区县  
        							    nodata:"none" //当子集无数据时，隐藏select  
        							});
            					})
            					//删除
            					$(".deletes").click(function(){
            						var id = $(this).prop("id");
            						id=id.substring(0,id.length-3);
            						$.ajax({
                    					url:"/fiioer/deleteAdress.do",
                    					data:{"id":id},
                    					type:"post",
                    					dataType:"json",
                    					success:function(data){
                    						if(data.tip=="success"){
                    							window.location.reload();
                    						}
                    						
                    						
                    					},
                    					error:function(){
                    						
                    					}
                    				})
            					});
            					//增加联系人按钮
                    			$(".bbda").click(function(){
                    				$("#adressz").show();
                    				$("#ids").val("")
                    				$("#name").val("")
                    				$("#tel").val("")
                    				$("#detail").val("")
                    				$("#map").val("")
                    				$("#city").citySelect({   
                					    url:"${path}/js/city.min.js",   
                					    prov:"北京", //省份  
                					    city:"东城区", //城市  
                					    nodata:"none" //当子集无数据时，隐藏select  
                					});
                    			})
            					
            				},
            				error:function(){
            					
            				}
            			})
                		$("#city").citySelect({   
    					    url:"${path}/js/city.min.js",   
    					    prov:"北京", //省份  
    					    city:"东城区", //城市  
    					    nodata:"none" //当子集无数据时，隐藏select  
    					});
            			$("#cancelBtn").click(function(){
            				window.location.reload();
            			})
            			/* 新增或修改联系人 */
            			$("#sureBtn").click(function(){
            				$.ajax({
            					url:"/fiioer/saveOrUpdateAdress.do",
            					data:$("#userForm").serialize(),
            					type:"post",
            					dataType:"json",
            					success:function(data){
            						if(data.tip=="success"){
            							$("#tip").text("保存成功")
                						setTimeout(function() {
    										$("#tip").text("");
    									}, 2000);
            						}else{
            							$("#tip").text("系统发生错误")
                						setTimeout(function() {
    										$("#tip").text("");
    									}, 2000);
            						}
            					},
            					error:function(){
            						$("#tip").text("系统发生错误")
            						setTimeout(function() {
										$("#tip").text("");
									}, 2000);
            					}
            				})
            			})
                	})
                </script>

</html>
