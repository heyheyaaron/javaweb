package feiao.forum.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.HttpException;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import feiao.forum.emailUtil.EmailUtil;
import feiao.forum.pojo.FaConMsg;
import feiao.forum.pojo.FaGoods;
import feiao.forum.pojo.FaLotteryPrice;
import feiao.forum.pojo.FaUser;
import feiao.forum.pojo.FaWare;
import feiao.forum.sendmsg.SendSms;
import feiao.forum.service.BbsService;
import feiao.forum.service.Constant;
import feiao.forum.service.ContentService;
import feiao.forum.service.CoreService;
import feiao.forum.service.LotteryService;
import feiao.forum.service.MemberService;
import feiao.forum.service.NoteService;
import feiao.forum.util.CookieTools;
import feiao.forum.util.MD5;
import feiao.forum.util.RandomTools;

@Controller
@RequestMapping("/")
public class FeiioController extends CoreController{
	@Autowired
	private CoreService service;
	@Autowired
	private ContentService cservice;
	@Autowired
	private MemberService mservice;
	@Autowired
	private VerifyController vr;
	@Autowired
	private NoteService nservice;
	@Autowired
	private BbsService bservice;
	@Autowired
	private LotteryService lservice;
	//首页
	@RequestMapping("/")
	public String index(HttpServletRequest request){
		
		try {
			//判断是否登录
			FaUser fu = islogin(request);
			request.setAttribute("fu", fu);
			//今天发帖数
			Long nowCount = nservice.getCountByToday();
			//总发帖数
			Long noteCount = bservice.getTotalByNote(null, 0, 0);
			//会员数
			Long memberCount = mservice.getTotalByMember(null, 0,0,null);
			//展示首页头部脚部信息
			showProtalMsg(request);
			//首页banner图
			List<Map<String, Object>> listbanner = service.findIndexBanner();
			//查询所有父版块
			List<Map<String, Object>> listmodel = service.findIndexModel();
			//查询热帖
			List<Map<String, Object>> hotnote = nservice.getHotNote();
			//查询推荐贴
			List<Map<String, Object>> tjnote = nservice.getTjNote();
			//查询最新活动
			List<Map<String, Object>> hdnote = nservice.getHdNote(22);
			//查询新手教堂
			List<Map<String, Object>> ktnote = nservice.getHdNote(23);
			//查询固件
			List<Map<String, Object>> gujian = nservice.getHdNote(28);
			//查询系统帖子
			List<Map<String, Object>> xtnote = nservice.getHdNote(24);
			
			request.setAttribute("gujian",gujian);
			request.setAttribute("listbanner",listbanner );
			request.setAttribute("listmodel",listmodel );
			request.setAttribute("nowCount",nowCount);
			request.setAttribute("noteCount",noteCount);
			request.setAttribute("memberCount",memberCount);
			request.setAttribute("hotnote",hotnote);
			request.setAttribute("tjnote",tjnote);
			request.setAttribute("hdnote",hdnote);
			request.setAttribute("ktnote",ktnote);
			request.setAttribute("xtnote",xtnote);
			Integer issign = nservice.signIsTrueOrFalse(request,fu);
			request.setAttribute("issign",issign);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return "index";
	}
	//跳转普通登录页面
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request){
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
		
		return "login/index";
	}
	//退出
	@RequestMapping("/logouts.do")
	public String logout(HttpServletRequest request,HttpServletResponse response){
		//判断是否登录
		if(request.getSession().getAttribute(Constant.SESSION_USER)!=null){
			request.getSession().removeAttribute(Constant.SESSION_USER);
		}
		if(CookieTools.getCookie(Constant.COOKIE_NAME, request)!=null){
			CookieTools.removeCookie(Constant.COOKIE_NAME, response, request);
		}
		showProtalMsg(request);
		Map<String, Object> m1 = cservice.findIndexWB();
		Map<String, Object> m2 = cservice.findIndexWX();
		Map<String, Object> m3 = cservice.findIndexQQ();
		request.setAttribute("weibo",m1.get("url"));
		request.setAttribute("weixin",m2.get("image"));
		request.setAttribute("QQ",m3.get("url"));
		return "login/index";
	}
	
	
	//跳转到注册页面
	@RequestMapping("/register.do")
	public String register(HttpServletRequest request){
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
		//查询系统帖子
		List<Map<String, Object>> xtnote = nservice.getHdNote(32);
		List<Map<String, Object>> htnote = nservice.getHdNote(33);
		request.setAttribute("x1",xtnote);
		request.setAttribute("x2",htnote);
		return "register/index";
	}
	//登录
	@RequestMapping("/sureLogin.do")
	@ResponseBody
	public Map<String, Object> sureLogin(HttpServletResponse response,HttpServletRequest request,String username,String password,Integer key) throws Exception{
		
		Map<String, Object> map = new HashMap<>();
		//判断是否登录
		if(islogin(request)!=null){
			map.put("tip", "您已登录，不能进行此操作");
			return map;
		}
		if(key==null){
			key=0;
		}
		String tip = service.login(username,password,key,request,response);
		map.put("tip", tip);
		
		return map;
	}
	//登录
	@RequestMapping("/sureAsyncLogin.do")
	@ResponseBody
	public Map<String, Object> sureAsyncLogin(HttpServletResponse response,HttpServletRequest request,String user_id,String password,String code,String a) throws Exception{
		
		Map<String, Object> map = new HashMap<>();
		//判断是否登录
		if(islogin(request)!=null){
			map.put("code", "1");
			map.put("msg", "error");
			return map;
		}
		if(!a.equals("login")){
			map.put("code", "1");
			map.put("msg", "error");
			return map;
		}
		Properties pro = new Properties();
		URL url = BaseController.class.getClassLoader().getResource("task.properties");
		FileInputStream fis = new FileInputStream(url.getFile());
		pro.load(fis);
		String dbcode = pro.getProperty("keep.code");
		if(!MD5.getMD5(dbcode+user_id).equals(code)){
			map.put("code", "1");
			map.put("msg", "error");
			return map;
		}
		Integer key=0;
		
		String tip = service.login(user_id,password,key,request,response);
		if(tip.equals("success")){
			FaUser fu = islogin(request);
			map.put("code", "1");
			map.put("msg", "success");
			Map<String, Object> maps = new HashMap<>();
			maps.put("user_id", fu.getFa_username());
			maps.put("uid", fu.getFa_id());
			maps.put("email", fu.getFa_email());
			map.put("data", maps);
		}else{
			map.put("code", "1");
			map.put("msg", "error");
		}
		map.put("tip", tip);
		
		return map;
	}
	//验证邮箱是否存在并且发送邮件
	@RequestMapping("/sendEmailForRegister.do")
	@ResponseBody
	public Map<String, Object> sendEmailForRegister(HttpServletRequest request,String email){
		
		Map<String, Object> map = new HashMap<>();
		//判断是否登录
		if(islogin(request)!=null){
			map.put("tip", "您已登录，不能进行此操作");
			return map;
		}
		try {
			Integer isTrue = mservice.validateEmailIsTrue(email);
			if(isTrue.equals(1)){
				String code = RandomTools.getRandomString(30);
				Integer i = service.saveEmailByRe(email,MD5.getMD5(code));
				if(i.equals(1)){
					EmailUtil.send(email, "飞傲论坛会员注册", "请你点击以下链接完成注册操作:<br/><a href='"+Constant.WEB_FA+"/returnRegister.do?email="+email+"&code="+MD5.getMD5(code)+"' target='_blank' >"+Constant.WEB_FA+"/returnRegister.do?email="+email+"&code="+MD5.getMD5(code)+"</a>");
					map.put("tip", "success");
				}else{
					map.put("tip", "网络出现异常，请稍后再操作");
				}
			}else{
				map.put("tip", "该邮箱已被注册");
			}
		} catch (Exception e) {
			map.put("tip", "网络出现异常，请稍后再操作");
			e.printStackTrace();
		}
		
		
		return map;
	}
	//跳转到邮箱点击后的注册页面
	@RequestMapping("/returnRegister.do")
	public String returnRegister(HttpServletRequest request,String email,String code){
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
		//验证是否正确
		Integer i = service.vidEmail(email,code);
		if(i.equals(1)){
			request.setAttribute("email",email);
			return "register/emaillogin";
		}else{
			return "error";
		}
		
	}
	//注册
	@RequestMapping(value="/RegisterMemberForEmail.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> RegisterMemberForEmail(HttpServletRequest request,String email,String password,String username){
		Map<String, Object> map = new HashMap<>();
		//判断是否登录
		if(islogin(request)!=null){
			map.put("tip", "您已登录，不能进行此操作");
			return map;
		}
		//防盗链
		
		String referer = request.getHeader("referer");
		if(referer.indexOf("?")>0){
			referer = referer.substring(0, referer.indexOf("?"));
		}
		String heardUrl = request.getRequestURL().substring(0, request.getRequestURL().indexOf("/RegisterMemberForEmail.do"))+"/returnRegister.do";
		Map<String, Object> maps = new HashMap<>();
		if(referer.equals(heardUrl)){
			if(password.length()>=6 &&password.length()<=18){
				//新建会员
				Integer i = service.createMember(email,password,request,username);
				if(i.equals(1)){
					map.put("tip", "success");
				}else if(i.equals(5)){
					map.put("tip", "该昵称已被使用");
				}else if(i.equals(6)){
					map.put("tip", "昵称不能为纯数字，并且不能包含@字符");
				}else{
					map.put("tip", "该邮箱已被注册");
				}
			}else{
				map.put("tip", "密码长度为6到18位");
			}
			
			
		}else{
			map.put("tip", "系统已记录你的违规操作，请从正常路径访问此URL");
		}
		
		
		return map;
	}
	//发送手机验证码
	@RequestMapping("/sendCodeByTel.do")
	@ResponseBody
	public Map<String, Object> sendCodeByTel(HttpServletRequest request,String tel){
		Map<String, Object> map = new HashMap<>();
		try {
			String vode = RandomStringUtils.randomNumeric(6);
			request.getSession().setAttribute("telCodes", vode);
			SendSms.sendSMSDemo(tel, vode);
			map.put("tip", "success");
		} catch (Exception e) {
			map.put("tip", "系统发生异常");
			e.printStackTrace();
		} 
		
		return map;
	}
	
	
	//发送邮箱验证码
	@RequestMapping("/sendCodeByEmail.do")
	@ResponseBody
	public Map<String, Object> sendCodeByEmail(HttpServletRequest request,String email){
		
		Map<String, Object> map = new HashMap<>();
		try {
			String vode = RandomStringUtils.randomNumeric(6);
			request.getSession().setAttribute("emailCodes", vode);
			EmailUtil.send(email, "飞傲论坛会员找回密码", "您的验证码为："+vode+"请不要泄露给任何人");
			map.put("tip", "success");
		} catch (Exception e) {
			map.put("tip", "系统发生异常");
			e.printStackTrace();
		} 
		
		return map;
	}
	//跳转到固件下载页面
	@RequestMapping("/firmwareDown.do")
	public String firmwareDown(HttpServletRequest request, Integer id){
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = service.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "pro/down";
	}
	//分页查询固件下载信息
	@RequestMapping(value="/selectFirmwareByPage.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectFirmwareByPage(HttpServletRequest request,Integer curpage){
		FaUser fu = islogin(request);
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 25;
		if(curpage==null || curpage<1){
			curpage=1;
		}
		map.put("curpage", curpage);
		curpage = (curpage-1)*pagesize;
		
		List<FaWare> data = service.selectFirmwareByPage(curpage,pagesize);
		Long totalpage = service.selectFirmwareCount();
		map.put("totalsize", totalpage);
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		
		map.put("rows", data);
		
		return map;
	}
	//跳转到抽奖页面
	@RequestMapping("/luckDraw.do")
	public String luckDraw(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = service.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		//右侧广告
		List<Map<String, Object>> xtnote = nservice.getHdNote(30);
		request.setAttribute("guanggao",xtnote);
		//最新抽奖记录
		List<Map<String, Object>> cjlist = service.getLotteryUserMsg();
		request.setAttribute("cjlist",cjlist);
		//查询所有的奖品
		List<FaLotteryPrice> apz = lservice.getAllPrize();
		request.setAttribute("apz",apz);
		return "pro/choujiang";
	}
}
