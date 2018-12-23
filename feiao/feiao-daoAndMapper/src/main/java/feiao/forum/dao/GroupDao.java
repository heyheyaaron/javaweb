package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.Group;

@Repository 
public interface GroupDao {
	//查询所有用户组
	List<Map<String , Object>> selectAllGroup();
	//分页展示用户组信息
	List<Map<String, Object>> getGroupByPage(@Param("curpage")Integer curpage, @Param("search")String search, @Param("pagesize")Integer pagesize);
	//查询用户组总记录数
	Long getTotalByGroup(@Param("search")String search);
	//删除用户组
	void deleteGroupData(Integer id);
	//删除用户组与权限的关系表
	void deleteGroupAndResource(Integer id);
	//删除用户组与用户的关系表
	void deleteGroupAndUser(Integer id);
	
	//增加用户组
	void saveGroup(@Param("group")Group group);
	//用户组绑定资源
	void saveGroupAndRe(String idz, Integer id, Integer id2);
	//根据id获取用户组信息
	Group getGroupById(Integer id);
	//获取该用户组的所有资源
	List<String> getResourceByGroupId(Integer id);
	//修改用户组
	void updateGroup(Group group);
	//获得该用户组下所有的用户名
	List<String> getUsernameByGroupId(Integer id);
	//根据用户查询用户组
	List<Integer> getGroupByUserId(String id);

}
