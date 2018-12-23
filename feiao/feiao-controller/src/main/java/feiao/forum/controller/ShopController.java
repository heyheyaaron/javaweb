package feiao.forum.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import feiao.forum.pojo.FaGoods;
import feiao.forum.pojo.FaGroups;
import feiao.forum.pojo.FaShopMsg;
import feiao.forum.service.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {
	@Autowired
	private ShopService service;
	/*TODO*******************************积分商城商品信息************************************************************/

	//跳转到增加商品页面
	@RequiresPermissions("shopgood:add")
	@RequestMapping("/addGood.do")
	public String addGood(HttpServletRequest request,Integer curpage){
		
		
		request.setAttribute("curpage", curpage);
		return "shop/good/addgood";
	}
	//跳转到修改商品页面
	@RequiresPermissions("shopgood:view")
	@RequestMapping("/updateGood.do")
	public String updateGood(HttpServletRequest request,Integer curpage,Integer id){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		
		FaGoods fg = service.getGoodById(id);
		String starttime="";
		String endtime ="";
		if(fg.getFa_starttime()!=null && !fg.getFa_starttime().equals("")){
			starttime = sdf.format(fg.getFa_starttime());
		}
		if(fg.getFa_endtime()!=null && !fg.getFa_endtime().equals("")){
			endtime = sdf.format(fg.getFa_endtime());
		}
		request.setAttribute("faGoods", fg);
		request.setAttribute("starttime", starttime);
		request.setAttribute("endtime", endtime);
		request.setAttribute("curpage", curpage);
		return "shop/good/updategood";
	}
	
	//增加商品
	@RequiresPermissions("shopgood:add")
	@RequestMapping("/sureAddGood.do")
	@ResponseBody
	public Map<String, Object> sureAddGood(HttpServletRequest request,FaGoods fg) throws ParseException{
		String startday = request.getParameter("startday");
		String endday = request.getParameter("endday");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		Date ss =null;
		Date ee =null;
		
		if(startday!=null && !startday.equals("")){
			ss = sdf.parse(startday);
			
		}
		if(endday!=null && !endday.equals("")){
			ee = sdf.parse(endday);
			
		}
		fg.setFa_starttime(ss);
		fg.setFa_endtime(ee);
		String tip = service.addGoodData(fg);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改商品
	@RequiresPermissions("shopgood:update")
	@RequestMapping(value="/sureUpdateGood.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateGood(HttpServletRequest request,FaGoods fg) throws ParseException{
		String startday = request.getParameter("startday");
		String endday = request.getParameter("endday");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		Date ss =null;
		Date ee =null;
		
		if(startday!=null && !startday.equals("")){
			ss = sdf.parse(startday);
			
		}
		if(endday!=null && !endday.equals("")){
			ee = sdf.parse(endday);
			
		}
		fg.setFa_starttime(ss);
		fg.setFa_endtime(ee);
		String tip = service.updateGoodData(fg);
		
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	
	//删除商品
	@RequiresPermissions("shopgood:delete")
	@RequestMapping("/deleteGood.do")
	@ResponseBody
	public Map<String, Object> deleteGood(HttpServletRequest request,Integer id,Integer curpage){
		
		Integer tip = service.deleteGoodData(id);
		Map<String, Object> map = new HashMap<>();
		map.put("curpage", curpage);
		map.put("tip", tip);
		return map;
	}
	//挑转到商品列表页面
	@RequiresPermissions("shopgood:view")
	@RequestMapping("/returnGood.do")
	public String retrunGood(HttpServletRequest request,HttpServletResponse response){
		
		if(request.getParameter("curpage")!=null){
			if(request.getParameter("curpage").equals("0")){
				request.setAttribute("curpage", 1);
			}else{
				request.setAttribute("curpage", request.getParameter("curpage"));
			}
			
		}else{
			request.setAttribute("curpage", 1);
		}
		return "shop/good/index";
	}
	//分页展示商品信息
	@RequiresPermissions("shopgood:view")
	@RequestMapping("/selectGood.do")
	@ResponseBody
	public Map<String, Object> selectGood(HttpServletRequest request,Integer curpage){
		if(curpage<1){
			curpage=1;
		}
		Integer pagesize = 50;
		Map<String, Object> map =new HashMap<>();
		String search = request.getParameter("searchname");
		
		List<FaGoods> list = service.getGoodByPage(curpage,search,pagesize);
		Long total = service.getTotalByGood(search);
		map.put("rows", list);
		map.put("total", total);
		map.put("curpage", curpage);
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
	}
	/*TODO*******************************积分商城商品订单信息************************************************************/
	//挑转到商品订单列表页面
	@RequiresPermissions("shopdata:view")
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
		String startday ="";
		String endday ="";
		Integer prizeType =0;
		if(request.getParameter("startday")!=null &&!request.getParameter("startday").equals("")){
			startday = request.getParameter("startday");
		}
		if(request.getParameter("endday")!=null &&!request.getParameter("endday").equals("")){
			endday = request.getParameter("endday");
		}
		if(request.getParameter("prizeType")!=null &&!request.getParameter("prizeType").equals("")){
			prizeType = Integer.parseInt(request.getParameter("prizeType"));
		}
		request.setAttribute("startday", startday);
		request.setAttribute("endday", endday);
		request.setAttribute("prizeType", prizeType);
		return "shop/data/index";
		}
	
	//分页展示标签信息
	@RequiresPermissions("shopdata:view")
	@RequestMapping("/selectMsg.do")
	@ResponseBody
	public Map<String, Object> selectMsg(HttpServletRequest request,Integer curpage){
		
		try {
			Map<String, Object> map =new HashMap<>();
			if(curpage<1){
				curpage=1;
			}
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
			List<Map<String, Object>> list = service.getShopMsgByPage((curpage-1)*pagesize,pagesize,ss,ee,prizeType);
			Long total = service.getTotalByShopMsg(ss,ee,prizeType);
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
	//跳转到商品订单页面
	@RequiresPermissions("shopdata:view")
	@RequestMapping("/viewShopGoodMsg.do")
	public String viewShopGoodMsg(HttpServletRequest request,String id,Integer curpage){
		String startday ="";
		String endday ="";
		Integer prizeType =0;
		if(request.getParameter("startday")!=null &&!request.getParameter("startday").equals("")){
			startday = request.getParameter("startday");
		}
		if(request.getParameter("endday")!=null &&!request.getParameter("endday").equals("")){
			endday = request.getParameter("endday");
		}
		if(request.getParameter("prizeType")!=null &&!request.getParameter("prizeType").equals("")){
			prizeType = Integer.parseInt(request.getParameter("prizeType"));
		}
		request.setAttribute("startday", startday);
		request.setAttribute("endday", endday);
		request.setAttribute("prizeType", prizeType);
		request.setAttribute("curpage", curpage);
		FaShopMsg fsm = service.getFSMById(id);
		request.setAttribute("fsm", fsm);
		return "shop/data/updatedata";
	}
	//发货/退款
	@RequiresPermissions("shopdata:view")
	@RequestMapping("/changeShopData.do")
	@ResponseBody
	public Map<String, Object> changeShopData(HttpServletRequest request,String id,Integer type){
		Map<String, Object> map = new HashMap<>();
		String tip = service.changeShopData(id,type);
		map.put("tip", tip);
		return map;
	}
}
