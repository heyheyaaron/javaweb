package feiao.forum.controller;

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

import feiao.forum.pojo.FaConMsg;
import feiao.forum.pojo.FaConType;
import feiao.forum.pojo.FaLabel;
import feiao.forum.service.ContentService;
@Controller
@RequestMapping("/con")
public class ContentController {
	
	@Autowired
	private ContentService service;
	/*TODO*******************************内容分类管理************************************************************/
	//跳转到增加内容分类页面
	@RequiresPermissions("contenttype:add")
	@RequestMapping("/addConType.do")
	public String addConType(HttpServletRequest request){
		
		return "content/type/addtype";
	}
	//跳转到修改内容分类页面
	@RequiresPermissions("contenttype:update")
	@RequestMapping("/updateConType.do")
	public String updateConType(HttpServletRequest request,Integer id){
		
		FaConType fl = service.getConTypeById(id);
		request.setAttribute("faConType", fl);
		return "content/type/updatetype";
	}
	//增加内容分类
	@RequiresPermissions("contenttype:add")
	@RequestMapping("/sureAddConType.do")
	@ResponseBody
	public Map<String, Object> sureAddConType(HttpServletRequest request,FaConType fl){
		
		String tip = service.addConTypeData(fl);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改内容分类
	@RequiresPermissions("contenttype:update")
	@RequestMapping(value="/sureUpdateConType.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateConType(HttpServletRequest request,FaConType fl){
		
		String tip = service.updateConTypeData(fl);
		
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//删除内容分类
	@RequiresPermissions("contenttype:delete")
	@RequestMapping("/deleteConType.do")
	@ResponseBody
	public Map<String, Object> deleteConType(HttpServletRequest request,Integer id){
		
		Integer tip = service.deleteConTypeData(id);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//挑转到内容分类列表页面
	@RequiresPermissions("contenttype:view")
	@RequestMapping("/returnConType.do")
	public String retrunConType(HttpServletRequest request,HttpServletResponse response){
		
		
		return "content/type/index";
	}
	//异步加载所有内容分类信息
	@RequiresPermissions("contenttype:view")
	@RequestMapping("/getAllConType.do")
	@ResponseBody
	public List<FaConType> getAllConType(){
		return service.getAllConType();
	}
	
	/*TODO*******************************内容信息管理************************************************************/
	//异步加载内容分类的内容树
	@RequiresPermissions("contentmsg:view")
	@RequestMapping("/loadConmsgTree.do")
	@ResponseBody
	public List<Map<String, Object>> loadConmsgTree(){
		return service.loadConmsgTree();
	}
	//异步加载内容分类的没有子元素的数据
	@RequiresPermissions("contentmsg:view")
	@RequestMapping("/selectAllMsgByCid.do")
	@ResponseBody
	public List<Map<String, Object>> selectAllMsgByCid(){
		return service.selectAllMsgByCid();
	}
	//挑转到内容分类列表页面
	@RequiresPermissions("contentmsg:view")
	@RequestMapping("/returnConMsg.do")
	public String retrunConMsg(HttpServletRequest request,HttpServletResponse response){
		
		
		return "content/msg/index";
	}
	//异步加载内容信息
	@RequiresPermissions("contentmsg:view")
	@RequestMapping("/selectConMsg.do")
	@ResponseBody
	public Map<String, Object> selectConMsg(HttpServletRequest request,int page,int rows,int id){
		Map<String, Object> map = new HashMap<>();
		//System.err.println(id+":::::"+page+"..........."+rows);
		List<Map<String, Object>> list = service.getConMsgByPage((page-1)*rows,rows,id);
		Long count = service.getCountByPid(id);
		map.put("rows", list);
		map.put("total", count);
		return map;
	}
	//跳转到增加内容分类页面
	@RequiresPermissions("contentmsg:add")
	@RequestMapping("/addConMsg.do")
	public String addConMsg(HttpServletRequest request,Integer id){
		request.setAttribute("id", id);
		return "content/msg/addmsg";
	}
	//跳转到修改内容分类页面
	@RequiresPermissions("contentmsg:view")
	@RequestMapping("/updateConMsg.do")
	public String updateConMsg(HttpServletRequest request,Integer id,String bid){
		FaConMsg fcm = service.getFCMForId(bid);
		request.setAttribute("id", id);
		request.setAttribute("fcm", fcm);
		return "content/msg/updatemsg";
	}
	//增加内容
	@RequiresPermissions("contentmsg:add")
	@RequestMapping("/sureAddConMsg.do")
	@ResponseBody
	public Map<String, Object> sureAddConMsg(HttpServletRequest request,FaConMsg fl){
		
		String tip = service.addConMsgData(fl);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改内容
	@RequiresPermissions("contentmsg:update")
	@RequestMapping(value="/sureUpdateConMsg.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateConMsg(HttpServletRequest request,FaConMsg fl){
		
		String tip = service.updateConMsgData(fl);
		
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//删除内容
	@RequiresPermissions("contentmsg:delete")
	@RequestMapping("/deleteConMsg.do")
	@ResponseBody
	public Map<String, Object> deleteConMsg(HttpServletRequest request,String [] id){
		
		Integer tip = service.deleteConMsgData(id);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
}
