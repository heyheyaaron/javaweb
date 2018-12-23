package feiao.forum.interceptor;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import feiao.forum.pojo.User;
import feiao.forum.service.Constant;
import feiao.forum.service.UserService;



public class LoginInterceptor implements HandlerInterceptor{
	@Autowired
	private UserService userService;
	@Autowired
	private SessionDAO sessionDAO;
    //执行Handler方法之前执行  
    //用于身份认证、身份授权  
    //比如身份认证，如果认证通过表示当前用户没有登陆，需要此方法拦截不再向下执行  
    @Override  
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,  
            Object handler) throws Exception {  
          
    	/** 获取Session中的用户 */
		User user = (User)request
					.getSession().getAttribute(Constant.SESSION_USERH);
		System.out.println("session user: " + user);
		/** 判断用户是否存在，由于记住了用户 */
		if (user == null){
			/** 获取当事人(获取Session中用户userId) */
			String userId = (String)SecurityUtils.getSubject().getPrincipal();
			System.out.println("LoginInterceptor: "  + userId);
			if (!StringUtils.isEmpty(userId)){
				user = userService.getUser(userId);
				SecurityUtils.getSubject().getSession()
					.setAttribute(Constant.SESSION_USERH, user);
				System.out.println("经过这里吗？"+SecurityUtils.getSubject().getSession().getAttribute(Constant.SESSION_USERH));
			}
		}
		
		/** 判断用户不为空 */
		if (user != null){
			/** 获取所有激活的session */
			Collection<Session> sessions = sessionDAO.getActiveSessions();
			System.out.println("在线用户的总数量：" + sessions.size());
			/** 定义变量 */
			int count = 0;
			/** 统计登录用户的总数量 */
			for (Session session : sessions){
				if (session.getAttribute(Constant.SESSION_USERH) != null){
					count++;
				}
			}
			System.out.println("登录用户的总数量：" + count);
			request
			.getSession().setAttribute(Constant.LOGIN_USER_COUNT, count);
		}
		if(user == null){
			response.sendRedirect(request.getContextPath()+"/FiioAdmin/login.jsp"); 
			return false;
		}else{
			return true;
		}
		
    }  
      
    //进入Handler方法之后，返回modelAndView之前执行  
    //应用场景从modelAndView出发：将公用的模型数据(比如菜单导航)在这里  
    //传到视图，也可以在这里统一指定视图  
    @Override  
    public void postHandle(HttpServletRequest request, HttpServletResponse response,  
            Object handler, ModelAndView modelAndView) throws Exception {  
    	
          
    }  
      
    //执行Handler完成执行此方法  
    //应用场景：统一异常处理，统一日志处理  
    @Override  
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response,  
            Object handler, Exception ex)  
            throws Exception {  
    	   
           if(ex!=null){
        	   System.out.println("错误信息："+ex);
           }
         
    } 

}
