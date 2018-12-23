package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.Role;

@Repository 
public interface RoleDao {
	//查询所有角色
	List<Map<String , Object>> selectAllRole();
	//分页展示角色信息
	List<Map<String, Object>> getRoleByPage(@Param("curpage")Integer curpage, @Param("search")String search, @Param("pagesize")Integer pagesize);
	//查询角色总记录数
	Long getTotalByRole(@Param("search")String search);
	//删除角色
	void deleteRoleData(Integer id);
	//删除角色与权限的关系表
	void deleteRoleAndResource(Integer id);
	//停用相关用户
	void finishUser(Integer id);
	//增加角色
	void saveRole(@Param("role")Role role);
	//角色绑定资源
	void saveRoleAndRe(String idz, Integer id, Integer id2);
	//根据id获取角色信息
	Role getRoleById(Integer id);
	//获取该角色的所有资源
	List<String> getResourceByRoleId(Integer id);
	//修改角色
	void updateRole(Role role);
	//获得该角色下所有的用户名
	List<String> getUsernameByRoleId(Integer id);

}
