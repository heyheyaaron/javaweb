package feiao.forum.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.Resource;
import feiao.forum.pojo.User;

@Repository 
public interface UserDao{  
    //List<User> selectId(String username);  
	
	//根据用户ID得到用户资料
	User get(String userId);
	//根据用户id获取权限
	Set<Resource> getResourceByUserId(String username);
	//根据用户id查询该用户的角色
	Set<String> getRoleByUserId(String userId);
	//查询该用户所有的权限
	Set<String> getPermissionByUserId(String username);
	//分页展示用户信息
	List<Map<String, Object>> getUserByPage(@Param("curpage")Integer curpage, @Param("search")String search, @Param("pagesize")Integer pagesize);
	//查询总记录数
	Long getTotalByUser(@Param("search")String search);
	//判断用户名是否重复
	Long getUserIsHaveLife(String username);
	//增加用户
	void addUser(User user);
	//修改用户
	void updateUser(User user);
	//删除用户
	void deleteUserData(String username);
	//修改个人资料
	void saveUserBySelf(User user);
	//绑定用户组
	void addUserAndGroup(String idz, String name, Integer inter);
	//删除角色用户组中间表
	void deleteRoleAndGroup(String username);
	//查询该用户所在用户组所有的权限
	Set<String> getPermissionByUserIdfromGroup(String username);
	//根据用户id获取用户组权限
	Set<Resource> getResourceByUserIdforGroup(String username);
	//获取所有用户主键
	List<String> getAllUserName();
} 

