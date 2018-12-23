package feiao.forum.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import feiao.forum.pojo.Resource;
import feiao.forum.pojo.User;



public interface UserService {
	
	//登录
	Map<String, Object> login(String userId, String password, String vcode, int key, HttpServletRequest request);
	//获取当前账户
	User getUser(String userId);
	//加载主菜单
	List<Map<String, Object>> getUserMenu(HttpServletRequest request);
	/**
	 * 根据主键code获取资源
	 * @param code 主键code
	 * @return 资源
	 */
	
	Resource getResource(Integer code);
	//根据用户查询角色
	Set<String> getRoleByUserId(String userId);
	//查询该用户所有的权限
	Set<String> getPermissionByUserId(String userId);
	//分页展示用户信息
	List<Map<String, Object>> getUserByPage(Integer curpage, String search, Integer pagesize);
	//查询用户总记录数
	Long getTotalByUser(String search);
	//增加用户
	String addUserData(User user, Integer[] groups);
	//修改用户
	String updateUserData(User user, Integer[] groups);
	//删除用户
	Integer deleteUserData(String username);
	//修改个人信息
	String updateMyMsg(User user, String oldpsw, HttpServletRequest request);
	
	
	
}
