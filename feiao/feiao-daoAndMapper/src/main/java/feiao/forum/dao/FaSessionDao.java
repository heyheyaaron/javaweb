package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaIgnore;
import feiao.forum.pojo.FaSession;

@Repository
public interface FaSessionDao {
	//查询未读的会话信息的发送者id
	Long getSendIdOnRed(String fa_id);
	//屏蔽好友的会话记录
	void closeMyFriendsRoom(List<FaIgnore> list);
	//根据id 恢复屏蔽好友的会话
	void resetMySession(@Param("id")String fa_id, @Param("list")List<String> dellist, @Param("types")Integer i);
	//分页查询我的会话页面
	List<Map<String, Object>> findMySessionRoom(String fa_id, Integer curpage, Integer pagesize);
	//分页查询会话信息总数
	Long selectMySendOrGetMsgCount(String fa_id);
	//查询该会话的总数
	Long findCountById(String string);
	//查询未读信息总数
	Long findCountByIdAndNoRead(String string);
	//根据会话室查询最新的一条信息
	FaSession getNewMsgById(String string);
	//批量删除对话
	void deleteSessionAndRoom(@Param("id")String fa_id, @Param("ids")String[] ids);
	//批量删除对话里的内容
	void deleteSessionAndContene(@Param("id")String fa_id, @Param("ids")String[] ids);
	//批量对话已读
	void msgHasRead(@Param("id")String fa_id, @Param("ids")String[] ids);
	//查询我跟她的会话室
	List<Map<String, Object>> getMyAndFriendRoom(String fa_id, String fid);
	//查询我跟她有没有会话室
	Map<String, Object> getMyAndFriendRoomByMine(String fa_id, String fid);
	//批量插入会话室信息
	void saveRoomMsg(List<Map<String, Object>> listroom);
	//批量插入会话信息
	void saveSessionMsg(List<FaSession> listsession);
	//分页查询我和好友的消息页面
	List<Map<String, Object>> selectMyFriendAndMeMsgByPage(String mid, String fid, Integer curpage, Integer pagesize);
	//分页查询我和好友的消息数量
	Long selectMyFriendAndMeMsgByCount(String mid, String fid);
	//查询room id;
	String getRoomIdByFriendAndMine(String mid, String fid);
	//删除某条信息
	void deleteSessionMsgByPid(String id, String idr);
	//某条会话信息已读
	void MsgIsReadById(String id);
}
