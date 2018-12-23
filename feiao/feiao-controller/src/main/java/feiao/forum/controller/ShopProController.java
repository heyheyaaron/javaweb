package feiao.forum.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import feiao.forum.pojo.FaGoods;
import feiao.forum.pojo.FaSection;
import feiao.forum.pojo.FaUser;
import feiao.forum.service.BbsService;
import feiao.forum.service.Constant;
import feiao.forum.service.CoreService;
import feiao.forum.service.NoteService;
import feiao.forum.service.ProductService;
import feiao.forum.service.ShopService;

@Controller
@RequestMapping("/shopPro")
public class ShopProController extends CoreController{
	@Autowired
	private BbsService bservice;
	@Autowired
	private CoreService cservice;
	@Autowired
	private NoteService nservice;
	@Autowired
	private ShopService sservice;
	//跳转到兑换商店页面
	@RequestMapping("/showShopProduct.do")
	public String sendThemeNote(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		request.setAttribute("fu", fu);
		//查询banner图
		List<Map<String, Object>> hdnote = nservice.getHdNote(26);
		request.setAttribute("banners", hdnote);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "pro/mall";
	}
	//跳转到兑换商店页面
	@RequestMapping("/buyThisProductBy.do")
	public String buyThisProductBy(HttpServletRequest request, Integer id){
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		request.setAttribute("fu", fu);
		FaGoods sg = sservice.getGoodById(id);
		request.setAttribute("sg", sg);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		//查询备注信息
		List<Map<String, Object>> hdnote = nservice.getHdNote(27);
		request.setAttribute("beizhus", hdnote);
		return "pro/shop-detail";
	}
	//分页查询商品商品信息
	@RequestMapping(value="/selectShopProByPage.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectShopProByPage(HttpServletRequest request,Integer curpage,Integer typess){
		FaUser fu = islogin(request);
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 12;
		if(curpage==null || curpage<1){
			curpage=1;
		}
		if(typess==null || typess<0){
			typess=0;
		}
		map.put("curpage", curpage);
		curpage = (curpage-1)*pagesize;
		
		List<Map<String, Object>> data = cservice.selectShopProByPage(curpage,pagesize,typess);
		Long totalpage = cservice.selectShopProCount(typess);
		map.put("totalsize", totalpage);
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		
		map.put("rows", data);
		
		return map;
	}
	//兑换商品
	@RequestMapping(value="/createShopGood.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createShopGood(HttpServletRequest request,Integer id,Integer count,String adress){
		FaUser fu = islogin(request);
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = sservice.createShopGood(fu,id,count,adress,request);
		map.put("tip", tip);
		
		return map;
	}
	//填抽奖地址
	@RequestMapping(value="/saveLotteryAdress.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveLotteryAdress(HttpServletRequest request,String id,String name,String tel,String adress){
		String referer = request.getHeader("referer");
		Map<String, Object> map = new HashMap<String, Object>();
		if(referer!=null ){
			if(referer.indexOf("?")>0){
				referer = referer.substring(0, referer.indexOf("?"));
			}
			String heardUrl = request.getRequestURL().substring(0, request.getRequestURL().indexOf("/shopPro/saveLotteryAdress.do"))+"/luckDraw.do";
			Map<String, Object> maps = new HashMap<>();
			if(!referer.equals(heardUrl)){
				map.put("tip", "系统已记录您的违规操作！");
				return map;
			}
		}else{
			map.put("tip", "系统已记录您的违规操作！");
			return map;
		}
		FaUser fu = islogin(request);
		String tip = sservice.saveLotteryAdress(fu,id,name,tel,adress);
		map.put("tip", tip);
		
		return map;
	}
	//抽奖
	@RequestMapping(value="/saveLotteryData.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveLotteryData(HttpServletRequest request,Integer id,Integer cost){
		String referer = request.getHeader("referer");
		Map<String, Object> map = new HashMap<String, Object>();
		if(referer!=null ){
			if(referer.indexOf("?")>0){
				referer = referer.substring(0, referer.indexOf("?"));
			}
			String heardUrl = request.getRequestURL().substring(0, request.getRequestURL().indexOf("/shopPro/saveLotteryData.do"))+"/luckDraw.do";
			Map<String, Object> maps = new HashMap<>();
			if(!referer.equals(heardUrl)){
				map.put("tip", "系统已记录您的违规操作！");
				return map;
			}
		}else{
			map.put("tip", "系统已记录您的违规操作！");
			return map;
		}
		try {
			FaUser fu = islogin(request);
			//获取数据
			Properties pro = new Properties();
			URL url = BaseController.class.getClassLoader().getResource("task.properties");
			FileInputStream fis = new FileInputStream(url.getFile());
			pro.load(fis);
			String tip = sservice.saveLotteryData(fu,id,request,cost,pro.getProperty("keep.everyone"),pro.getProperty("keep.total"));
			String[] split = tip.split(",");
			map.put("tip", split[0]);
			if(split.length>1){
				map.put("id", split[1]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return map;
	}
}
