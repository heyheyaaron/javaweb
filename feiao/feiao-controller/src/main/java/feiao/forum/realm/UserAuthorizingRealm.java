package feiao.forum.realm;

import java.util.Set;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import feiao.forum.pojo.User;
import feiao.forum.service.UserService;






/**
 * 用户安全数据源(身份认证与授权数据)
 * 
 */
public class UserAuthorizingRealm extends AuthorizingRealm {
	
	/** 注入业务层接口 */
	@Resource
	private UserService userService;
	/*@Resource
	private TbywsysadminService tbywsysadminService;*/
	
	/** 授权方法 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		System.out.println("======授权方法=====doGetAuthorizationInfo============");
		/** 获取当前Session中的用户   principals: 所有的登录的用户 */
		String userId = (String)principals.getPrimaryPrincipal();
		System.out.println("==userId==: " + userId);
		
		/** 创建简单的授权信息对象 */
		SimpleAuthorizationInfo  authorizationInfo = new SimpleAuthorizationInfo();
		/** 调用业务层对象查询该用户所有的角色 */
		Set<String> roles = userService.getRoleByUserId(userId);
		System.out.println(userId + ",用户的角色: " + roles);
		/** 添加角色 */
		authorizationInfo.addRoles(roles);
		
		/** 调用业务层对象查询该用户所有的权限 */
		Set<String> permissions = userService.getPermissionByUserId(userId);
		System.out.println(userId + ",用户的权限: " + permissions);
		/** 添加权限 */
		authorizationInfo.addStringPermissions(permissions);
		return authorizationInfo;
		
	}

	/** 身份认证方法  subject.login()*/
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		System.out.println("===========doGetAuthenticationInfo============");
		/** 获取当事人 (需要认证的用户) 实际是就是登录名 */
		String userId = (String)token.getPrincipal();
		System.out.println("userId: " + userId);
		
		/** 判断用户名是否正确 */
		User user = userService.getUser(userId);
		if (user == null){
			throw new UnknownAccountException("用户名不正确！");
		}
		
		/**
		 * 创建简单的身份认证信息对象
		 * 第一个参数：principal 当事人(登录用户名)
		 * 第二个参数：hashedCredentials 加密的密码(用户密码)
		 * 第三个参数：credentialsSalt 密码加盐
		 * 第四个参数： realmName 域的名称
		 */
		
		return new SimpleAuthenticationInfo(userId, 
							user.getPassword(),
							ByteSource.Util.bytes(user.getSalt()), 
							this.getName());
		
	}

}
