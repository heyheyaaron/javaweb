package feiao.forum.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaSelfMood;

@Repository
public interface FaSelfMoodDao {
	//查询我最新的心情
	FaSelfMood getNewMood(String string);
	//分页查看用户的心情
	List<Map<String, Object>> selectMemberMood(String id, Integer curpage, Integer pagesize);
	//根据id查询心情
	FaSelfMood getMoodById(String string);
	//分页查看用户的心情数量
	Long selectMemberMoodCount(String id);
	//保存转发的心情
	void saveMood(FaSelfMood fsf);
	//删除我的心情
	void deleteMyMood(String fa_id, String id);
	//查询我跟好友的动态
	List<Map<String, Object>> selectMineAndMemberMood(@Param("friendids")Set<String> friendids, @Param("curpage")Integer curpage, @Param("pagesize")Integer pagesize);
	//分页查看用户好友的心情数量
	Long selectFriendMoodCount(@Param("fids")Set<String> friendids);

}
