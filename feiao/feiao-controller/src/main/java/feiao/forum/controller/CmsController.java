package feiao.forum.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import feiao.forum.service.UserService;



@Controller
@RequestMapping("/")
public class CmsController {
	@Resource  
    private UserService service;  
	//@RequestMapping("/*/*")  
	@RequestMapping("/**/*.do")  
    public String toIndex(HttpServletRequest request,Model model){  
        System.err.println(request.getServerName());  
        System.err.println(request.getServletPath());  
        System.err.println(request.getContextPath());  
        System.err.println(request.getQueryString());  
        
        System.out.println("head.referer=" + request.getHeader("referer"));
        System.out.println("RemoteHost=" + request.getRemoteHost());
        System.out.println("getRemoteAddr=" + request.getRemoteAddr()+ ":" + request.getRemotePort());
        return "swlovefg";  
	}
}
