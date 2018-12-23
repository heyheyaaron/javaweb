package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaFriendType;

@Repository
public interface FaFriendTypeDao {
	//根据id查询屏蔽的好友分组
	List<Map<String, Object>> getIgnoreForGroup(String fa_id);
	//把该用户的用户组先不屏蔽
	void showGroupForUserId(String id);
	//屏蔽指定用户组
	void CloseGroupForId(String[] ids);
	//保存用户组
	void saveFriendTypes(List<FaFriendType> lf);
	//查询我的所有分组信息
	List<FaFriendType> getAllGroupById(String fa_id);
	//查询该分组是不是我的分组
	Long getCountByUserIdAndId(String fa_id, String tid);

}
