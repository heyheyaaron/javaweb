package feiao.forum.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.PostConstruct;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;

import feiao.forum.dao.ResourceDao;
import feiao.forum.dao.UserDao;
import feiao.forum.pojo.Resource;
import feiao.forum.pojo.User;
import feiao.forum.service.Constant;
import feiao.forum.service.UserService;
import feiao.forum.util.CryptographyHelper;
import feiao.forum.util.RandomTools;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao dao;
	@Autowired
	private ResourceDao redao;
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
	
	/**
	 * 登录方法
	 * @param userId 用户名
	 * @param password 密码
	 * @param vcode 验证码
	 * @param key 是否记住用户
	 * @return JSON格式
	 */
	public Map<String, Object> login(String userId, String password,String vcode, 
			int key,HttpServletRequest request){
		try{
			/** 定义Map集合封装提示信息 */
			Map<String, Object> map = new HashMap<>();
			map.put("status", 1);
			map.put("tip", "验证码不正确！");
			/** 判断验证码是否正确 */
			
			String verifyCode = (String)request.getSession().getAttribute("verify_code");
							
			if (verifyCode != null && verifyCode.equalsIgnoreCase(vcode)){
				/** 判断用户名与密码是否为空 */
				if (!StringUtils.isEmpty(userId) && !StringUtils.isEmpty(password)){
					
					/** ############### 用shiro做身份认证  #################*/
					/** 获取主体 */
					Subject subject = SecurityUtils.getSubject();
					/** 创建用户名密码令牌 */
					UsernamePasswordToken token = new UsernamePasswordToken(userId, password,
								key == 1);
					try{
						/** 身份认证 */
						subject.login(token);
					}catch(Exception ex){
						ex.printStackTrace();
					}
					/** 身份认证通过 */
					if (subject.isAuthenticated()){
						User user = dao.get(userId);
						if(user.getIsdel() == 1){
							map.put("status", 4);
							map.put("tip", "该用户已停用！");
						}else{
						
							/** 登录成功,存入Session */
							subject.getSession().setAttribute(Constant.SESSION_USERH, user);
							
							request.getSession().removeAttribute("verify_code");
							map.put("status", 0);
							map.put("tip", "登录成功！");
						}
					}else{
						map.put("status", 3);
						map.put("tip", "用户名或密码不正确！");
					}
				}else{
					map.put("status", 2);
					map.put("tip", "用户名或密码为空！");
				}
			}
			/** 返回提示信息 */
			return map;
		}catch(Exception ex){
			throw new RuntimeException("登录方法出现了异常！", ex);
		}
	}
	
	
	
	
	
	
	/**
	 * 根据用户id查询用户
	 * @param userId 用户id
	 * @return 用户
	 */
	public User getUser(String userId){
		try{
			return dao.get(userId);
		}catch(Exception ex){
			throw new RuntimeException("根据用户id查询用户方法出现了异常！", ex);
		}
	}
	
	
	/**
	 * 获取用户菜单
	 * @return List
	 */
	public List<Map<String, Object>> getUserMenu(HttpServletRequest request){
		
			
			try {
				/** 获取当前登录的用户 */
				String userId = (String)SecurityUtils.getSubject().getPrincipal();
				/** 从菜单缓存对象中获取数据 */
				List<Map<String, Object>> menuData = menuCache.get(userId);
				/** 判断菜单缓存对象中是否有用户的数据 */
				if (menuData != null && menuData.size() > 0){
					System.out.println("缓存区的数据：" + menuData);
					
					return menuData;
				}
				
				/** ###################### 自己的业务部分 ############################ */
				
				/** 定义List集合封装响应数据 */
				menuData = new ArrayList<>();
				/** 获取当前登录的用户 */
				User user = (User)request
						.getSession().getAttribute(Constant.SESSION_USERH);
				/** 根据当前登录用户userId查询他所有的角色，再角色查询所有的资源 */
				Set<Resource> res = dao.getResourceByUserId(user.getUsername());
				Set<Resource> rez = dao.getResourceByUserIdforGroup(user.getUsername());
				
				Set<Resource> rer = new HashSet<>();
				for (Resource re : rez) {
					boolean tof = true;
					for (Resource rea : res) {
						if(re.getId().equals(rea.getId())){
							tof = false;
							break;
						}
						
					}
					if(tof){
						rer.add(re);
					}
					
				}
				for (Resource rea : rer) {
					res.add(rea);
					
				}
				
				List<Resource> resourceListss= new ArrayList<>();
				List<Resource> resourceLists= new ArrayList<>();
				for (Resource re : res) {
					resourceListss.add(re);
				}
				
				//查询没有的父菜单栏
				resourceListss=xunhuanFindPid(resourceListss);
				for (Resource re : resourceListss) {
					if(re.getIsbutton().equals(0)){
						resourceLists.add(re);
						
					}
				}
				Collections.sort(resourceLists,new Comparator<Resource>() {

					@Override
					public int compare(Resource r1, Resource r2) {
						if(r1.getSort()<r2.getSort()){
							return -1;
						}else if(r1.getSort()>r2.getSort()){
							return 1;
						}
						return 0;
					}
				});
				System.out.println("排序后："+resourceLists);
				List<Map<String, Object>> listMax= new ArrayList<>();
				
				
				
				for (Resource re : resourceLists) {
					if(re.getParentId().equals(0)){
						Map<String, Object> mapMax = new HashMap<>();
						mapMax.put("id",re.getId());
						mapMax.put("name", re.getName());
						mapMax.put("parentId",re.getParentId() );
						mapMax.put("icon", re.getIcon());
						mapMax.put("order", 1);
						
						mapMax.put("url","javascript:void(0)");
						mapMax.put("isHeader", re.getIsHeader());
						List<Map<String, Object>> listMin = foceMenu(resourceLists, re);
						mapMax.put("childMenus", listMin);
						if(listMin!=null && !listMin.isEmpty()){
							listMax.add(mapMax);
						}
						
						
						
					}
				}
				menuCache.put(userId, listMax);
				return listMax;
			} catch (Exception e) {
				throw new RuntimeException("获取用户菜单方法出现了异常！", e);
			}
	}
	//递归查询菜单栏
	public List<Map<String, Object>> foceMenu(List<Resource> resourceLists,Resource re){
		try {
			List<Map<String, Object>> listMin= new ArrayList<>();
			for (Resource res : resourceLists) {
				if(res.getParentId().equals(re.getId())){
					
					Map<String, Object> mapMax = new HashMap<>();
					mapMax.put("id",res.getId());
					mapMax.put("name", res.getName());
					mapMax.put("parentId",res.getParentId() );
					mapMax.put("icon", res.getIcon());
					mapMax.put("order", 1);
					mapMax.put("isHeader", res.getIsHeader());
					if(res.getUrl().equals("none")){
						
						mapMax.put("url","javascript:void(0)");
					}else{
						mapMax.put("url",res.getUrl());
					}
					
					
					List<Map<String, Object>> listMins = foceMenu(resourceLists, res);
					mapMax.put("childMenus", listMins);
					listMin.add(mapMax);
				}
				
			}
			return listMin;
		} catch (Exception e) {
			throw new RuntimeException("递归查询菜单栏方法出现异常",e);
		}
		
	}
			

	
	
	
	/**
	 * 根据主键code获取资源
	 * @param code 主键code
	 * @return 资源
	 */
	@Override
	public Resource getResource(Integer code) {
		try{
			return redao.get(code);
		}catch(Exception ex){
			throw new RuntimeException("根据主键code获取资源方法出现了异常！", ex);
		}
	}
	/*<!--根据用户id查询该用户的角色  -->*/
	@Override
	public Set<String> getRoleByUserId(String userId) {
		
		try {
			return dao.getRoleByUserId(userId);
		} catch (Exception e) {
			
			throw new RuntimeException("根据用户id查询该用户的角色方法出现了异常！", e);
		}
	}
	
	//查询该用户所有的权限
	@Override
	public Set<String> getPermissionByUserId(String userId) {
		
		try {
			Set<String> set = dao.getPermissionByUserId(userId);
			Set<String> sets =dao.getPermissionByUserIdfromGroup(userId);
			for (String str : sets) {
				set.add(str);
			}
			System.err.println("权限："+set);
			return set;
		} catch (Exception e) {
			throw new RuntimeException("查询该用户所有的权限方法出现了异常！", e);
		}
	}
	
	//分页展示用户信息
	@Override
	public List<Map<String, Object>> getUserByPage(Integer curpage, String search,Integer pagesize) {
		
		try {
			return dao.getUserByPage((curpage-1)*pagesize, search,pagesize);
		} catch (Exception e) {
			throw new RuntimeException("分页展示用户信息出现异常！", e);
		}
	}
	//查询总记录数
	@Override
	public Long getTotalByUser(String search) {
		try {
			return dao.getTotalByUser(search);
		} catch (Exception e) {
			throw new RuntimeException("查询总记录数出现异常！", e);
		}
	}
	//增加用户
	@Override
	public String addUserData(User user,Integer[] groups) {
		try {
			
			if(user.getUsername()==null||user.getUsername().equals("")){
				return "登录名不能为空";
			}
			if(user.getPassword()==null||user.getPassword().equals("")){
				return "密码不能为空";
			}
			if(user.getName()==null||user.getName().equals("")){
				return "姓名不能为空";
			}
			if(user.getRole_id()==null||user.getRole_id().equals("")){
				return "用户角色不能为空";
			}
			if(user.getIsdel()==null||user.getIsdel().equals("")){
				return "用户状态不能为空";
			}
			
			String regex = "[\u4E00-\u9FA5]+";
			if(user.getUsername().matches(regex)){
				return"登录名应该由字母与数字组成";
			}
			if(user.getUsername().length()<5||user.getUsername().length()>16){
				return "登录名长度为5到16位之间";
			}
			if(user.getPassword().length()<6||user.getPassword().length()>20){
				return "密码长度应为6到20位之间";
			}
			if(user.getName().length()<2||user.getName().length()>12){
				return "姓名过长啦";
			}
			//判断用户名是否重复
			Long count =dao.getUserIsHaveLife(user.getUsername());
			if(count>0){
				return "登录名重复，请重新输入";
			}
			/** 随机生成加密盐 */
			String salt = CryptographyHelper.getRandomSalt();
			/** 设置加密盐 */
			user.setSalt(salt);
			user.setPassword(CryptographyHelper.encrypt(user.getPassword(), salt));
			if(user.getIsdel().equals(1)){
				user.setDeltime(new Date());
			}
			dao.addUser(user);
			if(groups!=null &&!groups.equals("") && groups.length>0){
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
				Date date = new Date();
				String ds = sdf.format(date);
				for (Integer inter : groups) {
					String idz = ds +RandomTools.getRandomString(10);
					dao.addUserAndGroup(idz,user.getUsername(),inter);
				}
			}
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加用户出现异常！", e);
		}
	}
	//修改用户
	@Override
	public String updateUserData(User user,Integer [] groups) {
		try {
			
			
			
			if(user.getName()==null||user.getUsername().equals("")){
				return "姓名不能为空";
			}
			if(user.getRole_id()==null||user.getRole_id().equals("")){
				return "用户角色不能为空";
			}
			if(user.getIsdel()==null||user.getIsdel().equals("")){
				return "用户状态不能为空";
			}
			
			if(user.getPassword()!=null&&!user.getPassword().equals("")){
				if(user.getPassword().length()<6||user.getPassword().length()>20){
					
					return "密码长度应为6到20位之间";
				}
			}
			
			if(user.getName().length()<2||user.getName().length()>12){
				return "姓名过长啦";
			}
			
			
			User dbuser = getUser(user.getUsername());
			if(user.getPassword()!=null&&!user.getPassword().equals("")){
				/** 随机生成加密盐 */
				String salt = CryptographyHelper.getRandomSalt();
				/** 设置加密盐 */
				user.setSalt(salt);
				user.setPassword(CryptographyHelper.encrypt(user.getPassword(), salt));
			}else{
				user.setPassword(dbuser.getPassword());
				user.setSalt(dbuser.getSalt());
			}
			if(!user.getIsdel().equals(dbuser.getIsdel())){
				if(user.getIsdel().equals(0)){
					user.setDeltime(null);
				}else{
					user.setDeltime(new Date());
				}
				
			}
			dao.updateUser(user);
			/** 获取域的名称 */
			String realmName = SecurityUtils.getSubject()
						.getPrincipals().getRealmNames().iterator().next();
			
			menuCache.remove(user.getUsername());
			/** 创建简单的当事人集合 */
			PrincipalCollection principalCollection = 
					new SimplePrincipalCollection(user.getUsername(), realmName);
			/** 把用户的权限缓存清空 */
			authorizationCache.remove(principalCollection);
			//删除角色与用户组的关系表
			dao.deleteRoleAndGroup(user.getUsername());
			if(groups!=null &&!groups.equals("") && groups.length>0){
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
				Date date = new Date();
				String ds = sdf.format(date);
				for (Integer inter : groups) {
					String idz = ds +RandomTools.getRandomString(10);
					dao.addUserAndGroup(idz,user.getUsername(),inter);
				}
			}
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加用户出现异常！", e);
		}
	}
	//删除用户
	@Override
	public Integer deleteUserData(String username) {
		try {
			dao.deleteUserData(username);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("删除用户出现异常！", e);
		}
	}

	//查询没有的父菜单栏
	public List<Resource> xunhuanFindPid(List<Resource> resourceLists){
		try {
			for (Resource rew : resourceLists) {
				boolean istrue =false;
				
				if(!rew.getParentId().equals(0)){
					for (Resource rel : resourceLists) {
						if(rew.getParentId().equals(rel.getId())){
							istrue = true;
							break;
						}
					}
					if(!istrue){
						Resource rez = redao.get(rew.getParentId());
						resourceLists.add(rez);
						return xunhuanFindPid(resourceLists);
					}
				}
			}
			return resourceLists;
		} catch (Exception e) {
			throw new RuntimeException("查询没有的父菜单栏",e);
		}
	}
	//修改个人信息
	@Override
	public String updateMyMsg(User user,String oldpsw,HttpServletRequest request) {
		try {
			if(user.getName()==null||user.getName().equals("")){
				return "姓名不能为空";
			}
			if(oldpsw!=null && !oldpsw.equals("")){
				if(user.getPassword()==null ||user.getPassword().equals("")){
					return "新密码不能为空";
				}
			}
			if(user.getPassword()!=null && !user.getPassword().equals("")){
				if(oldpsw==null ||oldpsw.equals("")){
					return "旧密码不能为空";
				}
				if(user.getPassword().length()<6||user.getPassword().length()>20){
					
					return "设置密码长度应为6到20位之间";
				}
			}
			if(user.getName().length()<2||user.getName().length()>12){
				return "姓名过长啦";
			}
			User dbuser = dao.get(user.getUsername());
			if(user.getPassword()!=null && !user.getPassword().equals("")){
				if(!CryptographyHelper.encrypt(oldpsw, dbuser.getSalt()).equals(dbuser.getPassword())){
					return "密码不正确";
				}else{
					/** 随机生成加密盐 */
					String salt = CryptographyHelper.getRandomSalt();
					/** 设置加密盐 */
					dbuser.setSalt(salt);
					dbuser.setPassword(CryptographyHelper.encrypt(user.getPassword(), salt));
				}
			}else{
				dbuser.setPassword(dbuser.getPassword());
				dbuser.setSalt(dbuser.getSalt());
			}
			dbuser.setName(user.getName());
			dao.saveUserBySelf(dbuser);
			request.getSession().setAttribute(Constant.SESSION_USERH, dbuser);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改个人信息",e);
		}
	}
	

	

}
