package feiao.forum.service;

import java.util.List;
import java.util.Map;

import feiao.forum.pojo.Role;


public interface RoleService {
	//查询所有角色
	List<Map<String , Object>> selectAllRole();
	//分页展示角色信息
	List<Map<String, Object>> getRoleByPage(Integer curpage, String search, Integer pagesize);
	//查询角色总记录数
	Long getTotalByRole(String search);
	//删除角色
	Integer deleteRoleData(Integer id);
	//增加角色
	String addRoleData(Role role, Integer[] group);
	//根据id获取角色信息
	Role getRoleById(Integer id);
	//获取该角色的所有资源
	List<String> getResourceByRoleId(Integer id);
	//修改角色
	String updateRoleData(Role role, Integer[] group);
}
