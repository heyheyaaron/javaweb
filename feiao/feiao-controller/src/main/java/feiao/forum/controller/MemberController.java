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

import feiao.forum.emailUtil.EmailUtil;
import feiao.forum.emailUtil.EmailUtils;
import feiao.forum.pojo.FaGroups;
import feiao.forum.pojo.FaHonor;
import feiao.forum.pojo.FaLabel;
import feiao.forum.pojo.FaMibao;
import feiao.forum.pojo.FaProduct;
import feiao.forum.pojo.FaRank;
import feiao.forum.pojo.FaUser;
import feiao.forum.pojo.User;
import feiao.forum.service.Constant;
import feiao.forum.service.MemberService;


@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService service;
	/*TODO*******************************会员标签************************************************************/
	//跳转到增加标签页面
	@RequiresPermissions("mblabel:add")
	@RequestMapping("/addLabel.do")
	public String addLabel(HttpServletRequest request,Integer curpage){
		/*// 获取请求是从哪里来的  
        String referer = request.getHeader("referer");*/
        
		request.setAttribute("curpage", curpage);
		return "mb/label/addlabel";
	}
	//跳转到修改标签页面
	@RequiresPermissions("mblabel:update")
	@RequestMapping("/updateLabel.do")
	public String updateLabel(HttpServletRequest request,Integer curpage,Integer id){
		
		FaLabel fl = service.getLabelById(id);
		request.setAttribute("faLabel", fl);
		request.setAttribute("curpage", curpage);
		return "mb/label/updatelabel";
	}
	//增加标签
	@RequiresPermissions("mblabel:add")
	@RequestMapping("/sureAddLabel.do")
	@ResponseBody
	public Map<String, Object> sureAddLabel(HttpServletRequest request,FaLabel fl){
		
		String tip = service.addLabelData(fl);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改标签
	@RequiresPermissions("mblabel:update")
	@RequestMapping(value="/sureUpdateLabel.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateLabel(HttpServletRequest request,FaLabel fl){
		
		String tip = service.updateLabelData(fl);
		
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//删除标签
	@RequiresPermissions("mblabel:delete")
	@RequestMapping("/deleteLabel.do")
	@ResponseBody
	public Map<String, Object> deleteLabel(HttpServletRequest request,Integer id,Integer curpage){
		
		Integer tip = service.deleteLabeData(id);
		Map<String, Object> map = new HashMap<>();
		map.put("curpage", curpage);
		map.put("tip", tip);
		return map;
	}
	//挑转到标签列表页面
	@RequiresPermissions("mblabel:view")
	@RequestMapping("/returnLabel.do")
	public String retrunLabel(HttpServletRequest request,HttpServletResponse response){
		
		if(request.getParameter("curpage")!=null){
			if(request.getParameter("curpage").equals("0")){
				request.setAttribute("curpage", 1);
			}else{
				request.setAttribute("curpage", request.getParameter("curpage"));
			}
			
		}else{
			request.setAttribute("curpage", 1);
		}
		return "mb/label/index";
	}
	//分页展示标签信息
	@RequiresPermissions("mblabel:view")
	@RequestMapping("/selectLabel.do")
	@ResponseBody
	public Map<String, Object> selectLabel(HttpServletRequest request,Integer curpage){
		Integer pagesize = 50;
		if(curpage<1){
			curpage=1;
		}
		Map<String, Object> map =new HashMap<>();
		String search = request.getParameter("searchname");
		
		List<Map<String, Object>> list = service.getLabelByPage(curpage,search,pagesize);
		Long total = service.getTotalByLabel(search);
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
	//异步加载所有标签信息
	@RequestMapping("getAllLabel.do")
	@ResponseBody
	public List<FaLabel> getAllLabel(){
		return service.getAllLabel();
	}
	/*TODO*******************************会员勋章************************************************************/
	
	//跳转到增加勋章页面
	@RequiresPermissions("mbhonor:add")
	@RequestMapping("/addHonor.do")
	public String addHonor(HttpServletRequest request,Integer curpage){
		
		
		request.setAttribute("curpage", curpage);
		return "mb/honor/addhonor";
	}
	//跳转到修改勋章页面
	@RequiresPermissions("mbhonor:update")
	@RequestMapping("/updateHonor.do")
	public String updateHonor(HttpServletRequest request,Integer curpage,Integer id){
		
		FaHonor fh = service.getHonorById(id);
		request.setAttribute("faHonor", fh);
		request.setAttribute("curpage", curpage);
		return "mb/honor/updatehonor";
	}
	//跳转到发放勋章页面
	@RequiresPermissions("mbhonor:send")
	@RequestMapping("/sendHonor.do")
	public String sendHonor(HttpServletRequest request,Integer curpage,Integer id){
		
		FaHonor fh = service.getHonorById(id);
		request.setAttribute("faHonor", fh);
		request.setAttribute("curpage", curpage);
		return "mb/honor/sendhonor";
	}
	//跳转到删除某会员勋章页面
	@RequiresPermissions("mbhonor:delmb")
	@RequestMapping("/delMbHonor.do")
	public String delMbHonor(HttpServletRequest request,Integer curpage,Integer id){
		
		FaHonor fh = service.getHonorById(id);
		request.setAttribute("faHonor", fh);
		request.setAttribute("curpage", curpage);
		return "mb/honor/deletehonor";
	}
	//增加勋章
	@RequiresPermissions("mbhonor:add")
	@RequestMapping("/sureAddHonor.do")
	@ResponseBody
	public Map<String, Object> sureAddHonor(HttpServletRequest request,FaHonor fh){
		
		String tip = service.addHonorData(fh);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改勋章
	@RequiresPermissions("mbhonor:update")
	@RequestMapping(value="/sureUpdateHonor.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateHonor(HttpServletRequest request,FaHonor fh){
		
		String tip = service.updateHonorData(fh);
		
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//发送勋章
	@RequiresPermissions("mbhonor:send")
	@RequestMapping(value="/sureSendHonor.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureSendHonor(HttpServletRequest request,FaHonor fh,String username){
		
		String tip = service.sendHonorData(fh,username);
		
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//删除某会员勋章
	@RequiresPermissions("mbhonor:delmb")
	@RequestMapping(value="/sureDelMbHonor.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureDelMbHonor(HttpServletRequest request,FaHonor fh,String username){
		
		String tip = service.delMbHonorData(fh,username);
		
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//删除勋章
	@RequiresPermissions("mbhonor:delete")
	@RequestMapping("/deleteHonor.do")
	@ResponseBody
	public Map<String, Object> deleteHonor(HttpServletRequest request,Integer id,Integer curpage){
		
		Integer tip = service.deleteHonorData(id);
		Map<String, Object> map = new HashMap<>();
		map.put("curpage", curpage);
		map.put("tip", tip);
		return map;
	}
	//挑转到勋章列表页面
	@RequiresPermissions("mbhonor:view")
	@RequestMapping("/returnHonor.do")
	public String retrunHonor(HttpServletRequest request,HttpServletResponse response){
		
		if(request.getParameter("curpage")!=null){
			if(request.getParameter("curpage").equals("0")){
				request.setAttribute("curpage", 1);
			}else{
				request.setAttribute("curpage", request.getParameter("curpage"));
			}
			
		}else{
			request.setAttribute("curpage", 1);
		}
		return "mb/honor/index";
	}
	//分页展示勋章信息
	@RequiresPermissions("mbhonor:view")
	@RequestMapping("/selectHonor.do")
	@ResponseBody
	public Map<String, Object> selectHonor(HttpServletRequest request,Integer curpage){
		if(curpage<1){
			curpage=1;
		}
		Integer pagesize = 50;
		Map<String, Object> map =new HashMap<>();
		String search = request.getParameter("searchname");
		
		List<Map<String, Object>> list = service.getHonorByPage(curpage,search,pagesize);
		Long total = service.getTotalByHonor(search);
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
	/*TODO*******************************会员密保************************************************************/
	//跳转到增加密保页面
	@RequiresPermissions("mbmibao:add")
	@RequestMapping("/addMibao.do")
	public String addMibao(HttpServletRequest request){
		
		return "mb/mibao/addmibao";
	}
	//跳转到修改密保页面
	@RequiresPermissions("mbmibao:update")
	@RequestMapping("/updateMibao.do")
	public String updateMibao(HttpServletRequest request,Integer id){
		
		FaMibao fl = service.getMibaoById(id);
		request.setAttribute("faMibao", fl);
		return "mb/mibao/updatemibao";
	}
	//增加密保
	@RequiresPermissions("mbmibao:add")
	@RequestMapping("/sureAddMibao.do")
	@ResponseBody
	public Map<String, Object> sureAddMibao(HttpServletRequest request,FaMibao fl){
		
		String tip = service.addMibaoData(fl);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改密保
	@RequiresPermissions("mbmibao:update")
	@RequestMapping(value="/sureUpdateMibao.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateMibao(HttpServletRequest request,FaMibao fl){
		
		String tip = service.updateMibaoData(fl);
		
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//删除密保
	@RequiresPermissions("mbmibao:delete")
	@RequestMapping("/deleteMibao.do")
	@ResponseBody
	public Map<String, Object> deleteMibao(HttpServletRequest request,Integer id){
		
		Integer tip = service.deleteMibaoData(id);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//挑转到密保列表页面
	@RequiresPermissions("mbmibao:view")
	@RequestMapping("/returnMibao.do")
	public String retrunMibao(HttpServletRequest request,HttpServletResponse response){
		
		return "mb/mibao/index";
	}
	
	//异步加载所有密保信息
	@RequiresPermissions("mbmibao:view")
	@RequestMapping("getAllMibao.do")
	@ResponseBody
	public List<FaMibao> getAllMibao(){
		return service.getAllMibao();
	}
	/*TODO*******************************会员用户组************************************************************/
	
	//跳转到增加用户组页面
	@RequiresPermissions("mbgroup:add")
	@RequestMapping("/addGroup.do")
	public String addGroups(HttpServletRequest request,Integer curpage){
		
		
		request.setAttribute("curpage", curpage);
		return "mb/group/addgroup";
	}
	//跳转到修改用户组页面
	@RequiresPermissions("mbgroup:update")
	@RequestMapping("/updateGroup.do")
	public String updateGroups(HttpServletRequest request,Integer curpage,Integer id){
		
		FaGroups fg = service.getGroupsById(id);
		request.setAttribute("faGroups", fg);
		request.setAttribute("curpage", curpage);
		return "mb/group/updategroup";
	}
	
	//增加用户组
	@RequiresPermissions("mbgroup:add")
	@RequestMapping("/sureAddGroup.do")
	@ResponseBody
	public Map<String, Object> sureAddGroups(HttpServletRequest request,FaGroups fg){
		
		String tip = service.addGroupsData(fg);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改用户组
	@RequiresPermissions("mbgroup:update")
	@RequestMapping(value="/sureUpdateGroup.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateGroups(HttpServletRequest request,FaGroups fg){
		
		String tip = service.updateGroupsData(fg);
		
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	
	//删除用户组
	@RequiresPermissions("mbgroup:delete")
	@RequestMapping("/deleteGroup.do")
	@ResponseBody
	public Map<String, Object> deleteGroups(HttpServletRequest request,Integer id,Integer curpage){
		
		Integer tip = service.deleteGroupsData(id);
		Map<String, Object> map = new HashMap<>();
		map.put("curpage", curpage);
		map.put("tip", tip);
		return map;
	}
	//挑转到用户组列表页面
	@RequiresPermissions("mbgroup:view")
	@RequestMapping("/returnGroup.do")
	public String retrunGroups(HttpServletRequest request,HttpServletResponse response){
		
		if(request.getParameter("curpage")!=null){
			if(request.getParameter("curpage").equals("0")){
				request.setAttribute("curpage", 1);
			}else{
				request.setAttribute("curpage", request.getParameter("curpage"));
			}
			
		}else{
			request.setAttribute("curpage", 1);
		}
		return "mb/group/index";
	}
	//分页展示用户组信息
	@RequiresPermissions("mbgroup:view")
	@RequestMapping("/selectGroup.do")
	@ResponseBody
	public Map<String, Object> selectGroups(HttpServletRequest request,Integer curpage){
		if(curpage<1){
			curpage=1;
		}
		Integer pagesize = 50;
		Map<String, Object> map =new HashMap<>();
		String search = request.getParameter("searchname");
		
		List<Map<String, Object>> list = service.getGroupsByPage(curpage,search,pagesize);
		Long total = service.getTotalByGroups(search);
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
	//异步加载所有用户组信息
	@RequestMapping("getAllMbGroup.do")
	@ResponseBody
	public List<Map<String, Object>> getAllMbGroup(){
		return service.getAllMbGroup();
	}
	
	/*TODO*******************************会员等级************************************************************/
	
	//跳转到增加等级页面
	@RequiresPermissions("mbrank:add")
	@RequestMapping("/addRank.do")
	public String addRank(HttpServletRequest request,Integer curpage){
		
		
		request.setAttribute("curpage", curpage);
		return "mb/rank/addrank";
	}
	//跳转到修改等级页面
	@RequiresPermissions("mbrank:update")
	@RequestMapping("/updateRank.do")
	public String updateRank(HttpServletRequest request,Integer curpage,Integer id){
		
		FaRank fr = service.getRankById(id);
		request.setAttribute("faRank", fr);
		request.setAttribute("curpage", curpage);
		return "mb/rank/updaterank";
	}
	//增加等级
	@RequiresPermissions("mbrank:add")
	@RequestMapping("/sureAddRank.do")
	@ResponseBody
	public Map<String, Object> sureAddRank(HttpServletRequest request,FaRank fr){
		
		String tip = service.addRankData(fr);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改等级
	@RequiresPermissions("mbrank:update")
	@RequestMapping(value="/sureUpdateRank.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateRank(HttpServletRequest request,FaRank fr){
		
		String tip = service.updateRankData(fr);
		
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//删除等级
	@RequiresPermissions("mbrank:delete")
	@RequestMapping("/deleteRank.do")
	@ResponseBody
	public Map<String, Object> deleteRank(HttpServletRequest request,Integer id,Integer curpage){
		
		Integer tip = service.deleteRankData(id);
		Map<String, Object> map = new HashMap<>();
		map.put("curpage", curpage);
		map.put("tip", tip);
		return map;
	}
	//挑转到等级列表页面
	@RequiresPermissions("mbrank:view")
	@RequestMapping("/returnRank.do")
	public String retrunRank(HttpServletRequest request,HttpServletResponse response){
		
		if(request.getParameter("curpage")!=null){
			if(request.getParameter("curpage").equals("0")){
				request.setAttribute("curpage", 1);
			}else{
				request.setAttribute("curpage", request.getParameter("curpage"));
			}
			
		}else{
			request.setAttribute("curpage", 1);
		}
		return "mb/rank/index";
	}
	//分页展示等级信息
	@RequiresPermissions("mbrank:view")
	@RequestMapping("/selectRank.do")
	@ResponseBody
	public Map<String, Object> selectRank(HttpServletRequest request,Integer curpage){
		Integer pagesize = 50;
		if(curpage<1){
			curpage=1;
		}
		Map<String, Object> map =new HashMap<>();
		String search = request.getParameter("searchname");
		
		List<Map<String, Object>> list = service.getRankByPage(curpage,search,pagesize);
		Long total = service.getTotalByRank(search);
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
	
	//为所有会员匹配新规则
	@RequiresPermissions("mbrank:mate")
	@RequestMapping("/mateRank.do")
	@ResponseBody
	public Map<String, Object> mateRank(HttpServletRequest request){
		
		Integer tip = service.mateRank();
		Map<String, Object> map = new HashMap<>();
		
		map.put("tip", tip);
		return map;
	}
	//异步加载所有会员等级
	@RequestMapping("/selectAllRank.do")
	@ResponseBody
	public List<FaRank> selectAllRank(){
		return service.selectAllRank();
	}
	/*TODO*******************************会员信息************************************************************/
	//跳转到增加会员页面
	@RequiresPermissions("mbmember:add")
	@RequestMapping("/addMember.do")
	public String addMember(HttpServletRequest request,Integer curpage){
		
		
		request.setAttribute("curpage", curpage);
		return "mb/member/addmember";
	}
	//跳转到修改/查看会员页面
	@RequiresPermissions("mbmember:view")
	@RequestMapping("/updateMember.do")
	public String updateMember(HttpServletRequest request,Integer curpage,String id){
		
		FaUser fu = service.getMemberById(id);
		List<Map<String, Object>> map1 = service.getHonorByUserId(id);
		List<Map<String, Object>> map2 = service.getLabelByUserId(id);
		List<Integer> list = service.getGroupIdByUserId(id);
		if(map1.isEmpty()){
			map1=null;
		}
		if(map2.isEmpty()){
			map2=null;
		}
		request.setAttribute("groupIds", list);
		request.setAttribute("honor", map1);
		request.setAttribute("label", map2);
		request.setAttribute("faUser", fu);
		request.setAttribute("curpage", curpage);
		
		return "mb/member/updatemember";
	}
	//增加会员
	@RequiresPermissions("mbmember:add")
	@RequestMapping(value="/sureAddMember.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureAddMember(HttpServletRequest request,FaUser fu){
		//防盗链
		//通过网站名防盗
		/*String referer = request.getHeader("referer");
		if(referer.indexOf("?")>0){
			referer = referer.substring(0, referer.indexOf("?"));
		}
		String heardUrl = request.getRequestURL().substring(0, request.getRequestURL().indexOf("/sureAddMember.do"))+"/addMember.do";
		Map<String, Object> map = new HashMap<>();
		if(referer.equals(heardUrl)){
			String tip = service.addMemberData(fu);
			map.put("tip", tip);
		}else{
			map.put("tip", "系统已记录你的违规操作，请从正常路径访问此URL");
		}*/
		//通过ip地址防盗
		Map<String, Object> map = new HashMap<>();
		
		String tip = service.addMemberData(fu,request);
		map.put("tip", tip);
		
		return map;
	}
	//修改会员
	@RequiresPermissions("mbmember:update")
	@RequestMapping(value="/sureUpdateMember.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateMember(HttpServletRequest request,FaUser fu,Integer [] groups){
		//防盗链
		Map<String, Object> map = new HashMap<>();
		
		String tip = service.updateMemberData(fu,groups);
		map.put("tip", tip);
		
		return map;
	}
	//删除会员
	@RequiresPermissions("mbmember:delete")
	@RequestMapping("/deleteMember.do")
	@ResponseBody
	public Map<String, Object> deleteMember(HttpServletRequest request,String [] ids){
		Map<String, Object> map = new HashMap<>();
		if(ids.length<=0){
			map.put("tip", 5);
			return map;
		}
		Integer tip = service.deleteMemberData(ids);
		
		map.put("tip", tip);
		return map;
	}
	//挑转到会员列表页面
	@RequiresPermissions("mbmember:view")
	@RequestMapping("/returnMember.do")
	public String retrunMember(HttpServletRequest request,HttpServletResponse response){
		
		if(request.getParameter("curpage")!=null){
			if(request.getParameter("curpage").equals("0")){
				request.setAttribute("curpage", 1);
			}else{
				request.setAttribute("curpage", request.getParameter("curpage"));
			}
			
		}else{
			request.setAttribute("curpage", 1);
		}
		return "mb/member/index";
	}
	//分页展示会员信息
	@RequiresPermissions("mbmember:view")
	@RequestMapping("/selectMember.do")
	@ResponseBody
	public Map<String, Object> selectMember(HttpServletRequest request,Integer curpage){
		Integer pagesize = 50;
		if(curpage<1){
			curpage=1;
		}
		Map<String, Object> map =new HashMap<>();
		String search = request.getParameter("searchname");
		Integer rankid = 0;
		Integer groupid = 0;
		String telid = null;
		if(request.getParameter("rankid")!=null && !request.getParameter("rankid").equals("")){
			rankid=Integer.parseInt(request.getParameter("rankid"));
		}
		if(request.getParameter("groupid")!=null && !request.getParameter("groupid").equals("")){
			groupid=Integer.parseInt(request.getParameter("groupid"));
		}
		if(request.getParameter("telid")!=null && !request.getParameter("telid").equals("0")){
			telid=request.getParameter("telid");
		}
			System.out.println("等于："+groupid);	
			System.out.println("等于："+telid);	
		List<Map<String, Object>> list = service.getMemberByPage(curpage,search,pagesize,rankid,groupid,telid);
		Long total = service.getTotalByMember(search,rankid,groupid,telid);
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
	//分页展示会员积分表信息
	@RequiresPermissions("mbmember:view")
	@RequestMapping("/findUserInteById.do")
	@ResponseBody
	public Map<String, Object> findUserInteById(HttpServletRequest request,String userId,Integer curpage){
		
		try {
			if(curpage<1){
				curpage=1;
			}
			String startday = request.getParameter("startday");
			String endday = request.getParameter("endday");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
			Date ss =null;
			Date ee =null;
			Integer pagesize = 50;
			Map<String, Object> map = new HashMap<>();
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
			List<Map<String, Object>> list = service.getMemberInteByPage(curpage,pagesize,ss,ee,userId);
			Long total = service.getTotalByMemberInte(ss,ee,userId);
			map.put("tip", 1);
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
		} catch (Exception e) {
			e.printStackTrace();
			Map<String, Object> map = new HashMap<>();
			map.put("tip", 0);
			map.put("msg", "服务器发生错误");
			return map;
		}
		
		
		
		
		
	}
	//验证登录名是否重复
	@RequestMapping("/validateUserNameIsTrue.do")
	@ResponseBody
	public Map<String, Object> validateUserNameIsTrue(HttpServletRequest request,String username){
		Integer tip = service.validateUserNameIsTrue(username);
		Map<String, Object> map =new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//验证手机是否重复
	@RequestMapping("/validateTelIsTrue.do")
	@ResponseBody
	public Map<String, Object> validateTelIsTrue(HttpServletRequest request,String tel){
		Integer tip = service.validateTelIsTrue(tel);
		Map<String, Object> map =new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//验证邮箱是否重复
	@RequestMapping("/validateEmailIsTrue.do")
	@ResponseBody
	public Map<String, Object> validateEmailIsTrue(HttpServletRequest request,String email){
		Integer tip = service.validateEmailIsTrue(email);
		Map<String, Object> map =new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//验证手机是否重复不包括自己
	@RequestMapping("/validateTelIsTrueMe.do")
	@ResponseBody
	public Map<String, Object> validateTelIsTrueMe(HttpServletRequest request,String tel,String id){
		Integer tip = service.validateTelIsTrueMe(tel,id);
		Map<String, Object> map =new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//验证邮箱是否重复不包括自己
	@RequestMapping("/validateEmailIsTrueMe.do")
	@ResponseBody
	public Map<String, Object> validateEmailIsTrueMe(HttpServletRequest request,String email,String id){
		Integer tip = service.validateEmailIsTrueMe(email,id);
		Map<String, Object> map =new HashMap<>();
		map.put("tip", tip);
		return map;
	}
		/*TODO*******************************消息推送************************************************************/
	//跳转到邮件推送页面
	@RequiresPermissions("mbsend:email")
	@RequestMapping("/returnSendEmail.do")
	public String returnSendEmail(HttpServletRequest request,Integer curpage){
		return "mb/email/sendemail";
	}
	//跳转到站内推送页面
	@RequiresPermissions("mbsend:msg")
	@RequestMapping("/returnSendMsg.do")
	public String returnSendMsg(HttpServletRequest request,Integer curpage){
		return "mb/email/sendmsg";
	}
	//异步发送邮件
	@RequestMapping("/sendEmail.do")
	@ResponseBody
	public Map<String, Object> sendEmail(HttpServletRequest request,String title,String descz,Integer sendtype){
		Map<String, Object> map =new HashMap<>();
		if(title==null || title.equals("")){
			map.put("tip", 3);
			return map;
		}
		if(descz==null || descz.equals("")){
			map.put("tip", 4);
			return map;
		}
		System.out.println(descz);
		//判断群发还是单发
		if(sendtype.equals(1)){
			String users =request.getParameter("sendemail");
			if(users==null || users.equals("")){
				map.put("tip", 5);
				return map;
			}
			if(users.contains("；")){
				map.put("tip", 2);
			}else{
				String[] emails = users.split(";");
				for (String email : emails) {
					EmailUtil.send(email, title, descz);
				}
				map.put("tip", 1);
			}
		}else{
			
			List<String> list = service.getEmailByTerms(Integer.parseInt(request.getParameter("rankid")),Integer.parseInt(request.getParameter("groupid")),Integer.parseInt(request.getParameter("labelid")),Integer.parseInt(request.getParameter("telid")));
			if(list==null||list.isEmpty()){
				map.put("tip", 6);
				return map;
			}
			
			EmailUtil.sends(list, title, descz);
			map.put("tip", 1);
		}
		
		
		
		return map;
	}
	//异步发送站内信息
	@RequestMapping("/sendMsg.do")
	@ResponseBody
	public Map<String, Object> sendMsg(HttpServletRequest request,String title,String descz,Integer sendtype){
		Map<String, Object> map =new HashMap<>();
		if(title==null || title.equals("")){
			map.put("tip", 3);
			return map;
		}
		if(descz==null || descz.equals("")){
			map.put("tip", 4);
			return map;
		}
		System.out.println(descz);
		//判断群发还是单发
		if(sendtype.equals(1)){
			String users =request.getParameter("sendemail");
			if(users==null || users.equals("")){
				map.put("tip", 5);
				return map;
			}
			if(users.contains("；")){
				map.put("tip", 2);
			}else{
				String[] emails = users.split(";");
				//根据手机号或者邮箱号发送站内消息
				service.sendMsg(emails, title, descz);
				
				map.put("tip", 1);
			}
		}else{
			//根据分类组合群发消息
			Integer tip =service.sendMsgs(Integer.parseInt(request.getParameter("rankid")),Integer.parseInt(request.getParameter("groupid")),Integer.parseInt(request.getParameter("labelid")), title, descz,Integer.parseInt(request.getParameter("telid")));
			map.put("tip", tip);
		}
		
		
		
		return map;
	}
}
