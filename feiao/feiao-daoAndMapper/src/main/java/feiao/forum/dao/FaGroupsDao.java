package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaGroups;

@Repository
public interface FaGroupsDao {
	//根据id查询用户组信息
	FaGroups get(Integer id);
	//分页展示用户组信息
	List<Map<String, Object>> getFaGroupsByPage(@Param("curpage")Integer curpage,@Param("pagesize")Integer pagesize,@Param("search")String search);
	//查询用户组总数
	Long getTotalByFaGroups(@Param("search")String search);
	//增加用户组
	void addFaGroups(FaGroups faGroups);
	//修改用户组
	void updateFaGroups(FaGroups faGroups);
	//删除用户组
	void deleteFaGroups(Integer id);
	//删除用户组与会员的关系表
	void deleteFaGroupsAndUser(Integer id);
	//根据会员id和用户组ID查询之间的关系
	Long findCountByUserAndGroups(String userId, Integer fa_id);
	//绑定会员与用户组之间的关系
	void bindFaGroups(String idz, Integer fa_id, String userId);
	//根据会员id查询用户组信息
	List<Map<String, Object>> getGroupsByUserId(String id);
	//异步加载所有用户组信息
	List<Map<String, Object>> getAllMbGroup();
	//根据用户id 查询该会员绑定用户组情况
	List<Integer> getGroupIdByUserId(String id);
	//删除会员绑定的用户组
	void deleteGroupsByUserId(String string);
	//查询该用户的用户组
	List<String> getGroupNameByUserId(String id);
}
