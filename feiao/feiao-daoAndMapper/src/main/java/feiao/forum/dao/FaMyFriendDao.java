package feiao.forum.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaMyFriend;
import feiao.forum.pojo.FaSentMessage;

@Repository
public interface FaMyFriendDao {
	//分页查询我的好友信息数据
	List<Map<String, Object>> selectMyFriendByPage(@Param("userid")String fa_id, @Param("curpage")Integer curpage, @Param("pagesize")Integer pagesize, @Param("searchname")String searchname,
			@Param("searchtype")String searchtype);
	//分页查询我的好友信息数量
	Long getCountByIdFriend(@Param("userid")String fa_id, @Param("searchname")String searchname, @Param("searchtype")String searchtype);
	//取消好友
	void deleteMyFriend(String id, String fa_id);
	//修改好友备注名
	void updateMyFriend(String idz, String fa_id, String namez);
	//修改好友分组
	void updateMyType(String idz, String fa_id, String groups);
	//好友移动分组分组
	void changeMyGroups(@Param("userid")String fa_id, @Param("id")String tid, @Param("ids")String[] ids);
	//查询我们是否是好友
	Long getCountByMyIdAndFrId(String fa_id, String string);
	//创建好友表
	void saveFriendMsg(List<FaMyFriend> lf);
	//查询我好友id及i是否属于忽略组
	List<Map<String, Object>> findFriendIgnoreStatus(String id);
	//查询我关注的id
	Set<String> findmyFollowsId(String id);

}
