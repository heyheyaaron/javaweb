package feiao.forum.service;

import java.util.List;
import java.util.Map;

import feiao.forum.pojo.Group;


public interface GroupService {
	//查询所有用户组
	List<Map<String , Object>> selectAllGroup();
	//分页展示用户组信息
	List<Map<String, Object>> getGroupByPage(Integer curpage, String search, Integer pagesize);
	//查询用户组总记录数
	Long getTotalByGroup(String search);
	//删除用户组
	Integer deleteGroupData(Integer id);
	//增加用户组
	String addGroupData(Group Group, Integer[] groups);
	//根据id获取用户组信息
	Group getGroupById(Integer id);
	//获取该用户组的所有资源
	List<String> getResourceByGroupId(Integer id);
	//修改用户组
	String updateGroupData(Group group, Integer[] groups);
	//根据用户查询用户组
	List<Integer> getGroupByUserId(String id);
}
