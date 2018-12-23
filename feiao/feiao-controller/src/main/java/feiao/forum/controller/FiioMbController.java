package feiao.forum.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.HttpException;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import feiao.forum.emailUtil.EmailUtil;
import feiao.forum.pojo.FaFriendType;
import feiao.forum.pojo.FaGroups;
import feiao.forum.pojo.FaLabel;
import feiao.forum.pojo.FaMibao;
import feiao.forum.pojo.FaRank;
import feiao.forum.pojo.FaReceiver;
import feiao.forum.pojo.FaSection;
import feiao.forum.pojo.FaSession;
import feiao.forum.pojo.FaUser;
import feiao.forum.sendmsg.SendSms;
import feiao.forum.service.BbsService;
import feiao.forum.service.Constant;
import feiao.forum.service.CoreService;
import feiao.forum.service.MemberService;
import feiao.forum.service.NoteService;
import feiao.forum.service.util.FeiaoDataMsg;
import feiao.forum.service.util.InteRP;
import feiao.forum.util.MD5;
import feiao.forum.util.RandomTools;

@Controller
@RequestMapping("/fiioer")
public class FiioMbController extends CoreController {
	@Autowired
	private MemberService service;
	@Autowired
	private CoreService cservice;
	@Autowired
	private NoteService nservice;
	@Autowired
	private BbsService bservice;
	
	//跳转到发表普通贴页面
	@RequestMapping("/sendThemeNote.do")
	public String sendThemeNote(HttpServletRequest request, Integer id){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//获取板块信息
		FaSection fs = bservice.getModelById(id);
		request.setAttribute("faSection", fs);
		//查询会员是否需要验证
		Integer iscode = service.isVcodeForUserNote(fu.getFa_rank());
		request.setAttribute("iscode", iscode);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "note/forum3";
	}
	//跳转到发表投票贴页面
	@RequestMapping("/sendVoteNote.do")
	public String sendVoteNote(HttpServletRequest request,Integer id){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//获取板块信息
		FaSection fs = bservice.getModelById(id);
		request.setAttribute("faSection", fs);
		//查询会员是否需要验证
		Integer iscode = service.isVcodeForUserNote(fu.getFa_rank());
		request.setAttribute("iscode", iscode);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "note/ticked";
	}
	//跳转到发表反馈贴页面
	@RequestMapping("/sendQuestNote.do")
	public String sendQuestNote(HttpServletRequest request,Integer id){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//获取板块信息
		FaSection fs = bservice.getModelById(id);
		request.setAttribute("faSection", fs);
		//查询会员是否需要验证
		Integer iscode = service.isVcodeForUserNote(fu.getFa_rank());
		request.setAttribute("iscode", iscode);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "note/question";
	}
	//跳转到发表活动帖页面
	@RequestMapping("/sendActiveNote.do")
	public String sendActiveNote(HttpServletRequest request,Integer id){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//获取板块信息
		FaSection fs = bservice.getModelById(id);
		request.setAttribute("faSection", fs);
		//查询会员是否需要验证
		Integer iscode = service.isVcodeForUserNote(fu.getFa_rank());
		request.setAttribute("iscode", iscode);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "note/actives";
	}
	//跳转到心情回复
	@RequestMapping("/myMoodShow.do")
	public String myMoodShow(HttpServletRequest request,String id){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//获取会员等级
		FaRank fr = service.getRankById(fu.getFa_rank());
		request.setAttribute("fr", fr);
		//获取会员勋章
		List<Map<String, Object>> honor = service.getHonorByUserId(fu.getFa_id());
		if(honor==null || honor.isEmpty()){
			honor=null;
		}
		//查询会员是否需要验证
		Integer iscode = service.isVcodeForUser(fu.getFa_rank());
		request.setAttribute("iscode",iscode);
		request.setAttribute("honor", honor);
		request.setAttribute("id", id);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php2";
	}
	//跳转到个人基本资料页面
	@RequestMapping("/mySelfMsg.do")
	public String index(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//获取会员等级
		FaRank fr = service.getRankById(fu.getFa_rank());
		request.setAttribute("fr", fr);
		//获取会员勋章
		List<Map<String, Object>> honor = service.getHonorByUserId(fu.getFa_id());
		if(honor==null || honor.isEmpty()){
			honor=null;
		}
		request.setAttribute("honor", honor);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php17";
	}
	
	
	//跳转到个人职业资料页面
	@RequestMapping("/myJob.do")
	public String myJob(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php18";
	}
	
	
	//跳转到个人活动信息页面
	@RequestMapping("/myActive.do")
	public String myActive(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php19";
	}
	
	
	//跳转到修改头像页面页面
	@RequestMapping("/updateMyImage.do")
	public String updateMyImage(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/avatar";
	}
	//跳转到修改头像真实页面
	@RequestMapping("/myTitleImage.do")
	public String myTitleImage(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//查询所有密保问题
		List<FaMibao> listmb = service.getAllMibao();
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		request.setAttribute("mibao",listmb);
		return "center/uc";
	}
	
	
	//跳转到我的积分页面
	@RequestMapping("/myInte.do")
	public String myInte(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/credit";
	}
	//跳转到积分规则页面
	@RequestMapping("/InteRole.do")
	public String InteRole(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查看积分规则表
		InteRP rps = FeiaoDataMsg.findRP(request.getSession().getServletContext());
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		request.setAttribute("rp",rps );
		return "center/home.php23";
	}
	//跳转到我的积分记录页面
	@RequestMapping("/InteData.do")
	public String InteData(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php22";
	}
	
	
	//跳转到我的用户组页面
	@RequestMapping("/myGroup.do")
	public String myGroup(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		
		//查询我绑定的用户组
		List<Map<String, Object>> list=service.getGroupsByUserId(fu.getFa_id());
		if(list==null||list.isEmpty()){
			list=null;
		}
		request.setAttribute("listgroup", list);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		
		return "center/home.php24";
	}
	//跳转到我绑定的标签页面
	@RequestMapping("/myLabel.do")
	public String myLabel(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		List<Integer> labels = service.getLabelIdByUserId(fu.getFa_id());
		
		if(labels==null ||labels.isEmpty()){
			labels=null;
		}
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		
		request.setAttribute("labels",labels );
		return "center/home.php25";
	}
	
	
	//跳转到版块权限页面
	@RequestMapping("/myModel.do")
	public String myModel(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//获取全部版块权限信息
		List<Map<String, Object>> listm = cservice.getModelResource(fu);
		request.setAttribute("listm",listm );
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php26";
	}
	
	
	//跳转到个人隐私页面
	@RequestMapping("/myPrivacy.do")
	public String myPrivacy(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php27";
	}
	
	
	//跳转到我的动态页面
	@RequestMapping("/myState.do")
	public String myState(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//根据id查询屏蔽的好友分组
		List<Map<String, Object>> listGroup = cservice.getIgnoreForGroup(fu.getFa_id());
		if(listGroup==null || listGroup.equals("")){
			listGroup=null;
		}
		//查询屏蔽的好友
		List<Map<String, Object>> listFriends = cservice.getIgnoreForFriends(fu.getFa_id());
		if(listFriends==null || listFriends.equals("")){
			listFriends=null;
		}
		//查询屏蔽的提醒
		List<Map<String, Object>> listMsg ;
		if(fu.getFa_ignore_msg()!=null && !fu.getFa_ignore_msg().equals("")){
			if(!fu.getFa_ignore_msg().equals("0")){
				String[] split = fu.getFa_ignore_msg().split(",");
				listMsg = cservice.getIgnoreForMsg(split);
				if(listMsg==null || listMsg.equals("")){
					listMsg=null;
				}
			}else{
				listMsg = new ArrayList<>();
				Map<String, Object> map =new HashMap<>();
				map.put("name", "全部提醒");
				map.put("id", "0");
				listMsg.add(map);
			}
		}else{
			listMsg = null;
		}
		request.setAttribute("listGroup",listGroup);
		request.setAttribute("listFriends",listFriends );
		request.setAttribute("listMsg",listMsg );
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php28";
	}
	//跳转到联系人信息页面
	@RequestMapping("/myAdress.do")
	public String myAdress(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/address";
	}
	//跳转到我的产品页面
	@RequestMapping("/myProduct.do")
	public String myProduct(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/product";
	}
	//跳转到中奖记录页面
	@RequestMapping("/myLottery.do")
	public String myLottery(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//查询我的联系人
		List<FaReceiver> list = cservice.getAllReceiverById(fu.getFa_id());
		request.setAttribute("listre",list );
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php21";
	}
	//跳转到兑换商品页面
	@RequestMapping("/myOrder.do")
	public String myOrder(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php20";
	}
	//跳转到我的关系（收听）页面
	@RequestMapping("/myFollow.do")
	public String myFollow(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php10";
	}
	//跳转到我的听众页面
	@RequestMapping("/myListener.do")
	public String myListener(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php11";
	}
	//跳转到我的好友页面
	@RequestMapping("/myFriend.do")
	public String myFriend(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//查询我的所有分组信息
		List<FaFriendType> lf = cservice.getAllGroupById(fu.getFa_id());
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		request.setAttribute("listft",lf);
		return "center/home.php12";
	}
	//跳转到搜索好友页面
	@RequestMapping("/searchMember.do")
	public String searchMember(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php1";
	}
	
	//跳转到个人消息页面
	@RequestMapping("/myGetMsg.do")
	public String myGetMsg(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		//查询我忽略的人的id与名称
		List<Map<String, Object>> listignore = cservice.findMyIgnoreMembers(fu.getFa_id());
		request.setAttribute("listignore",listignore);
		return "center/home.php13";
	}
	//跳转到系统消息页面
	@RequestMapping("/mySystemMsg.do")
	public String mySystemMsg(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php14";
	}
	//跳转到提醒信息页面
	@RequestMapping("/myRemind.do")
	public String myRemind(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php15";
	}
	//跳转到发送消息页面
	@RequestMapping("/sendForAllFriend.do")
	public String sendForAllFriend(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/message";
	}
	//跳转到我的心情页面
	@RequestMapping("/mySelfMood.do")
	public String mySelfMood(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询会员是否需要验证
		Integer iscode = service.isVcodeForUser(fu.getFa_rank());
		request.setAttribute("iscode",iscode);
		//查询我所有心情的数量
		Long moods = nservice.selectMemberMoodCount(fu.getFa_id());
		//查询我所有听众数量
		Long fanss = cservice.selectMyFansCount(fu.getFa_id());
		//查询我所有收听数量
		Long follows = cservice.selectMyFollowCount(fu.getFa_id());
		request.setAttribute("moods",moods);
		request.setAttribute("fanss",fanss);
		request.setAttribute("follows",follows);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php5";
	}
	//跳转到我朋友心情页面
	@RequestMapping("/myFriendsMood.do")
	public String myFriendsMood(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询会员是否需要验证
		Integer iscode = service.isVcodeForUser(fu.getFa_rank());
		request.setAttribute("iscode",iscode);
		//查询我所有心情的数量
		Long moods = nservice.selectMemberMoodCount(fu.getFa_id());
		//查询我所有听众数量
		Long fanss = cservice.selectMyFansCount(fu.getFa_id());
		//查询我所有收听数量
		Long follows = cservice.selectMyFollowCount(fu.getFa_id());
		request.setAttribute("moods",moods);
		request.setAttribute("fanss",fanss);
		request.setAttribute("follows",follows);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php3";
	}
	//跳转到飞傲帖子页面
	@RequestMapping("/showFiioNote.do")
	public String showFiioNote(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询会员是否需要验证
		Integer iscode = service.isVcodeForUser(fu.getFa_rank());
		request.setAttribute("iscode",iscode);
		//查询我所有心情的数量
		Long moods = nservice.selectMemberMoodCount(fu.getFa_id());
		//查询我所有听众数量
		Long fanss = cservice.selectMyFansCount(fu.getFa_id());
		//查询我所有收听数量
		Long follows = cservice.selectMyFollowCount(fu.getFa_id());
		request.setAttribute("moods",moods);
		request.setAttribute("fanss",fanss);
		request.setAttribute("follows",follows);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php4";
	}
	//跳转到好友对话页面页面
	@RequestMapping("/answerForFriend.do")
	public String answerForFriend(HttpServletRequest request,String id){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		FaUser fuf = service.getMemberById(id);
		request.setAttribute("fuf",fuf);
		request.setAttribute("fu", fu);
		//该会话室的内容已读
		cservice.isReadMyFriendMsg(fu.getFa_id(),id);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		
		return "center/message1";
	}
	//跳转查看会员信息页面
	@RequestMapping("/showMemberMsg.do")
	public String showMemberMsg(HttpServletRequest request,String id){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		FaUser fuf = service.getMemberById(id);
		request.setAttribute("fuf",fuf);
		request.setAttribute("fu", fu);
		//查询发帖数量
		Long c0 = nservice.selectMyNoteCount(fuf.getFa_id());
		//查询收听数量
		Long c1 = cservice.selectMyFollowCount(fuf.getFa_id());
		//查询听众数量
		Long c2 = cservice.selectMyFansCount(fuf.getFa_id());
		//查询是否已经关注他
		Integer i1 = cservice.isFollowToHim(fu.getFa_id(),id);
		//查询是否已经是好友
		Integer i2 = cservice.isFriendToHim(fu.getFa_id(),id);
		//我的所有产品
		List<Map<String, Object>> list = cservice.getAllProductById(fuf.getFa_id());
		//获取会员等级
		FaRank fr = service.getRankById(fuf.getFa_rank());
		request.setAttribute("fr", fr);
		//获取会员勋章
		List<Map<String, Object>> honor = service.getHonorByUserId(fuf.getFa_id());
		if(honor==null || honor.isEmpty()){
			honor=null;
		}
		Long totalpage = cservice.selectMyFriendCount(fuf.getFa_id(),null,"0");
		Long myAnswer = nservice.selectMymyAnswerCount(fuf.getFa_id());
		List<Map<String, Object>> map2 = service.getLabelByUserId(id);
		List<String> listz = service.getGroupByUserId(id);
		
		if(map2.isEmpty()){
			map2=null;
		}
		request.setAttribute("groupIds", listz);
		request.setAttribute("label", map2);
		
		
		
		request.setAttribute("honor", honor);
		request.setAttribute("pro",list);
		request.setAttribute("igz",i1);
		request.setAttribute("ifri",i2);
		request.setAttribute("myNote",c0);
		request.setAttribute("myFolow",c1 );
		request.setAttribute("myFans",c2 );
		request.setAttribute("myFri",totalpage );
		request.setAttribute("myAnswer",myAnswer);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		
		return "center/personal";
	}
	//跳转查看会员信息广播页面
	@RequestMapping("/showMemberbroadcast.do")
	public String showMemberbroadcast(HttpServletRequest request,String id){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		FaUser fuf = service.getMemberById(id);
		request.setAttribute("fuf",fuf);
		request.setAttribute("fu", fu);
		//查询会员是否需要验证
		Integer iscode = service.isVcodeForUser(fu.getFa_rank());
		request.setAttribute("iscode",iscode);
		//查询发帖数量
		Long c0 = nservice.selectMyNoteCount(fuf.getFa_id());
		//查询收听数量
		Long c1 = cservice.selectMyFollowCount(fuf.getFa_id());
		//查询听众数量
		Long c2 = cservice.selectMyFansCount(fuf.getFa_id());
		//查询是否已经关注他
		Integer i1 = cservice.isFollowToHim(fu.getFa_id(),id);
		//查询是否已经是好友
		Integer i2 = cservice.isFriendToHim(fu.getFa_id(),id);
		//我的所有产品
		List<Map<String, Object>> list = cservice.getAllProductById(fuf.getFa_id());
		request.setAttribute("pro",list);
		request.setAttribute("igz",i1);
		request.setAttribute("ifri",i2);
		request.setAttribute("myNote",c0);
		request.setAttribute("myFolow",c1 );
		request.setAttribute("myFans",c2 );
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/space-uid-2";
	}
	//跳转查看会员信息主题页面
	@RequestMapping("/showMemberNote.do")
	public String showMemberNote(HttpServletRequest request,String id){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		FaUser fuf = service.getMemberById(id);
		request.setAttribute("fuf",fuf);
		request.setAttribute("fu", fu);
		//查询发帖数量
		Long c0 = nservice.selectMyNoteCount(fuf.getFa_id());
		//查询收听数量
		Long c1 = cservice.selectMyFollowCount(fuf.getFa_id());
		//查询听众数量
		Long c2 = cservice.selectMyFansCount(fuf.getFa_id());
		//查询是否已经关注他
		Integer i1 = cservice.isFollowToHim(fu.getFa_id(),id);
		//查询是否已经是好友
		Integer i2 = cservice.isFriendToHim(fu.getFa_id(),id);
		//我的所有产品
		List<Map<String, Object>> list = cservice.getAllProductById(fuf.getFa_id());
		request.setAttribute("pro",list);
		request.setAttribute("igz",i1);
		request.setAttribute("ifri",i2);
		request.setAttribute("myNote",c0);
		request.setAttribute("myFolow",c1 );
		request.setAttribute("myFans",c2 );
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.pnp";
	}
	//跳转查看会员信息帖子回复页面
	@RequestMapping("/showMemberReplies.do")
	public String showMemberReplies(HttpServletRequest request,String id){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		FaUser fuf = service.getMemberById(id);
		request.setAttribute("fuf",fuf);
		request.setAttribute("fu", fu);
		//查询发帖数量
		Long c0 = nservice.selectMyNoteCount(fuf.getFa_id());
		//查询收听数量
		Long c1 = cservice.selectMyFollowCount(fuf.getFa_id());
		//查询听众数量
		Long c2 = cservice.selectMyFansCount(fuf.getFa_id());
		//查询是否已经关注他
		Integer i1 = cservice.isFollowToHim(fu.getFa_id(),id);
		//查询是否已经是好友
		Integer i2 = cservice.isFriendToHim(fu.getFa_id(),id);
		//我的所有产品
		List<Map<String, Object>> list = cservice.getAllProductById(fuf.getFa_id());
		request.setAttribute("pro",list);
		request.setAttribute("igz",i1);
		request.setAttribute("ifri",i2);
		request.setAttribute("myNote",c0);
		request.setAttribute("myFolow",c1 );
		request.setAttribute("myFans",c2 );
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.pnp2";
	}
	//跳转到我的帖子页面
	@RequestMapping("/myNote.do")
	public String myNote(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php6";
	}
	//跳转到我的帖子回复页面
	@RequestMapping("/myNoteComment.do")
	public String myNoteComment(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php7";
	}
	//跳转到我的帖子收藏页面
	@RequestMapping("/myNoteCollect.do")
	public String myNoteCollect(HttpServletRequest request){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("fu", fu);
		//展示头部尾部信息
		showProtalMsg(request);
		//查询所有父版块
		List<Map<String, Object>> listmodel = cservice.findIndexModel();
		request.setAttribute("listmodel",listmodel );
		return "center/home.php9";
	}
	//保存个人基本信息
	@RequestMapping(value="/saveBaseMb.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveBaseMb(HttpServletRequest request,FaUser fu){
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = service.saveBaseMb(fu);
		map.put("tip", tip);
		FaUser newfu =service.getMemberById(fu.getFa_id());
		request.getSession().setAttribute(Constant.SESSION_USER, newfu);
		return map;
	}
	//保存个人职业信息
	@RequestMapping(value="/saveJobMb.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveJobMb(HttpServletRequest request,FaUser fu){
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = service.saveJobMb(fu);
		map.put("tip", "success");
		FaUser newfu =service.getMemberById(fu.getFa_id());
		request.getSession().setAttribute(Constant.SESSION_USER, newfu);
		
		return map;
	}
	//保存个人活动信息
	@RequestMapping(value="/saveActiveMb.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveActiveMb(HttpServletRequest request,FaUser fu){
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = service.saveActiveMb(fu);
		map.put("tip", "success");
		FaUser newfu =service.getMemberById(fu.getFa_id());
		request.getSession().setAttribute(Constant.SESSION_USER, newfu);
		return map;
	}
	
	//分页展示会员积分记录
	@RequestMapping(value="/findUserInteById.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findUserInteById(HttpServletRequest request,String id,Integer curpage,String startDay,String endDay,Integer buyOrSelf ,Integer types){
		
		try {
			if(curpage<1){
				curpage=1;
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date ss =null;
			Date ee =null;
			Integer pagesize = 10;
			Map<String, Object> map = new HashMap<>();
			if(startDay!=null && !startDay.equals("")){
				ss = sdf.parse(startDay);
				if(endDay==null||endDay.equals("")){
					map.put("tip", 2);
					map.put("msg", "请填写查询的结束日期");
					return map;
				}
			}
			if(endDay!=null && !endDay.equals("")){
				ee = sdf.parse(endDay);
				if(startDay==null||startDay.equals("")){
					map.put("tip", 2);
					map.put("msg", "请填写查询的开始日期");
					return map;
				}
			}
			List<Map<String, Object>> list = service.getFiioerInteByPage(curpage,pagesize,ss,ee,id,types,buyOrSelf);
			Long total = service.getTotalByFiioerInte(ss,ee,id,types,buyOrSelf);
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
	//查询所有标签
	@RequestMapping(value="/getAllLabel.do",method=RequestMethod.POST)
	@ResponseBody
	public List<FaLabel> getAllLabel(HttpServletRequest request,FaUser fu){
		
		List<FaLabel> allLabel = service.getAllLabel();
		
		
		return allLabel;
	}
	//绑定标签
	@RequestMapping(value="/bindLabel.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bindLabel(HttpServletRequest request,String id,Integer [] ids){
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = service.bindLabel(id,ids);
		
		map.put("tip", tip);
		return map;
	}
	//更新隐藏好友列表信息
	@RequestMapping(value="/saveFriendState.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveFriendState(HttpServletRequest request,String id,Integer friendType){
		
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = service.saveFriendState(id,friendType);
		
		map.put("tip", tip);
		FaUser newfu =service.getMemberById(id);
		request.getSession().setAttribute(Constant.SESSION_USER, newfu);
		return map;
	}
	//屏蔽用户组
	@RequestMapping(value="/ignoreGroups.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ignoreGroups(HttpServletRequest request,String [] ids,String id){
		
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = cservice.ignoreGroups(id,ids);
		
		map.put("tip", tip);
		return map;
	}
	//取消屏蔽指定用户
	@RequestMapping(value="/ignoreFriends.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ignoreFriends(HttpServletRequest request,String [] ids){
		
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = cservice.ignoreFriends(ids);
		
		map.put("tip", tip);
		return map;
	}
	//屏蔽用户提醒
	@RequestMapping(value="/ignoreMsgs.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ignoreMsgs(HttpServletRequest request,String  ids,String id){
		
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = cservice.ignoreMsgs(request,ids,id);
		
		map.put("tip", tip);
		return map;
	}
	//上传用户头像
	@RequestMapping(value="/updateMyImage.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateMyImage(HttpServletRequest request,String  imageUrl){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = cservice.updateMyImage(request,fu.getFa_id(),imageUrl);
		
		map.put("tip", tip);
		return map;
	}
	//发送给自己邮箱的验证码
	@RequestMapping(value="/sendMsgToemail.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sendMsgToemail(HttpServletRequest request,String  codeName){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		String code = RandomStringUtils.randomNumeric(6);
		EmailUtil.send(fu.getFa_email(), "飞傲论坛验证码", "您的验证码为："+code+" 请不要泄露给任何人");
		request.getSession().setAttribute(codeName, code);
		map.put("tip", "success");
		return map;
	}
	//发送给自己手机的验证码
	@RequestMapping(value="/sendMsgToTel.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sendMsgToTel(HttpServletRequest request,String  codeName) throws Exception{
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		String code = RandomStringUtils.randomNumeric(6);
		SendSms.sendSMSDemo(fu.getFa_telphone().toString(), code);
		request.getSession().setAttribute(codeName, code);
		map.put("tip", "success");
		return map;
	}
	//发送给新邮箱的验证码
	@RequestMapping(value="/sendMsgToNewemail.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sendMsgToNewemail(HttpServletRequest request,String  codeName,String email){
		Map<String, Object> map = new HashMap<String, Object>();
		if(email!=null && !email.equals("")){
			Integer isTrue = service.validateEmailIsTrue(email);
			if(isTrue.equals(1)){
				String code = RandomStringUtils.randomNumeric(6);
				EmailUtil.send(email, "飞傲论坛验证码", "您的验证码为："+code+" 请不要泄露给任何人");
				request.getSession().setAttribute(codeName, code);
				request.getSession().setAttribute(codeName+"a", email);
				map.put("tip", "success");
			}else{
				map.put("tip", "该邮箱已被注册");
			}
		}else{
			map.put("tip", "邮箱不能为空");
		}
		
		
		return map;
	}
	//发送给新手机的验证码
	@RequestMapping(value="/sendMsgToNewTel.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sendMsgToNewTel(HttpServletRequest request,String  codeName,String tel) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		if(tel!=null && !tel.equals("")){
			Integer isTrue = service.validateTelIsTrue(tel);
			if(isTrue.equals(1)){
				String code = RandomStringUtils.randomNumeric(6);
				SendSms.sendSMSDemo(tel, code);
				request.getSession().setAttribute(codeName, code);
				request.getSession().setAttribute(codeName+"a", tel);
				map.put("tip", "success");
			}else{
				map.put("tip", "该手机已被注册");
			}
		}else{
			map.put("tip", "手机不能为空");
		}
		
		
		return map;
	}
	//验证邮箱验证码是否正确
	@RequestMapping(value="/vidCodeIsTrueByEmail.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> vidCodeIsTrueByEmail(HttpServletRequest request,String  codeName,String code){
		Map<String, Object> map = new HashMap<String, Object>();
		if(code!=null && !code.equals("")){
			if(!code.equals(request.getSession().getAttribute(codeName))){
				map.put("tip", "输入的验证码不正确");
			}else{
				map.put("tip", "success");
				request.getSession().removeAttribute(codeName);
			}
		}else{
			map.put("tip", "验证码不能为空");
		}
		
		return map;
	}
	//验证手机及验证码是否正确
	@RequestMapping(value="/vidCodeIsTrueByTel.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> vidCodeIsTrueByTel(HttpServletRequest request,String  codeName,String code){
		Map<String, Object> map = new HashMap<String, Object>();
		if(code!=null && !code.equals("")){
			if(!code.equals(request.getSession().getAttribute(codeName))){
				map.put("tip", "输入的验证码不正确");
			}else{
				map.put("tip", "success");
				request.getSession().removeAttribute(codeName);
			}
		}else{
			map.put("tip", "验证码不能为空");
		}
		
		return map;
	}
	//密码修改密码
	@RequestMapping(value="/updatePswByPsw.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updatePswByPsw(HttpServletRequest request,HttpServletResponse response,String  oripsw,String newpsw){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = cservice.updatePswByPsw(request,response,fu.getFa_id(),newpsw,oripsw);
		
		map.put("tip", tip);
		return map;
	}
	//邮箱修改密码
	@RequestMapping(value="/updatePswByEmail.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updatePswByEmail(HttpServletRequest request,HttpServletResponse response,String  code,String newpsw){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		if(code!=null && !code.equals("")){
			if(!code.equals(request.getSession().getAttribute("emailChangePsw"))){
				map.put("tip", "输入的验证码不正确");
			}else{
				String tip = cservice.updatePsw(request,response,fu.getFa_id(),newpsw,"emailChangePsw");
				
				map.put("tip", tip);
			}
		}else{
			map.put("tip", "验证码不能为空");
		}
		
		
		return map;
	}
	//手机修改密码
	@RequestMapping(value="/updatePswByTel.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updatePswByTel(HttpServletRequest request,HttpServletResponse response,String  code,String newpsw){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		if(code!=null && !code.equals("")){
			if(!code.equals(request.getSession().getAttribute("telChangePsw"))){
				map.put("tip", "输入的验证码不正确");
			}else{
				String tip = cservice.updatePsw(request,response,fu.getFa_id(),newpsw,"telChangePsw");
				
				map.put("tip", tip);
			}
		}else{
			map.put("tip", "验证码不能为空");
		}
		
		
		return map;
	}
	//邮箱修改邮箱
	@RequestMapping(value="/updateEmailByEmail.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateEmailByEmail(HttpServletRequest request,String  code,String codeName,String email){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		if(code!=null && !code.equals("")){
			if(!code.equals(request.getSession().getAttribute(codeName))){
				map.put("tip", "输入的验证码不正确");
			}else{
				if(email!=null && !email.equals("")){
					if(!email.equals(request.getSession().getAttribute(codeName+"a"))){
						map.put("tip", "邮箱发生变化，请重新输入验证码");
					}else{
						String tip = cservice.updateEmailByEmail(request,fu.getFa_id(),email,codeName);
						
						map.put("tip", tip);
					}
					
				}else{
					map.put("tip", "邮箱不能为空");
				}
				
			}
		}else{
			map.put("tip", "验证码不能为空");
		}
		
		
		return map;
	}
	//手机修改手机
	@RequestMapping(value="/updateTelByTel.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateTelByTel(HttpServletRequest request,String  code,String codeName,String tel){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		if(code!=null && !code.equals("")){
			if(!code.equals(request.getSession().getAttribute(codeName))){
				map.put("tip", "输入的验证码不正确");
			}else{
				if(tel!=null && !tel.equals("")){
					if(!tel.equals(request.getSession().getAttribute(codeName+"a"))){
						map.put("tip", "手机发生变化，请重新输入验证码");
					}else{
						String tip = cservice.updateTelByEmail(request,fu.getFa_id(),tel,codeName);
						
						map.put("tip", tip);
					}
					
				}else{
					map.put("tip", "手机不能为空");
				}
				
			}
		}else{
			map.put("tip", "验证码不能为空");
		}
		
		
		return map;
	}
	//邮箱修改手机
	@RequestMapping(value="/updateTelByEmail.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateTelByEmail(HttpServletRequest request,String  code,String codeName,String tel){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		if(code!=null && !code.equals("")){
			if(!code.equals(request.getSession().getAttribute(codeName))){
				map.put("tip", "输入的验证码不正确");
			}else{
				if(tel!=null && !tel.equals("")){
					if(!tel.equals(request.getSession().getAttribute(codeName+"a"))){
						map.put("tip", "手机发生变化，请重新输入验证码");
					}else{
						String tip = cservice.updateTelByEmail(request,fu.getFa_id(),tel,codeName);
						
						map.put("tip", tip);
					}
					
				}else{
					map.put("tip", "手机不能为空");
				}
				
			}
		}else{
			map.put("tip", "验证码不能为空");
		}
		
		
		return map;
	}
	//绑定手机
	@RequestMapping(value="/bindTel.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bindTel(HttpServletRequest request,String  code,String codeName,String tel){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		if(fu.getFa_telphone()==null || fu.getFa_telphone().equals("")){
			if(code!=null && !code.equals("")){
				if(!code.equals(request.getSession().getAttribute(codeName))){
					map.put("tip", "输入的验证码不正确");
				}else{
					if(tel!=null && !tel.equals("")){
						if(!tel.equals(request.getSession().getAttribute(codeName+"a"))){
							map.put("tip", "手机发生变化，请重新输入验证码");
						}else{
							String tip = cservice.updateTelByEmail(request,fu.getFa_id(),tel,codeName);
							
							map.put("tip", tip);
						}
						
					}else{
						map.put("tip", "手机不能为空");
					}
					
				}
			}else{
				map.put("tip", "验证码不能为空");
			}
		}else{
			map.put("tip", "你已经绑定手机啦");
		}
		return map;
	}
	//验证密保是否正确
	@RequestMapping(value="/findMiBaoIsTrue.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findMiBaoIsTrue(HttpServletRequest request,FaUser fus) throws Exception{
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		if(!fus.getFa_mibao_ar_st().equals(fu.getFa_mibao_ar_st())){
			map.put("tip", "密保不正确");
			return map;
		}
		if(!fus.getFa_mibao_ar_rd().equals(fu.getFa_mibao_ar_rd())){
			map.put("tip", "密保不正确");
			return map;
		}
		if(!fus.getFa_mibao_ar_nd().equals(fu.getFa_mibao_ar_nd())){
			map.put("tip", "密保不正确");
			return map;
		}
		
		map.put("tip", "success");
		return map;
	}
	//验证密码是否正确
	@RequestMapping(value="/findPswIsTrue.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findPswIsTrue(HttpServletRequest request,String psw) throws Exception{
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		if(fu.getFa_password().equals(MD5.getMD5(psw))){
			map.put("tip", "success");
		}else{
			map.put("tip", "密码不正确");
		}
		return map;
	}
	//保存密保
	@RequestMapping(value="/saveMibao.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveMibao(HttpServletRequest request,FaUser fus) throws Exception{
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		if(fu.getFa_mibao_ar_st()!=null ){
			map.put("tip", "你已经设置过密保啦");
			return map;
					
		}
		if(fu.getFa_mibao_ar_rd()!=null ){
			map.put("tip", "你已经设置过密保啦");
			return map;
			
		}
		if(fu.getFa_mibao_ar_nd()!=null ){
			map.put("tip", "你已经设置过密保啦");
			return map;
			
		}
		if(fus.getFa_mibao_ar_st()==null ||fus.getFa_mibao_ar_st().equals("")){
			map.put("tip", "请完善密保问题");
			return map;
		}
		if(fus.getFa_mibao_ar_rd()==null ||fus.getFa_mibao_ar_rd().equals("")){
			map.put("tip", "请完善密保问题");
			return map;
		}
		if(fus.getFa_mibao_ar_nd()==null ||fus.getFa_mibao_ar_nd().equals("")){
			map.put("tip", "请完善密保问题");
			return map;
		}
		fus.setFa_id(fu.getFa_id());
		String tip = service.saveMibaoByid(fus);
		fu.setFa_mibao_qu_st(fus.getFa_mibao_qu_st());
		fu.setFa_mibao_qu_rd(fus.getFa_mibao_qu_rd());
		fu.setFa_mibao_qu_nd(fus.getFa_mibao_qu_nd());
		fu.setFa_mibao_ar_st(fus.getFa_mibao_ar_st());
		fu.setFa_mibao_ar_rd(fus.getFa_mibao_ar_rd());
		fu.setFa_mibao_ar_nd(fus.getFa_mibao_ar_nd());
		request.getSession().setAttribute(Constant.SESSION_USER, fu);
		map.put("tip", tip);
		return map;
	}
	//保存密保
	@RequestMapping(value="/updateMibao.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateMibao(HttpServletRequest request,FaUser fus) throws Exception{
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(fus.getFa_mibao_ar_st()==null ||fus.getFa_mibao_ar_st().equals("")){
			map.put("tip", "请完善密保问题");
			return map;
		}
		if(fus.getFa_mibao_ar_rd()==null ||fus.getFa_mibao_ar_rd().equals("")){
			map.put("tip", "请完善密保问题");
			return map;
		}
		if(fus.getFa_mibao_ar_nd()==null ||fus.getFa_mibao_ar_nd().equals("")){
			map.put("tip", "请完善密保问题");
			return map;
		}
		fus.setFa_id(fu.getFa_id());
		String tip = service.saveMibaoByid(fus);
		fu.setFa_mibao_qu_st(fus.getFa_mibao_qu_st());
		fu.setFa_mibao_qu_rd(fus.getFa_mibao_qu_rd());
		fu.setFa_mibao_qu_nd(fus.getFa_mibao_qu_nd());
		fu.setFa_mibao_ar_st(fus.getFa_mibao_ar_st());
		fu.setFa_mibao_ar_rd(fus.getFa_mibao_ar_rd());
		fu.setFa_mibao_ar_nd(fus.getFa_mibao_ar_nd());
		request.getSession().setAttribute(Constant.SESSION_USER, fu);
		map.put("tip", tip);
		return map;
	}
	//新增或修改联系人
	@RequestMapping(value="/saveOrUpdateAdress.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveOrUpdateAdress(HttpServletRequest request,FaReceiver fr) throws Exception{
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		fr.setFa_userid(fu.getFa_id());
		String tip = cservice.saveOrUpdateAdress(fr);
		map.put("tip", tip);
		return map;
	}
	//删除联系人
	@RequestMapping(value="/deleteAdress.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteAdress(HttpServletRequest request,String id) {
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = cservice.deleteAdress(id,fu.getFa_id());
		map.put("tip", tip);
		return map;
	}
	//查询我的所有联系人
	@RequestMapping(value="/SelectMyAllAdress.do",method=RequestMethod.POST)
	@ResponseBody
	public List<FaReceiver> SelectMyAllAdress(HttpServletRequest request) {
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		List<FaReceiver> list = cservice.getAllReceiverById(fu.getFa_id());
		
		return list;
	}
	//查询我的所有产品
	@RequestMapping(value="/showAllMyProduct.do",method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> showAllMyProduct(HttpServletRequest request) {
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		List<Map<String, Object>> list = cservice.getAllProductById(fu.getFa_id());
		
		return list;
	}
	//注册产品
	@RequestMapping(value="/registerProduct.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> registerProduct(HttpServletRequest request,String proId){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = cservice.registerProduct(fu.getFa_id(),proId,request);
		map.put("tip", tip);
		return map;
	}
	//加载抽奖信息
	@RequestMapping(value="/showMyLotteryData.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showMyLotteryData(HttpServletRequest request,Integer curpage){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Integer pagesize = 50;
		curpage = (curpage-1)*pagesize;
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> data = cservice.showMyLotteryData(fu.getFa_id(),curpage,pagesize);
		Long totalpage = cservice.showMyLotteryCount(fu.getFa_id());
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		map.put("rows", data);
		
		return map;
	}
	//加载兑换奖品信息
	@RequestMapping(value="/showMyShopData.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showMyShopData(HttpServletRequest request,Integer curpage){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Integer pagesize = 50;
		curpage = (curpage-1)*pagesize;
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> data = cservice.showMyShopData(fu.getFa_id(),curpage,pagesize);
		Long totalpage = cservice.showMyShopCount(fu.getFa_id());
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		map.put("rows", data);
		
		return map;
	}
	//更新抽奖中的联系人信息
	@RequestMapping(value="/updateLotteryAdress.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateLotteryAdress(HttpServletRequest request,String id,String adid){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = cservice.updateLotteryAdress(fu.getFa_id(),id,adid);
		map.put("tip", tip);
		
		return map;
	}
	//取关
	@RequestMapping(value="/deleteMyFollow.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteMyFollow(HttpServletRequest request,String id){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = cservice.deleteMyFollow(fu.getFa_id(),id);
		map.put("tip", tip);
		
		return map;
	}
	//关注
	@RequestMapping(value="/addMyFollow.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addMyFollow(HttpServletRequest request,String id){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = cservice.addMyFollow(fu.getFa_id(),id);
		map.put("tip", tip);
		
		return map;
	}
	//关注修改备注名
	@RequestMapping(value="/updateMyFollow.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateMyFollow(HttpServletRequest request,String idz,String namez){
		Map<String, Object> map = new HashMap<String, Object>();
		if(namez.length()<=15){
			FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
			String tip = cservice.updateMyFollow(fu.getFa_id(),idz,namez);
			map.put("tip", tip);
		}else{
			map.put("tip", "备注名称太长啦");
		}
		
		
		return map;
	}
	//好友修改备注名
	@RequestMapping(value="/updateMyFriend.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateMyFriend(HttpServletRequest request,String ids,String namez){
		Map<String, Object> map = new HashMap<String, Object>();
		if(namez.length()<=15){
			FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
			String tip = cservice.updateMyFriend(fu.getFa_id(),ids,namez);
			map.put("tip", tip);
		}else{
			map.put("tip", "备注名称太长啦");
		}
		
		
		return map;
	}
	//设置好友分组
	@RequestMapping(value="/updateMyFriendType.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateMyFriendType(HttpServletRequest request,String idx,String groups){
		Map<String, Object> map = new HashMap<String, Object>();
		if(groups==null){
			groups="";
		}
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		String tip = cservice.updateMyFriendType(fu.getFa_id(),idx,groups);
		map.put("tip", tip);
		
		
		
		return map;
	}
	//好友移动分组分组
	@RequestMapping(value="/changeMyGroups.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> changeMyGroups(HttpServletRequest request,String [] ids,String tid){
		Map<String, Object> map = new HashMap<String, Object>();
		
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		String tip = cservice.changeMyGroups(fu.getFa_id(),tid,ids);
		map.put("tip", tip);
		
		
		
		return map;
	}
	//分页查询我的收听信息
	@RequestMapping(value="/selectMyFollowByPage.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectMyFollowByPage(HttpServletRequest request,Integer curpage){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 20;
		if(curpage==null || curpage<1){
			curpage=1;
		}
		map.put("curpage", curpage);
		curpage = (curpage-1)*pagesize;
		
		List<Map<String, Object>> data = cservice.selectMyFollowByPage(fu.getFa_id(),curpage,pagesize);
		Long totalpage = cservice.selectMyFollowCount(fu.getFa_id());
		map.put("totalsize", totalpage);
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		
		map.put("rows", data);
		
		return map;
	}
	//分页查询我的听众信息
	@RequestMapping(value="/selectMyFansByPage.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectMyFansByPage(HttpServletRequest request,Integer curpage){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 20;
		if(curpage==null || curpage<1){
			curpage=1;
		}
		map.put("curpage", curpage);
		curpage = (curpage-1)*pagesize;
		
		List<Map<String, Object>> data = cservice.selectMyFansByPage(fu.getFa_id(),curpage,pagesize);
		Long totalpage = cservice.selectMyFansCount(fu.getFa_id());
		map.put("totalsize", totalpage);
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		
		map.put("rows", data);
		
		return map;
	}
	//分页查询我的好友信息
	@RequestMapping(value="/selectMyFriendByPage.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectMyFriendByPage(HttpServletRequest request,Integer curpage,String searchtype ,String searchname){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 20;
		if(curpage==null || curpage<1){
			curpage=1;
		}
		map.put("curpage", curpage);
		curpage = (curpage-1)*pagesize;
		if(searchtype.equals("0")){
			searchtype=null;
		}
		List<Map<String, Object>> data = cservice.selectMyFriendByPage(fu.getFa_id(),curpage,pagesize,searchname,searchtype);
		Long totalpage = cservice.selectMyFriendCount(fu.getFa_id(),searchname,searchtype);
		map.put("totalsize", totalpage);
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		
		map.put("rows", data);
		
		return map;
	}
	//取消好友
	@RequestMapping(value="/deleteMyFriend.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteMyFriend(HttpServletRequest request,String id){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = cservice.deleteMyFriend(fu.getFa_id(),id);
		map.put("tip", tip);
		
		return map;
	}
	//加好友（发送消息）
	@RequestMapping(value="/addMyFriend.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addMyFriend(HttpServletRequest request,String id){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = cservice.addMyFriend(fu.getFa_id(),id);
		map.put("tip", tip);
		
		return map;
	}
	//分页查询我搜索会员信息
	@RequestMapping(value="/searchMember.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> searchMember(HttpServletRequest request,Integer curpage,String username ,Integer syncbbs,String tel,String email,Integer sex,Integer lifeplace){
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 20;
		if(curpage==null || curpage<1){
			curpage=1;
		}
		map.put("curpage", curpage);
		if(username==null || username.equals("")){
			if(tel==null || tel.equals("")){
				if(email==null || email.equals("")){
					if(sex>=2){
						if(lifeplace<0){
							map.put("rows", "");
							
							return map;
						}
					}
				}
			}
		}
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		
		curpage = (curpage-1)*pagesize;
		List<Map<String, Object>> data = cservice.selectMyFriendByPage(fu.getFa_id(),curpage,pagesize,username,syncbbs,tel,email,sex,lifeplace);
		Long totalpage = cservice.selectMyFriendCount(fu.getFa_id(),username,syncbbs,tel,email,sex,lifeplace);
		map.put("totalsize", totalpage);
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		
		map.put("rows", data);
		
		return map;
	}
	//模糊查询我的好友
	@RequestMapping(value="/searchMemberByVague.do",method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> searchMemberByVague(HttpServletRequest request,String username){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		if(username==null || username.equals("")){
			List<Map<String, Object>> list = new ArrayList<>();
			return list;
		}else{
			List<Map<String, Object>> list = cservice.searchMemberByVague(fu.getFa_id(),username);
			return list;
		}
		
		
	}
	//忽略某个好友
	@RequestMapping(value="/ignoreByFriendId.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ignoreByFriendId(HttpServletRequest request,String id){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<>();
		String tip = cservice.ignoreByFriendId(fu.getFa_id(),id);
		map.put("tip", tip);
		return map;
		
		
	}
	//保存屏蔽的好友信息
	@RequestMapping(value="/saveIgnoreFriend.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> saveIgnoreFriend(HttpServletRequest request,String [] users,Integer isFriendMsg){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		if(isFriendMsg==null){
			isFriendMsg = 0;
		}
		if(isFriendMsg>1 || isFriendMsg<0){
			isFriendMsg=0;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = cservice.saveIgnoreFriend(fu.getFa_id(),users,isFriendMsg);
		if(tip.equals("success")){
			fu.setFa_isfriendmsg(isFriendMsg);
			request.getSession().setAttribute(Constant.SESSION_USER,fu);
		}
		map.put("tip", tip);
		return map;
		
		
		
	}
	//批量删除对话
	@RequestMapping(value="/deleteSessionRoom.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteSessionRoom(HttpServletRequest request,String [] ids){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = cservice.deleteSessionRoom(fu.getFa_id(),ids);
		
		map.put("tip", tip);
		return map;
		
		
		
	}
	//批量删除系统消息
	@RequestMapping(value="/deleteSystemMsg.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteSystemMsg(HttpServletRequest request,String [] ids){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = cservice.deleteSystemMsg(fu.getFa_id(),ids);
		
		map.put("tip", tip);
		return map;
		
		
		
	}
	//批量已读对话
	@RequestMapping(value="/msgHasRead.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> msgHasRead(HttpServletRequest request,String [] ids){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = cservice.msgHasRead(fu.getFa_id(),ids);
		
		map.put("tip", tip);
		return map;
		
		
		
	}
	//批量已读系统信息
	@RequestMapping(value="/systemMsgHasRead.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> systemMsgHasRead(HttpServletRequest request,String [] ids){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = cservice.systemMsgHasRead(fu.getFa_id(),ids);
		
		map.put("tip", tip);
		return map;
		
		
		
	}
	//批量发送个人信息给好友
	@RequestMapping(value="/sendMyMsgToMyFriends.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sendMyMsgToMyFriends(HttpServletRequest request,String [] users,String descs){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = cservice.sendMyMsgToMyFriends(fu.getFa_id(),users,descs);
		
		map.put("tip", tip);
		return map;
		
		
		
	}
	//发送某个信息给好友
	@RequestMapping(value="/sendMyMsgToMyOnlyFriend.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sendMyMsgToMyOnlyFriend(HttpServletRequest request,String users,String descs){
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		
		
		Map<String, Object> map = cservice.sendMyMsgToMyOnlyFriend(fu.getFa_id(),users,descs);
		
		return map;
		
		
		
	}
	//删除某个消息
	@RequestMapping(value="/deleteSessionSelfMsg.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteSessionSelfMsg(HttpServletRequest request,String mid,String fid,String id){
		
		
		Map<String, Object> map = cservice.deleteSessionSelfMsg(mid,fid,id);
		
		return map;
	}
	//删除某个提醒
	@RequestMapping(value="/deleteSystemRemind.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteSystemRemind(HttpServletRequest request,String id){
		
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = cservice.deleteSystemRemind(fu.getFa_id(),id);
		
		return map;
	}
	//忽略某个提醒
	@RequestMapping(value="/ignoreSystemRemind.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> ignoreSystemRemind(HttpServletRequest request,String id){
		
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = cservice.ignoreSystemRemind(request,fu,id);
		
		return map;
	}
	//同意成为好友
	@RequestMapping(value="/agreeBecomeTheFriend.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> agreeBecomeTheFriend(HttpServletRequest request,String id){
		
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = cservice.agreeBecomeTheFriend(fu.getFa_id(),id);
		
		return map;
	}
	//拒绝成为好友
	@RequestMapping(value="/stopBecomeTheFriend.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> stopBecomeTheFriend(HttpServletRequest request,String id){
		
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = cservice.stopBecomeTheFriend(fu.getFa_id(),id);
		
		return map;
	}
	//确认转播
	@RequestMapping(value="/sureReturn.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureReturn(HttpServletRequest request,Integer iscode,String pid,String desc,String vode,String fid){
		
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = nservice.sureReturn(request,fu.getFa_id(),iscode,pid,desc,vode,fid);
		map.put("tip", tip);
		return map;
	}
	//发送心情
	@RequestMapping(value="/sureSendMyGood.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureSendMyGood(HttpServletRequest request,Integer iscode,String desc,String vode){
		
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		String tip = nservice.sureSendMyGood(request,fu.getFa_id(),iscode,desc,vode);
		map.put("tip", tip);
		return map;
	}
	//确认评论
	@RequestMapping(value="/sureReply.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sureReply(HttpServletRequest request,Integer iscode,String pid,String desc,String vode,String fid,String rid){
		
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		
		Map<String, Object> map =  nservice.sureReply(request,fu.getFa_id(),iscode,pid,desc,vode,fid,rid);
		
		return map;
	}
	//删除我的心情
	@RequestMapping(value="/deleteMyMood.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteMyMood(HttpServletRequest request,String id){
		
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		
		Map<String, Object> map =  nservice.deleteMyMood(fu.getFa_id(),id);
		
		return map;
	}
	//删除我的帖子
	@RequestMapping(value="/deleteMyNote.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteMyNote(HttpServletRequest request,String id){
		
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		
		Map<String, Object> map =  nservice.deleteMyNote(fu.getFa_id(),id);
		
		return map;
	}
	//取消收藏我的帖子
	@RequestMapping(value="/deleteMyCollect.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteMyCollect(HttpServletRequest request,String id){
		
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		
		Map<String, Object> map =  nservice.deleteMyCollect(fu.getFa_id(),id);
		
		return map;
	}
	//分页查询个人消息页面
	@RequestMapping(value="/selectMySendOrGetMsg.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectMySendOrGetMsg(HttpServletRequest request,Integer curpage){
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 20;
		if(curpage==null || curpage<1){
			curpage=1;
		}
		map.put("curpage", curpage);
		
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		
		curpage = (curpage-1)*pagesize;
		List<Map<String, Object>> data = cservice.selectMySendOrGetMsgByPage(fu.getFa_id(),curpage,pagesize);
		Long totalpage = cservice.selectMySendOrGetMsgCount(fu.getFa_id());
		map.put("totalsize", totalpage);
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		
		map.put("rows", data);
		
		return map;
	}
	//分页查询系统消息页面
	@RequestMapping(value="/selectSystemMsg.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectSystemMsg(HttpServletRequest request,Integer curpage){
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 20;
		if(curpage==null || curpage<1){
			curpage=1;
		}
		map.put("curpage", curpage);
		
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		
		curpage = (curpage-1)*pagesize;
		List<Map<String, Object>> data = cservice.selectSystemMsgByPage(fu.getFa_id(),curpage,pagesize);
		Long totalpage = cservice.selectSystemMsgCount(fu.getFa_id());
		map.put("totalsize", totalpage);
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		
		map.put("rows", data);
		
		return map;
	}
	//分页查询我和好友的消息页面
	@RequestMapping(value="/selectMyFriendAndMeMsgByPage.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectMyFriendAndMeMsgByPage(HttpServletRequest request,Integer curpage,String mid,String fid){
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 20;
		if(curpage==null || curpage<1){
			curpage=1;
		}
		
		
		
		curpage = (curpage-1)*pagesize;
		List<Map<String, Object>> data = cservice.selectMyFriendAndMeMsgByPage(mid,fid,curpage,pagesize);
		Long totalpage = cservice.selectMyFriendAndMeMsgByCount(mid,fid);
		
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		
		map.put("rows", data);
		
		return map;
	}
	//分页查询我的提醒
	@RequestMapping(value="/selectRemindBypage.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectRemindBypage(HttpServletRequest request,Integer curpage){
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 20;
		if(curpage==null || curpage<1){
			curpage=1;
		}
		map.put("curpage", curpage);
		
		
		curpage = (curpage-1)*pagesize;
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		
		List<Map<String, Object>> data = cservice.selectRemindBypage(fu.getFa_id(),curpage,pagesize);
		Long totalpage = cservice.selectRemindByCount(fu.getFa_id());
		map.put("totalsize", totalpage);
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		
		map.put("rows", data);
		
		return map;
	}
	//分页查询会员发表的帖子
	@RequestMapping(value="/selectMemberNote.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectMemberNote(HttpServletRequest request,Integer curpage,String id){
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 20;
		if(curpage==null || curpage<1){
			curpage=1;
		}
		map.put("curpage", curpage);
		
		
		curpage = (curpage-1)*pagesize;
		
		List<Map<String, Object>> data = nservice.selectMemberNote(id,curpage,pagesize);
		Long totalpage = nservice.selectMyNoteCount(id);
		map.put("totalsize", totalpage);
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		
		map.put("rows", data);
		
		return map;
	}
	//分页查询会员收藏的帖子
	@RequestMapping(value="/selectCollectNote.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectCollectNote(HttpServletRequest request,Integer curpage,String id){
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 20;
		if(curpage==null || curpage<1){
			curpage=1;
		}
		map.put("curpage", curpage);
		
		
		curpage = (curpage-1)*pagesize;
		
		List<Map<String, Object>> data = nservice.selectCollectNote(id,curpage,pagesize);
		Long totalpage = nservice.selectCollectNoteCount(id);
		map.put("totalsize", totalpage);
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		
		map.put("rows", data);
		
		return map;
	}
	//分页查询会员回复的帖子
	@RequestMapping(value="/selectMemberReply.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectMemberReply(HttpServletRequest request,Integer curpage,String id){
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 20;
		if(curpage==null || curpage<1){
			curpage=1;
		}
		map.put("curpage", curpage);
		
		
		curpage = (curpage-1)*pagesize;
		
		List<Map<String, Object>> data = nservice.selectMemberReply(id,curpage,pagesize);
		Long totalpage = nservice.selectMemberReply(id);
		map.put("totalsize", totalpage);
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		
		map.put("rows", data);
		
		return map;
	}
	//分页查询会员心情的
	@RequestMapping(value="/selectMemberMood.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectMemberMood(HttpServletRequest request,Integer curpage,String id){
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 20;
		if(curpage==null || curpage<1){
			curpage=1;
		}
		map.put("curpage", curpage);
		
		
		curpage = (curpage-1)*pagesize;
		
		List<Map<String, Object>> data = nservice.selectMemberMood(id,curpage,pagesize);
		Long totalpage = nservice.selectMemberMoodCount(id);
		map.put("totalsize", totalpage);
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		
		map.put("rows", data);
		
		return map;
	}
	//分页查询我和好友的心情
	@RequestMapping(value="/selectFriendMood.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectFriendMood(HttpServletRequest request,Integer curpage,String id){
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 20;
		if(curpage==null || curpage<1){
			curpage=1;
		}
		map.put("curpage", curpage);
		
		
		curpage = (curpage-1)*pagesize;
		
		Map<String, Object> data = nservice.selectFriendMood(id,curpage,pagesize);
		Long totalpage = (long)data.get("count");
		map.put("totalsize", totalpage);
		if(totalpage%pagesize==0){
			map.put("totalpage", totalpage/pagesize);
		}else{
			map.put("totalpage", (totalpage/pagesize)+1);
		}
		List<Map<String, Object>> dd = (List<Map<String, Object>>) data.get("data");
		map.put("rows", dd);
		
		return map;
	}
	
	//分页查询我和好友的心情的一个
	@RequestMapping(value="/selectFriendMoodByOne.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectFriendMoodByOne(HttpServletRequest request,Integer curpage,String id){
		
		
		
		
		Map<String, Object> data = nservice.selectFriendMoodByOne(id);
		
		
		return data;
	}
	
	//分页查询所有帖子回复的评论
	@RequestMapping(value="/selectAllCommentByNote.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectAllCommentByNote(HttpServletRequest request,Integer curpage){
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 20;
		if(curpage==null || curpage<1){
			curpage=1;
		}
		map.put("curpage", curpage);
		
		
		curpage = (curpage-1)*pagesize;
		
		List<Map<String, Object>> data = nservice.selectAllCommentByNote(curpage,pagesize);
		
		
		
		map.put("rows", data);
		
		return map;
	}
	//分页查询我的帖子的回复
	@RequestMapping(value="/selectMyCommentByNote.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectMyCommentByNote(HttpServletRequest request,Integer curpage){
		//获取缓存中的会员信息
		FaUser fu = (FaUser) request.getSession().getAttribute(Constant.SESSION_USER);
		Map<String, Object> map = new HashMap<String, Object>();
		Integer pagesize = 20;
		if(curpage==null || curpage<1){
			curpage=1;
		}
		map.put("curpage", curpage);
		
		
		curpage = (curpage-1)*pagesize;
		
		List<Map<String, Object>> data = nservice.selectMyCommentByNote(fu.getFa_id(),curpage,pagesize);
		
		
		
		map.put("rows", data);
		
		return map;
	}
	
}
