package feiao.forum.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import feiao.forum.excel.ExcelActiveUser;
import feiao.forum.excel.ExcelTools;
import feiao.forum.pojo.FaComment;
import feiao.forum.pojo.FaConMsg;
import feiao.forum.pojo.FaLabel;
import feiao.forum.pojo.FaNote;
import feiao.forum.pojo.FaRank;
import feiao.forum.pojo.FaSection;
import feiao.forum.pojo.FaUser;
import feiao.forum.pojo.FaUserVote;
import feiao.forum.service.BbsService;
import feiao.forum.service.Constant;
import feiao.forum.service.CoreService;
import feiao.forum.service.MemberService;
import feiao.forum.service.NoteService;

@Controller
@RequestMapping("/note")
public class NoteController extends CoreController{
	@Autowired
	private CoreService cservice;
	@Autowired
	private NoteService nservice;
	@Autowired
	private BbsService bservice;
	@Autowired
	private MemberService mservice;
	//跳转到展示帖子页面
	@RequestMapping("/showNoteContent.do")
	public String showNoteContent(HttpServletRequest request,String id,Integer floor){
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		//获取帖子信息
		FaNote fn = bservice.getNoteById(id);
		if(fn.getFa_type().equals(2)){
			List<Map<String, Object>> fnv = bservice.getVoteMsgByNoteId(fn.getFa_id());
			request.setAttribute("fnv", fnv);
			//查询我的投票记录
			if(fu!=null && fu.getFa_id()!=null){
				List<FaUserVote> mfuv = nservice.getUserVoteByNoteIdAndUserid(fu.getFa_id(),fn.getFa_id());
				request.setAttribute("mfnv", mfuv);
			}
			if(fn.getFa_votemeb()>0){
				List<Map<String,Object>> votemb = nservice.getVoteMemberMsgByNoteId(fn.getFa_id());
				request.setAttribute("votemb", votemb);
				System.err.println(votemb);
			}
		
		}
		//反馈贴
		if(fn.getFa_type().equals(3)){
			Map<String, Object> typeById = bservice.getTypeById(fn.getFa_protypes());
			request.setAttribute("protype", typeById.get("name"));
			Map<String, Object> styleById = bservice.getStyleById(fn.getFa_prostyle());
			if(styleById!=null && !styleById.isEmpty()){
				request.setAttribute("prostyle", styleById.get("name"));
			}else{
				request.setAttribute("prostyle", "没有设置该型号");
			}
			
			Map<String, Object> questById = bservice.getQuestById(fn.getFa_proquest());
			request.setAttribute("proquest", questById.get("name"));
		}
		//查询帖子的评论数
		Long huifuCount = nservice.findCountByNoteId(fn.getFa_id());
		//更新帖子的阅读数
		nservice.updateReadCount(id);
		request.setAttribute("huifuCount", huifuCount);
		//查询所有模块
		List<Map<String, Object>> sm = bservice.selectAllModel();
		request.setAttribute("sm", sm);
		//查询所有标签
		List<FaLabel> sms = mservice.getAllLabel();
		request.setAttribute("sms", sms);
		request.setAttribute("floor", floor);
		//支持 && 反对数量
		Long zhichi = nservice.getCountTofById(fn.getFa_id(),0);
		Long fandui = nservice.getCountTofById(fn.getFa_id(),1);
		request.setAttribute("zhichi", zhichi);
		request.setAttribute("fandui", fandui);
		//获取板块信息
		FaSection fs = bservice.getModelById(fn.getFa_resource());
		//获取板块帖子的总数
		if(fs!=null && fs.getFa_id()!=null){
			Long totalCount = nservice.getNoteCountBySectionId(fs.getFa_id());
			request.setAttribute("totalCount", totalCount);
		}else{
			fs.setFa_name("");
			fs.setFa_id(0);
			request.setAttribute("totalCount", 0);
		}
		
		request.setAttribute("faSection", fs);
		request.setAttribute("fn", fn);
		//查询会员是否需要验证
		if(fu!=null && fu.getFa_id()!=null){
			Integer iscode = mservice.isVcodeForUserNote(fu.getFa_rank());
			request.setAttribute("iscode", iscode);
		}else{
			request.setAttribute("iscode", 0);
		}
		
		//查询版主信息
		List<Map<String, Object>> sectionnames = nservice.getUserNameBySection(fs.getFa_id());
		request.setAttribute("sns", sectionnames);
		//查询有图帖子推荐
		List<FaConMsg> hasImage = nservice.hasImageRead();
		//查询无图帖子推荐
		List<FaConMsg> noImage = nservice.noImageRead();
		//查询无图帖子推荐
		request.setAttribute("fu", fu);
		request.setAttribute("hasImage", hasImage);
		request.setAttribute("noImage", noImage);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		
		Integer issign = nservice.signIsTrueOrFalse(request,fu);
		request.setAttribute("issign",issign);
		FaUser fuf = mservice.getMemberById(fn.getFa_userid());
		request.setAttribute("fuf",fuf);
		//获取会员等级
		FaRank fr = mservice.getRankById(fuf.getFa_rank());
		request.setAttribute("fr", fr);
		//展示头部尾部信息
		showProtalMsg(request);
		if(fs.getFa_readr()==null || fs.getFa_readr().equals("")){
			if(fs.getFa_readg()==null || fs.getFa_readg().equals("")){
				return "note/fatei";
			}
		}
		if(fu==null || fu.getFa_id()==null){
			return "note/noqx";
		}else{
			if(fs!=null && fs.getFa_id()!=null){
				Integer ia = 0;
				if(fs.getFa_readr()!=null && !fs.getFa_readr().equals("")){
					String [] arr = fs.getFa_readr().split(",");
					for (String string : arr) {
						if(fu.getFa_rank().equals(Integer.parseInt(string))){
							ia = 1;
							break;
						}
					}
				}
				
				if(ia<=0){
					if(fs.getFa_readg()!=null &&!fs.getFa_readg().equals("")){
						List<Integer> gids = mservice.getGroupIdByUserId(fu.getFa_id());
						for (Integer gid : gids) {
							String [] arrg = fs.getFa_readg().split(",");
							for (String string : arrg) {
								if(gid.equals(Integer.parseInt(string))){
									ia = 1;
									break;
								}
							}
						}
					}
					
				}
				if(ia<=0){
					return "note/noqx"; 
				}
			}else{
				return "note/noqx";
			}
		}
		return "note/fatei";
		
		
	}
	//跳转到固定板块页面
	@RequestMapping("/showFSection.do")
	public String showFSection(HttpServletRequest request,Integer id){
		//获取板块信息
		FaSection fs = bservice.getModelById(id);
		request.setAttribute("faSection", fs);
		//获取该板块的子版块信息
		List<Map<String, Object>> listz = nservice.getSectionByPid(fs.getFa_id());
		request.setAttribute("lz", listz);
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		//获取板块帖子的总数
		Long totalCount = nservice.getNoteCountBySectionId(id);
		request.setAttribute("totalCount", totalCount);
		//查询版主信息
		List<Map<String, Object>> sectionnames = nservice.getUserNameBySection(id);
		request.setAttribute("sns", sectionnames);
		//查询有图帖子推荐
		List<FaConMsg> hasImage = nservice.hasImageRead();
		//查询无图帖子推荐
		List<FaConMsg> noImage = nservice.noImageRead();
		//查询无图帖子推荐
		request.setAttribute("fu", fu);
		request.setAttribute("hasImage", hasImage);
		request.setAttribute("noImage", noImage);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		Integer issign = nservice.signIsTrueOrFalse(request,fu);
		request.setAttribute("issign",issign);
		if(fs.getFa_id().equals(6)){
			return "note/fankui";
		}else{
			return "note/forum-10-1";
		}
		
		
	}
	//分页查询模块中的帖子
	@RequestMapping(value="/selectAllNoteBySection.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectAllNoteBySection(HttpServletRequest request,Integer curpage,Integer pid,Integer types,Integer sort){
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 20;
		if(curpage==null || curpage<1){
			curpage=1;
		}
		map.put("curpage", curpage);
		
		
		curpage = (curpage-1)*pagesize;
		
		List<Map<String, Object>> data = nservice.selectAllNoteBySection(curpage,pagesize,pid,types,sort);
		Long totalpage = nservice.selectAllNoteBySectionCount(pid,types,sort);
		map.put("totalsize", totalpage);
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		
		map.put("rows", data);
		
		return map;
	}
	//分页查询反馈模块中的帖子
	@RequestMapping(value="/selectFankuiNoteBySection.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectFankuiNoteBySection(HttpServletRequest request,Integer curpage,Integer protype,Integer prostyle,Integer proquest,Integer handletype){
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 20;
		if(curpage==null || curpage<1){
			curpage=1;
		}
		map.put("curpage", curpage);
		
		
		curpage = (curpage-1)*pagesize;
		
		List<Map<String, Object>> data = nservice.selectFankuiNoteBySection(curpage,pagesize,protype,prostyle,proquest,handletype);
		Long totalpage = nservice.selectFankuiNoteBySectionCount(protype,prostyle,proquest,handletype);
		map.put("totalsize", totalpage);
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		
		map.put("rows", data);
		
		return map;
	}
	//分页查询搜索中的帖子
	@RequestMapping(value="/searchNoteBySearchName.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> searchNoteBySearchName(HttpServletRequest request,Integer curpage,String search,
			String sname,Integer tieOrUser,Integer types,Integer sorts, Integer section,String startDay,String endDay
			){
		
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Integer pagesize = 20;
			if(curpage==null || curpage<1){
				curpage=1;
			}
			map.put("curpage", curpage);
			
			
			curpage = (curpage-1)*pagesize;
			List<Map<String, Object>> data;
			Long totalpage =0L;
			if(section!=null){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				if(startDay==null || startDay.equals("")){
					startDay="1999-01-01 00:00:00";
					
				}
				Date st =sdf.parse(startDay);
				Date et =new Date();
				if(endDay!=null && !endDay.equals("")){
					et=sdf.parse(endDay);
				}
				if(tieOrUser==null){
					tieOrUser=0;
				}
				if(types==null){
					types=0;
				}
				if(sorts==null){
					sorts=0;
				}
				data=nservice.searchNoteByMany(curpage,pagesize,sname,tieOrUser,types,sorts,section,st,et);
				totalpage = nservice.searchNoteBySearchNameCounts(sname,tieOrUser,types,sorts,section,st,et);
			}else{
				data=nservice.searchNoteBySearchName(curpage,pagesize,search);
				totalpage = nservice.searchNoteBySearchNameCount(search);
			}
			
			
			map.put("totalsize", totalpage);
			if(totalpage%pagesize==0){
				map.put("totalpage", totalpage/pagesize);
			}else{
				map.put("totalpage", (totalpage/pagesize)+1);
			}
			
			map.put("rows", data);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return map;
	}
	//签到
	@RequestMapping(value="/signIsTrue.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteMyNote(HttpServletRequest request){
		Map<String, Object> map = new HashMap<>();
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		
		String tip  =  nservice.signIsTrue(fu,request);
		map.put("tip", tip);
		return map;
	}
	//版主修改版块信息
	@RequestMapping(value="/updateSectionMsg.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSectionMsg(HttpServletRequest request,Integer nid,String desc){
		Map<String, Object> map = new HashMap<>();
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		Integer ishost=isSectionHost(fu, nid);
		
		if(ishost<1){
			map.put("tip", "您不是版主，无权操作");
			return map;
		}
		String tip  =  nservice.updateSectionMsg(fu,nid,desc);
		map.put("tip", tip);
		return map;
	}
	//保存主题帖子
	@RequestMapping(value="/saveThemeNote.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveThemeNote(HttpServletRequest request,FaNote fn,String code,Integer iscode,String [] details,String votetime){
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		if(request.getParameter("editorValue")!=null){
			fn.setFa_desc(request.getParameter("editorValue"));
		}
		try {
			if(votetime!=null && !votetime.equals("") ){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				fn.setFa_votetime(sdf.parse(votetime));
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, Object> mx  =  nservice.saveThemeNote(fu,fn,code,iscode,request,details);
		return mx;
	}
	//修改主题帖子
	@RequestMapping(value="/updateThemeNote.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateThemeNote(HttpServletRequest request,FaNote fn,String code,Integer iscode,String [] details,String [] delids,String votetime){
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		if(request.getParameter("editorValue")!=null){
			fn.setFa_desc(request.getParameter("editorValue"));
		}
		try {
			if(votetime!=null && !votetime.equals("") ){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				fn.setFa_votetime(sdf.parse(votetime));
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String referer = request.getHeader("referer");
		//
		if(referer!=null ){
			if(referer.indexOf("?")>0){
				referer = referer.substring(0, referer.indexOf("?"));
			}
			String heardUrl = request.getRequestURL().substring(0, request.getRequestURL().indexOf("/updateThemeNote.do"))+"/showUpdateNote.do";
			
			if(referer.equals(heardUrl)){
				Map<String, Object> mx  =  nservice.updateThemeNote(fu,fn,code,iscode,request,details,delids);
				return mx;
			}else{
				Map<String, Object> map = new HashMap<>();
				map.put("tip", "您的这个操作属于违规操作");
				return map;
			}
		}else{
			Map<String, Object> map = new HashMap<>();
			map.put("tip", "您的这个操作属于违规操作");
			return map;
		}
		
		
		
		
	}
	
	//发表回复
	@RequestMapping(value="/createCommentByNote.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createCommentByNote(HttpServletRequest request,FaComment fc,String code,Integer iscode){
		Map<String, Object> map = new HashMap<>();
		if(request.getParameter("editorValue")!=null){
			fc.setFa_desc(request.getParameter("editorValue"));
		}
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		if(fu==null || fu.getFa_id()==null){
			map.put("tip", "请先登录");
			return map;
		}
		String tip  =  nservice.createCommentByNote(fu,fc,code,iscode,request);
		map.put("tip", tip);
		return map;
	}
	//投票
	@RequestMapping(value="/tijiaovote.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> tijiaovote(HttpServletRequest request,String [] bbss,String nid,Integer dod){
		Map<String, Object> map = new HashMap<>();
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		if(fu==null || fu.getFa_id()==null){
			map.put("tip", "请先登录");
			return map;
		}
		String tip  =  nservice.tijiaovote(fu,bbss,nid,dod,request);
		map.put("tip", tip);
		return map;
	}
	//支持或者反对
	@RequestMapping(value="/trueOrFalseByNote.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> trueOrFalseByNote(HttpServletRequest request,String id,Integer tof){
		Map<String, Object> map = new HashMap<>();
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		if(fu==null || fu.getFa_id()==null){
			map.put("tip", "请先登录");
			return map;
		}
		String tip  =  nservice.trueOrFalseByNote(fu,id,tof,request);
		map.put("tip", tip);
		return map;
	}
	//分页查询该帖子的评论
	@RequestMapping(value="/selectNoteComment.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectNoteComment(HttpServletRequest request,Integer curpage,String id,Integer floor){
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 20;
		
		
		Long totalpage = nservice.findCountByNoteId(id);
		Integer i =0;
		if(floor!=null && floor>0 ){
			//查询该楼层前面有多少条数据
			Long fcount = nservice.getCountByCeng(floor,id); 
			i=1;
			if(fcount<=totalpage){
				if(fcount%pagesize==0){
					curpage = (int) (fcount/pagesize);
				}else{
					curpage = ((int) (fcount/pagesize))+1;
				}
			}
		}
		if(curpage==null || curpage<1){
			curpage=1;
		}
		map.put("curpage", curpage);
		curpage = (curpage-1)*pagesize;
		
		
		List<Map<String, Object>> data = nservice.selectNoteComment(id,curpage,pagesize);
		
		map.put("totalsize", totalpage);
		map.put("isfloor", i);
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		
		map.put("rows", data);
		map.put("id", id);
		
		return map;
	}
	
	//删除帖子
	@RequestMapping("/deleteNote.do")
	@ResponseBody
	public Map<String, Object> deleteNote(HttpServletRequest request,String [] ids,Integer ishost){
		
		Map<String, Object> map = new HashMap<>();
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		if(fu==null){
			map.put("tip", "请先登录");
			return map;
		}
		
		if(ids.length<=0){
			map.put("tip", "请选择需要操作的帖子");
			return map;
		}
		FaNote fn = bservice.getNoteById(ids[0]);
		ishost=isSectionHost(fu, fn.getFa_resource());
		if(ishost<0){
			
			if(fu.getFa_id().equals(fn.getFa_userid())){
				ishost=1;
			}
		}
		if(ishost<1){
			map.put("tip", "您不是版主，无权操作");
			return map;
		}
		Integer tip = bservice.deleteNoteData(ids,request);
		
		map.put("tip", "success");
		return map;
	}
	//置顶帖子
	@RequestMapping("/zdNote.do")
	@ResponseBody
	public Map<String, Object> zdNote(HttpServletRequest request,String ids,Integer ishost,Integer types){
		Map<String, Object> map = new HashMap<>();
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		if(fu==null){
			map.put("tip", "请先登录");
			return map;
		}
		if(ids==null){
			map.put("tip", "请选择需要操作的帖子");
			return map;
		}
		FaNote fn = bservice.getNoteById(ids);
		ishost=isSectionHost(fu, fn.getFa_resource());
		
		if(ishost<1){
			map.put("tip", "您不是版主，无权操作");
			return map;
		}
		
		nservice.zdNoteData(ids,types);
		
		map.put("tip", "success");
		return map;
	}
	//精华帖子
	@RequestMapping("/jhNote.do")
	@ResponseBody
	public Map<String, Object> jhNote(HttpServletRequest request,String ids,Integer ishost,Integer types){
		Map<String, Object> map = new HashMap<>();
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		if(fu==null){
			map.put("tip", "请先登录");
			return map;
		}
		if(ids==null){
			map.put("tip", "请选择需要操作的帖子");
			return map;
		}
		FaNote fn = bservice.getNoteById(ids);
		ishost=isSectionHost(fu, fn.getFa_resource());
		if(ishost<1){
			map.put("tip", "您不是版主，无权操作");
			return map;
		}
		
		nservice.jhNoteData(ids,types,request);
		
		map.put("tip", "success");
		return map;
	}
	//高亮帖子
	@RequestMapping("/glNote.do")
	@ResponseBody
	public Map<String, Object> glNote(HttpServletRequest request,String ids,Integer ishost,Integer types){
		Map<String, Object> map = new HashMap<>();
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		if(fu==null){
			map.put("tip", "请先登录");
			return map;
		}
		if(ids==null){
			map.put("tip", "请选择需要操作的帖子");
			return map;
		}
		FaNote fn = bservice.getNoteById(ids);
		ishost=isSectionHost(fu, fn.getFa_resource());
		if(ishost<1){
			map.put("tip", "您不是版主，无权操作");
			return map;
		}
		nservice.glNoteData(ids,types);
		
		map.put("tip", "success");
		return map;
	}
	//热搜帖子
	@RequestMapping("/rsNote.do")
	@ResponseBody
	public Map<String, Object> rsNote(HttpServletRequest request,String ids,Integer ishost,Integer types){
		Map<String, Object> map = new HashMap<>();
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		if(fu==null){
			map.put("tip", "请先登录");
			return map;
		}
		if(ids==null){
			map.put("tip", "请选择需要操作的帖子");
			return map;
		}
		FaNote fn = bservice.getNoteById(ids);
		ishost=isSectionHost(fu, fn.getFa_resource());
		if(ishost<1){
			map.put("tip", "您不是版主，无权操作");
			return map;
		}
		nservice.rsNoteData(ids,types);
		
		map.put("tip", "success");
		return map;
	}
	//移动帖子
	@RequestMapping("/moveNote.do")
	@ResponseBody
	public Map<String, Object> moveNote(HttpServletRequest request,String ids,Integer ishost,Integer typeid){
		Map<String, Object> map = new HashMap<>();
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		if(fu==null){
			map.put("tip", "请先登录");
			return map;
		}
		if(ids==null){
			map.put("tip", "请选择需要操作的帖子");
			return map;
		}
		FaNote fn = bservice.getNoteById(ids);
		ishost=isSectionHost(fu, fn.getFa_resource());
		if(ishost<1){
			map.put("tip", "您不是版主，无权操作");
			return map;
		}
		nservice.moveNoteData(ids,typeid);
		
		map.put("tip", "success");
		return map;
	}
	//标签帖子
	@RequestMapping("/biaoqianNote.do")
	@ResponseBody
	public Map<String, Object> biaoqianNote(HttpServletRequest request,String ids,Integer ishost,Integer typeid){
		Map<String, Object> map = new HashMap<>();
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		if(fu==null){
			map.put("tip", "请先登录");
			return map;
		}
		
		if(ids==null){
			map.put("tip", "请选择需要操作的帖子");
			return map;
		}
		FaNote fn = bservice.getNoteById(ids);
		ishost=isSectionHost(fu, fn.getFa_resource());
		if(ishost<1){
			map.put("tip", "您不是版主，无权操作");
			return map;
		}
		nservice.biaoqianNoteData(ids,typeid);
		
		map.put("tip", "success");
		return map;
	}
	//升降帖子
	@RequestMapping("/udNote.do")
	@ResponseBody
	public Map<String, Object> udNote(HttpServletRequest request,String ids,Integer ishost,Integer typeid){
		Map<String, Object> map = new HashMap<>();
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		if(fu==null){
			map.put("tip", "请先登录");
			return map;
		}
		if(ids==null){
			map.put("tip", "请选择需要操作的帖子");
			return map;
		}
		FaNote fn = bservice.getNoteById(ids);
		ishost=isSectionHost(fu, fn.getFa_resource());
		if(ishost<1){
			map.put("tip", "您不是版主，无权操作");
			return map;
		}
		nservice.udNoteData(ids,typeid);
		
		map.put("tip", "success");
		return map;
	}
	//处理反馈帖子
	@RequestMapping("/updateNoteDealStatus.do")
	@ResponseBody
	public Map<String, Object> updateNoteDealStatus(HttpServletRequest request,String id,Integer ishost,Integer status){
		Map<String, Object> map = new HashMap<>();
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		if(fu==null){
			map.put("tip", "请先登录");
			return map;
		}
		if(id==null){
			map.put("tip", "请选择需要操作的帖子");
			return map;
		}
		FaNote fn = bservice.getNoteById(id);
		ishost=isSectionHost(fu, fn.getFa_resource());
		if(ishost<1){
			map.put("tip", "您不是版主，无权操作");
			return map;
		}
		nservice.updateNoteDealStatus(id,status);
		
		map.put("tip", "success");
		return map;
	}
	//报名
	@RequestMapping("/myjoin.do")
	@ResponseBody
	public Map<String, Object> myjoin(HttpServletRequest request,String nid,Integer total){
		Map<String, Object> map = new HashMap<>();
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		if(fu==null){
			map.put("tip", "请先登录");
			return map;
		}
		
		if(nid==null){
			map.put("tip", "请选择需要操作的帖子");
			return map;
		}
		String tip = nservice.myjoin(nid,fu,total);
		
		map.put("tip", tip);
		return map;
	}
	//导出
	@RequestMapping(value="/excelToActive.do")
	public void findAllexcelToActive(HttpServletRequest request,HttpServletResponse response,String id){
		try {
			//防盗链
			//判断url
			request.setAttribute("id",id);
			String referer = request.getHeader("referer");
			
			//
			if(referer!=null ){
				if(referer.indexOf("?")>0){
					referer = referer.substring(0, referer.indexOf("?"));
				}
				String heardUrl = request.getRequestURL().substring(0, request.getRequestURL().indexOf("/excelToActive.do"))+"/showNoteContent.do";
				Map<String, Object> maps = new HashMap<>();
				if(referer.equals(heardUrl)){
					
					List<Map<String, Object>> list = bservice.findAllPreMsgByNoteId(id);
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
				}
			}
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
	//跳转到修改帖子页面
	@RequestMapping("/showUpdateNote.do")
	public String showUpdateNote(HttpServletRequest request,String id){
		
		//防盗链
		//判断url
		
		String referer = request.getHeader("referer");
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		//
		if(referer!=null ){
			if(referer.indexOf("?")>0){
				referer = referer.substring(0, referer.indexOf("?"));
			}
			String heardUrl = request.getRequestURL().substring(0, request.getRequestURL().indexOf("/note/showUpdateNote.do"))+"/note/showNoteContent.do";
			Map<String, Object> maps = new HashMap<>();
			if(referer.equals(heardUrl)){
				//获取缓存中的会员信息
				FaUser fu = islogin(request);
				//获取帖子信息
				FaNote fn = bservice.getNoteById(id);
				if(fn.getFa_type().equals(2)){
					List<Map<String, Object>> fnv = bservice.getVoteMsgByNoteId(fn.getFa_id());
					request.setAttribute("fnv", fnv);
					/*//查询我的投票记录
					if(fu!=null && fu.getFa_id()!=null){
						List<FaUserVote> mfuv = nservice.getUserVoteByNoteIdAndUserid(fu.getFa_id(),fn.getFa_id());
						request.setAttribute("mfnv", mfuv);
					}*/
					
				
				}
				//展示头部尾部信息
				showProtalMsg(request);
				request.setAttribute("fn", fn);
				request.setAttribute("fu", fu);
				//查询会员是否需要验证
				Integer iscode = mservice.isVcodeForUserNote(fu.getFa_rank());
				request.setAttribute("iscode", iscode);
				if(fn.getFa_type().equals(1)){

					return "note/forum3u";
				}else if(fn.getFa_type().equals(2)){
					List<Map<String, Object>> fnv = bservice.getVoteMsgByNoteId(fn.getFa_id());
					request.setAttribute("fnv", fnv);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					request.setAttribute("fudate", sdf.format(fn.getFa_votetime()));
						
					
					return "note/tickedu";
				}else{

					return "note/questionu";
				}
			}else{
				return "redirect:/";
			}
		}else{
			return "redirect:/";
		}
	}
	
	//跳转到搜索帖子页面
	@RequestMapping("/searchNoteData.do")
	public String sendThemeNote(HttpServletRequest request,String search){
		//获取缓存中的会员信息
		FaUser fu = islogin(request);
		request.setAttribute("fu", fu);
		String str;
		
			if(search!=null){
				//str = new String(search.getBytes("ISO-8859-1"),"UTF-8");
				try {
					str = URLDecoder.decode(search, "UTF-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					str ="";
				}
			}else{
				str ="";
			}
			request.setAttribute("search", str);
		
		
		/*request.setAttribute("search", str);*/
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "note/search.php";
	}
	//分页展示产品型号信息
		@RequestMapping("/selectNoteStyle.do")
		@ResponseBody
		public Map<String, Object> selectNoteStyle(HttpServletRequest request){
			Map<String, Object> map =new HashMap<>();
			List<Map<String, Object>> list = bservice.getStyleByPage();
			map.put("rows", list);
			return map;
		}
		//分页展示产品型号信息
		@RequestMapping("/selectNoteStyleByPid.do")
		@ResponseBody
		public Map<String, Object> selectNoteStyleByPid(HttpServletRequest request,Integer pid){
			Map<String, Object> map =new HashMap<>();
			List<Map<String, Object>> list = bservice.getStyleByPageByPid(pid);
			map.put("rows", list);
			return map;
	}
		//分页展示产品问题信息
		@RequestMapping("/selectNoteQuest.do")
		@ResponseBody
		public Map<String, Object> selectNoteQuest(HttpServletRequest request){
			Map<String, Object> map =new HashMap<>();
			List<Map<String, Object>> list = bservice.getQuestByPage();
			map.put("rows", list);
			return map;
		}
		//分页展示标签信息
		@RequestMapping("/selectNoteType.do")
		@ResponseBody
		public Map<String, Object> selectNoteType(HttpServletRequest request){
			Map<String, Object> map =new HashMap<>();
			List<Map<String, Object>> list = bservice.getTypeByPage();
			map.put("rows", list);
			return map;
		}
		//分页查询会员心情的回复
		@RequestMapping(value="/getMoreMoodMsg.do",method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> getMoreMoodMsg(HttpServletRequest request,Integer curpage,String id){
			Map<String, Object> map = new HashMap<String, Object>();
			Integer pagesize = 5;
			if(curpage==null || curpage<1){
				curpage=1;
			}
			map.put("curpage", curpage);
			
			
			curpage = (curpage-1)*pagesize;
			
			List<Map<String, Object>> data = nservice.getMoreMoodMsg(id,curpage,pagesize);
			Long totalpage = nservice.getMoreMoodMsgCount(id);
			map.put("totalsize", totalpage);
			if(totalpage%pagesize==0){
				map.put("totalpage", totalpage/pagesize);
			}else{
				map.put("totalpage", (totalpage/pagesize)+1);
			}
			
			map.put("rows", data);
			map.put("id", id);
			
			return map;
		}
		//判断用户名是否重复
		@RequestMapping("/usernameIsTrue.do")
		@ResponseBody
		public Map<String, Object> usernameIsTrue(HttpServletRequest request,String username){
			Map<String, Object> map =new HashMap<>();
			String tip = mservice.usernameIsTrue(username);
			map.put("tip", tip);
			return map;
		}
		//判断是否为版主
		public Integer isSectionHost(FaUser fu,Integer nid){
			if(fu.getFa_ishost().equals(2)){
				return 1;
			}
			if(fu.getFa_sectionid().equals(nid)){
				return 1;
			}
			return 0;
		}
		//删除评论
		@RequestMapping("/deletepl.do")
		@ResponseBody
		public Map<String, Object> deletepl(HttpServletRequest request,String  id,String  nid){
			
			Map<String, Object> map = new HashMap<>();
			//获取缓存中的会员信息
			FaUser fu = islogin(request);
			if(fu==null){
				map.put("tip", "请先登录");
				return map;
			}
			
			if(id==null){
				map.put("tip", "请选择需要操作的评论");
				return map;
			}
			FaNote fn = bservice.getNoteById(nid);
			Integer ishost=isSectionHost(fu, fn.getFa_resource());
			if(ishost<0){
				
				if(fu.getFa_id().equals(fn.getFa_userid())){
					ishost=1;
				}
			}
			if(ishost<1){
				map.put("tip", "您不是版主，无权操作");
				return map;
			}
			Integer tip = bservice.deleteNoteData(id,request,nid);
			
			map.put("tip", "success");
			return map;
		}
		//异步加载所有版块信息
		@RequestMapping("/selectAllModel.do")
		@ResponseBody
		public List<Map<String, Object>> selectAllModel(){
			return bservice.selectAllModel();
		}
}
