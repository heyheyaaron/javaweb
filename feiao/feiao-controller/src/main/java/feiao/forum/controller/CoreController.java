package feiao.forum.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import feiao.forum.pojo.FaUser;
import feiao.forum.service.Constant;
import feiao.forum.service.CoreService;
import feiao.forum.service.MemberService;
import feiao.forum.util.CookieTools;
import feiao.forum.util.CookieUtils;

public class CoreController {
	@Autowired
	private CoreService service;
	@Autowired
	private MemberService mservice;
	//加载公共信息
	public void showProtalMsg(HttpServletRequest request) {
		try {
			
			//版头版尾信息
			//判断session状态
			if(request.getSession().getAttribute("listCom")!=null){
				request.setAttribute("listCom", request.getSession().getAttribute("listCom"));
			}else{
				List<Map<String, Object>> listCom = service.findIndexEndCom();
				request.setAttribute("listCom", listCom);
				request.getSession().setAttribute("listCom", listCom);
			}
			if(request.getSession().getAttribute("listNor")!=null){
				request.setAttribute("listNor",request.getSession().getAttribute("listNor") );
			}else{
				List<Map<String, Object>> listNor = service.findIndexEndNor();
				request.setAttribute("listNor",listNor );
				request.getSession().setAttribute("listNor",listNor);
			}
			if(request.getSession().getAttribute("listHead")!=null){
				request.setAttribute("listHead",request.getSession().getAttribute("listHead") );
			}else{
				List<Map<String, Object>> listHead = service.findIndexHead();
				request.setAttribute("listHead",listHead );
				request.getSession().setAttribute("listHead",listHead);
			}
			if(request.getSession().getAttribute("listMbEnd")!=null){
				request.setAttribute("listMbEnd",request.getSession().getAttribute("listMbEnd") );
			}else{
				List<Map<String, Object>> listMbEnd = service.findlistMbEnd();
				request.setAttribute("listMbEnd",listMbEnd );
				request.getSession().setAttribute("listMbEnd",listMbEnd);
			}
			//判断有没有未读信息
			if(request.getSession().getAttribute(Constant.SESSION_USER)!=null && !request.getSession().getAttribute(Constant.SESSION_USER).equals("")){
				FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
				Integer hasMyMsg = service.hasMyMsg(fu.getFa_id());
				request.setAttribute("hasMyMsg",hasMyMsg);
			}
			
			
			//seo
			Properties pro = new Properties();
			URL url = BaseController.class.getClassLoader().getResource("task.properties");
			FileInputStream fis = new FileInputStream(url.getFile());
			pro.load(fis);
			request.setAttribute("keepname", pro.getProperty("keep.name"));
			request.setAttribute("keepdesc", pro.getProperty("keep.desc"));
			request.setAttribute("keeplottery", pro.getProperty("keep.lottery"));
			request.setAttribute("keepimg", pro.getProperty("keep.img"));
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	public FaUser islogin(HttpServletRequest request){
		if(request.getSession().getAttribute(Constant.SESSION_USER)!=null && !request.getSession().getAttribute(Constant.SESSION_USER).equals("")){
			FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
			
			if(fu!=null && fu.getFa_id()!=null){
				request.setAttribute("fu", fu);
				return fu;
			}else{
				return null;
			}
		}else{
			Cookie cookie = CookieTools.getCookie(Constant.COOKIE_NAME, request);
			System.out.println("cookie:是否存在：");
			System.out.println(cookie!=null);
			if(cookie!=null && !cookie.getValue().equals("")){
				String ids = CookieUtils.decodeBase64(cookie.getValue());
				String id =ids.substring(0, ids.indexOf("-"));
				String psw = ids.substring(ids.indexOf("-")+1);
				FaUser fu = mservice.getMemberById(id);
				if(fu==null || fu.getFa_id()==null){
					return null;
				}
				if(fu.getFa_password().equals(psw)){
					request.getSession().setAttribute(Constant.SESSION_USER, fu);
					request.setAttribute("fu", fu);
					service.loginAddInteAndFeibiao(request,fu);
					return fu;
				}else{
					return null;
				}
			}else{
				return null;
			}
			
		}
		
	}
}
