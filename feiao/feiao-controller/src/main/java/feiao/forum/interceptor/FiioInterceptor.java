package feiao.forum.interceptor;

import java.util.Collection;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import feiao.forum.pojo.FaUser;
import feiao.forum.pojo.User;
import feiao.forum.service.Constant;
import feiao.forum.service.CoreService;
import feiao.forum.service.MemberService;
import feiao.forum.service.UserService;
import feiao.forum.util.CookieTools;
import feiao.forum.util.CookieUtils;



public class FiioInterceptor implements HandlerInterceptor{
	@Autowired
	private MemberService mService;
	@Autowired
	private CoreService cService;
	@Autowired
	private SessionDAO sessionDAO;
    //执行Handler方法之前执行  
    @Override  
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,  
            Object handler) throws Exception {  
          
    	if(request.getSession().getAttribute(Constant.SESSION_USER)!=null && !request.getSession().getAttribute(Constant.SESSION_USER).equals("")){
			FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
			
			if(fu!=null && fu.getFa_id()!=null){
				return true;
			}else{
				response.sendRedirect(request.getContextPath()+"/login.do"); 
				return false;
			}
		}else{
			Cookie cookie = CookieTools.getCookie(Constant.COOKIE_NAME, request);
			System.out.println("cookie:是否存在：");
			System.out.println(cookie!=null);
			if(cookie!=null && !cookie.getValue().equals("")){
				String ids = CookieUtils.decodeBase64(cookie.getValue());
				String id =ids.substring(0, ids.indexOf("-"));
				String psw = ids.substring(ids.indexOf("-")+1);
				FaUser fu = mService.getMemberById(id);
				
				if(fu.getFa_password().equals(psw)){
					request.getSession().setAttribute(Constant.SESSION_USER, fu);
					cService.loginAddInteAndFeibiao(request,fu);
					return true;
				}else{
					response.sendRedirect(request.getContextPath()+"/login.do"); 
					return false;
				}
			}else{
				response.sendRedirect(request.getContextPath()+"/login.do"); 
				return false;
			}
			
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
