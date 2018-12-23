package feiao.forum.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import feiao.forum.excel.ExcelTools;
import feiao.forum.pojo.FaLabel;
import feiao.forum.pojo.FaProduct;
import feiao.forum.pojo.FaRank;
import feiao.forum.pojo.FaWare;
import feiao.forum.service.ProductService;

@Controller
@RequestMapping("/pro")
public class ProductController {
	@Autowired
	private ProductService service;
	
	
/*TODO*******************************会员产品************************************************************/
	
	//跳转到增加产品页面
	@RequiresPermissions("cppro:add")
	@RequestMapping("/addPro.do")
	public String addPro(HttpServletRequest request,Integer curpage){
		
		
		request.setAttribute("curpage", curpage);
		return "mb/pro/addpro";
	}
	//跳转到修改产品页面
	@RequiresPermissions("cppro:view")
	@RequestMapping("/updatePro.do")
	public String updatePro(HttpServletRequest request,Integer curpage,String id){
		
		FaProduct fp = service.getProById(id);
		request.setAttribute("faProduct", fp);
		request.setAttribute("curpage", curpage);
		return "mb/pro/updatepro";
	}
	
	//增加产品
	@RequiresPermissions("cppro:add")
	@RequestMapping("/sureAddPro.do")
	@ResponseBody
	public Map<String, Object> sureAddPro(HttpServletRequest request,FaProduct fp){
		
		String tip = service.addProData(fp);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改产品
	@RequiresPermissions("cppro:update")
	@RequestMapping(value="/sureUpdatePro.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdatePro(HttpServletRequest request,FaProduct fp){
		
		String tip = service.updateProData(fp);
		
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	
	//删除产品
	@RequiresPermissions("cppro:delete")
	@RequestMapping("/deletePro.do")
	@ResponseBody
	public Map<String, Object> deletePro(HttpServletRequest request,String id,Integer curpage){
		
		Integer tip = service.deleteProData(id);
		Map<String, Object> map = new HashMap<>();
		map.put("curpage", curpage);
		map.put("tip", tip);
		return map;
	}
	//删除产品具体信息
	@RequiresPermissions("cppro:delete")
	@RequestMapping("/deleteProErp.do")
	@ResponseBody
	public Map<String, Object> deleteProErp(HttpServletRequest request,Integer id,Integer curpage){
		
		Integer tip = service.deleteProErpData(id);
		Map<String, Object> map = new HashMap<>();
		map.put("curpage", curpage);
		map.put("tip", tip);
		return map;
	}
	//挑转到产品列表页面
	@RequiresPermissions("cppro:view")
	@RequestMapping("/returnPro.do")
	public String retrunPro(HttpServletRequest request,HttpServletResponse response){
		
		if(request.getParameter("curpage")!=null){
			if(request.getParameter("curpage").equals("0")){
				request.setAttribute("curpage", 1);
			}else{
				request.setAttribute("curpage", request.getParameter("curpage"));
			}
			
		}else{
			request.setAttribute("curpage", 1);
		}
		return "mb/pro/index";
	}
	//分页展示产品信息
	@RequiresPermissions("cppro:view")
	@RequestMapping("/selectPro.do")
	@ResponseBody
	public Map<String, Object> selectPro(HttpServletRequest request,Integer curpage){
		if(curpage<1){
			curpage=1;
		}
		Integer pagesize = 50;
		Map<String, Object> map =new HashMap<>();
		String search = request.getParameter("searchname");
		
		List<FaProduct> list = service.getProByPage(curpage,search,pagesize);
		Long total = service.getTotalByPro(search);
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
		System.out.println(map);
		return map;
	}
	//分页展示产品具体信息
	@RequiresPermissions("cppro:view")
	@RequestMapping("/selectProErp.do")
	@ResponseBody
	public Map<String, Object> selectProErp(HttpServletRequest request,Integer curpage,String id){
		if(curpage<1){
			curpage=1;
		}
		Integer pagesize = 50;
		Map<String, Object> map =new HashMap<>();
		
		List<Map<String, Object>> list = service.getProErpByPage(curpage,id,pagesize);
		Long total = service.getTotalByProErp(id);
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
		System.out.println(map);
		return map;
	}
	//导入
	@RequiresPermissions("cppro:import")
	@RequestMapping("/excelToPro.do")
	@ResponseBody
	public Map<String, Object> excelToPro(String id,MultipartFile  upFile){
		Map<String, Object> ma = new HashMap<>();
		try {
			
			
			String hz = upFile.getOriginalFilename();
			System.err.println(hz);
			System.err.println(hz.substring(hz.lastIndexOf(".")+1));
			if(hz.substring(hz.lastIndexOf(".")+1).equals("xls")){
				List<Map<Integer, Object>> list = ExcelTools.excelImport(upFile);
				for (Map<Integer, Object> map : list) {
					if(map.get(0)==null || map.get(0).toString().equals("")){
						map.put(0, "excel导入时没找到该值，请删除该行数据");
					}
					if(map.get(1)==null || map.get(1).toString().equals("")){
						map.put(1, "excel导入时没找到该值，请删除该行数据");
					}
					if(map.get(2)==null || map.get(2).toString().equals("")){
						map.put(2, id);
					}
				}
				String str = service.excelToPro(list);
				ma.put("tip", str);
				return ma;
			}else{
				ma.put("tip", "请导入.xls格式的文件");
				return ma;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			ma.put("tip", "上传发生错误，请重新上传");
			return ma;
		}
		
		
	}
	//异步加载所有手机型号信息
	@RequestMapping("/getAllPro.do")
	@ResponseBody
	public List<Map<String, Object>> getAllPro(){
		return service.getAllPro();
	}
	/*TODO*******************************固件************************************************************/
	//跳转到增加固件页面
	@RequiresPermissions("cpware:add")
	@RequestMapping("/addWare.do")
	public String addWare(HttpServletRequest request,Integer curpage){
		
		
		request.setAttribute("curpage", curpage);
		return "mb/ware/addware";
	}
	//跳转到修改固件页面
	@RequiresPermissions("cpware:view")
	@RequestMapping("/updateWare.do")
	public String updateWare(HttpServletRequest request,Integer curpage,String id){
		
		FaWare fr = service.getWareById(id);
		request.setAttribute("faWare", fr);
		request.setAttribute("curpage", curpage);
		return "mb/ware/updateware";
	}
	//增加固件
	@RequiresPermissions("cpware:add")
	@RequestMapping("/sureAddWare.do")
	@ResponseBody
	public Map<String, Object> sureAddWare(HttpServletRequest request,FaWare fr){
		
		String tip = service.addWareData(fr);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改固件
	@RequiresPermissions("cpware:update")
	@RequestMapping(value="/sureUpdateWare.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateWare(HttpServletRequest request,FaWare fr){
		
		String tip = service.updateWareData(fr);
		
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//删除固件
	@RequiresPermissions("cpware:delete")
	@RequestMapping("/deleteWare.do")
	@ResponseBody
	public Map<String, Object> deleteWare(HttpServletRequest request,String id,Integer curpage){
		
		Integer tip = service.deleteWareData(id);
		Map<String, Object> map = new HashMap<>();
		map.put("curpage", curpage);
		map.put("tip", tip);
		return map;
	}
	//挑转到固件列表页面
	@RequiresPermissions("cpware:view")
	@RequestMapping("/returnWare.do")
	public String retrunWare(HttpServletRequest request,HttpServletResponse response){
		
		if(request.getParameter("curpage")!=null){
			
			if(request.getParameter("curpage").equals("0")){
				request.setAttribute("curpage", 1);
			}else{
				request.setAttribute("curpage", request.getParameter("curpage"));
			}
			
		}else{
			request.setAttribute("curpage", 1);
		}
		return "mb/ware/index";
	}
	//分页展示固件信息
	@RequiresPermissions("cpware:view")
	@RequestMapping("/selectWare.do")
	@ResponseBody
	public Map<String, Object> selectWare(HttpServletRequest request,Integer curpage){
		Integer pagesize = 50;
		if(curpage<1){
			curpage =1;
		}
		Map<String, Object> map =new HashMap<>();
		String search = request.getParameter("searchname");
		
		List<FaWare> list = service.getWareByPage(curpage,search,pagesize);
		Long total = service.getTotalByWare(search);
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
}
