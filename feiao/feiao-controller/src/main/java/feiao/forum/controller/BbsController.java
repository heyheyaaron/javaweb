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

import feiao.forum.excel.ExcelActiveUser;
import feiao.forum.excel.ExcelTools;
import feiao.forum.pojo.FaLabel;
import feiao.forum.pojo.FaNote;
import feiao.forum.pojo.FaNoteVote;
import feiao.forum.pojo.FaSection;
import feiao.forum.pojo.FaSectionType;
import feiao.forum.pojo.FaUser;
import feiao.forum.service.BbsService;
import feiao.forum.service.MemberService;

@Controller
@RequestMapping("/bbs")
public class BbsController {
	@Autowired
	private BbsService service;
	@Autowired
	private MemberService mservice;
	/*TODO*******************************论坛版块管理************************************************************/
	//挑转到版块列表页面
	@RequiresPermissions("bbsmodel:view")
	@RequestMapping("/returnModel.do")
	public String retrunModel(HttpServletRequest request,HttpServletResponse response){
		
		if(request.getParameter("curpage")!=null){
			if(request.getParameter("curpage").equals("0")){
				request.setAttribute("curpage", 1);
			}else{
				request.setAttribute("curpage", request.getParameter("curpage"));
			}
			
		}else{
			request.setAttribute("curpage", 1);
		}
		return "bbs/model/index";
	}
	
	//异步加载所有版块信息
	@RequestMapping("selectAllModel.do")
	@ResponseBody
	public List<Map<String, Object>> selectAllModel(){
		return service.selectAllModel();
	}
	//异步加载该版块的分类信息
	@RequestMapping("selectAllReType.do")
	@ResponseBody
	public List<Map<String, Object>> selectAllReType(Integer id){
		return service.selectAllReType(id);
	}
	
	//跳转到增加版块页面
	@RequiresPermissions("bbsmodel:add")
	@RequestMapping("/addModel.do")
	public String addModel(HttpServletRequest request){
		
		return "bbs/model/addmodel";
	}
	//跳转到修改版块页面
	@RequiresPermissions("bbsmodel:update")
	@RequestMapping("/updateModel.do")
	public String updateModel(HttpServletRequest request,Integer id){
		
		FaSection fs = service.getModelById(id);
		request.setAttribute("faSection", fs);
		return "bbs/model/updatemodel";
	}
	//增加版块
	@RequiresPermissions("bbsmodel:add")
	@RequestMapping("/sureAddModel.do")
	@ResponseBody
	public Map<String, Object> sureAddModel(HttpServletRequest request,FaSection fs){
		System.err.println(fs.getFa_postr());
		String tip = service.addModelData(fs);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改版块
	@RequiresPermissions("bbsmodel:update")
	@RequestMapping(value="/sureUpdateModel.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateModel(HttpServletRequest request,FaSection fs){
		
		String tip = service.updateModelData(fs);
		
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//删除版块
	@RequiresPermissions("bbsmodel:delete")
	@RequestMapping("/deleteModel.do")
	@ResponseBody
	public Map<String, Object> deleteModel(HttpServletRequest request,Integer id){
		
		String tip = service.deleteModelData(id);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	/*TODO*******************************论坛版主管理************************************************************/
	//挑转到版块列表页面
	@RequiresPermissions("bbsmoderator:view")
	@RequestMapping("/returnModerator.do")
	public String retrunModerator(HttpServletRequest request,HttpServletResponse response){
		
		if(request.getParameter("curpage")!=null){
			if(request.getParameter("curpage").equals("0")){
				request.setAttribute("curpage", 1);
			}else{
				request.setAttribute("curpage", request.getParameter("curpage"));
			}
			
		}else{
			request.setAttribute("curpage", 1);
		}
		return "bbs/moderator/index";
	}
	//分页展示版主信息
	@RequiresPermissions("bbsmoderator:view")
	@RequestMapping("/selectModerator.do")
	@ResponseBody
	public Map<String, Object> selectModerator(HttpServletRequest request,Integer curpage,Integer isMo,Integer oneMo){
		Integer pagesize = 50;
		if(curpage<1){
			curpage=1;
		}
		Map<String, Object> map =new HashMap<>();
		String search = request.getParameter("searchname");
		if(isMo==null){
			isMo=0;
		}
		if(oneMo==null){
			oneMo=0;
		}
				
		List<Map<String, Object>> list = service.getModeratorByPage(curpage,search,pagesize,isMo,oneMo);
		Long total = service.getTotalByModerator(search,isMo,oneMo);
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
	//验证该会员是否存在
	@RequestMapping("/selectUserByTelOrEmail.do")
	@ResponseBody
	public Integer selectUserByTelOrEmail(HttpServletRequest request,String userId){
		return service.selectUserByTelOrEmail(userId);
	}
	//跳转到增加版主页面
	@RequiresPermissions("bbsmoderator:add")
	@RequestMapping("/addModerator.do")
	public String addModerator(HttpServletRequest request,Integer curpage){
		request.setAttribute("curpage", curpage);
		return "bbs/moderator/addmoderator";
	}
	//跳转到修改版主页面
	@RequiresPermissions("bbsmoderator:update")
	@RequestMapping("/updateModerator.do")
	public String updateModerator(HttpServletRequest request,Integer curpage,String id){
		FaUser fu = mservice.getMemberById(id);
		request.setAttribute("faUser", fu);
		request.setAttribute("curpage", curpage);
		return "bbs/moderator/updatemoderator";
	}
	//增加版主
	@RequiresPermissions("bbsmoderator:add")
	@RequestMapping("/sureAddModerator.do")
	@ResponseBody
	public Map<String, Object> sureAddModerator(HttpServletRequest request,String userId,Integer typeMo,Integer oneMo){
		if(oneMo==null){
			oneMo=0;
		}
		if(typeMo==null){
			typeMo=0;
		}
		String tip = service.addModeratorData(userId,typeMo,oneMo);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改版主
	@RequiresPermissions("bbsmoderator:update")
	@RequestMapping(value="/sureUpdateModerator.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateModerator(HttpServletRequest request,String id,Integer typeMo,Integer oneMo){
		if(oneMo==null){
			oneMo=0;
		}
		if(typeMo==null){
			typeMo=0;
		}
		String tip = service.updateModeratorData(id,typeMo,oneMo);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//删除版主
	@RequiresPermissions("bbsmoderator:delete")
	@RequestMapping("/deleteModerator.do")
	@ResponseBody
	public Map<String, Object> deleteModerator(HttpServletRequest request,String [] ids){
		
		Integer tip = service.deleteModeratorData(ids);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	/*TODO*******************************论坛版块分类管理************************************************************/
	//挑转到论坛版块分类列表页面
	@RequiresPermissions("bbsmodel:view")
	@RequestMapping("/returnModelType.do")
	public String returnModelType(HttpServletRequest request,HttpServletResponse response,Integer id){
		
		if(request.getParameter("curpage")!=null){
			if(request.getParameter("curpage").equals("0")){
				request.setAttribute("curpage", 1);
			}else{
				request.setAttribute("curpage", request.getParameter("curpage"));
			}
			
		}else{
			request.setAttribute("curpage", 1);
		}
		request.setAttribute("sid", id);
		return "bbs/type/index";
	}
	
	//分页展示版块分类信息
	@RequiresPermissions("bbsmodel:view")
	@RequestMapping("/selectMlType.do")
	@ResponseBody
	public Map<String, Object> selectMlType(HttpServletRequest request,Integer curpage,Integer id){
		Integer pagesize = 50;
		if(curpage<1){
			curpage=1;
		}
		Map<String, Object> map =new HashMap<>();
		List<Map<String, Object>> list = service.getMlTypeByPage(curpage,pagesize,id);
		Long total = service.getTotalByMlType(id);
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
	//跳转到增加版块页面
	@RequiresPermissions("bbsmodel:type")
	@RequestMapping("/addMlType.do")
	public String addMlType(HttpServletRequest request,Integer id,Integer curpage){
		request.setAttribute("sid", id);
		request.setAttribute("curpage", curpage);
		return "bbs/type/addtype";
	}
	//跳转到修改版块页面
	@RequiresPermissions("bbsmodel:type")
	@RequestMapping("/updateMlType.do")
	public String updateMlType(HttpServletRequest request,String id,Integer curpage){
		
		FaSectionType fst = service.getMlTypeById(id);
		request.setAttribute("fst", fst);
		request.setAttribute("curpage", curpage);
		return "bbs/type/updatetype";
	}
	//增加版块分类
	@RequiresPermissions("bbsmodel:type")
	@RequestMapping("/sureAddMlType.do")
	@ResponseBody
	public Map<String, Object> sureAddMlType(HttpServletRequest request,FaSectionType fst){
		
		String tip = service.addMlTypeData(fst);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改版块分类
	@RequiresPermissions("bbsmodel:type")
	@RequestMapping(value="/sureUpdateMlType.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateMlType(HttpServletRequest request,FaSectionType fst){
		
		String tip = service.updateMlTypeData(fst);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//删除版块分类
	@RequiresPermissions("bbsmodel:type")
	@RequestMapping("/deleteMlType.do")
	@ResponseBody
	public Map<String, Object> deleteMlType(HttpServletRequest request,String id){
		
		Integer tip = service.deleteMlTypeData(id);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	/*TODO*******************************帖子管理************************************************************/
	//挑转到帖子列表页面
	@RequiresPermissions("bbsnote:view")
	@RequestMapping("/returnNote.do")
	public String returnNote(HttpServletRequest request,HttpServletResponse response){
		
		if(request.getParameter("curpage")!=null){
			if(request.getParameter("curpage").equals("0")){
				request.setAttribute("curpage", 1);
			}else{
				request.setAttribute("curpage", request.getParameter("curpage"));
			}
			
		}else{
			request.setAttribute("curpage", 1);
		}
		return "bbs/note/index";
	}
	//分页展示帖子信息
	@RequiresPermissions("bbsnote:view")
	@RequestMapping("/selectNote.do")
	@ResponseBody
	public Map<String, Object> selectNote(HttpServletRequest request,Integer curpage,Integer noteTpye,Integer modelid){
		Integer pagesize = 100;
		if(curpage<1){
			curpage=1;
		}
		Map<String, Object> map =new HashMap<>();
		String search = request.getParameter("searchname");
		if(noteTpye==null){
			noteTpye=0;
		}
		if(modelid==null){
			modelid=0;
		}
		
				
		List<Map<String, Object>> list = service.getNoteByPage(curpage,search,pagesize,noteTpye,modelid);
		Long total = service.getTotalByNote(search,noteTpye,modelid);
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
	//分页展示帖子评论信息
	@RequiresPermissions("bbsnote:view")
	@RequestMapping("/findCommentById.do")
	@ResponseBody
	public Map<String, Object> findCommentById(HttpServletRequest request,Integer curpage,String id){
		Integer pagesize = 50;
		if(curpage<1){
			curpage=1;
		}
		Map<String, Object> map =new HashMap<>();
		
		
		
		List<Map<String, Object>> list = service.getCommentByPage(curpage,pagesize,id);
		Long total = service.getTotalByComment(id);
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
	//删除帖子
	@RequiresPermissions("bbsnote:delete")
	@RequestMapping("/deleteNote.do")
	@ResponseBody
	public Map<String, Object> deleteNote(HttpServletRequest request,String [] ids){
		Map<String, Object> map = new HashMap<>();
		if(ids.length<=0){
			map.put("tip", 5);
			return map;
		}
		Integer tip = service.deleteNoteData(ids,request);
		
		map.put("tip", tip);
		return map;
	}
	//置顶帖子
	@RequiresPermissions("bbsnote:zd")
	@RequestMapping("/zdNote.do")
	@ResponseBody
	public Map<String, Object> zdNote(HttpServletRequest request,String [] ids){
		Map<String, Object> map = new HashMap<>();
		if(ids.length<=0){
			map.put("tip", 5);
			return map;
		}
		Integer tip = service.zdNoteData(ids);
		
		map.put("tip", tip);
		return map;
	}
	//精华帖子
	@RequiresPermissions("bbsnote:jh")
	@RequestMapping("/jhNote.do")
	@ResponseBody
	public Map<String, Object> jhNote(HttpServletRequest request,String [] ids){
		Map<String, Object> map = new HashMap<>();
		if(ids.length<=0){
			map.put("tip", 5);
			return map;
		}
		Integer tip = service.jhNoteData(ids);
		
		map.put("tip", tip);
		return map;
	}
	//高亮帖子
	@RequiresPermissions("bbsnote:gl")
	@RequestMapping("/glNote.do")
	@ResponseBody
	public Map<String, Object> glNote(HttpServletRequest request,String [] ids){
		Map<String, Object> map = new HashMap<>();
		if(ids.length<=0){
			map.put("tip", 5);
			return map;
		}
		Integer tip = service.glNoteData(ids);
		
		map.put("tip", tip);
		return map;
	}
	//跳转到修改或查看帖子页面
	@RequiresPermissions("bbsnote:view")
	@RequestMapping("/updateNote.do")
	public String updateNote(HttpServletRequest request,Integer curpage,String id){
		FaNote fn = service.getNoteById(id);
		List<String> list = service.getTypeNameById(fn.getFa_id());
		String strs = "";
		for (String string : list) {
			strs=strs+string+"     ";
		}
		/*int inx = strs.lastIndexOf(",");
		if(inx==strs.length()-1){
			strs=strs.substring(0, strs.length()-2);
		}*/
		String name = service.getNameByUserId(fn.getFa_userid());
		if(name==null || name.equals("")){
			name="该会员还未设置昵称";
		}
		request.setAttribute("faNote", fn);
		request.setAttribute("Label", strs);
		request.setAttribute("userName", name);
		request.setAttribute("curpage", curpage);
		//普通帖
		if(fn.getFa_type().equals(1)){
			return "bbs/note/updatenor";
		//投票贴
		}else if(fn.getFa_type().equals(2)){
			List<Map<String, Object>> fnv = service.getVoteMsgByNoteId(fn.getFa_id());
			request.setAttribute("fnv", fnv);
			return "bbs/note/updatevote";
		//反馈贴
		}else if(fn.getFa_type().equals(3)){
			return "bbs/note/updatereturn";
		//活动贴
		}else{
			return "bbs/note/updateactive";
		}
		
	}
	//修改帖子信息（后台）
	@RequiresPermissions("bbsnote:update")
	@RequestMapping(value="/sureUpdateNote.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateNote(HttpServletRequest request,FaNote fn){
		
		String tip = service.updateNote(fn);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	
	//异步加载活动帖的参与者信息
	@RequestMapping(value="/findAllPreMsgByNoteId.do",method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> findAllPreMsgByNoteId(HttpServletRequest request,String id){
		return  service.findAllPreMsgByNoteId(id);
		
	}
	//导出
	@RequiresPermissions("bbsnote:export")
	@RequestMapping(value="/excelToActive.do")
	public void findAllexcelToActive(HttpServletRequest request,HttpServletResponse response,String id){
		try {
			List<Map<String, Object>> list = service.findAllPreMsgByNoteId(id);
			List<ExcelActiveUser> lists = new ArrayList<>();
			System.err.println(list);
			for (Map<String, Object> map : list) {
				
				ExcelActiveUser eau = new ExcelActiveUser(map);
				lists.add(eau);
				
			}
			/** Excel标题信息 */
			String[] titles = {"会员昵称","会员手机","会员邮箱","报名时间","参与者姓名","参与者联系方式"};
			/** 调用工具类导出数据至Excel */
			ExcelTools.exportExcel("帖子ID："+id+"参与者数据", titles, lists,"帖子ID："+id+"参与者数据", 
					response, request);
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
	
	
	
	
	
	
	
	
	//跳转到增加产品类别标签页面
	@RequiresPermissions("bbsnotetype:add")
	@RequestMapping("/addNoteType.do")
	public String addNoteType(HttpServletRequest request){
		return "bbs/proType/addnotetype";
	}
	//跳转到修改产品类别页面
	@RequiresPermissions("bbsnotetype:update")
	@RequestMapping("/updateNoteType.do")
	public String updateNoteType(HttpServletRequest request,Integer id){
		Map<String, Object> fl = service.getTypeById(id);
		request.setAttribute("maps", fl);
		return "bbs/proType/updatenotetype";
	}
	//增加产品类别
	@RequiresPermissions("bbsnotetype:add")
	@RequestMapping("/sureAddNoteType.do")
	@ResponseBody
	public Map<String, Object> sureAddNoteType(HttpServletRequest request,String name,Integer sort){
		String tip = service.addTypeData(name,sort);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改产品类别
	@RequiresPermissions("bbsnotetype:update")
	@RequestMapping(value="/sureUpdateNoteType.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateNoteType(HttpServletRequest request,Integer id,String name,Integer sort){
		String tip = service.updateTypeData(id,name,sort);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//删除产品类别
	@RequiresPermissions("bbsnotetype:delete")
	@RequestMapping("/deleteNoteType.do")
	@ResponseBody
	public Map<String, Object> deleteNoteType(HttpServletRequest request,Integer id){
		Integer tip = service.deleteTypeData(id);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//挑转到标签列表页面
	@RequiresPermissions("bbsnotetype:view")
	@RequestMapping("/returnNoteType.do")
	public String retrunNoteType(HttpServletRequest request,HttpServletResponse response){
		return "bbs/proType/index";
	}
	//分页展示标签信息
	@RequestMapping("/selectNoteType.do")
	@ResponseBody
	public Map<String, Object> selectNoteType(HttpServletRequest request){
		Map<String, Object> map =new HashMap<>();
		List<Map<String, Object>> list = service.getTypeByPage();
		map.put("rows", list);
		return map;
	}
	
	
	
	
	
	
	//跳转到增加产品型号标签页面
	@RequiresPermissions("bbsnotestyle:add")
	@RequestMapping("/addNoteStyle.do")
	public String addNoteStyle(HttpServletRequest request){
		return "bbs/proXinghao//addnotestyle";
	}
	//跳转到修改产品型号类别页面
	@RequiresPermissions("bbsnotestyle:update")
	@RequestMapping("/updateNoteStyle.do")
	public String updateNotestyle(HttpServletRequest request,Integer id){
		Map<String, Object> fl = service.getStyleById(id);
		request.setAttribute("maps", fl);
		return "bbs/proXinghao/updatenotestyle";
	}
	//增加产品型号
	@RequiresPermissions("bbsnotestyle:add")
	@RequestMapping("/sureAddNoteStyle.do")
	@ResponseBody
	public Map<String, Object> sureAddNoteStyle(HttpServletRequest request,String name,Integer sort,Integer parentId){
		String tip = service.addStyleData(name,sort,parentId);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改产品型号
	@RequiresPermissions("bbsnotestyle:update")
	@RequestMapping(value="/sureUpdateNoteStyle.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateNoteStyle(HttpServletRequest request,Integer id,String name,Integer sort, Integer parentId){
		String tip = service.updateStyleData(id,name,sort, parentId);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//删除产品型号
	@RequiresPermissions("bbsnotestyle:delete")
	@RequestMapping("/deleteNoteStyle.do")
	@ResponseBody
	public Map<String, Object> deleteNoteStyle(HttpServletRequest request,Integer id){
		Integer tip = service.deleteStyleData(id);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//挑转到产品型号列表页面
	@RequiresPermissions("bbsnotestyle:view")
	@RequestMapping("/returnNoteStyle.do")
	public String retrunNoteStyle(HttpServletRequest request,HttpServletResponse response){
		return "bbs/proXinghao/index";
	}
	//分页展示产品型号信息
	@RequestMapping("/selectNoteStyle.do")
	@ResponseBody
	public Map<String, Object> selectNoteStyle(HttpServletRequest request){
		Map<String, Object> map =new HashMap<>();
		List<Map<String, Object>> list = service.getStyleByPage();
		map.put("rows", list);
		return map;
	}
	
	
	
	
	
	
	//跳转到增加产品问题标签页面
	@RequiresPermissions("bbsnotequest:add")
	@RequestMapping("/addNoteQuest.do")
	public String addNoteQuest(HttpServletRequest request){
		return "bbs/proQuest/addnotequest";
	}
	//跳转到修改产品问题类别页面
	@RequiresPermissions("bbsnotequest:update")
	@RequestMapping("/updateNoteQuest.do")
	public String updateNoteQuest(HttpServletRequest request,Integer id){
		Map<String, Object> fl = service.getQuestById(id);
		request.setAttribute("maps", fl);
		return "bbs/proQuest/updatenotequest";
	}
	//增加产品问题
	@RequiresPermissions("bbsnotequest:add")
	@RequestMapping("/sureAddNoteQuest.do")
	@ResponseBody
	public Map<String, Object> sureAddNoteQuest(HttpServletRequest request,String name,Integer sort){
		String tip = service.addQuestData(name,sort);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//修改产品问题
	@RequiresPermissions("bbsnotequest:update")
	@RequestMapping(value="/sureUpdateNoteQuest.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureUpdateNoteQuest(HttpServletRequest request,Integer id,String name,Integer sort){
		String tip = service.updateQuestData(id,name,sort);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//删除产品问题
	@RequiresPermissions("bbsnotequest:delete")
	@RequestMapping("/deleteNoteQuest.do")
	@ResponseBody
	public Map<String, Object> deleteNoteQuest(HttpServletRequest request,Integer id){
		Integer tip = service.deleteQuestData(id);
		Map<String, Object> map = new HashMap<>();
		map.put("tip", tip);
		return map;
	}
	//挑转到产品问题列表页面
	@RequiresPermissions("bbsnotequest:view")
	@RequestMapping("/returnNoteQuest.do")
	public String retrunNoteQuest(HttpServletRequest request,HttpServletResponse response){
		return "bbs/proQuest/index";
	}
	//分页展示产品问题信息
	@RequestMapping("/selectNoteQuest.do")
	@ResponseBody
	public Map<String, Object> selectNoteQuest(HttpServletRequest request){
		Map<String, Object> map =new HashMap<>();
		List<Map<String, Object>> list = service.getQuestByPage();
		map.put("rows", list);
		return map;
	}
	//删除评论
	@RequiresPermissions("bbsnote:delete")
	@RequestMapping("/deletepl.do")
	@ResponseBody
	public Map<String, Object> deletepl(HttpServletRequest request,String  id,String  nid){
		
		Map<String, Object> map = new HashMap<>();
		FaNote fn = service.getNoteById(nid);
		
		Integer tip = service.deleteNoteData(id,request,nid);
		
		map.put("tip", "success");
		return map;
	}
}
