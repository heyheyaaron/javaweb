package feiao.forum.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaSentMessage;

@Repository
public interface FaSentMessageDao {
	//保存站内发送的信息
	void saveMsg(FaSentMessage fsm);
	//站内发送的信息(群发)
	void saveMsgs(List<FaSentMessage> listz);
	//加好友(发送消息)
	void saveFriendMsg(FaSentMessage fsm);
	//查询未读的提醒信息的数量
	Long getTixingOnRed(String fa_id);
	//分页查询系统消息
	List<Map<String, Object>> selectSystemMsgByPage(String fa_id, Integer curpage, Integer pagesize);
	//分页查询系统消息数量
	Long selectSystemMsgCount(String fa_id);
	//批量删除系统消息
	void deleteMsgByIds(@Param("id")String fa_id, @Param("ids")String[] ids);
	//批量已读系统信息
	void systemMsgHasRead(@Param("id")String fa_id, @Param("ids")String[] ids);
	//分页查询我的提醒
	List<Map<String, Object>> selectRemindBypage(String fa_id, Integer curpage, Integer pagesize);
	//分页查询我的提醒数量
	Long selectRemindByCount(String fa_id);
	//删除某个提醒
	void deleteSystemRemind(String fa_id, String id);
	//改变好友申请信息状态 根据2个会员
	void updateFriendApplyStatus(String fa_id, String id, Integer i, Date date);
	//根据两个id 和类型查询信息
	FaSentMessage getFsmByUserIdAndFid(String id, String fa_id, Integer i);
	//改变好友申请信息状态 根据id
	void updateFriendMsg(FaSentMessage fsm);
	
	
}
