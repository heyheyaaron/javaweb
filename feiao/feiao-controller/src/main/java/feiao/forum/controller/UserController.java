package feiao.forum.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import feiao.forum.pojo.User;
import feiao.forum.service.Constant;
import feiao.forum.service.UserService;



@Controller
@RequestMapping("/user")
public class UserController {
	@Resource  
    private UserService service;  
	@RequestMapping("/test.do")  
    public String toIndex(HttpServletRequest request,Model model){  
		/** 获取Session中的用户 */
			User user = (User)request
						.getSession().getAttribute(Constant.SESSION_USERH);
			request.setAttribute("user", user);
        /*Integer userId = Integer.parseInt(request.getParameter("id"));  
        System.out.println("wwe:::"+userId);
        User user = new User();
        user.setUsername(userId.toString());
        user.setPassword("1232efsd");
        boolean doUserLogin = service.doUserLogin(user);
        System.out.println("t or f:::::"+doUserLogin);
        model.addAttribute("user", user);  
        model.addAttribute("tof", doUserLogin);  */
		
		
        return "test";  
	}
}
