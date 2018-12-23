package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaIgnore;

@Repository
public interface FaIgnoreDao {
	//根据我的id查询屏蔽的好友
	List<Map<String, Object>> getIgnoreForFriends(String fa_id);
	//根据我的id查询屏蔽的好友
	List<Map<String, Object>> getIgnoreForFriendss(String fa_id);
	//查询屏蔽的提醒
	List<Map<String, Object>> getIgnoreForMsg(String[] ids);
	//取消屏蔽指定用户
	void deleteById(String[] ids);
	//根据id 删除屏蔽的好友
	void deleteByMyId(@Param("id")String fa_id, @Param("list")List<String> dellist);
	//保存新的屏蔽好友的id信息
	void saveMyIgnoreFriends(List<FaIgnore> list);
	//查询我原理屏蔽的好友的id
	List<String> getIgnoreIdForMyId(String fa_id);
	//查询该好友是否已经屏蔽
	Long getCountByMyIdAndFriId(String fa_id, String id);

}
