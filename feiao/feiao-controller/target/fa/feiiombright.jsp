<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	
</head>
<body>
	<div class="back_left bdl ">
                        <dl class="a" id="lf_">
                                <dt>个人中心</dt>
                                <dd id="myi">
                                        <a href="/fiioer/myFriendsMood.do">动态</a>
                                </dd>
                                <dd id="myn">
                                        <a href="/fiioer/myNote.do">帖子</a>
                                </dd>
                                <dd id="myf">
                                        <a href="/fiioer/myFollow.do">关系</a>
                                </dd>
                                <dd id="mym">
                                        <a href="/fiioer/myGetMsg.do">消息</a>
                                </dd>
                                <dd  id="mys">
                                        <a href="/fiioer/mySelfMsg.do">设置</a>
                                </dd>
                                <dd id="myo">
                                        <a href="/fiioer/myOrder.do">兑换单</a>
                                </dd >
                                <dd id="myl">
                                        <a href="/fiioer/myLottery.do">中奖记录</a>
                                </dd> 
                                 <!-- <dd id="myp">
                                                <a href="/fiioer/myProduct.do">我的产品</a>
                                        </dd> -->
                                   <dd id="mya">
                                                <a href="/fiioer/myAdress.do">收货地址</a>
                                        </dd>
                                <dd >
                                        <div style="height:18px; width:100%;"></div>
                                </dd>
                        </dl>
                </div>
</body>
<script type="text/javascript">
	$(function(){
		var test = window.location.pathname;
		if(test=="/fiioer/myFriendsMood.do"){
			$("#myi").addClass("bdl_a");
		}else if(test=="/fiioer/myNote.do"){
			$("#myn").addClass("bdl_a");
		}else if(test=="/fiioer/myFollow.do"){
			$("#myf").addClass("bdl_a");
		}else if(test=="/fiioer/myGetMsg.do"){
			$("#mym").addClass("bdl_a");
		}else if(test=="/fiioer/mySelfMsg.do"){
			$("#mys").addClass("bdl_a");
		}else if(test=="/fiioer/myOrder.do"){
			$("#myo").addClass("bdl_a");
		}else if(test=="/fiioer/myLottery.do"){
			$("#myl").addClass("bdl_a");
		}else if(test=="/fiioer/myProduct.do"){
			$("#myp").addClass("bdl_a");
		}else if(test=="/fiioer/myAdress.do"){
			$("#mya").addClass("bdl_a");
		}
		//个人信息设置
		else if(test=="/fiioer/myJob.do"){
			$("#mys").addClass("bdl_a");
		}
		else if(test=="/fiioer/myActive.do"){
			$("#mys").addClass("bdl_a");
		}
		else if(test=="/fiioer/updateMyImage.do"){
			$("#mys").addClass("bdl_a");
		}
		else if(test=="/fiioer/myInte.do"){
			$("#mys").addClass("bdl_a");
		}
		else if(test=="/fiioer/InteRole.do"){
			$("#mys").addClass("bdl_a");
		}
		else if(test=="/fiioer/InteData.do"){
			$("#mys").addClass("bdl_a");
		}
		else if(test=="/fiioer/myGroup.do"){
			$("#mys").addClass("bdl_a");
		}
		else if(test=="/fiioer/myModel.do"){
			$("#mys").addClass("bdl_a");
		}
		else if(test=="/fiioer/myPrivacy.do"){
			$("#mys").addClass("bdl_a");
		}
		else if(test=="/fiioer/myState.do"){
			$("#mys").addClass("bdl_a");
		}
		else if(test=="/fiioer/myLabel.do"){
			$("#mys").addClass("bdl_a");
		}
		//我的关系设置
		else if(test=="/fiioer/searchMemberResult.do"){
			$("#myf").addClass("bdl_a");
		}
		else if(test=="/fiioer/myListener.do"){
			$("#myf").addClass("bdl_a");
		}
		else if(test=="/fiioer/myFriend.do"){
			$("#myf").addClass("bdl_a");
		}
		else if(test=="/fiioer/searchMember.do"){
			$("#myf").addClass("bdl_a");
		}
		//个人动态
		else if(test=="/fiioer/myFriendsMood.do"){
			$("#myi").addClass("bdl_a");
		}
		else if(test=="/fiioer/showFiioNote.do"){
			$("#myi").addClass("bdl_a");
		}
		//我的消息
		else if(test=="/fiioer/mySystemMsg.do"){
			$("#mym").addClass("bdl_a");
		}
		else if(test=="/fiioer/myRemind.do"){
			$("#mym").addClass("bdl_a");
		}
		else if(test=="/fiioer/myMoodShow.do"){
			$("#mym").addClass("bdl_a");
		}
		//我的帖子
		else if(test=="/fiioer/myNoteComment.do"){
			$("#myn").addClass("bdl_a");
		}
		else if(test=="/fiioer/myNoteCollect.do"){
			$("#myn").addClass("bdl_a");
		}
	})
</script>
</html>