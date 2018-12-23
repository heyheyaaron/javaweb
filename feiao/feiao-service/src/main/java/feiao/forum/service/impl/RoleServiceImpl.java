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

import feiao.forum.dao.RoleDao;
import feiao.forum.pojo.Role;
import feiao.forum.service.RoleService;
import feiao.forum.util.RandomTools;
@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDao dao;
	
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
	//查询所有角色
	@Override
	public List<Map<String , Object>> selectAllRole() {
		try {
			List<Map<String , Object>> map = dao.selectAllRole();
			return map;
		} catch (Exception e) {
			throw new RuntimeException("查询所有角色方法出现异常",e);
		}
	}
	//分页展示角色信息
	@Override
	public List<Map<String, Object>> getRoleByPage(Integer curpage, String search, Integer pagesize) {
		try {
			return dao.getRoleByPage((curpage-1)*pagesize, search,pagesize);
		} catch (Exception e) {
			throw new RuntimeException("分页展示角色信息出现异常！", e);
		}
	}
	//查询角色总记录数
	@Override
	public Long getTotalByRole(String search) {
		try {
			return dao.getTotalByRole(search);
		} catch (Exception e) {
			throw new RuntimeException("查询总记录数出现异常！", e);
		}
	}
	//删除角色
	@Override
	public Integer deleteRoleData(Integer id) {
		try {
			//删除角色
			dao.deleteRoleData(id);
			//删除角色与权限的关系表
			dao.deleteRoleAndResource(id);
			//停用相关用户
			dao.finishUser(id);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("删除用户出现异常！", e);
		}
	}
	//增加角色
	@Override
	public String addRoleData(Role role, Integer[] group) {
		try {
			if(role.getName()==null||role.getName().equals("")){
				return "角色名称不能为空";
			}
			if(role.getCode()==null||role.getCode().equals("")){
				return "角色代码不能为空";
			}
			if(role.getRemark()==null||role.getRemark().equals("")){
				return "角色描述不能为空";
			}
			if(group==null||group.length<1){
				return "保存失败！请为该角色提供权限";
			}
			//保存
			dao.saveRole(role);
			
			//绑定资源
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
			Date date = new Date();
			String ds = sdf.format(date);
			for (Integer id : group) {
				String idz = ds +RandomTools.getRandomString(10);
				dao.saveRoleAndRe(idz,role.getId(),id);
			}
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加角色出现异常！", e);
		}
	}
	//根据id获取角色信息
	@Override
	public Role getRoleById(Integer id) {
		try {
			return dao.getRoleById(id);
		} catch (Exception e) {
			throw new RuntimeException("根据id获取角色信息出现异常！", e);
		}
	}
	//获取该角色的所有资源
	@Override
	public List<String> getResourceByRoleId(Integer id) {
		try {
			return dao.getResourceByRoleId(id);
		} catch (Exception e) {
			throw new RuntimeException("获取该角色的所有资源出现异常！", e);
		}
	}
	//修改角色
	@Override
	public String updateRoleData(Role role, Integer[] group) {
		try {
			if(role.getName()==null||role.getName().equals("")){
				return "角色名称不能为空";
			}
			if(role.getCode()==null||role.getCode().equals("")){
				return "角色代码不能为空";
			}
			if(role.getRemark()==null||role.getRemark().equals("")){
				return "角色描述不能为空";
			}
			if(group==null||group.length<1){
				return "保存失败！请为该角色提供权限";
			}
			//保存
			dao.updateRole(role);
			//删除角色与权限的关系表
			dao.deleteRoleAndResource(role.getId());
			//绑定资源
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
			Date date = new Date();
			String ds = sdf.format(date);
			for (Integer id : group) {
				String idz = ds +RandomTools.getRandomString(10);
				dao.saveRoleAndRe(idz,role.getId(),id);
			}
			//清除该角色下的用户的缓存
			//获得该角色下所有的用户名
			/** 获取域的名称 */
			String realmName = SecurityUtils.getSubject()
						.getPrincipals().getRealmNames().iterator().next();
			List<String> list = dao.getUsernameByRoleId(role.getId());
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
			throw new RuntimeException("修改角色方法出现异常！", e);
		}
	}
}
