package feiao.forum.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import feiao.forum.service.util.FeiaoDataMsg;
import feiao.forum.service.util.InteRP;
import feiao.forum.task.TimedTaskHot;

@Controller

@RequestMapping("/base")
public class BaseController {
	/*TODO*******************************积分奖惩制度************************************************************/
	//挑转到积分奖惩信息列表页面
	@RequiresPermissions("baserp:view")
	@RequestMapping("/returnRp.do")
	public String returnRp(HttpServletRequest request,HttpServletResponse response){
		InteRP rp = FeiaoDataMsg.findRP(request.getSession().getServletContext());
		request.setAttribute("rp", rp);
		
		return "base/rp/index";
	}
	//保存积分奖惩信息
	@RequiresPermissions("baserp:update")
	@RequestMapping(value="/updateRps.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateRp(HttpServletRequest request,InteRP rp){
		Map<String, Object> map = new HashMap<>();
		try {
			Document doc = new SAXReader().read(new File(request.getSession().getServletContext().getRealPath("core.xml")));
			Element root = doc.getRootElement();
			//发表回复
			Element respeak = (Element) root.elements().get(0);
			
			Element rjval = (Element) respeak.elements().get(1);
			Element rfval = (Element) respeak.elements().get(2);
			Element rzval = (Element) respeak.elements().get(3);
			Element rtval = (Element) respeak.elements().get(4);
			rjval.element("value").setText(rp.getRespeakInte().toString());
			rfval.element("value").setText(rp.getRespeakFb().toString());
			rzval.element("value").setText(rp.getRespeakz().toString());
			rtval.element("value").setText(rp.getRespeakt().toString());
			//发表主题帖子
			Element theme = (Element) root.elements().get(1);
			
			Element tjval = (Element) theme.elements().get(1);
			Element tfval = (Element) theme.elements().get(2);
			Element tzval = (Element) theme.elements().get(3);
			Element ttval = (Element) theme.elements().get(4);
			tjval.element("value").setText(rp.getThemeInte().toString());
			tfval.element("value").setText(rp.getThemeFb().toString());
			tzval.element("value").setText(rp.getThemez().toString());
			ttval.element("value").setText(rp.getThemet().toString());
			//帖子加精
			Element jing = (Element) root.elements().get(2);
			
			Element jjval = (Element) jing.elements().get(1);
			Element jfval = (Element) jing.elements().get(2);
			Element jzval = (Element) jing.elements().get(3);
			Element jtval = (Element) jing.elements().get(4);
			jjval.element("value").setText(rp.getJingInte().toString());
			jfval.element("value").setText(rp.getJingFb().toString());
			jzval.element("value").setText(rp.getJingz().toString());
			jtval.element("value").setText(rp.getJingt().toString());
			//删帖
			Element del = (Element) root.elements().get(3);
			
			Element djval = (Element) del.elements().get(1);
			Element dfval = (Element) del.elements().get(2);
			Element dzval = (Element) del.elements().get(3);
			Element dtval = (Element) del.elements().get(4);
			djval.element("value").setText(rp.getDeleteInte().toString());
			dfval.element("value").setText(rp.getDeleteFb().toString());
			dzval.element("value").setText(rp.getDeletez().toString());
			dtval.element("value").setText(rp.getDeletet().toString());
			//登录
			Element login = (Element) root.elements().get(4);
			
			Element ljval = (Element) login.elements().get(1);
			Element lfval = (Element) login.elements().get(2);
			Element lzval = (Element) login.elements().get(3);
			Element ltval = (Element) login.elements().get(4);
			ljval.element("value").setText(rp.getLoginInte().toString());
			lfval.element("value").setText(rp.getLoginFb().toString());
			lzval.element("value").setText(rp.getLoginz().toString());
			ltval.element("value").setText(rp.getLogint().toString());
			//参与投票
			Element vote = (Element) root.elements().get(5);
			
			Element vjval = (Element) vote.elements().get(1);
			Element vfval = (Element) vote.elements().get(2);
			Element vzval = (Element) vote.elements().get(3);
			Element vtval = (Element) vote.elements().get(4);
			vjval.element("value").setText(rp.getVoteInte().toString());
			vfval.element("value").setText(rp.getVoteFb().toString());
			vzval.element("value").setText(rp.getVotez().toString());
			vtval.element("value").setText(rp.getVotet().toString());
			//设置头像
			Element title = (Element) root.elements().get(6);
			
			Element ijval = (Element) title.elements().get(1);
			Element ifval = (Element) title.elements().get(2);
			Element izval = (Element) title.elements().get(3);
			Element itval = (Element) title.elements().get(4);
			ijval.element("value").setText(rp.getTitleInte().toString());
			ifval.element("value").setText(rp.getTitleFb().toString());
			izval.element("value").setText(rp.getTitlez().toString());
			itval.element("value").setText(rp.getTitlet().toString());
			//邮箱认证
			Element email = (Element) root.elements().get(7);
			
			Element ejval = (Element) email.elements().get(1);
			Element efval = (Element) email.elements().get(2);
			Element ezval = (Element) email.elements().get(3);
			Element etval = (Element) email.elements().get(4);
			ejval.element("value").setText(rp.getEmailInte().toString());
			efval.element("value").setText(rp.getEmailFb().toString());
			ezval.element("value").setText(rp.getEmailz().toString());
			etval.element("value").setText(rp.getEmailt().toString());
			//产品注册
			Element pro = (Element) root.elements().get(8);
			
			Element pjval = (Element) pro.elements().get(1);
			Element pfval = (Element) pro.elements().get(2);
			Element pzval = (Element) pro.elements().get(3);
			Element ptval = (Element) pro.elements().get(4);
			pjval.element("value").setText(rp.getProInte().toString());
			pfval.element("value").setText(rp.getProFb().toString());
			pzval.element("value").setText(rp.getProz().toString());
			ptval.element("value").setText(rp.getProt().toString());
			//签到
			Element sno = (Element) root.elements().get(9);
			
			Element sjval = (Element) sno.elements().get(1);
			Element sfval = (Element) sno.elements().get(2);
			Element szval = (Element) sno.elements().get(3);
			Element stval = (Element) sno.elements().get(4);
			sjval.element("value").setText(rp.getSignInte().toString());
			sfval.element("value").setText(rp.getSignFb().toString());
			szval.element("value").setText(rp.getSignz().toString());
			stval.element("value").setText(rp.getSignt().toString());
			XMLWriter xmlWriter = new XMLWriter(new FileOutputStream(request.getSession().getServletContext().getRealPath("core.xml")),OutputFormat.createPrettyPrint());
			xmlWriter.write(doc);
			xmlWriter.close();
			map.put("tip", "success");
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			map.put("tip", "访问失败，请重新加载页面");
			return map;
		}
	}
	/*TODO*******************************网站信息配置************************************************************/
	//挑转到官网基本信息页面
	@RequiresPermissions("basebs:view")
	@RequestMapping("/returnBs.do")
	public String returnBs(HttpServletRequest request,HttpServletResponse response) throws Exception{
		Properties pro = new Properties();
		URL url = BaseController.class.getClassLoader().getResource("task.properties");
		FileInputStream fis = new FileInputStream(url.getFile());
		pro.load(fis);
		String  Str = pro.getProperty("task.hot.time").trim();
		request.setAttribute("pros", Str.charAt(8));
		request.setAttribute("keepname", pro.getProperty("keep.name"));
		request.setAttribute("keepdesc", pro.getProperty("keep.desc"));
		request.setAttribute("keepcode", pro.getProperty("keep.code"));
		
		return "base/bs/index";
	}
	//保存官网基本信息
	
	@RequiresPermissions("basebs:update")
	@RequestMapping(value="/updateBs.do")
	@ResponseBody
	public Map<String, Object> updateBs(HttpServletRequest request,Integer pros, String keepname,String keepdesc,String keepcode){
		Map<String, Object> map = new HashMap<>();
		try {
			String str = "0 0 0 1/"+pros+" * ? ";
			Properties pro = new Properties();
			URL url = BaseController.class.getClassLoader().getResource("task.properties");
			FileInputStream fis = new FileInputStream(url.getFile());
			pro.load(fis);
			pro.setProperty("task.hot.time", str);
			pro.setProperty("keep.name", keepname);
			pro.setProperty("keep.desc", keepdesc);
			pro.setProperty("keep.code", keepcode);
			FileOutputStream fos=new FileOutputStream(url.getFile());
			pro.store(fos,null);
			TimedTaskHot.cron=str;
			map.put("tip", "success");
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			map.put("tip", "服务器加载发生错误");
			return map;
		} 
	}
	
}
