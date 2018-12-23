package feiao.forum.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import feiao.forum.pojo.FaHonor;
import feiao.forum.pojo.FaLotteryPrice;
import feiao.forum.service.LotteryService;
import feiao.forum.task.TimedTaskHot;

@Controller
@RequestMapping("/lottery")
public class LotteryController {
	@Autowired
	public LotteryService service;
	
/*TODO*******************************奖品信息************************************************************/
	
	//跳转到增加奖品页面
	@RequiresPermissions("lotteryprize:add")
	@RequestMapping("/addPrize.do")
	public String addPrize(HttpServletRequest request){
		return "lottery/prize/addprize";
	}
	//跳转到修改奖品页面
	@RequiresPermissions("lotteryprize:update")
	@RequestMapping("/updatePrize.do")
	public String updatePrize(HttpServletRequest request,Integer id){
		
		FaLotteryPrice flp = service.getPrizeById(id);
		request.setAttribute("flp", flp);
		return "lottery/prize/updateprize";
	}
	
	//增加奖品
	@RequiresPermissions("lotteryprize:add")
	@RequestMapping("/sureAddPrize.do")
	@ResponseBody
	public Map<String, Object> sureAddPrize(HttpServletRequest request,FaLotteryPrice flp){
		
		String tip = service.addPrizeData(flp);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改奖品
	@RequiresPermissions("lotteryprize:update")
	@RequestMapping(value="/sureUpdatePrize.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdatePrize(HttpServletRequest request,FaLotteryPrice flp){
		
		String tip = service.updatePrizeData(flp);
		
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	
	//删除奖品
	@RequiresPermissions("lotteryprize:delete")
	@RequestMapping("/deletePrize.do")
	@ResponseBody
	public Map<String, Object> deletePrize(HttpServletRequest request,Integer id){
		
		Integer tip = service.deletePrizeData(id);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//挑转到奖品列表页面
	@RequiresPermissions("lotteryprize:view")
	@RequestMapping("/returnPrize.do")
	public String retrunPrize(HttpServletRequest request,HttpServletResponse response){
		
		return "lottery/prize/index";
	}
	//挑转到奖品页面
	@RequiresPermissions("lotterypic:view")
	@RequestMapping("/returnPic.do")
	public String retrunPic(HttpServletRequest request,HttpServletResponse response) throws Exception{
		Properties pro = new Properties();
		URL url = BaseController.class.getClassLoader().getResource("task.properties");
		FileInputStream fis = new FileInputStream(url.getFile());
		pro.load(fis);
		String  Str = pro.getProperty("task.hot.time").trim();
		request.setAttribute("keeplottery", pro.getProperty("keep.lottery"));
		request.setAttribute("keepimg", pro.getProperty("keep.img"));
		request.setAttribute("keepeveryone", pro.getProperty("keep.everyone"));
		request.setAttribute("keeptotal", pro.getProperty("keep.total"));
		return "lottery/index";
	}
	//保存抽奖基本信息
	
	@RequiresPermissions("lotterypic:view")
	@RequestMapping(value="/updateBs.do")
	@ResponseBody
	public Map<String, Object> updateBs(HttpServletRequest request,String keeplottery,String keepimg,String keeptotal,String keepeveryone){
		Map<String, Object> map = new HashMap<>();
		try {
			
			Properties pro = new Properties();
			URL url = BaseController.class.getClassLoader().getResource("task.properties");
			FileInputStream fis = new FileInputStream(url.getFile());
			pro.load(fis);
			pro.setProperty("keep.lottery", keeplottery);
			pro.setProperty("keep.img", keepimg);
			pro.setProperty("keep.everyone", keepeveryone);
			pro.setProperty("keep.total", keeptotal);
			FileOutputStream fos=new FileOutputStream(url.getFile());
			pro.store(fos,null);
			map.put("tip", "success");
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			map.put("tip", "服务器加载发生错误");
			return map;
		} 
	}
	//展示奖品信息
	@RequiresPermissions("lotteryprize:view")
	@RequestMapping("/selectPrize.do")
	@ResponseBody
	public Map<String, Object> selectPrize(HttpServletRequest request){
		Map<String, Object> map =new HashMap<>();
		
		List<FaLotteryPrice> list = service.getAllPrize();
		
		map.put("rows", list);
		
		return map;
	}
	/*TODO*******************************兑奖信息************************************************************/
	//挑转到兑奖列表页面
	@RequiresPermissions("lotterymsg:view")
	@RequestMapping("/returnMsg.do")
	public String retrunMsg(HttpServletRequest request,HttpServletResponse response){
		
		if(request.getParameter("curpage")!=null){
			if(request.getParameter("curpage").equals("0")){
				request.setAttribute("curpage", 1);
			}else{
				request.setAttribute("curpage", request.getParameter("curpage"));
			}
			
		}else{
			request.setAttribute("curpage", 1);
		}
		
		return "lottery/msg/index";
	}
	//分页展示标签信息
	@RequiresPermissions("lotterymsg:view")
	@RequestMapping("/selectMsg.do")
	@ResponseBody
	public Map<String, Object> selectMsg(HttpServletRequest request,Integer curpage){
		
		try {
			if(curpage<1){
				curpage=1;
			}
			Map<String, Object> map =new HashMap<>();
			String startday = request.getParameter("startday");
			String endday = request.getParameter("endday");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
			Date ss =null;
			Date ee =null;
			Integer pagesize = 50;
			if(startday!=null && !startday.equals("")){
				ss = sdf.parse(startday);
				if(endday==null||endday.equals("")){
					map.put("tip", 2);
					map.put("msg", "请填写查询的结束日期");
					return map;
				}
			}
			if(endday!=null && !endday.equals("")){
				ee = sdf.parse(endday);
				if(startday==null||startday.equals("")){
					map.put("tip", 2);
					map.put("msg", "请填写查询的开始日期");
					return map;
				}
			}
			Integer prizeType = 0;
			if(request.getParameter("prizeType")!=null &&!request.getParameter("prizeType").equals("")){
				prizeType = Integer.parseInt(request.getParameter("prizeType"));
			}
			List<Map<String, Object>> list = service.getLotteryMsgByPage(curpage,pagesize,ss,ee,prizeType);
			Long total = service.getTotalByLotteryMsg(ss,ee,prizeType);
			map.put("rows", list);
			map.put("total", total);
			map.put("curpage", curpage);
			map.put("tip", 1);
			int i = (int) (total/pagesize);
			if(total%pagesize!=0){
				map.put("totalpage", i+1);
			}else{
				map.put("totalpage", i);
			}
			if(map.get("totalpage").toString().equals("0")){
				map.put("totalpage", "1");
			}
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, Object> map = new HashMap<>();
			map.put("tip", 0);
			map.put("msg", "服务器发生错误");
			return map;
		}
	}
	//确认兑奖
	@RequiresPermissions("lotterymsg:tof")
	@RequestMapping("/surePrize.do")
	@ResponseBody
	public Map<String, Object> surePrize(HttpServletRequest request,String id){
		Map<String, Object> map =new HashMap<>();
		Integer tip = service.surePrize(id);
		map.put("tip", tip);
		return map;
	}
	//取消兑奖
	@RequiresPermissions("lotterymsg:tof")
	@RequestMapping("/cancelPrize.do")
	@ResponseBody
	public Map<String, Object> cancelPrize(HttpServletRequest request,String id){
		Map<String, Object> map =new HashMap<>();
		Integer tip = service.cancelPrize(id);
		map.put("tip", tip);
		return map;
	}
}
