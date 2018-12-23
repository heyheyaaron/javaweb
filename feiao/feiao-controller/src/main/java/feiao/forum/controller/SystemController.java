package feiao.forum.controller;

import java.util.ArrayList;
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

import feiao.forum.pojo.Column;
import feiao.forum.pojo.Group;
import feiao.forum.pojo.Resource;
import feiao.forum.pojo.Role;
import feiao.forum.pojo.User;
import feiao.forum.service.Constant;
import feiao.forum.service.GroupService;
import feiao.forum.service.ResourceService;
import feiao.forum.service.RoleService;
import feiao.forum.service.UserService;



@Controller
@RequestMapping("/system")
public class SystemController {
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private ResourceService resourceService;
	//登录
	@RequestMapping("/login.do")
	@ResponseBody 
	public Map<String, Object> login(HttpServletRequest request,HttpServletResponse response,String userId,String password,String vcode){
		int key =0;
		if(request.getParameter("key")!=null){
			key=1;
		}
		
		Map<String, Object> map = new HashMap<>();
		map=userService.login(userId, password, vcode,key,request);
		
		return map;
		
	}
	//跳转到栏目内容页面
	@RequestMapping("/showColumnMsg.do")
	public String showColumnMsg(HttpServletRequest request,Integer id){
		Column col = resourceService.getColumnById(id);
		if(col==null){
			col.setTitle("没有设置标题");
			col.setDescz("没有内容");
		}else{
			if(col.getDescz()==null || col.getDescz().equals("")){
				col.setDescz("没有内容");
			}
			if(col.getTitle()==null || col.getTitle().equals("")){
				col.setTitle("没有设置标题");
			}
		}
		request.setAttribute("col", col);
		return "showmsg";
	}
	//跳转到主页
	@RequestMapping("/main.do")
	public String main(HttpServletRequest request){
		User user = (User) request.getSession().getAttribute(Constant.SESSION_USERH);
		Role role = roleService.getRoleById(user.getRole_id());
		request.setAttribute("user", user);
		request.setAttribute("role", role);
		return "main";
	}
	//跳转到增加用户页面
	@RequiresPermissions("sysuser:add")
	@RequestMapping("/addUser.do")
	public String addUser(HttpServletRequest request,Integer curpage){
		/*// 获取请求是从哪里来的  
        String referer = request.getHeader("referer");*/
        
		request.setAttribute("curpage", curpage);
		return "user/adduser";
	}
	//跳转到增加角色页面
	@RequiresPermissions("sysrole:add")
	@RequestMapping("/addRole.do")
	public String addRole(HttpServletRequest request,Integer curpage){
		request.setAttribute("curpage", curpage);
		return "role/addrole";
	}
	//跳转到增加用户组页面
	@RequiresPermissions("sysgroup:add")
	@RequestMapping("/addGroup.do")
	public String addGroup(HttpServletRequest request,Integer curpage){
		request.setAttribute("curpage", curpage);
		return "group/addgroup";
	}
	//跳转到增加权限页面
	@RequiresPermissions("sysresource:add")
	@RequestMapping("/addResource.do")
	public String addResource(HttpServletRequest request){
		
		return "resource/addresource";
	}
	//跳转到增加栏目页面
	@RequiresPermissions("colct:add")
	@RequestMapping("/addColumn.do")
	public String addColumn(HttpServletRequest request){
		
		return "column/addcolumn";
	}
	//跳转到修改用户页面
	@RequiresPermissions("sysuser:update")
	@RequestMapping("/updateUser.do")
	public String updateUser(HttpServletRequest request,Integer curpage,String id){
		User user = userService.getUser(id);
		
		List<Integer> groupForRe = groupService.getGroupByUserId(user.getUsername());
		
		
		request.setAttribute("groupForRe", groupForRe);
		request.setAttribute("user", user);
		request.setAttribute("curpage", curpage);
		return "user/updateuser";
	}
	//跳转到修改角色页面
	@RequiresPermissions("sysrole:update")
	@RequestMapping("/updateRole.do")
	public String updateRole(HttpServletRequest request,Integer curpage,Integer id){
		Role role = roleService.getRoleById(id);
		List<String> roleForRe = roleService.getResourceByRoleId(id);
		request.setAttribute("role", role);
		request.setAttribute("roleForRe", roleForRe);
		request.setAttribute("curpage", curpage);
		
		return "role/updaterole";
	}
	//跳转到修改用户组页面
	@RequiresPermissions("sysgroup:update")
	@RequestMapping("/updateGroup.do")
	public String updateGroup(HttpServletRequest request,Integer curpage,Integer id){
		Group group = groupService.getGroupById(id);
		List<String> groupForRe = groupService.getResourceByGroupId(id);
		request.setAttribute("group", group);
		request.setAttribute("groupForRe", groupForRe);
		request.setAttribute("curpage", curpage);
		
		return "group/updategroup";
	}
	//跳转到修改权限页面
	@RequiresPermissions("sysresource:update")
	@RequestMapping("/updateResource.do")
	public String updateResource(HttpServletRequest request,Integer id){
		Resource resource = resourceService.getResourceById(id);
		request.setAttribute("resource", resource);
		
		return "resource/updateresource";
	}
	//跳转到修改栏目页面
	@RequiresPermissions("colct:update")
	@RequestMapping("/updateColumn.do")
	public String updateColumn(HttpServletRequest request,Integer id){
		Resource resource = resourceService.getResourceById(id);
		if(resource.getIshiddent().equals(1)){
			Column col = resourceService.getColumnById(id);
			request.setAttribute("col", col);
		}
		
		request.setAttribute("resource", resource);
		
		
		return "column/updatecolumn";
	}
	//增加用户
	@RequiresPermissions("sysuser:add")
	@RequestMapping("/sureAddUser.do")
	@ResponseBody
	public Map<String, Object> sureAddUser(HttpServletRequest request,User user,Integer [] groups){
		
		String tip = userService.addUserData(user,groups);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//增加角色
	@RequiresPermissions("sysrole:add")
	@RequestMapping("/sureAddRole.do")
	@ResponseBody
	public Map<String, Object> sureAddRole(HttpServletRequest request,Role role,Integer [] group){
		
		
		String tip = roleService.addRoleData(role,group);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//增加用户组
	@RequiresPermissions("sysgroup:add")
	@RequestMapping("/sureAddGroup.do")
	@ResponseBody
	public Map<String, Object> sureAddGroup(HttpServletRequest request,Group group,Integer [] groups){
		
		
		String tip = groupService.addGroupData(group,groups);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//增加权限
	@RequiresPermissions("sysresource:add")
	@RequestMapping("/sureAddResource.do")
	@ResponseBody
	public Map<String, Object> sureAddResource(HttpServletRequest request,Resource re){
		
		
		String tip = resourceService.addResourceData(re);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//增加栏目
	@RequiresPermissions("colct:add")
	@RequestMapping("/sureAddColumn.do")
	@ResponseBody
	public Map<String, Object> sureAddColumn(HttpServletRequest request,Resource re,Column col){
		
		
		String tip = resourceService.addColumnData(re,col);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改个人信息
	@RequestMapping(value="/updateMyMsg.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateMyMsg(HttpServletRequest request,User user,String oldpsw){
		
		String tip = userService.updateMyMsg(user,oldpsw,request);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改用户
	@RequiresPermissions("sysuser:update")
	@RequestMapping(value="/sureUpdateUser.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateUser(HttpServletRequest request,User user,Integer [] groups){
		
		String tip = userService.updateUserData(user,groups);
		
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改角色
	@RequiresPermissions("sysrole:update")
	@RequestMapping(value="/sureUpdateRole.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateRole(HttpServletRequest request,Role role,Integer [] group){
		
		String tip = roleService.updateRoleData(role,group);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改用户组
	@RequiresPermissions("sysgroup:update")
	@RequestMapping(value="/sureUpdateGroup.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateGroup(HttpServletRequest request,Group group,Integer [] groups){
		
		String tip = groupService.updateGroupData(group,groups);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改权限
	@RequiresPermissions("sysresource:update")
	@RequestMapping(value="/sureUpdateResource.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateResource(HttpServletRequest request,Resource resource){
		
		String tip = resourceService.updateResourceData(resource);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改栏目
	@RequiresPermissions("colct:update")
	@RequestMapping(value="/sureUpdateColumn.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateColumn(HttpServletRequest request,Resource resource,Column col){
		
		String tip = resourceService.updateColumnData(resource,col);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//删除用户
	@RequiresPermissions("sysuser:delete")
	@RequestMapping("/deleteUser.do")
	@ResponseBody
	public Map<String, Object> deleteUser(HttpServletRequest request,String username,Integer curpage){
		
		Integer tip = userService.deleteUserData(username);
		Map<String, Object> map = new HashMap<>();
		map.put("curpage", curpage);
		map.put("tip", tip);
		return map;
	}
	//删除角色
	
	@RequiresPermissions("sysrole:delete")
	@RequestMapping("/deleteRole.do")
	@ResponseBody
	public Map<String, Object> deleteRole(HttpServletRequest request,Integer id,Integer curpage){
		
		Integer tip = roleService.deleteRoleData(id);
		Map<String, Object> map = new HashMap<>();
		map.put("curpage", curpage);
		map.put("tip", tip);
		return map;
	}
	//删除用户组
	
	@RequiresPermissions("sysgroup:delete")
	@RequestMapping("/deleteGroup.do")
	@ResponseBody
	public Map<String, Object> deleteGroup(HttpServletRequest request,Integer id,Integer curpage){
		
		Integer tip = groupService.deleteGroupData(id);
		Map<String, Object> map = new HashMap<>();
		map.put("curpage", curpage);
		map.put("tip", tip);
		return map;
	}
	//删除权限
	@RequiresPermissions("sysresource:delete")
	@RequestMapping("/deleteResource.do")
	@ResponseBody
	public Map<String, Object> deleteResource(HttpServletRequest request,Integer id){
		
		String tip = resourceService.deleteResourceData(id);
		Map<String, Object> map = new HashMap<>();
		
		map.put("tip", tip);
		return map;
	}
	//删除栏目
	@RequiresPermissions("colct:update")
	@RequestMapping("/deleteColumn.do")
	@ResponseBody
	public Map<String, Object> deleteColumn(HttpServletRequest request,Integer id){
		
		String tip = resourceService.deleteColumnData(id);
		Map<String, Object> map = new HashMap<>();
		
		map.put("tip", tip);
		return map;
	}
	//查询所有角色
	@RequestMapping("/selectAllRole.do")
	@ResponseBody
	public List<Map<String , Object>> selectAllRole(){
		
		List<Map<String , Object>> list = roleService.selectAllRole();
		
		return list;
	}
	//查询所有用户组
	@RequestMapping("/selectAllGroup.do")
	@ResponseBody
	public List<Map<String , Object>> selectAllGroup(){
		
		List<Map<String , Object>> list = groupService.selectAllGroup();
		
		return list;
	}
	//加载主菜单
	@RequestMapping("/menu.do")
	@ResponseBody 
	public List<Map<String,Object>> login(HttpServletRequest request){
		
		List<Map<String,Object>> menuData  = userService.getUserMenu(request);
		System.err.println(menuData);
		return menuData;
		
	}
	//挑转到系统用户页面
	@RequiresPermissions("sysuser:view")
	@RequestMapping("/returnUser.do")
	public String retrunUser(HttpServletRequest request,HttpServletResponse response){
		
		if(request.getParameter("curpage")!=null){
			if(request.getParameter("curpage").equals("0")){
				request.setAttribute("curpage", 1);
			}else{
				request.setAttribute("curpage", request.getParameter("curpage"));
			}
			
		}else{
			request.setAttribute("curpage", 1);
		}
		return "user/index";
	}
	//挑转到系统角色页面
	@RequiresPermissions("sysrole:view")
	@RequestMapping("/returnRole.do")
	public String retrunRole(HttpServletRequest request){
		
		if(request.getParameter("curpage")!=null){
			if(request.getParameter("curpage").equals("0")){
				request.setAttribute("curpage", 1);
			}else{
				request.setAttribute("curpage", request.getParameter("curpage"));
			}
			
		}else{
			request.setAttribute("curpage", 1);
		}
		return "role/index";
	}
	//挑转到系统用户组页面
	@RequiresPermissions("sysgroup:view")
	@RequestMapping("/returnGroup.do")
	public String retrunGroup(HttpServletRequest request){
		
		if(request.getParameter("curpage")!=null){
			if(request.getParameter("curpage").equals("0")){
				request.setAttribute("curpage", 1);
			}else{
				request.setAttribute("curpage", request.getParameter("curpage"));
			}
			
		}else{
			request.setAttribute("curpage", 1);
		}
		return "group/index";
	}
	//挑转到权限管理页面
	@RequiresPermissions("sysresource:view")
	@RequestMapping("/returnResource.do")
	public String retrunResource(HttpServletRequest request){
		
		if(request.getParameter("curpage")!=null){
			if(request.getParameter("curpage").equals("0")){
				request.setAttribute("curpage", 1);
			}else{
				request.setAttribute("curpage", request.getParameter("curpage"));
			}
			
		}else{
			request.setAttribute("curpage", 1);
		}
		return "resource/index";
	}
	//挑转到栏目管理页面
	@RequiresPermissions("colct:view")
	@RequestMapping("/returnColumn.do")
	public String retrunColumn(HttpServletRequest request){
		
		if(request.getParameter("curpage")!=null){
			if(request.getParameter("curpage").equals("0")){
				request.setAttribute("curpage", 1);
			}else{
				request.setAttribute("curpage", request.getParameter("curpage"));
			}
			
		}else{
			request.setAttribute("curpage", 1);
		}
		return "column/index";
	}
	
	//分页展示用户信息
	@RequiresPermissions("sysuser:view")
	@RequestMapping("/selectUser.do")
	@ResponseBody
	public Map<String, Object> selectUser(HttpServletRequest request,Integer curpage){
		Integer pagesize = 50;
		if(curpage<1){
			curpage=1;
		}
		Map<String, Object> map =new HashMap<>();
		String search = request.getParameter("searchname");
		
		List<Map<String, Object>> list = userService.getUserByPage(curpage,search,pagesize);
		Long total = userService.getTotalByUser(search);
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
	//分页展示角色信息
	@RequiresPermissions("sysrole:view")
	@RequestMapping("/selectRole.do")
	@ResponseBody
	public Map<String, Object> selectRole(HttpServletRequest request,Integer curpage){
		Integer pagesize = 50;
		if(curpage<1){
			curpage=1;
		}
		Map<String, Object> map =new HashMap<>();
		String search = request.getParameter("searchname");
		
		List<Map<String, Object>> list = roleService.getRoleByPage(curpage,search,pagesize);
		Long total = roleService.getTotalByRole(search);
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
	//分页展示用户组信息
	@RequiresPermissions("sysgroup:view")
	@RequestMapping("/selectGroup.do")
	@ResponseBody
	public Map<String, Object> selectGroup(HttpServletRequest request,Integer curpage){
		Integer pagesize = 50;
		if(curpage<1){
			curpage=1;
		}
		Map<String, Object> map =new HashMap<>();
		String search = request.getParameter("searchname");
		
		List<Map<String, Object>> list = groupService.getGroupByPage(curpage,search,pagesize);
		Long total = groupService.getTotalByGroup(search);
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
	//查询所有资源不包括栏目
	@RequestMapping("/selectAllReasource.do")
	@ResponseBody
	public List<Map<String, Object>> selectAllReasource(){
		
		
		List<Map<String, Object>> list = resourceService.selectAllReasourceNo();
		
		return list;
	}
	//查询所有资源不包括功能按钮
	@RequestMapping("/selectAllRes.do")
	@ResponseBody
	public List<Map<String, Object>> selectAllRes(){
		
		
		List<Map<String, Object>> list = resourceService.selectAllRes();
		
		return list;
	}
	//查询所有资源不包括栏目和功能
	@RequestMapping("/selectAllReNoBtn.do")
	@ResponseBody
	public List<Map<String, Object>> selectAllReNoBtn(){
		
		
		List<Map<String, Object>> list = resourceService.selectAllReNoBtn();
		
		return list;
	}
	
	
}
