package feiao.forum.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.mysql.fabric.xmlrpc.base.Data;

import feiao.forum.dao.GroupDao;
import feiao.forum.pojo.Group;
import feiao.forum.service.GroupService;
import feiao.forum.util.RandomTools;
@Service
public class GroupServiceImpl implements GroupService {
	@Autowired
	private GroupDao dao;
	
	/** 注入缓存管理器 */
	@Autowired
	private EhCacheManager cacheManager;
	/** 定义用户菜单缓存区的名称 (取属性文件中key对应的值) */
	@Value("feiao-userResourceMenuCache")
	private String menuCacheName;
	/** 定义用户菜单级存对象 */
	private Cache<String, List<Map<String, Object>>> menuCache;
	/** 定义用户权限缓存区的名称 */
	@Value("shiro-authorizationCache")
	private String authorizationCacheName;
	/** 定义用户授权缓存对象 */
	private Cache<PrincipalCollection, AuthorizationInfo> authorizationCache;
	
	/** bean的生命周期  (初始化方法)init-method */
	@PostConstruct
	public void init(){
		/** 获取菜单缓存对象 */
		menuCache = cacheManager.getCache(menuCacheName);
		/** 获取授权缓存对象 */
		authorizationCache = cacheManager.getCache(authorizationCacheName);
	}
	//查询所有用户组
	@Override
	public List<Map<String , Object>> selectAllGroup() {
		try {
			List<Map<String , Object>> map = dao.selectAllGroup();
			return map;
		} catch (Exception e) {
			throw new RuntimeException("查询所有用户组方法出现异常",e);
		}
	}
	//分页展示用户组信息
	@Override
	public List<Map<String, Object>> getGroupByPage(Integer curpage, String search, Integer pagesize) {
		try {
			return dao.getGroupByPage((curpage-1)*pagesize, search,pagesize);
		} catch (Exception e) {
			throw new RuntimeException("分页展示用户组信息出现异常！", e);
		}
	}
	//查询用户组总记录数
	@Override
	public Long getTotalByGroup(String search) {
		try {
			return dao.getTotalByGroup(search);
		} catch (Exception e) {
			throw new RuntimeException("查询总记录数出现异常！", e);
		}
	}
	//删除用户组
	@Override
	public Integer deleteGroupData(Integer id) {
		try {
			
			List<String> list = dao.getUsernameByGroupId(id);
			
			//删除用户组
			dao.deleteGroupData(id);
			//删除用户组与权限的关系表
			dao.deleteGroupAndResource(id);
			//删除用户组与用户的关系表
			dao.deleteGroupAndUser(id);
			//获得该用户组下所有的用户名
			/** 获取域的名称 */
			String realmName = SecurityUtils.getSubject()
						.getPrincipals().getRealmNames().iterator().next();
			
			for (String username : list) {
				menuCache.remove(username);
				/** 创建简单的当事人集合 */
				PrincipalCollection principalCollection = 
						new SimplePrincipalCollection(username, realmName);
				/** 把用户的权限缓存清空 */
				authorizationCache.remove(principalCollection);
			}
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("删除用户出现异常！", e);
		}
	}
	//增加用户组
	@Override
	public String addGroupData(Group group, Integer[] groups) {
		try {
			if(group.getName()==null||group.getName().equals("")){
				return "用户组名称不能为空";
			}
			
			if(groups==null||groups.length<1){
				return "保存失败！请为该用户组提供权限";
			}
			//保存
			dao.saveGroup(group);
			
			//绑定资源
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
			Date date = new Date();
			String ds = sdf.format(date);
			for (Integer id : groups) {
				String idz = ds +RandomTools.getRandomString(10);
				dao.saveGroupAndRe(idz,group.getId(),id);
			}
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加用户组出现异常！", e);
		}
	}
	//根据id获取用户组信息
	@Override
	public Group getGroupById(Integer id) {
		try {
			return dao.getGroupById(id);
		} catch (Exception e) {
			throw new RuntimeException("根据id获取用户组信息出现异常！", e);
		}
	}
	//获取该用户组的所有资源
	@Override
	public List<String> getResourceByGroupId(Integer id) {
		try {
			return dao.getResourceByGroupId(id);
		} catch (Exception e) {
			throw new RuntimeException("获取该用户组的所有资源出现异常！", e);
		}
	}
	//修改用户组
	@Override
	public String updateGroupData(Group group, Integer[] groups) {
		try {
			if(group.getName()==null||group.getName().equals("")){
				return "用户组名称不能为空";
			}
			
			if(groups==null||groups.length<1){
				return "保存失败！请为该用户组提供权限";
			}
			//保存
			dao.updateGroup(group);
			//删除用户组与权限的关系表
			dao.deleteGroupAndResource(group.getId());
			//绑定资源
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
			Date date = new Date();
			String ds = sdf.format(date);
			for (Integer id : groups) {
				String idz = ds +RandomTools.getRandomString(10);
				dao.saveGroupAndRe(idz,group.getId(),id);
			}
			//清除该用户组下的用户的缓存
			//获得该用户组下所有的用户名
			/** 获取域的名称 */
			String realmName = SecurityUtils.getSubject()
						.getPrincipals().getRealmNames().iterator().next();
			List<String> list = dao.getUsernameByGroupId(group.getId());
			
			for (String username : list) {
				menuCache.remove(username);
				/** 创建简单的当事人集合 */
				PrincipalCollection principalCollection = 
						new SimplePrincipalCollection(username, realmName);
				/** 把用户的权限缓存清空 */
				authorizationCache.remove(principalCollection);
			}
			
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改用户组方法出现异常！", e);
		}
	}
	//根据用户查询用户组
	@Override
	public List<Integer> getGroupByUserId(String id) {
		try {
			return dao.getGroupByUserId(id);
		} catch (Exception e) {
			throw new RuntimeException("根据用户查询用户组出现异常！", e);
		}
	}
}
