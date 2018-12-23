package feiao.forum.service.impl;

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

import feiao.forum.dao.ResourceDao;
import feiao.forum.dao.UserDao;
import feiao.forum.pojo.Column;
import feiao.forum.pojo.Resource;
import feiao.forum.service.ResourceService;

@Service
public class ResourceServiceImpl implements ResourceService{
	@Autowired
	private ResourceDao dao;
	@Autowired
	private UserDao userdao;
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
	//查询所有资源
	@Override
	public List<Map<String, Object>> selectAllReasource() {
		
		try {
			return dao.selectAllReasource();
		} catch (Exception e) {
			throw new RuntimeException("查询所有资源方法出现错误",e);
		}
	}
	//查询所有资源不展示栏目管理的内容
	@Override
	public List<Map<String, Object>> selectAllReasourceNo() {
		
		try {
			return dao.selectAllReasourceNo();
		} catch (Exception e) {
			throw new RuntimeException("查询所有资源方法出现错误",e);
		}
	}
	//查询所有资源不包括功能按钮
	@Override
	public List<Map<String, Object>> selectAllRes() {
		
		try {
			return dao.selectAllRes();
		} catch (Exception e) {
			throw new RuntimeException("查询所有资源方法出现错误",e);
		}
	}
	//查询所有资源不展示栏目管理的内容和功能
	@Override
	public List<Map<String, Object>> selectAllReNoBtn() {
		
		try {
			return dao.selectAllReNoBtn();
		} catch (Exception e) {
			throw new RuntimeException("查询所有资源方法出现错误",e);
		}
	}
	//删除权限
	@Override
	public String deleteResourceData(Integer id) {
		try {
			//查询该权限子权限的个数
			Long count = dao.getResourceCidCount(id);
			if(count>0){
				return "该权限还存有子权限，请清除该权限下的子权限";
			}
			dao.deleteResource(id);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("删除权限方法出现错误",e);
		}
	}
	////删除栏目
	@Override
	public String deleteColumnData(Integer id) {
		try {
			
			Resource re = dao.get(id);
			if(re.getIshiddent().equals(0)){
				return "该栏目不能删除";
			}	
			//查询该权限子权限的个数
			Long count = dao.getResourceCidCount(id);
			if(count>0){
				return "该栏目下还存有子栏目，请清除该栏目下的子栏目";
			}
			dao.deleteResource(id);
			dao.deleteColumn(id);
			List<String> list = userdao.getAllUserName();
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
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("删除权限方法出现错误",e);
		}
	}
	//增加权限
	@Override
	public String addResourceData(Resource re) {
		try {
			if(re.getName()==null ||re.getName().equals("")){
				return "权限名称不能为空";
			}
			if(re.getParentId().equals(0)){
				re.setIsHeader(1);
			}else{
				re.setIsHeader(0);
			}
			if(re.getSort()==null){
				re.setSort(999);
			}
			if(re.getUrl()==null ||re.getUrl().equals("")){
				re.setUrl("none");
			}
			if(re.getPermission()==null||re.getPermission().equals("")){
				re.setPermission("*");
			}
			re.setIshiddent(0);
			re.setIcon("&#xe606");
			dao.addResource(re);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加权限方法出现错误",e);
		}
	}
	//增加栏目
	@Override
	public String addColumnData(Resource re,Column col) {
		try {
			if(re.getName()==null ||re.getName().equals("")){
				return "栏目名称不能为空";
			}
			if(re.getParentId().equals(0)){
				re.setIsHeader(1);
			}else{
				re.setIsHeader(0);
			}
			re.setIsbutton(0);
			re.setPermission("*");
			re.setIshiddent(1);
			re.setIcon("&#xe606");
			if(re.getSort()==null){
				re.setSort(999);
			}
			dao.addResource(re);
			if(!re.getUrl().equals("none")){
				
				dao.updateResourceUrl(re.getId(),"showColumnMsg.do?id="+re.getId());
				col.setId(re.getId());
				dao.saveColumnByReId(col);
			}
			List<String> list = userdao.getAllUserName();
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
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加栏目方法出现错误",e);
		}
	}
	//根据id获取资源
	@Override
	public Resource getResourceById(Integer id) {
		try {
			return dao.get(id);
		} catch (Exception e) {
			throw new RuntimeException("根据id获取资源方法出现错误",e);
		}
	}
	//修改权限
	@Override
	public String updateResourceData(Resource re) {
		try {
			if(re.getName()==null ||re.getName().equals("")){
				return "权限名称不能为空";
			}
			if(re.getId().equals(re.getParentId())){
				return "不能设置自身为上级";
			}
			if(re.getParentId().equals(0)){
				re.setIsHeader(1);
			}else{
				re.setIsHeader(0);
			}
			if(re.getSort()==null){
				re.setSort(999);
			}
			if(re.getUrl()==null ||re.getUrl().equals("")){
				re.setUrl("none");
			}
			if(re.getPermission()==null||re.getPermission().equals("")){
				re.setPermission("*");
			}
			dao.updateResource(re);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改权限方法出现错误",e);
		}
	}
	//修改栏目
	@Override
	public String updateColumnData(Resource re, Column col) {
		try {
			if(re.getName()==null ||re.getName().equals("")){
				return "栏目名称不能为空";
			}
			if(re.getId().equals(re.getParentId())){
				return "不能设置自身为上级";
			}
			if(re.getSort()==null){
				re.setSort(999);
			}
			if(re.getIshiddent().equals(0)){
				dao.updateColumnBySys(re.getId(),re.getName(),re.getSort());
			}else{
				if(re.getParentId().equals(0)){
					re.setIsHeader(1);
				}else{
					re.setIsHeader(0);
				}
				if(!re.getUrl().equals("none")){
					re.setUrl("showColumnMsg.do?id="+re.getId());
				}
				dao.updateColumnByMySelf(re);
				col.setId(re.getId());
				dao.updateColumnByReId(col);
			}
			List<String> list = userdao.getAllUserName();
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
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改权限方法出现错误",e);
		}
	}
	//根据栏目id查询文章
	@Override
	public Column getColumnById(Integer id) {
		try {
			return dao.getColumnById(id);
		} catch (Exception e) {
			throw new RuntimeException("根据栏目id查询文章方法出现错误",e);
		}
	}
}
