package feiao.forum.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import feiao.forum.pojo.FaUser;
import feiao.forum.service.Constant;
import feiao.forum.service.ContentService;
import feiao.forum.service.MemberService;

@Controller
@RequestMapping("/forget")
public class ForgetController extends CoreController{
	@Autowired
	private MemberService mservice;
	@Autowired
	private ContentService cservice;
	//跳转到忘记密码第一步
	@RequestMapping("/firstPsw.do")
	public String firstPsw(HttpServletRequest request){
		//判断是否登录
		if(islogin(request)!=null){
			return "redirect:/fiioer/myFriendsMood.do";
		}
		showProtalMsg(request);
		Map<String, Object> m1 = cservice.findIndexWB();
		Map<String, Object> m2 = cservice.findIndexWX();
		Map<String, Object> m3 = cservice.findIndexQQ();
		request.setAttribute("weibo",m1.get("url"));
		request.setAttribute("weixin",m2.get("image"));
		request.setAttribute("QQ",m3.get("url"));
		return "forgetpwd/index";
	}
	//跳转到忘记密码第二步
	@RequestMapping("/secondPsw.do")
	public String secondPsw(HttpServletRequest request,String id){
		//判断是否登录
		if(islogin(request)!=null){
			return "redirect:/fiioer/myFriendsMood.do";
		}
		showProtalMsg(request);
		Map<String, Object> m1 = cservice.findIndexWB();
		Map<String, Object> m2 = cservice.findIndexWX();
		Map<String, Object> m3 = cservice.findIndexQQ();
		request.setAttribute("weibo",m1.get("url"));
		request.setAttribute("weixin",m2.get("image"));
		request.setAttribute("QQ",m3.get("url"));
		//防盗链
		//判断url
		
		String referer = request.getHeader("referer");
		//
		if(referer!=null ){
			if(referer.indexOf("?")>0){
				referer = referer.substring(0, referer.indexOf("?"));
			}
			String heardUrl = request.getRequestURL().substring(0, request.getRequestURL().indexOf("/secondPsw.do"))+"/firstPsw.do";
			Map<String, Object> maps = new HashMap<>();
			if(referer.equals(heardUrl)){
				FaUser fu = mservice.getMemberById(id);
				request.setAttribute("fu",fu);
				
				return "forgetpwd/toPhone";
			}else{
				return "redirect:/forget/firstPsw.do";
			}
		}else{
			return "redirect:/forget/firstPsw.do";
		}
	}
	//跳转到忘记密码第3步
	@RequestMapping("/thirdPsw.do")
	public String thirdPsw(HttpServletRequest request,String id){
		//判断是否登录
		if(islogin(request)!=null){
			return "redirect:/fiioer/myFriendsMood.do";
		}
		showProtalMsg(request);
		Map<String, Object> m1 = cservice.findIndexWB();
		Map<String, Object> m2 = cservice.findIndexWX();
		Map<String, Object> m3 = cservice.findIndexQQ();
		request.setAttribute("weibo",m1.get("url"));
		request.setAttribute("weixin",m2.get("image"));
		request.setAttribute("QQ",m3.get("url"));
		//防盗链
		//判断url
		request.setAttribute("id",id);
		String referer = request.getHeader("referer");
		
		//
		if(referer!=null ){
			if(referer.indexOf("?")>0){
				referer = referer.substring(0, referer.indexOf("?"));
			}
			String heardUrl = request.getRequestURL().substring(0, request.getRequestURL().indexOf("/thirdPsw.do"))+"/secondPsw.do";
			Map<String, Object> maps = new HashMap<>();
			if(referer.equals(heardUrl)){
				
				return "forgetpwd/toResetPwd";
			}else{
				return "redirect:/forget/firstPsw.do";
			}
		}else{
			return "redirect:/forget/firstPsw.do";
		}
	}
	//跳转到忘记密码第4步
	@RequestMapping("/forthPsw.do")
	public String forthPsw(HttpServletRequest request){
		//判断是否登录
		if(islogin(request)!=null){
			return "redirect:/fiioer/myFriendsMood.do";
		}
		showProtalMsg(request);
		Map<String, Object> m1 = cservice.findIndexWB();
		Map<String, Object> m2 = cservice.findIndexWX();
		Map<String, Object> m3 = cservice.findIndexQQ();
		request.setAttribute("weibo",m1.get("url"));
		request.setAttribute("weixin",m2.get("image"));
		request.setAttribute("QQ",m3.get("url"));
		
		//防盗链
		//判断url
		String referer = request.getHeader("referer");
		
		//
		if(referer!=null ){
			if(referer.indexOf("?")>0){
				referer = referer.substring(0, referer.indexOf("?"));
			}
			String heardUrl = request.getRequestURL().substring(0, request.getRequestURL().indexOf("/forthPsw.do"))+"/thirdPsw.do";
			Map<String, Object> maps = new HashMap<>();
			if(referer.equals(heardUrl)){
				
				return "forgetpwd/toSuccess";
			}else{
				return "redirect:/forget/firstPsw.do";
			}
		}else{
			return "redirect:/forget/firstPsw.do";
		}
	}
	//根据手机或邮箱查询手机号（第1部）
	@RequestMapping("/vidFirst.do")
	@ResponseBody
	public Map<String, Object> vidFirst(HttpServletRequest request,String username,String code){
		Map<String, Object> map = new HashMap<>();
		//判断是否登录
		if(islogin(request)!=null){
			map.put("tip", "您已登录，不能进行此操作");
			return map;
		}
		if(username==null || username.equals("")){
			map.put("tip", "手机号/邮箱不能为空");
			return map;
		}
		if(request.getSession().getAttribute("verify_code").toString().equals(code)){
			//根据手机或者邮箱查询id
			String id = mservice.getTelByTelOrEmail(username);
			if(id!=null && !id.equals("")){
				map.put("tip", "success");
				map.put("id", id);
				request.getSession().removeAttribute("verify_code");
			}else{
				map.put("tip", "手机号/邮箱不存在");
			}
		}else{
			map.put("tip", "验证码不正确");
		}
		
		return map;
	}
	//手机验证（找回密码第二部）
	@RequestMapping("/videTel.do")
	@ResponseBody
	public Map<String, Object> videTel(HttpServletRequest request,String vcode){
		Map<String, Object> map = new HashMap<>();
		//判断是否登录
		if(islogin(request)!=null){
			map.put("tip", "您已登录，不能进行此操作");
			return map;
		}
		String referer = request.getHeader("referer");
		//
		if(referer!=null ){
			if(referer.indexOf("?")>0){
				referer = referer.substring(0, referer.indexOf("?"));
			}
			String heardUrl = request.getRequestURL().substring(0, request.getRequestURL().indexOf("/videTel.do"))+"/secondPsw.do";
			Map<String, Object> maps = new HashMap<>();
			if(referer.equals(heardUrl)){
				if(request.getSession().getAttribute("telCodes")!=null &&request.getSession().getAttribute("telCodes").toString().equals(vcode)){
					
					map.put("tip", "success");
					request.getSession().removeAttribute("telCodes");
					
				}else{
					map.put("tip", "验证码不正确");
				}
			}else{
				map.put("tip", "系统已记录您的违规操作，请从正常路径访问！");
			}
		}else{
			map.put("tip", "系统已记录您的违规操作，请从正常路径访问！");
		}
		return map;
	}
	
	//手机验证（找回密码第二部）
		@RequestMapping("/videEmail.do")
		@ResponseBody
		public Map<String, Object> videEmail(HttpServletRequest request,String vcode){
			Map<String, Object> map = new HashMap<>();
			//判断是否登录
			if(islogin(request)!=null){
				map.put("tip", "您已登录，不能进行此操作");
				return map;
			}
			String referer = request.getHeader("referer");
			//
			if(referer!=null ){
				if(referer.indexOf("?")>0){
					referer = referer.substring(0, referer.indexOf("?"));
				}
				String heardUrl = request.getRequestURL().substring(0, request.getRequestURL().indexOf("/videEmail.do"))+"/secondPsw.do";
				Map<String, Object> maps = new HashMap<>();
				if(referer.equals(heardUrl)){
					if(request.getSession().getAttribute("emailCodes").toString().equals(vcode)){
						
						map.put("tip", "success");
						request.getSession().removeAttribute("emailCodes");
						
					}else{
						map.put("tip", "验证码不正确");
					}
				}else{
					map.put("tip", "系统已记录您的违规操作，请从正常路径访问！");
				}
			}else{
				map.put("tip", "系统已记录您的违规操作，请从正常路径访问！");
			}
			return map;
		}
	//密保问题（找回密码第二部）
	@RequestMapping("/videMibao.do")
	@ResponseBody
	public Map<String, Object> videMibao(HttpServletRequest request,String answer1,String answer2,String answer3,String id){
		Map<String, Object> map = new HashMap<>();
		//判断是否登录
		if(islogin(request)!=null){
			map.put("tip", "您已登录，不能进行此操作");
			return map;
		}
		String referer = request.getHeader("referer");
		//
		if(referer!=null ){
			if(referer.indexOf("?")>0){
				referer = referer.substring(0, referer.indexOf("?"));
			}
			String heardUrl = request.getRequestURL().substring(0, request.getRequestURL().indexOf("/videMibao.do"))+"/secondPsw.do";
			Map<String, Object> maps = new HashMap<>();
			if(referer.equals(heardUrl)){
				FaUser fu = mservice.getMemberById(id);
				if(fu.getFa_mibao_ar_st().equals(answer1)){
					if(fu.getFa_mibao_ar_nd().equals(answer2)){
						if(fu.getFa_mibao_ar_rd().equals(answer3)){
							map.put("tip", "success");
						}else{
							map.put("tip", "密保问题错误");
						}
					}else{
						map.put("tip", "密保问题错误");
					}
				}else{
					map.put("tip", "密保问题错误");
				}
			}else{
				map.put("tip", "系统已记录您的违规操作，请从正常路径访问！");
			}
		}else{
			map.put("tip", "系统已记录您的违规操作，请从正常路径访问！");
		}
		
		
		
		return map;
	}
	//修改密码（第三部）
	@RequestMapping("/resetPsw.do")
	@ResponseBody
	public Map<String, Object> resetPsw(HttpServletRequest request,String password,String id){
		Map<String, Object> map = new HashMap<>();
		//判断是否登录
		if(islogin(request)!=null){
			map.put("tip", "您已登录，不能进行此操作");
			return map;
		}
		
		
		String referer = request.getHeader("referer");
		//
		if(referer!=null ){
			if(referer.indexOf("?")>0){
				referer = referer.substring(0, referer.indexOf("?"));
			}
			String heardUrl = request.getRequestURL().substring(0, request.getRequestURL().indexOf("/resetPsw.do"))+"/thirdPsw.do";
			Map<String, Object> maps = new HashMap<>();
			if(referer.equals(heardUrl)){
				String tip = mservice.resetPsw(id,password);
				map.put("tip", tip);
			}else{
				map.put("tip", "系统已记录您的违规操作，请从正常路径访问！");
			}
		}else{
			map.put("tip", "系统已记录您的违规操作，请从正常路径访问！");
		}
		return map;
	}
}
