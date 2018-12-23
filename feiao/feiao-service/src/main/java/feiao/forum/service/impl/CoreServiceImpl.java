package feiao.forum.service.impl;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import feiao.forum.dao.FaCommentDao;
import feiao.forum.dao.FaConMsgDao;
import feiao.forum.dao.FaFriendTypeDao;
import feiao.forum.dao.FaGoodsDao;
import feiao.forum.dao.FaGroupsDao;
import feiao.forum.dao.FaHonorDao;
import feiao.forum.dao.FaIgnoreDao;
import feiao.forum.dao.FaInteDao;
import feiao.forum.dao.FaListenerDao;
import feiao.forum.dao.FaLotteryDateDao;
import feiao.forum.dao.FaMyFriendDao;
import feiao.forum.dao.FaProductDao;
import feiao.forum.dao.FaRankDao;
import feiao.forum.dao.FaReceiverDao;
import feiao.forum.dao.FaSectionDao;
import feiao.forum.dao.FaSelfMoodDao;
import feiao.forum.dao.FaSentMessageDao;
import feiao.forum.dao.FaSessionDao;
import feiao.forum.dao.FaShopMsgDao;
import feiao.forum.dao.FaUserDao;
import feiao.forum.dao.FaUserViceDao;
import feiao.forum.dao.FaWareDao;
import feiao.forum.pojo.ErpPds;
import feiao.forum.pojo.FaComment;
import feiao.forum.pojo.FaConMsg;
import feiao.forum.pojo.FaFriendType;
import feiao.forum.pojo.FaIgnore;
import feiao.forum.pojo.FaInte;
import feiao.forum.pojo.FaListener;
import feiao.forum.pojo.FaLoginEmail;
import feiao.forum.pojo.FaMyFriend;
import feiao.forum.pojo.FaRank;
import feiao.forum.pojo.FaReceiver;
import feiao.forum.pojo.FaSection;
import feiao.forum.pojo.FaSelfMood;
import feiao.forum.pojo.FaSentMessage;
import feiao.forum.pojo.FaSession;
import feiao.forum.pojo.FaUser;
import feiao.forum.pojo.FaUserVice;
import feiao.forum.pojo.FaWare;
import feiao.forum.service.Constant;
import feiao.forum.service.CoreService;
import feiao.forum.service.util.FeiaoDataMsg;
import feiao.forum.service.util.InteRP;
import feiao.forum.service.util.UserNameUtil;
import feiao.forum.util.CookieTools;
import feiao.forum.util.CookieUtils;
import feiao.forum.util.MD5;
import feiao.forum.util.RandomTools;
import feiao.forum.util.TimeUtil;

@Service
public class CoreServiceImpl implements CoreService{
	//内容信息
	@Autowired
	public FaConMsgDao fcmDao;
	//版块
	@Autowired
	public FaSectionDao fsDao;
	//会员
	@Autowired
	public FaUserDao fuDao;
	//会员等级
	@Autowired
	private FaRankDao rankDao;
	//会员组
	@Autowired
	private FaGroupsDao groupsDao;
	//会员附属信息
	@Autowired
	private FaUserViceDao fuvDao;
	//好友分组列表
	@Autowired
	private FaFriendTypeDao fftDao;
	//屏蔽好友列表(//忽略好友会话列表)
	@Autowired
	private FaIgnoreDao ignoreDao;
	//勋章
	@Autowired
	private FaHonorDao fhDao;
	//积分
	@Autowired
	private FaInteDao inteDao;
	//联系人
	@Autowired
	private FaReceiverDao receDao;
	//我的产品
	@Autowired
	private FaProductDao proDao;
	//我的奖品
	@Autowired
	private FaLotteryDateDao fldDao;
	//我的兑换信息
	@Autowired
	private FaShopMsgDao fsmDao;
	//固件
	@Autowired
	private FaWareDao fwDao;
	
	//我的收听
	@Autowired
	private FaListenerDao flDao;
	//我的心情
	@Autowired
	private FaSelfMoodDao moodDao;
	//我的好友
	@Autowired
	private FaMyFriendDao fmfDao;
	//发送消息
	@Autowired
	private FaSentMessageDao sendmsgDao;
	//用户对话表
	@Autowired
	private FaSessionDao sessionDao;
	//评论表
	@Autowired
	private FaCommentDao commentDao;
	//兑换商品
	@Autowired
	private FaGoodsDao fgDao;
	
	//查询首页版头信息
	@Override
	public List<Map<String, Object>> findIndexHead(){
		try {
			return fcmDao.findIndexHead();
		} catch (Exception e) {
			throw new  RuntimeException("查询首页版头信息方法出现异常",e); 
		}
	}
	//查询首页版尾通用信息
	@Override
	public List<Map<String, Object>> findIndexEndNor(){
		try {
			return fcmDao.findIndexEndNor();
		} catch (Exception e) {
			throw new  RuntimeException("查询首页版尾通用信息方法出现异常",e); 
		}
	}
	//查询首页版尾公司信息
	@Override
	public List<Map<String, Object>> findIndexEndCom(){
		try {
			return fcmDao.findIndexEndCom();
		} catch (Exception e) {
			throw new  RuntimeException("查询首页版尾公司信息方法出现异常",e); 
		}
	}
	//查询首页banner图
	@Override
	public List<Map<String, Object>> findIndexBanner() {
		try {
			return fcmDao.findIndexBanner();
		} catch (Exception e) {
			throw new  RuntimeException("查询首页banner图方法出现异常",e); 
		}
	}
	//查询所有父版块
	@Override
	public List<Map<String, Object>> findIndexModel() {
		try {
			return fsDao.findIndexModel();
		} catch (Exception e) {
			throw new  RuntimeException("查询所有父版块方法出现异常",e); 
		}
	}
	//登录
	@Override
	public String login(String username, String password, Integer key,HttpServletRequest request,HttpServletResponse response) {
		try {
			if(username==null||username.equals("")){
				return "手机/邮箱/昵称不能为空";
			}
			if(password==null || password.equals("")){
				return "密码不能为空";
			}
			if(password.length()<6 || password.length()>18){
				return "密码长度为6到18位";
			}
			FaUser fu = fuDao.getUserByTelAndEmail(username);
			if(fu==null || fu.getFa_id()==null){
				return "账户不存在";
			}
			if(fu.getFa_status().equals(1)){
				return "该账户已停用";
			}
			if(!MD5.getMD5(password).equals(fu.getFa_password())){
				return "密码不正确";
			}
			if(key.equals(1)){
				String id = fu.getFa_id()+"-"+fu.getFa_password();
				id=CookieUtils.encodeBase64(id);
				CookieTools.addCookie(Constant.COOKIE_NAME, id, 604800, response, request);
				
			}
			request.getSession().setAttribute(Constant.SESSION_USER, fu);
			
			loginAddInteAndFeibiao(request,fu);
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("登录方法出现异常",e); 
		}
	}
	//保存邮箱注册信息
	@Override
	public Integer saveEmailByRe(String email, String md5) {
		try {
			Long count = fuDao.getCountByEmailRe(email);
			if(count>0){
				fuDao.updateEmailRe(email,md5);
			}else{
				fuDao.saveEmailRe(email,md5);
			}
			return 1;
		} catch (Exception e) {
			throw new  RuntimeException("保存邮箱注册信息方法出现异常",e); 
		}
	}
	//注册邮箱时验证是否正确
	@Override
	public Integer vidEmail(String email, String code) {
		try {
			FaLoginEmail fle = fuDao.getEmailRe(email);
			if(fle!=null &&fle.getFa_email()!=null){
				if(fle.getFa_code().equals(code)){
					return 1;
				}else{
					return 0;
				}
			}else{
				return 0;
			}
			
		} catch (Exception e) {
			throw new  RuntimeException("//注册邮箱时验证是否正确方法出现异常",e); 
		}
	}
	//新建会员
	@Override
	public Integer createMember(String email, String password, HttpServletRequest request,String username) {
		try {
			
			//查询用户名是否重复
			boolean numeric = UserNameUtil.isNumeric(username);
			if(numeric){
				return 6;
			}
			if(username.indexOf("@") != -1){  
				return 6;
			} 
			Long counts =fuDao.validateUserNameIsTrue(username);
			
			if(counts>0){
				
				return 5;
			}
			
			Long count = fuDao.validateEmailIsTrue(email);
			if(count<=0){
				
				//查看积分规则表
				InteRP rps = FeiaoDataMsg.findRP(request.getSession().getServletContext());
				FaUserVice fuv = new FaUserVice();
				FaUser fu = new FaUser();
				//判断规则表注册邮箱的次数
				//无限
				if(rps.getEmailz().equals(0)){
					if(!rps.getEmailt().equals(1)){
						fuv.setFa_email_times(1);
						fuv.setFa_email_type(0);
					}else{
						fuv.setFa_email_times(1);
						fuv.setFa_email_type(1);
					}
					
					//一次获得积分
				}else if(rps.getEmailz().equals(1)){
					fuv.setFa_email_times(1);
					fuv.setFa_email_type(1);
					//每天获得积分	
				}else{
					if(!rps.getEmailt().equals(1)){
						fuv.setFa_email_times(1);
						fuv.setFa_email_type(0);
					}else{
						fuv.setFa_email_times(1);
						fuv.setFa_email_type(1);
					}
				}
				fu.setFa_username(username);
				fu.setFa_password(MD5.getMD5(password));
				fu.setFa_jifen(rps.getEmailInte());
				fu.setFa_feibiao(rps.getEmailFb());
				fu.setFa_title_img("/img/download/uc/13/91/68/02/90/139168029/w200h200.jpg");
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
				Date date = new Date();
				String ds = sdf.format(date);
				fu.setFa_email(email);
				String idz = ds +RandomStringUtils.randomNumeric(8)+RandomTools.getRandomString(2);
				fu.setFa_id(idz);
				//查询0积分的会员等级
				List<Integer> list= rankDao.getRankIdByInte(0);
				if(list!=null && !list.isEmpty()){
					fu.setFa_rank(list.get(0));
				}
				fu.setFa_createtime(date);
				fuDao.addMember(fu);
				fuv.setFa_id(fu.getFa_id());
				//会员附属表
				fuvDao.addMember(fuv);
				//删除邮箱注册表
				fuDao.deleteEmailRe(email);
				//查询注册勋章id
				List<Integer> listhonor = fhDao.finIdbycondition(1);
				for (Integer ints : listhonor) {
					//发送勋章
					String idh = ds +RandomTools.getRandomString(10);
					fhDao.sendFaHonor(idh, idz, ints);
				}
				List<FaInte> lfi = new ArrayList<>();
				//增加会员积分变化表
				FaInte f1 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "邮箱注册认证", rps.getEmailInte(), 0, "邮箱注册绑定账号",fu.getFa_jifen());
				lfi.add(f1);
				FaInte f2 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "邮箱注册认证", rps.getEmailFb(), 1, "邮箱注册绑定账号",fu.getFa_feibiao());
				lfi.add(f2);
				inteDao.saveFaInte(lfi);
				//为该会员设置分组
				List<FaFriendType> lf = new ArrayList<>();
				FaFriendType ff1 = new FaFriendType();
				ff1.setFa_id(sdf.format(date)+"1"+RandomTools.getRandomString(9));
				ff1.setFa_userid(fu.getFa_id());
				ff1.setFa_name("其他");
				FaFriendType ff2 = new FaFriendType();
				ff2.setFa_id(sdf.format(date)+"2"+RandomTools.getRandomString(9));
				ff2.setFa_userid(fu.getFa_id());
				ff2.setFa_name("通过本站认识");
				FaFriendType ff3 = new FaFriendType();
				ff3.setFa_id(sdf.format(date)+"3"+RandomTools.getRandomString(9));
				ff3.setFa_userid(fu.getFa_id());
				ff3.setFa_name("通过活动认识");
				FaFriendType ff4 = new FaFriendType();
				ff4.setFa_id(sdf.format(date)+"4"+RandomTools.getRandomString(9));
				ff4.setFa_userid(fu.getFa_id());
				ff4.setFa_name("通过朋友认识");
				FaFriendType ff5 = new FaFriendType();
				ff5.setFa_id(sdf.format(date)+"5"+RandomTools.getRandomString(9));
				ff5.setFa_userid(fu.getFa_id());
				ff5.setFa_name("亲人");
				FaFriendType ff6 = new FaFriendType();
				ff6.setFa_id(sdf.format(date)+"6"+RandomTools.getRandomString(9));
				ff6.setFa_userid(fu.getFa_id());
				ff6.setFa_name("同事");
				FaFriendType ff7 = new FaFriendType();
				ff7.setFa_id(sdf.format(date)+"7"+RandomTools.getRandomString(9));
				ff7.setFa_userid(fu.getFa_id());
				ff7.setFa_name("同学");
				FaFriendType ff8 = new FaFriendType();
				ff8.setFa_id(sdf.format(date)+"8"+RandomTools.getRandomString(9));
				ff8.setFa_userid(fu.getFa_id());
				ff8.setFa_name("不认识");
				lf.add(ff1);
				lf.add(ff2);
				lf.add(ff3);
				lf.add(ff4);
				lf.add(ff5);
				lf.add(ff6);
				lf.add(ff7);
				lf.add(ff8);
				fftDao.saveFriendTypes(lf);
				return 1;
			}else{
				return 0;
			}
		} catch (Exception e) {
			throw new  RuntimeException("新建会员方法出现异常",e); 
		}
	}
	//查询会员底部信息
	@Override
	public List<Map<String, Object>> findlistMbEnd() {
		try {
			return fcmDao.findlistMbEnd();
		} catch (Exception e) {
			throw new  RuntimeException("查询会员底部信息方法出现异常",e); 
		}
	}
	//登录加分
	public void loginAddInteAndFeibiao(HttpServletRequest request,FaUser fu){
		try {
			//查看积分规则表
			InteRP rps = FeiaoDataMsg.findRP(request.getSession().getServletContext());
			//根据id查询会员附属表
			FaUserVice fuv = fuvDao.get(fu.getFa_id());
			//判断登录奖励的周期
			//无限
			int i = 0;
			if(rps.getLoginz().equals(0)){
				//判断还能不能颁发奖励
				if(!fuv.getFa_login_type().equals(1)){
					//查看该周期的次数
					if(!rps.getLogint().equals(0)){
						
						if(rps.getLogint()<=fuv.getFa_login_times()+1){
							fuv.setFa_login_type(1);
							fuv.setFa_login_times(fuv.getFa_login_times()+1);
							i=1;
						}else{
							fuv.setFa_login_times(fuv.getFa_login_times()+1);
							i=1;
						}
					}else{
						fuv.setFa_login_times(0);
						i=1;
					}
				}
			//一次	
			}else if(rps.getLoginz().equals(1)){
				//判断还能不能颁发奖励
				if(!fuv.getFa_login_type().equals(1)){
					if(1<=fuv.getFa_login_times()+1){
						fuv.setFa_login_type(1);
						fuv.setFa_login_times(fuv.getFa_login_times()+1);
						i=1;
					}else{
						fuv.setFa_login_times(fuv.getFa_login_times()+1);
						i=1;
					}
				}
			//一天	
			}else{
				//判断还能不能颁发奖励
				if(!fuv.getFa_login_type().equals(1)){
					//查看该周期的次数
					if(!rps.getLogint().equals(0)){
						
						if(rps.getLogint()<=fuv.getFa_login_times()+1){
							fuv.setFa_login_type(1);
							fuv.setFa_login_times(fuv.getFa_login_times()+1);
							i=1;
						}else{
							fuv.setFa_login_times(fuv.getFa_login_times()+1);
							i=1;
						}
					}else{
						fuv.setFa_login_times(0);
						i=1;
					}
				}
			}
			if(i>0){
				fuvDao.updateLoginMb(fuv);
				List<FaInte> lf = new ArrayList<>();
				FaInte f1 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "每天登录", rps.getLoginInte(), 0, "每天登录",fu.getFa_jifen()+rps.getLoginInte());
				FaInte f2 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "每天登录", rps.getLoginFb(), 1, "每天登录",fu.getFa_feibiao()+rps.getLoginFb());
				lf.add(f1);
				lf.add(f2);
				fu.setFa_jifen(fu.getFa_jifen()+rps.getLoginInte());
				fu.setFa_feibiao(fu.getFa_feibiao()+rps.getLoginFb());
				fuDao.updateByInteAndFeiBiao(fu);
				inteDao.saveFaInte(lf);
				//查询登记表
				FaRank frk = rankDao.get(fu.getFa_rank());
				if(fu.getFa_jifen()>frk.getFa_end()){
					//查询该积分的会员等级
					List<Integer> list= rankDao.getRankIdByInte(fu.getFa_jifen());
					if(list!=null && !list.isEmpty()){
						fu.setFa_rank(list.get(list.size()-1));
						fuDao.updateMemberRank(fu.getFa_id(),fu.getFa_rank());
					}
				}
				request.getSession().setAttribute(Constant.SESSION_USER, fu);
			}
		} catch (Exception e) {
			throw new RuntimeException("登录加积分方法出现错误",e);
		}
	}
	//设置头像加分
	public void titleAddInteAndFeibiao(HttpServletRequest request,FaUser fu){
		try {
			//查看积分规则表
			InteRP rps = FeiaoDataMsg.findRP(request.getSession().getServletContext());
			//根据id查询会员附属表
			FaUserVice fuv = fuvDao.get(fu.getFa_id());
			//判断登录奖励的周期
			//无限
			int i = 0;
			if(rps.getTitlez().equals(0)){
				//判断还能不能颁发奖励
				if(!fuv.getFa_title_type().equals(1)){
					//查看该周期的次数
					if(!rps.getTitlet().equals(0)){
						
						if(rps.getTitlet()<=fuv.getFa_title_times()+1){
							fuv.setFa_title_type(1);
							fuv.setFa_title_times(fuv.getFa_title_times()+1);
							i=1;
						}else{
							fuv.setFa_title_times(fuv.getFa_title_times()+1);
							i=1;
						}
					}else{
						fuv.setFa_title_times(0);
						i=1;
					}
				}
				//一次	
			}else if(rps.getTitlez().equals(1)){
				//判断还能不能颁发奖励
				if(!fuv.getFa_title_type().equals(1)){
					if(1<=fuv.getFa_title_times()+1){
						fuv.setFa_title_type(1);
						fuv.setFa_title_times(fuv.getFa_title_times()+1);
						i=1;
					}else{
						fuv.setFa_title_times(fuv.getFa_title_times()+1);
						i=1;
					}
				}
				//一天	
			}else{
				//判断还能不能颁发奖励
				if(!fuv.getFa_title_type().equals(1)){
					//查看该周期的次数
					if(!rps.getTitlet().equals(0)){
						
						if(rps.getTitlet()<=fuv.getFa_title_times()+1){
							fuv.setFa_title_type(1);
							fuv.setFa_title_times(fuv.getFa_title_times()+1);
							i=1;
						}else{
							fuv.setFa_title_times(fuv.getFa_title_times()+1);
							i=1;
						}
					}else{
						fuv.setFa_title_times(0);
						i=1;
					}
				}
			}
			if(i>0){
				fuvDao.updateTitleMb(fuv);
				List<FaInte> lf = new ArrayList<>();
				FaInte f1 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "设置头像", rps.getTitleInte(), 0, "设置头像",fu.getFa_jifen()+rps.getTitleInte());
				FaInte f2 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "设置头像", rps.getTitleFb(), 1, "设置头像",fu.getFa_feibiao()+rps.getTitleFb());
				lf.add(f1);
				lf.add(f2);
				fu.setFa_jifen(fu.getFa_jifen()+rps.getTitleInte());
				fu.setFa_feibiao(fu.getFa_feibiao()+rps.getTitleFb());
				fuDao.updateByInteAndFeiBiao(fu);
				inteDao.saveFaInte(lf);
				//查询登记表
				FaRank frk = rankDao.get(fu.getFa_rank());
				if(fu.getFa_jifen()>frk.getFa_end()){
					//查询该积分的会员等级
					List<Integer> list= rankDao.getRankIdByInte(fu.getFa_jifen());
					if(list!=null && !list.isEmpty()){
						fu.setFa_rank(list.get(list.size()-1));
						fuDao.updateMemberRank(fu.getFa_id(),fu.getFa_rank());
					}
				}
				request.getSession().setAttribute(Constant.SESSION_USER, fu);
			}
		} catch (Exception e) {
			throw new RuntimeException("设置头像加积分方法出现错误",e);
		}
	}
	//注册产品加分
	public void proAddInteAndFeibiao(HttpServletRequest request,FaUser fu){
		try {
			//查看积分规则表
			InteRP rps = FeiaoDataMsg.findRP(request.getSession().getServletContext());
			//根据id查询会员附属表
			FaUserVice fuv = fuvDao.get(fu.getFa_id());
			//判断登录奖励的周期
			//无限
			int i = 0;
			if(rps.getProz().equals(0)){
				//判断还能不能颁发奖励
				if(!fuv.getFa_pro_type().equals(1)){
					//查看该周期的次数
					if(!rps.getProt().equals(0)){
						
						if(rps.getProt()<=fuv.getFa_pro_times()+1){
							fuv.setFa_pro_type(1);
							fuv.setFa_pro_times(fuv.getFa_pro_times()+1);
							i=1;
						}else{
							fuv.setFa_pro_times(fuv.getFa_pro_times()+1);
							i=1;
						}
					}else{
						fuv.setFa_pro_times(0);
						i=1;
					}
				}
				//一次	
			}else if(rps.getProz().equals(1)){
				//判断还能不能颁发奖励
				if(!fuv.getFa_pro_type().equals(1)){
					if(1<=fuv.getFa_pro_times()+1){
						fuv.setFa_pro_type(1);
						fuv.setFa_pro_times(fuv.getFa_pro_times()+1);
						i=1;
					}else{
						fuv.setFa_pro_times(fuv.getFa_pro_times()+1);
						i=1;
					}
				}
				//一天	
			}else{
				//判断还能不能颁发奖励
				if(!fuv.getFa_pro_type().equals(1)){
					//查看该周期的次数
					if(!rps.getProt().equals(0)){
						
						if(rps.getProt()<=fuv.getFa_pro_times()+1){
							fuv.setFa_pro_type(1);
							fuv.setFa_pro_times(fuv.getFa_pro_times()+1);
							i=1;
						}else{
							fuv.setFa_pro_times(fuv.getFa_pro_times()+1);
							i=1;
						}
					}else{
						fuv.setFa_pro_times(0);
						i=1;
					}
				}
			}
			if(i>0){
				fuvDao.updateProMb(fuv);
				List<FaInte> lf = new ArrayList<>();
				FaInte f1 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "注册产品", rps.getProInte(), 0, "注册产品",fu.getFa_jifen()+rps.getProInte());
				FaInte f2 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "注册产品", rps.getProFb(), 1, "注册产品",fu.getFa_feibiao()+rps.getProFb());
				lf.add(f1);
				lf.add(f2);
				fu.setFa_jifen(fu.getFa_jifen()+rps.getProInte());
				fu.setFa_feibiao(fu.getFa_feibiao()+rps.getProFb());
				fuDao.updateByInteAndFeiBiao(fu);
				inteDao.saveFaInte(lf);
				//查询登记表
				FaRank frk = rankDao.get(fu.getFa_rank());
				if(fu.getFa_jifen()>frk.getFa_end()){
					//查询该积分的会员等级
					List<Integer> list= rankDao.getRankIdByInte(fu.getFa_jifen());
					if(list!=null && !list.isEmpty()){
						fu.setFa_rank(list.get(list.size()-1));
						fuDao.updateMemberRank(fu.getFa_id(),fu.getFa_rank());
					}
				}
				request.getSession().setAttribute(Constant.SESSION_USER, fu);
			}
		} catch (Exception e) {
			throw new RuntimeException("注册产品加积分方法出现错误",e);
		}
	}
	//获取全部版块权限信息
	@Override
	public List<Map<String, Object>> getModelResource(FaUser fu) {
		try {
			List<Map<String, Object>> list = new ArrayList<>();
			//根据用户id 获取该用户全部用户组id
			List<Integer> lg = groupsDao.getGroupIdByUserId(fu.getFa_id());
			//查询所有版块信息
			List<FaSection> listm = fsDao.getAllSection();
			for (FaSection fs : listm) {
				Map<String, Object> map = new HashMap<>();
				map.put("name", fs.getFa_name());
				//发帖
				if(fs.getFa_postg()!=null && !fs.getFa_postg().equals("")){
					String [] fg = fs.getFa_postg().split(",");
					if(lg!=null && !lg.isEmpty()){
						int i = 0;
						for (String str : fg) {
							Integer j = Integer.parseInt(str);
							if(lg.contains(j)){
								i=1;
								break;
							}
						}
						if(i>0){
							map.put("fg", 1);
						}else{
							map.put("fg", 0);
							//判断等级
							if(fs.getFa_postr()!=null && !fs.getFa_postr().equals("")){
								String [] fr = fs.getFa_postr().split(",");
								for (String str : fr) {
									Integer j = Integer.parseInt(str);
									if(fu.getFa_rank().equals(j)){
										map.put("fg", 1);
										break;
									}
								}
							}
							
						}
					}else{
						map.put("fg", 0);
						//判断等级
						if(fs.getFa_postr()!=null && !fs.getFa_postr().equals("")){
							String [] fr = fs.getFa_postr().split(",");
							for (String str : fr) {
								Integer j = Integer.parseInt(str);
								if(fu.getFa_rank().equals(j)){
									map.put("fg", 1);
									break;
								}
							}
						}
					}
				}else{
					map.put("fg", 0);
				}
				
				
				
				//回帖
				if(fs.getFa_repliesg()!=null &&!fs.getFa_repliesg().equals("")){
					String [] fr = fs.getFa_repliesg().split(",");
					if(lg!=null && !lg.isEmpty()){
						int i = 0;
						for (String str : fr) {
							Integer j = Integer.parseInt(str);
							if(lg.contains(j)){
								i=1;
								break;
							}
						}
						if(i>0){
							map.put("fr", 1);
						}else{
							map.put("fr", 0);
							//判断等级
							if(fs.getFa_repliesr()!=null && !fs.getFa_repliesr().equals("")){
								String [] rr = fs.getFa_repliesr().split(",");
								for (String str : rr) {
									Integer j = Integer.parseInt(str);
									if(fu.getFa_rank().equals(j)){
										map.put("fr", 1);
										break;
									}
								}
							}
							
						}
					}else{
						map.put("fr", 0);
						//判断等级
						if(fs.getFa_repliesr()!=null && !fs.getFa_repliesr().equals("")){
							String [] rr = fs.getFa_repliesr().split(",");
							for (String str : rr) {
								Integer j = Integer.parseInt(str);
								if(fu.getFa_rank().equals(j)){
									map.put("fr", 1);
									break;
								}
							}
						}
					}
				}else{
					map.put("fr", 0);
				}
				
				
				
				//点赞
				if(fs.getFa_zang()!=null && !fs.getFa_zang().equals("")){
					String [] fzg = fs.getFa_zang().split(",");
					if(lg!=null && !lg.isEmpty()){
						int i = 0;
						for (String str : fzg) {
							Integer j = Integer.parseInt(str);
							if(lg.contains(j)){
								i=1;
								break;
							}
						}
						if(i>0){
							map.put("fz", 1);
						}else{
							map.put("fz", 0);
							//判断等级
							if(fs.getFa_zanr()!=null && !fs.getFa_zanr().equals("")){
								String [] fzr = fs.getFa_zanr().split(",");
								for (String str : fzr) {
									Integer j = Integer.parseInt(str);
									if(fu.getFa_rank().equals(j)){
										map.put("fz", 1);
										break;
									}
								}
							}
							
						}
					}else{
						map.put("fz", 0);
						//判断等级
						if(fs.getFa_zanr()!=null && !fs.getFa_zanr().equals("")){
							String [] fzr = fs.getFa_zanr().split(",");
							for (String str : fzr) {
								Integer j = Integer.parseInt(str);
								if(fu.getFa_rank().equals(j)){
									map.put("fz", 1);
									break;
								}
							}
						}
					}
				}else{
					map.put("fz", 0);
				}
				
				
				
				
				
				//投票
				if(fs.getFa_voteg()!=null && !fs.getFa_voteg().equals("")){
					String [] fvg = fs.getFa_voteg().split(",");
					if(lg!=null && !lg.isEmpty()){
						int i = 0;
						for (String str : fvg) {
							Integer j = Integer.parseInt(str);
							if(lg.contains(j)){
								i=1;
								break;
							}
						}
						if(i>0){
							map.put("fv", 1);
						}else{
							map.put("fv", 0);
							//判断等级
							if(fs.getFa_voter()!=null && !fs.getFa_voter().equals("")){
								String [] fvr = fs.getFa_voter().split(",");
								for (String str : fvr) {
									Integer j = Integer.parseInt(str);
									if(fu.getFa_rank().equals(j)){
										map.put("fv", 1);
										break;
									}
								}
							}
							
						}
					}else{
						map.put("fv", 0);
						if(fs.getFa_voter()!=null && !fs.getFa_voter().equals("")){
							String [] fvr = fs.getFa_voter().split(",");
							for (String str : fvr) {
								Integer j = Integer.parseInt(str);
								if(fu.getFa_rank().equals(j)){
									map.put("fv", 1);
									break;
								}
							}
						}
					}
				}else{
					map.put("fv", 0);
				}
				
				//浏览
				if(fs.getFa_readg()!=null&&!fs.getFa_readg().equals("")){
					String [] frg = fs.getFa_readg().split(",");
					if(lg!=null && !lg.isEmpty()){
						int i = 0;
						for (String str : frg) {
							Integer j = Integer.parseInt(str);
							if(lg.contains(j)){
								i=1;
								break;
							}
						}
						if(i>0){
							map.put("fea", 1);
						}else{
							map.put("fea", 0);
							//判断等级
							if(fs.getFa_readr()!=null && !fs.getFa_readr().equals("")){
								String [] frr = fs.getFa_readr().split(",");
								for (String str : frr) {
									Integer j = Integer.parseInt(str);
									if(fu.getFa_rank().equals(j)){
										map.put("fea", 1);
										break;
									}
								}
							}
							
						}
					}else{
						map.put("fea", 0);
						//判断等级
						if(fs.getFa_readr()!=null && !fs.getFa_readr().equals("")){
							String [] frr = fs.getFa_readr().split(",");
							for (String str : frr) {
								Integer j = Integer.parseInt(str);
								if(fu.getFa_rank().equals(j)){
									map.put("fea", 1);
									break;
								}
							}
						}
					}
				}else{
					map.put("fea", 0);
				}
				
				list.add(map);
			}
			System.err.println(list);
			return list;
		} catch (Exception e) {
			throw new  RuntimeException("获取全部版块权限信息方法出现异常",e); 
		}
	}
	//根据id查询屏蔽的好友分组
	@Override
	public List<Map<String, Object>> getIgnoreForGroup(String fa_id) {
		try {
			return fftDao.getIgnoreForGroup(fa_id);
		} catch (Exception e) {
			throw new  RuntimeException("根据id查询屏蔽的好友分组方法出现异常",e); 
		}
	}
	//根据id查询屏蔽的好友
	@Override
	public List<Map<String, Object>> getIgnoreForFriends(String fa_id) {
		try {
			return ignoreDao.getIgnoreForFriends(fa_id);
		} catch (Exception e) {
			throw new  RuntimeException("根据id查询查询屏蔽的好友方法出现异常",e); 
		}
	}
	//查询屏蔽的提醒
	@Override
	public List<Map<String, Object>> getIgnoreForMsg(String [] ids) {
		try {
			return ignoreDao.getIgnoreForMsg(ids);
		} catch (Exception e) {
			throw new  RuntimeException("查询屏蔽的提醒方法出现异常",e); 
		}
	}
	//屏蔽用户组
	@Override
	public String ignoreGroups(String id, String[] ids) {
		try {
			//把该用户的用户组先不屏蔽
			fftDao.showGroupForUserId(id);
			//屏蔽指定用户组
			if(ids!=null && ids.length>0){
				fftDao.CloseGroupForId(ids);
			}
			
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("屏蔽用户组方法出现异常",e); 
		}
	}
	//取消屏蔽指定用户
	@Override
	public String ignoreFriends(String[] ids) {
		try {
			
			//取消屏蔽指定用户
			if(ids!=null && ids.length>0){
				ignoreDao.deleteById(ids);
			}
			
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("取消屏蔽指定用户方法出现异常",e); 
		}
	}
	//屏蔽用户提醒
	@Override
	public String ignoreMsgs(HttpServletRequest request,String ids, String id) {
		try {
				Integer version = fuDao.getVersionById(id);
				fuDao.UpdateUserIgnore(id,ids,version);
				FaUser fu = fuDao.getMemberById(id);
				request.getSession().setAttribute(Constant.SESSION_USER, fu);
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("屏蔽用户提醒方法出现异常",e); 
		}
	}
	//上传用户头像
	@Override
	public String updateMyImage(HttpServletRequest request, String fa_id, String imageUrl) {
		try {
			FaUser fu = fuDao.getMemberById(fa_id);
			fu.setFa_title_img(imageUrl);
			fuDao.setImageById(fa_id,imageUrl);
			titleAddInteAndFeibiao(request,fu);
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("上传用户头像方法出现异常",e); 
		}
	}
	//密码修改密码
	@Override
	public String updatePswByPsw(HttpServletRequest request,HttpServletResponse response, String fa_id, String newpsw, String oripsw) {
		try {
			if(newpsw.length()<6 ||newpsw.length()>18){
				return "密码长度为6到18位";
			}
			FaUser fu = fuDao.getMemberById(fa_id);
			
			if(!MD5.getMD5(oripsw).equals(fu.getFa_password())){
				return "原密码不正确，请重新输入";
			}
			
			fu.setFa_password(MD5.getMD5(newpsw));
			fuDao.setPswByPsw(fa_id,MD5.getMD5(newpsw),fu.getVersion());
			if(CookieTools.getCookie(Constant.COOKIE_NAME, request)!=null && !CookieTools.getCookie(Constant.COOKIE_NAME, request).equals("")){
				String id = fu.getFa_id()+"-"+fu.getFa_password();
				id=CookieUtils.encodeBase64(id);
				CookieTools.addCookie(Constant.COOKIE_NAME, id, 604800, response, request);
				
			}
			request.getSession().setAttribute(Constant.SESSION_USER, fu);
			
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("密码修改密码方法出现异常",e); 
		}
	}
	//邮箱修改密码
	@Override
	public String updatePsw(HttpServletRequest request, HttpServletResponse response, String fa_id,
			String newpsw,String string) {
		try {
			if(newpsw.length()<6 ||newpsw.length()>18){
				return "密码长度为6到18位";
			}
			FaUser fu = fuDao.getMemberById(fa_id);
			
			
			
			fu.setFa_password(MD5.getMD5(newpsw));
			fuDao.setPswByPsw(fa_id,MD5.getMD5(newpsw),fu.getVersion());
			if(CookieTools.getCookie(Constant.COOKIE_NAME, request)!=null && !CookieTools.getCookie(Constant.COOKIE_NAME, request).equals("")){
				String id = fu.getFa_id()+"-"+fu.getFa_password();
				id=CookieUtils.encodeBase64(id);
				CookieTools.addCookie(Constant.COOKIE_NAME, id, 604800, response, request);
				
			}
			request.getSession().setAttribute(Constant.SESSION_USER, fu);
			request.getSession().removeAttribute(string);
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("邮箱修改密码方法出现异常",e); 
		}
	}
	//更新邮箱
	@Override
	public String updateEmailByEmail(HttpServletRequest request, String fa_id, String email, String codeName) {
		try {
			
			FaUser fu = fuDao.getMemberById(fa_id);
			
			
			
			fu.setFa_email(email);
			fuDao.setEmail(fa_id,email,fu.getVersion());
			
			request.getSession().setAttribute(Constant.SESSION_USER, fu);
			request.getSession().removeAttribute(codeName);
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("//更新邮箱方法出现异常",e); 
		}
	}
	//更新手机
	@Override
	public String updateTelByEmail(HttpServletRequest request, String fa_id, String tel, String codeName) {
		try {
			
			FaUser fu = fuDao.getMemberById(fa_id);
			
			
			
			fu.setFa_telphone(tel);
			fuDao.setTel(fa_id,tel,fu.getVersion());
			
			request.getSession().setAttribute(Constant.SESSION_USER, fu);
			request.getSession().removeAttribute(codeName);
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("//更新手机方法出现异常",e); 
		}
	}
	//新增或修改联系人
	@Override
	public String saveOrUpdateAdress(FaReceiver fr) {
		try {
			if(fr.getFa_userid()==null||fr.getFa_userid().equals("")){
				return "error";
			}
			//判断是新增还是修改
			//修改
			if(fr.getFa_id()!=null && !fr.getFa_id().equals("")){
				receDao.update(fr);
			//新增	
			}else{
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String id = sdf.format(new Date())+RandomTools.getRandomString(6);
				fr.setFa_id(id);
				receDao.save(fr);
			}
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("新增或修改联系人方法出现异常",e); 
		}
	}
	//查询我的所有联系人
	@Override
	public List<FaReceiver> getAllReceiverById(String fa_id) {
		try {
			
			return receDao.selectReByUserId(fa_id);
		} catch (Exception e) {
			throw new  RuntimeException("查询我的所有联系人方法出现异常",e); 
		}
	}
	//查询我的所有产品
	@Override
	public List<Map<String, Object>> getAllProductById(String fa_id) {
		try {
			
			return proDao.getAllProductById(fa_id);
		} catch (Exception e) {
			throw new  RuntimeException("查询我的所有产品方法出现异常",e); 
		}
	}
	//删除联系人
	@Override
	public String deleteAdress(String id, String fa_id) {
		try {
			
			
			receDao.delete(id,fa_id);
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("删除联系人方法出现异常",e); 
		}
	}
	//注册产品
	@Override
	public String registerProduct(String fa_id, String proId, HttpServletRequest request) {
		try {
			//查询注册码是否已被使用
			ErpPds  eps =proDao.getErp(proId);
			if(eps==null || eps.getID()==null){
				return "该注册码不存在";
			}
			if(eps.getUserid()!=null){
				return "该注册码已被使用";
			}
			proDao.registerProduct(fa_id,proId);
			FaUser fu = fuDao.getMemberById(fa_id);
			proAddInteAndFeibiao(request,fu);
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("注册产品方法出现异常",e); 
		}
	}
	//加载抽奖信息数据
	@Override
	public List<Map<String, Object>> showMyLotteryData(String fa_id, Integer curpage, Integer pagesize) {
		try {
			
			return fldDao.showMyLotteryData(fa_id,curpage,pagesize);
		} catch (Exception e) {
			throw new  RuntimeException("加载抽奖信息数据方法出现异常",e); 
		}
	}
	//加载抽奖信息数量
	@Override
	public Long showMyLotteryCount(String fa_id) {
		try {
			
			return fldDao.showMyLotteryCount(fa_id);
		} catch (Exception e) {
			throw new  RuntimeException("加载抽奖信息数量方法出现异常",e); 
		}
	}
	//更新抽奖中的联系人信息
	@Override
	public String updateLotteryAdress(String fa_id, String id, String adid) {
		try {
			//根据id查询联系人
			FaReceiver fr =receDao.get(adid);
			if(!fr.getFa_userid().equals(fa_id)){
				return "联系人信息错误";
			}
			fldDao.updateAdressById(fa_id,id,fr.getFa_name()+" 手机:"+fr.getFa_tel()+" 地址："+fr.getFa_pr()+fr.getFa_ci()+fr.getFa_ar()+fr.getFa_detail());
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("更新抽奖中的联系人信息方法出现异常",e); 
		}
	}
	//加载兑换奖品信息
	@Override
	public List<Map<String, Object>> showMyShopData(String fa_id, Integer curpage, Integer pagesize) {
		try {
			
			return fsmDao.showMyShopData(fa_id,curpage,pagesize);
		} catch (Exception e) {
			throw new  RuntimeException("//加载兑换奖品信息方法出现异常",e); 
		}
	}
	//加载兑换奖品数量
	@Override
	public Long showMyShopCount(String fa_id) {
		try {
			
			return fsmDao.showMyShopCount(fa_id);
		} catch (Exception e) {
			throw new  RuntimeException("//加载兑换奖品数量方法出现异常",e); 
		}
	}
	//分页查询我的收听信息
	@Override
	public List<Map<String, Object>> selectMyFollowByPage(String fa_id, Integer curpage, Integer pagesize) {
		try {
			
			List<Map<String, Object>> list = flDao.selectMyFollowByPage(fa_id,curpage,pagesize);
			for (Map<String, Object> map : list) {
				//根据id查询关注与粉丝数
				Long c1 = flDao.getCountById(map.get("id").toString());
				map.put("shouting", c1);
				Long c2 = flDao.getCountByIdFans(map.get("id").toString());
				map.put("tingzhong", c2);
				//查询我最新的心情
				FaSelfMood newMood= moodDao.getNewMood(map.get("id").toString());
				if(newMood!=null && newMood.getFa_desc()!=null){
					map.put("mood", newMood.getFa_desc());
				}else{
					map.put("mood", "");
				}
			}
			return list;
		} catch (Exception e) {
			throw new  RuntimeException("分页查询我的听众信息方法出现异常",e); 
		}
	}
	//分页查询我的听众信息
	@Override
	public List<Map<String, Object>> selectMyFansByPage(String fa_id, Integer curpage, Integer pagesize) {
		try {
			
			List<Map<String, Object>> list = flDao.selectMyFansByPage(fa_id,curpage,pagesize);
			for (Map<String, Object> map : list) {
				//根据id查询关注与粉丝数
				Long c1 = flDao.getCountById(map.get("id").toString());
				map.put("shouting", c1);
				Long c2 = flDao.getCountByIdFans(map.get("id").toString());
				map.put("tingzhong", c2);
				//查询我最新的心情
				FaSelfMood newMood= moodDao.getNewMood(map.get("id").toString());
				if(newMood!=null && newMood.getFa_desc()!=null){
					map.put("mood", newMood.getFa_desc());
				}else{
					map.put("mood", "");
				}
				//查询是否属互相关注
				Long count = flDao.IsFriend(fa_id,map.get("id").toString());
				if(count>0){
					map.put("isEach", 1);
				}else{
					map.put("isEach", 0);
				}
			}
			return list;
		} catch (Exception e) {
			throw new  RuntimeException("分页查询我的听众信息方法出现异常",e); 
		}
	}
	//分页查询我的收听数量
	@Override
	public Long selectMyFollowCount(String fa_id) {
		try {
			
			return flDao.getCountById(fa_id);
		} catch (Exception e) {
			throw new  RuntimeException("分页查询我的收听数量方法出现异常",e); 
		}
	}
	//分页查询我的听众数量
	@Override
	public Long selectMyFansCount(String fa_id) {
		try {
			
			return flDao.getCountByIdFans(fa_id);
		} catch (Exception e) {
			throw new  RuntimeException("分页查询我的听众数量方法出现异常",e); 
		}
	}
	//取关
	@Override
	public String deleteMyFollow(String fa_id, String id) {
		try {
			
			flDao.deleteMyFollow(id,fa_id);
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("取关方法出现异常",e); 
		}
	}
	//修改备注名
	@Override
	public String updateMyFollow(String fa_id, String idz, String namez) {
		try {
			
			flDao.updateMyFollow(idz,fa_id,namez);
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("//修改备注名方法出现异常",e); 
		}
	}
	//关注
	@Override
	public String addMyFollow(String fa_id, String id) {
		try {
			if(fa_id.equals(id)){
				return "您不能收听自己";
			}
			//查询是否属互相关注
			Long count = flDao.IsFriend(fa_id,id);
			if(count>0){
				return "您已经收听他啦";
			}else{
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String idz = sdf.format(new Date())+RandomStringUtils.randomNumeric(4)+RandomTools.getRandomString(2);
				FaListener fl = new FaListener();
				fl.setFa_id(idz);
				fl.setFa_userid(fa_id);
				fl.setFa_listener(id);
				fl.setFa_time(new Date());
				flDao.saveListener(fl);
				
				//查询好友忽略的人
				String ignoreIds = fuDao.getIgonreIdSById(id);
				boolean tof = true;
				if(ignoreIds!=null && ignoreIds.length()>0){
					String[] inid = ignoreIds.split(",");
					for (String str : inid) {
						if(fa_id.equals(str)){
							tof = false;
							break;
						}
					}
				}
				if(tof){
					FaSentMessage fsm = new FaSentMessage();
					String code = sdf.format(new Date())+RandomTools.getRandomString(6);
					fsm.setFa_id(code);
					fsm.setFa_userid(id);
					fsm.setFa_friendid(fa_id);
					fsm.setFa_msg_type(3);
					fsm.setFa_time(new Date());
					sendmsgDao.saveFriendMsg(fsm);
				}
				return "success";
			}
			
		} catch (Exception e) {
			throw new  RuntimeException("关注方法出现异常",e); 
		}
	}
	//查询我的所有分组信息
	@Override
	public List<FaFriendType> getAllGroupById(String fa_id) {
		try {
			
			return fftDao.getAllGroupById(fa_id);
		} catch (Exception e) {
			throw new  RuntimeException("/查询我的所有分组信息方法出现异常",e); 
		}
	}
	//分页查询我的好友信息数据
	@Override
	public List<Map<String, Object>> selectMyFriendByPage(String fa_id, Integer curpage, Integer pagesize,
			String searchname, String searchtype) {
		try {
			
			List<Map<String, Object>> list = fmfDao.selectMyFriendByPage(fa_id,curpage,pagesize,searchname,searchtype);
			for (Map<String, Object> map : list) {
				//查询我最新的心情
				FaSelfMood newMood= moodDao.getNewMood(map.get("id").toString());
				if(newMood!=null && newMood.getFa_desc()!=null){
					map.put("mood", newMood.getFa_desc());
				}else{
					map.put("mood", "");
				}
				
			}
			return list;
		} catch (Exception e) {
			throw new  RuntimeException("分页查询我的好友信息数据方法出现异常",e); 
		}
	}
	//分页查询我的好友信息数量
	@Override
	public Long selectMyFriendCount(String fa_id, String searchname, String searchtype) {
		try {
			
			return fmfDao.getCountByIdFriend(fa_id,searchname,searchtype);
		} catch (Exception e) {
			throw new  RuntimeException("分页查询我的好友信息数量方法出现异常",e); 
		}
	}
	//取消好友
	@Override
	public String deleteMyFriend(String fa_id, String id) {
		try {
			fmfDao.deleteMyFriend(id,fa_id);
			fmfDao.deleteMyFriend(fa_id,id);
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("分页查询我的好友信息数量方法出现异常",e); 
		}
	}
	//修改好友
	@Override
	public String updateMyFriend(String fa_id, String idz, String namez) {
		try {
			
			fmfDao.updateMyFriend(idz,fa_id,namez);
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("//修改备注名方法出现异常",e); 
		}
	}
	//修改好友分组
	@Override
	public String updateMyFriendType(String fa_id, String idz, String groups) {
		try {
			
			fmfDao.updateMyType(idz,fa_id,groups);
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("//修改好友分组方法出现异常",e); 
		}
	}
	//好友移动分组分组
	@Override
	public String changeMyGroups(String fa_id, String tid, String[] ids) {
		try {
			Long count = fftDao.getCountByUserIdAndId(fa_id,tid);
			if(count>0){
				fmfDao.changeMyGroups(fa_id,tid,ids);
				return "success";
			}else{
				fmfDao.changeMyGroups(fa_id,tid,ids);
				return "您没有该分组，请重新选择";
			}
			
		} catch (Exception e) {
			throw new  RuntimeException("好友移动分组分组方法出现异常",e); 
		}
	}
	//分页查询我搜索会员信息
	@Override
	public List<Map<String, Object>> selectMyFriendByPage(String fa_id, Integer curpage, Integer pagesize,
			String username, Integer syncbbs, String tel, String email, Integer sex, Integer lifeplace) {
		try {
			List<Map<String, Object>> list = new ArrayList<>();
			List<Map<String, Object>> Listmb = fuDao.getMemberBySearchAndPage(curpage,pagesize,username,syncbbs,tel,email,sex,lifeplace);
			for (Map<String, Object> map : Listmb) {
				if(!map.get("id").toString().equals(fa_id)){
					list.add(map);
				}
			}
			for (Map<String, Object> map : list) {
				//查询是否是好友
				Long count1 = fmfDao.getCountByMyIdAndFrId(fa_id,map.get("id").toString());
				if(count1>0){
					map.put("getFriend", 1);
				}else{
					map.put("getFriend", 0);
				}
				//查询是否关注他
				Long count2 =flDao.IsFriend(fa_id, map.get("id").toString());
				if(count2>0){
					map.put("isListen", 1);
				}else{
					map.put("isListen", 0);
				}
			}
			
			return list;
			
		} catch (Exception e) {
			throw new  RuntimeException("分页查询我搜索会员信息方法出现异常",e); 
		}
	}
	//分页查询我搜索会员信息数量
	@Override
	public Long selectMyFriendCount(String fa_id, String username, Integer syncbbs, String tel, String email,
			Integer sex, Integer lifeplace) {
		try {
			
			return fuDao.selectMyFriendCount(username,syncbbs,tel, email,
					sex, lifeplace);
			
		} catch (Exception e) {
			throw new  RuntimeException("分页查询我搜索会员信息数量方法出现异常",e); 
		}
	}
	//加好友(发送消息)
	@Override
	public String addMyFriend(String fa_id, String id) {
		try {
			if(fa_id.equals(id)){
				return "不能加自己为好友";
			}
			//查询是否是好友
			Long count1 = fmfDao.getCountByMyIdAndFrId(fa_id,id);
			if(count1>0){
				return "你们已经是好友啦";
			}
			//查询好友忽略的人
			String ignoreIds = fuDao.getIgonreIdSById(id);
			boolean tof = true;
			if(ignoreIds!=null && ignoreIds.length()>0){
				String[] inid = ignoreIds.split(",");
				for (String str : inid) {
					if(fa_id.equals(str)){
						tof = false;
						break;
					}
				}
			}
			if(tof){
				FaSentMessage fsm = sendmsgDao.getFsmByUserIdAndFid(id,fa_id,1);
				if(fsm!=null && fsm.getFa_id()!=null){
					fsm.setFa_friend_istrue(0);
					fsm.setFa_time(new Date());
					sendmsgDao.updateFriendMsg(fsm);
				}else{
					fsm = new FaSentMessage();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String code = sdf.format(new Date())+RandomTools.getRandomString(6);
					System.err.println(code);
					fsm.setFa_id(code);
					fsm.setFa_userid(id);
					fsm.setFa_friendid(fa_id);
					fsm.setFa_msg_type(1);
					fsm.setFa_time(new Date());
					fsm.setFa_title("好友申请");
					fsm.setFa_msg("请求加你为好友");
					sendmsgDao.saveFriendMsg(fsm);
				}
				
			}
			
			return "success";
			
		} catch (Exception e) {
			throw new  RuntimeException("加好友(发送消息)方法出现异常",e); 
		}
	}
	//查询有没有未读信息
	@Override
	public Integer hasMyMsg(String fa_id) {
		
		try {
			//查询未读的会话信息的数量
			Long count1 = sessionDao.getSendIdOnRed(fa_id);
			//查询未读的提醒信息的数量
			Long count2 = sendmsgDao.getTixingOnRed(fa_id);
			if(count1+count2>0){
				return 1;
			}else{
				return 0;
			}
			
		} catch (Exception e) {
			throw new  RuntimeException("查询有没有未读信息方法出现异常",e); 
		}
	}
	//查询我忽略的人的主键id与名称
	@Override
	public List<Map<String, Object>> findMyIgnoreMember(String fa_id) {
		try {
			List<Map<String, Object>> list = ignoreDao.getIgnoreForFriends(fa_id);
			for (Map<String, Object> map : list) {
				if(map.get("name")==null){
					map.put("name", "该会员还未设置昵称");
				}
			}
			return list;
		} catch (Exception e) {
			throw new  RuntimeException("查询我忽略的人的id与名称方法出现异常",e); 
		}
	}
	//查询我忽略的人的id与名称
	@Override
	public List<Map<String, Object>> findMyIgnoreMembers(String fa_id) {
		try {
			List<Map<String, Object>> list = ignoreDao.getIgnoreForFriendss(fa_id);
			if(!list.isEmpty()){
				for (Map<String, Object> map : list) {
					if(map.get("name")==null){
						map.put("name", "该会员还未设置昵称");
					}
				}
			}
			
			return list;
		} catch (Exception e) {
			throw new  RuntimeException("查询我忽略的人的id与名称方法出现异常",e); 
		}
	}
	//模糊查询我的好友信息
	@Override
	public List<Map<String, Object>> searchMemberByVague(String fa_id, String username) {
		try {
			return fuDao.searchMemberByVague(fa_id,username);
		} catch (Exception e) {
			throw new  RuntimeException("模糊查询我的好友信息方法出现异常",e); 
		}
	}
	//保存屏蔽的好友信息
	@Override
	public String saveIgnoreFriend(String fa_id, String[] users,Integer isFriendMsg) {
		try {
			//查询我原来屏蔽的好友的id
			List<String> lstr = ignoreDao.getIgnoreIdForMyId(fa_id);
			//需要删除屏蔽表的好友id 
			Set<String> delset = new HashSet<>();
			//需要加进去屏蔽表的好友id
			Set<String> addset = new HashSet<>();
			if(users!=null){
				for (String str : lstr) {
					int i =0;
					for (String strr : users) {
						if(str.equals(strr)){
							i=1;
							break;
						}
					}
					if(i<1){
						delset.add(str);
					}
					
					
				}
			}else{
				for (String str : lstr) {
					delset.add(str);
					
				}
			}
			if(lstr!=null && !lstr.isEmpty()){
				if(users!=null){
					for (String str : users) {
						int i =0;
						for (String strr : lstr) {
							if(str.equals(strr)){
								i=1;
								break;
							}
							
						}
						if(i<1){
							addset.add(str);
						}
						
					}
				}
			}else{
				if(users!=null){
					for (String str : users) {
						addset.add(str);
						
					}
				}
			}
			
			if(delset!=null && !delset.isEmpty()){
				List<String> dellist = new ArrayList<>();
				for (String str : delset) {
					dellist.add(str);
				}
				//根据id 删除屏蔽的好友
				ignoreDao.deleteByMyId(fa_id,dellist);
				//根据id 恢复屏蔽好友的会话
				sessionDao.resetMySession(fa_id,dellist,0);
			}
			if(addset!=null && !addset.isEmpty()){
				List<FaIgnore> list = new ArrayList<>();
				List<String> addlist = new ArrayList<>();
				//保存新的屏蔽好友的id信息
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				Date date = new Date();
				for (String fid : addset) {
					addlist.add(fid);
					FaIgnore fi = new FaIgnore();
					String id = sdf.format(date)+RandomTools.getRandomString(6);
					fi.setFa_id(id);
					fi.setFa_userid(fa_id);
					fi.setFa_ignore(fid);
					list.add(fi);
				}
				ignoreDao.saveMyIgnoreFriends(list);
				//根据id 屏蔽好友的会话
				sessionDao.resetMySession(fa_id,addlist,1);
			}
			
			//改变状态
			fuDao.changeFriendMsgType(fa_id,isFriendMsg);
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("保存屏蔽的好友信息方法出现异常",e); 
		}
	}
	//分页查询个人消息页面
	@Override
	public List<Map<String, Object>> selectMySendOrGetMsgByPage(String fa_id, Integer curpage, Integer pagesize) {
		try {
			//查询跟我对话
			List<Map<String, Object>> list = sessionDao.findMySessionRoom(fa_id,curpage,pagesize);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			for (Map<String, Object> map : list) {
				//查询该会话的总数
				Long count = sessionDao.findCountById(map.get("id").toString());
				map.put("count", count);
				//查询未读信息总数
				Long counts = sessionDao.findCountByIdAndNoRead(map.get("id").toString());
				map.put("newMsg", counts);
				//根据会话室查询最新的一条信息
				FaSession fs  = sessionDao.getNewMsgById(map.get("id").toString());
				if(fs!=null && fs.getFa_id()!=null){
					
					SimpleDateFormat sdfz = new SimpleDateFormat("yyyy-MM-dd");
					Calendar   cal   =   Calendar.getInstance();
					cal.add(Calendar.DATE,   -1);
					String yesterday = sdfz.format(cal.getTime());
					long yestdaytime = sdfz.parse(yesterday).getTime();
					
					long nowtime = fs.getFa_time().getTime();
					if(nowtime>=yestdaytime){
						map.put("day", TimeUtil.formatTime(fs.getFa_time()));
					}else{
						map.put("day", sdf.format(fs.getFa_time()));
					}
					if(fs.getFa_msg()==null){
						fs.setFa_msg("");
					}
					map.put("msg", fs.getFa_msg());
					map.put("data", fs.getFa_time().getTime());
				}else{
					map.put("day", "");
					map.put("msg", "");
					map.put("data", 0);
				}
				
				
			}
			Collections.sort(list, new Comparator<Map<String,Object>>() {

				@Override
				public int compare(Map<String,Object> map1, Map<String,Object> map2) {
					if(Long.parseLong(map1.get("data").toString())<Long.parseLong(map2.get("data").toString())){
						return 1;
					}
					return -1;
				}

			});
			return list;
		} catch (Exception e) {
			throw new  RuntimeException("分页查询个人消息页面方法出现异常",e); 
		}
	}
	//分页查询会话信息总数
	@Override
	public Long selectMySendOrGetMsgCount(String fa_id) {
		try {
			return sessionDao.selectMySendOrGetMsgCount(fa_id);
		} catch (Exception e) {
			throw new  RuntimeException("分页查询会话信息总数方法出现异常",e); 
		}
	}
	//忽略某个好友
	@Override
	public String ignoreByFriendId(String fa_id, String id) {
		try {
			Long count = ignoreDao.getCountByMyIdAndFriId(fa_id,id);
			if(count>0){
				return "该好友已经屏蔽了";
			}else{
				List<FaIgnore> list = new ArrayList<>();
				List<String> addlist = new ArrayList<>();
				//保存新的屏蔽好友的id信息
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				Date date = new Date();
				
				addlist.add(id);
				FaIgnore fi = new FaIgnore();
				String idz = sdf.format(date)+RandomTools.getRandomString(6);
				fi.setFa_id(idz);
				fi.setFa_userid(fa_id);
				fi.setFa_ignore(id);
				list.add(fi);
				
				ignoreDao.saveMyIgnoreFriends(list);
				//根据id 屏蔽好友的会话
				sessionDao.resetMySession(fa_id,addlist,1);
				
				return "success";
			}
			
		} catch (Exception e) {
			throw new  RuntimeException("忽略某个好友方法出现异常",e); 
		}
	}
	//批量删除对话
	@Override
	public String deleteSessionRoom(String fa_id, String[] ids) {
		try {
			if(ids==null||ids.length<1){
				return "请选择至少一条消息";
			}
			//删除对话和对话里的信息

			sessionDao.deleteSessionAndContene(fa_id,ids);
			sessionDao.deleteSessionAndRoom(fa_id,ids);
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("批量删除对话方法出现异常",e); 
		}
	}
	//批量删除系统消息
	@Override
	public String deleteSystemMsg(String fa_id, String[] ids) {
		try {
			if(ids==null||ids.length<1){
				return "请选择至少一条消息";
			}
			
			sendmsgDao.deleteMsgByIds(fa_id,ids);
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("批量删除对话方法出现异常",e); 
		}
	}
	//批量对话已读
	@Override
	public String msgHasRead(String fa_id, String[] ids) {
		try {
			if(ids==null||ids.length<1){
				return "请选择至少一条消息";
			}
			
			sessionDao.msgHasRead(fa_id,ids);
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("批量对话已读方法出现异常",e); 
		}
	}
	//批量已读系统信息
	@Override
	public String systemMsgHasRead(String fa_id, String[] ids) {
		try {
			if(ids==null||ids.length<1){
				return "请选择至少一条消息";
			}
			
			sendmsgDao.systemMsgHasRead(fa_id,ids);
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("批量对话已读方法出现异常",e); 
		}
	}
	//批量发送个人信息给好友
	@Override
	public String sendMyMsgToMyFriends(String fa_id, String[] users, String descs) {
		try {
			if(users==null||users.length<1){
				return "请选择至少一名好友";
			}
			if(descs==null || descs.equals("")){
				return "请填写需要发送的内容";
			}
			//要保存的会话室信息
			List<Map<String, Object>> listroom = new ArrayList<>();
			//要保存的会话信息
			List<FaSession> listsession = new ArrayList<>();
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String idcode = sdf.format(date);
			for (String fid : users) {
				//判断双方是否互为好友
				Long c1 = fmfDao.getCountByMyIdAndFrId(fa_id, fid);
				FaUser fmsg = fuDao.getMemberById(fid);
				//是好友 或者对方可以发送所有人
				if(c1>0 || fmsg.getFa_isfriendmsg().equals(0)){
					//查询我跟她的会话室
					List<Map<String, Object>> lists = sessionDao.getMyAndFriendRoom(fa_id,fid);
					//两个对话室都存在
					if(lists.size()>=2){
						FaSession fssend = new FaSession();
						FaSession fsget = new FaSession();
						//发送者
						fssend.setFa_id(idcode+RandomTools.getRandomString(6));
						fssend.setFa_isread(1);
						fssend.setFa_msg(descs);
						fssend.setFa_sendorget(0);
						fssend.setFa_time(date);
						//接收者
						fsget.setFa_id(idcode+RandomTools.getRandomString(6));
						fsget.setFa_isread(0);
						fsget.setFa_msg(descs);
						fsget.setFa_sendorget(1);
						fsget.setFa_time(date);
						for (Map<String, Object> map : lists) {
							if(map.get("userid").toString().equals(fa_id)){
								fssend.setFa_pid(map.get("id").toString());
							}
							if(map.get("userid").toString().equals(fid)){
								fsget.setFa_pid(map.get("id").toString());
							}
						}
						listsession.add(fssend);
						listsession.add(fsget);
					//两个对话室都不存在
					}else if(lists.size()<=0){
						//创建我的对话室
						Map<String, Object> roomsend = new HashMap<>();
						String cz1=idcode+RandomTools.getRandomString(6);
						String cz2=idcode+RandomTools.getRandomString(6);
						roomsend.put("id", cz1);
						roomsend.put("fa_userid", fa_id);
						roomsend.put("fa_frendid", fid);
						//查询我有没有屏蔽他；
						Long cr1 = ignoreDao.getCountByMyIdAndFriId(fa_id, fid);
						if(cr1>0){
							roomsend.put("fa_isclose", 1);
						}else{
							roomsend.put("fa_isclose", 0);
						}
						//创建对方的对话室
						Map<String, Object> roomget = new HashMap<>();
						roomget.put("id",cz2 );
						roomget.put("fa_userid", fid);
						roomget.put("fa_frendid", fa_id);
						//查询他有没有屏蔽我；
						Long cr2 = ignoreDao.getCountByMyIdAndFriId(fid,fa_id);
						if(cr2>0){
							roomget.put("fa_isclose", 1);
						}else{
							roomget.put("fa_isclose", 0);
						}
						listroom.add(roomsend);
						listroom.add(roomget);
						
						FaSession fssend = new FaSession();
						FaSession fsget = new FaSession();
						//发送者
						fssend.setFa_id(idcode+RandomTools.getRandomString(6));
						fssend.setFa_isread(1);
						fssend.setFa_msg(descs);
						fssend.setFa_sendorget(0);
						fssend.setFa_time(date);
						fssend.setFa_pid(cz1);
						//接收者
						fsget.setFa_id(idcode+RandomTools.getRandomString(6));
						fsget.setFa_isread(0);
						fsget.setFa_msg(descs);
						fsget.setFa_sendorget(1);
						fsget.setFa_time(date);
						fsget.setFa_pid(cz2);
						
						listsession.add(fssend);
						listsession.add(fsget);
					//只有一个会话室存在
					}else{
						for (Map<String, Object> map : lists) {
							//只有我的会话室
							if(map.get("userid").toString().equals(fa_id)){
								//创建对方的对话室
								String cz2=idcode+RandomTools.getRandomString(6);
								Map<String, Object> roomget = new HashMap<>();
								roomget.put("id",cz2 );
								roomget.put("fa_userid", fid);
								roomget.put("fa_frendid", fa_id);
								//查询他有没有屏蔽我；
								Long cr2 = ignoreDao.getCountByMyIdAndFriId(fid,fa_id);
								if(cr2>0){
									roomget.put("fa_isclose", 1);
								}else{
									roomget.put("fa_isclose", 0);
								}
								listroom.add(roomget);
								
								FaSession fssend = new FaSession();
								FaSession fsget = new FaSession();
								//发送者
								fssend.setFa_id(idcode+RandomTools.getRandomString(6));
								fssend.setFa_isread(1);
								fssend.setFa_msg(descs);
								fssend.setFa_sendorget(0);
								fssend.setFa_time(date);
								fssend.setFa_pid(map.get("id").toString());
								//接收者
								fsget.setFa_id(idcode+RandomTools.getRandomString(6));
								fsget.setFa_isread(0);
								fsget.setFa_msg(descs);
								fsget.setFa_sendorget(1);
								fsget.setFa_time(date);
								fsget.setFa_pid(cz2);
								
								listsession.add(fssend);
								listsession.add(fsget);
							//只有她的会话室
							}else{
								//创建我的对话室
								Map<String, Object> roomsend = new HashMap<>();
								String cz1=idcode+RandomTools.getRandomString(6);
								roomsend.put("id", cz1);
								roomsend.put("fa_userid", fa_id);
								roomsend.put("fa_frendid", fid);
								//查询我有没有屏蔽他；
								Long cr1 = ignoreDao.getCountByMyIdAndFriId(fa_id, fid);
								if(cr1>0){
									roomsend.put("fa_isclose", 1);
								}else{
									roomsend.put("fa_isclose", 0);
								}
								listroom.add(roomsend);
								
								FaSession fssend = new FaSession();
								FaSession fsget = new FaSession();
								//发送者
								fssend.setFa_id(idcode+RandomTools.getRandomString(6));
								fssend.setFa_isread(1);
								fssend.setFa_msg(descs);
								fssend.setFa_sendorget(0);
								fssend.setFa_time(date);
								fssend.setFa_pid(cz1);
								//接收者
								fsget.setFa_id(idcode+RandomTools.getRandomString(6));
								fsget.setFa_isread(0);
								fsget.setFa_msg(descs);
								fsget.setFa_sendorget(1);
								fsget.setFa_time(date);
								fsget.setFa_pid(map.get("id").toString());
								
								listsession.add(fssend);
								listsession.add(fsget);
							}
							
						}
					}
					
					
					
					
				//不是好友
				}else{
					
					//查询我跟她有没有会话室
					Map<String, Object> mapx = sessionDao.getMyAndFriendRoomByMine(fa_id,fid);
					//有
					if(mapx!=null && !mapx.isEmpty()){
						
						FaSession fssend = new FaSession();
						//发送者
						fssend.setFa_id(idcode+RandomTools.getRandomString(6));
						fssend.setFa_isread(1);
						fssend.setFa_msg(descs);
						fssend.setFa_sendorget(0);
						fssend.setFa_time(date);
						fssend.setFa_pid(mapx.get("id").toString());
						listsession.add(fssend);
					//没有	
					}else{
						//创建我的对话室
						Map<String, Object> roomsend = new HashMap<>();
						String cz1=idcode+RandomTools.getRandomString(6);
						roomsend.put("id", cz1);
						roomsend.put("fa_userid", fa_id);
						roomsend.put("fa_frendid", fid);
						//查询我有没有屏蔽他；
						Long cr1 = ignoreDao.getCountByMyIdAndFriId(fa_id, fid);
						if(cr1>0){
							roomsend.put("fa_isclose", 1);
						}else{
							roomsend.put("fa_isclose", 0);
						}
						listroom.add(roomsend);
						FaSession fssend = new FaSession();
						//发送者
						fssend.setFa_id(idcode+RandomTools.getRandomString(6));
						fssend.setFa_isread(1);
						fssend.setFa_msg(descs);
						fssend.setFa_sendorget(0);
						fssend.setFa_time(date);
						fssend.setFa_pid(cz1);
						listsession.add(fssend);
					}
						
						
					
				}
				
				
				
				
			}
			//批量插入会话室信息
			if(listroom!=null && !listroom.isEmpty()){
				sessionDao.saveRoomMsg(listroom);
			}
			//批量插入会话信息
			if(listsession!=null && !listsession.isEmpty()){
				sessionDao.saveSessionMsg(listsession);
			}
			
			return "success";
		} catch (Exception e) {
			throw new  RuntimeException("批量发送个人信息给好友方法出现异常",e); 
		}
	}
	//发送某个信息给好友
	@Override
	public Map<String, Object> sendMyMsgToMyOnlyFriend(String fa_id, String fid, String descs) {
		try {
			Map<String, Object> mapz = new HashMap<>();
			if(fa_id.equals(fid)){
				mapz.put("tip", "不能给自己发信息");
				return mapz;
			}
			if(fid==null||fid.equals("")){
				mapz.put("tip", "你没有选择好友");
				return mapz;
			}
			if(descs==null || descs.equals("")){
				mapz.put("tip","请填写需要发送的内容" );
				return mapz;
			}
			
			//要保存的会话室信息
			List<Map<String, Object>> listroom = new ArrayList<>();
			//要保存的会话信息
			List<FaSession> listsession = new ArrayList<>();
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String idcode = sdf.format(date);
			//发送者id
			String sendids = idcode+RandomTools.getRandomString(6);
			//接受者id
			String getids = idcode+RandomTools.getRandomString(6);
			//判断双方是否互为好友
			Long c1 = fmfDao.getCountByMyIdAndFrId(fa_id, fid);
			FaUser fmsg = fuDao.getMemberById(fid);
			//是好友 或者对方可以发送所有人
			if(c1>0 || fmsg.getFa_isfriendmsg().equals(0)){
				//查询我跟她的会话室
				List<Map<String, Object>> lists = sessionDao.getMyAndFriendRoom(fa_id,fid);
				//两个对话室都存在
				if(lists.size()>=2){
					FaSession fssend = new FaSession();
					FaSession fsget = new FaSession();
					//发送者
					fssend.setFa_id(sendids);
					fssend.setFa_isread(1);
					fssend.setFa_msg(descs);
					fssend.setFa_sendorget(0);
					fssend.setFa_time(date);
					//接收者
					fsget.setFa_id(getids);
					fsget.setFa_isread(0);
					fsget.setFa_msg(descs);
					fsget.setFa_sendorget(1);
					fsget.setFa_time(date);
					for (Map<String, Object> map : lists) {
						if(map.get("userid").toString().equals(fa_id)){
							fssend.setFa_pid(map.get("id").toString());
						}
						if(map.get("userid").toString().equals(fid)){
							fsget.setFa_pid(map.get("id").toString());
						}
					}
					listsession.add(fssend);
					listsession.add(fsget);
				//两个对话室都不存在
				}else if(lists.size()<=0){
					//创建我的对话室
					Map<String, Object> roomsend = new HashMap<>();
					String cz1=idcode+RandomTools.getRandomString(6);
					String cz2=idcode+RandomTools.getRandomString(6);
					roomsend.put("id", cz1);
					roomsend.put("fa_userid", fa_id);
					roomsend.put("fa_frendid", fid);
					//查询我有没有屏蔽他；
					Long cr1 = ignoreDao.getCountByMyIdAndFriId(fa_id, fid);
					if(cr1>0){
						roomsend.put("fa_isclose", 1);
					}else{
						roomsend.put("fa_isclose", 0);
					}
					//创建对方的对话室
					Map<String, Object> roomget = new HashMap<>();
					roomget.put("id",cz2 );
					roomget.put("fa_userid", fid);
					roomget.put("fa_frendid", fa_id);
					//查询他有没有屏蔽我；
					Long cr2 = ignoreDao.getCountByMyIdAndFriId(fid,fa_id);
					if(cr2>0){
						roomget.put("fa_isclose", 1);
					}else{
						roomget.put("fa_isclose", 0);
					}
					listroom.add(roomsend);
					listroom.add(roomget);
						
					FaSession fssend = new FaSession();
					FaSession fsget = new FaSession();
					//发送者
					fssend.setFa_id(sendids);
					fssend.setFa_isread(1);
					fssend.setFa_msg(descs);
					fssend.setFa_sendorget(0);
					fssend.setFa_time(date);
					fssend.setFa_pid(cz1);
					//接收者
					fsget.setFa_id(getids);
					fsget.setFa_isread(0);
					fsget.setFa_msg(descs);
					fsget.setFa_sendorget(1);
					fsget.setFa_time(date);
					fsget.setFa_pid(cz2);
						
					listsession.add(fssend);
					listsession.add(fsget);
					//只有一个会话室存在
				}else{
					for (Map<String, Object> map : lists) {
						//只有我的会话室
						if(map.get("userid").toString().equals(fa_id)){
							//创建对方的对话室
							String cz2=idcode+RandomTools.getRandomString(6);
							Map<String, Object> roomget = new HashMap<>();
							roomget.put("id",cz2 );
							roomget.put("fa_userid", fid);
							roomget.put("fa_frendid", fa_id);
							//查询他有没有屏蔽我；
							Long cr2 = ignoreDao.getCountByMyIdAndFriId(fid,fa_id);
							if(cr2>0){
								roomget.put("fa_isclose", 1);
							}else{
								roomget.put("fa_isclose", 0);
							}
							listroom.add(roomget);
								
							FaSession fssend = new FaSession();
							FaSession fsget = new FaSession();
							//发送者
							fssend.setFa_id(sendids);
							fssend.setFa_isread(1);
							fssend.setFa_msg(descs);
							fssend.setFa_sendorget(0);
							fssend.setFa_time(date);
							fssend.setFa_pid(map.get("id").toString());
							//接收者
							fsget.setFa_id(getids);
							fsget.setFa_isread(0);
							fsget.setFa_msg(descs);
							fsget.setFa_sendorget(1);
							fsget.setFa_time(date);
							fsget.setFa_pid(cz2);
								
							listsession.add(fssend);
							listsession.add(fsget);
							//只有她的会话室
						}else{
							//创建我的对话室
							Map<String, Object> roomsend = new HashMap<>();
							String cz1=idcode+RandomTools.getRandomString(6);
							roomsend.put("id", cz1);
							roomsend.put("fa_userid", fa_id);
							roomsend.put("fa_frendid", fid);
							//查询我有没有屏蔽他；
							Long cr1 = ignoreDao.getCountByMyIdAndFriId(fa_id, fid);
							if(cr1>0){
								roomsend.put("fa_isclose", 1);
							}else{
								roomsend.put("fa_isclose", 0);
							}
							listroom.add(roomsend);
								
							FaSession fssend = new FaSession();
							FaSession fsget = new FaSession();
							//发送者
							fssend.setFa_id(sendids);
							fssend.setFa_isread(1);
							fssend.setFa_msg(descs);
							fssend.setFa_sendorget(0);
							fssend.setFa_time(date);
							fssend.setFa_pid(cz1);
							//接收者
							fsget.setFa_id(getids);
							fsget.setFa_isread(0);
							fsget.setFa_msg(descs);
							fsget.setFa_sendorget(1);
							fsget.setFa_time(date);
							fsget.setFa_pid(map.get("id").toString());
								
							listsession.add(fssend);
							listsession.add(fsget);
						}
							
					}
				}
					
					
					
					
			//不是好友
			}else{
				getids = "0";
				//查询我跟她有没有会话室
				Map<String, Object> mapx = sessionDao.getMyAndFriendRoomByMine(fa_id,fid);
				//有
				if(mapx!=null && !mapx.isEmpty()){
						
					FaSession fssend = new FaSession();
					//发送者
					fssend.setFa_id(sendids);
					fssend.setFa_isread(1);
					fssend.setFa_msg(descs);
					fssend.setFa_sendorget(0);
					fssend.setFa_time(date);
					fssend.setFa_pid(mapx.get("id").toString());
					listsession.add(fssend);
					//没有	
				}else{
					//创建我的对话室
					Map<String, Object> roomsend = new HashMap<>();
					String cz1=idcode+RandomTools.getRandomString(6);
					roomsend.put("id", cz1);
					roomsend.put("fa_userid", fa_id);
					roomsend.put("fa_frendid", fid);
					//查询我有没有屏蔽他；
					Long cr1 = ignoreDao.getCountByMyIdAndFriId(fa_id, fid);
					if(cr1>0){
						roomsend.put("fa_isclose", 1);
					}else{
						roomsend.put("fa_isclose", 0);
					}
					listroom.add(roomsend);
					FaSession fssend = new FaSession();
					//发送者
					fssend.setFa_id(sendids);
					fssend.setFa_isread(1);
					fssend.setFa_msg(descs);
					fssend.setFa_sendorget(0);
					fssend.setFa_time(date);
					fssend.setFa_pid(cz1);
					listsession.add(fssend);
				}
					
					
					
			}
				
				
				
				
			
			//批量插入会话室信息
			if(listroom!=null && !listroom.isEmpty()){
				sessionDao.saveRoomMsg(listroom);
			}
			//批量插入会话信息
			if(listsession!=null && !listsession.isEmpty()){
				sessionDao.saveSessionMsg(listsession);
			}
			mapz.put("id", sendids);
			mapz.put("idg", getids);
			SimpleDateFormat sdfz = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			mapz.put("day", TimeUtil.formatTime(date));
			mapz.put("msg", descs);
			mapz.put("tip", "success");
			return mapz;
		} catch (Exception e) {
			throw new  RuntimeException("批量发送个人信息给好友方法出现异常",e); 
		}
	}
	//该会话室的内容已读
	@Override
	public void isReadMyFriendMsg(String fa_id, String id) {
		try {
			//查询我跟她有没有会话室
			Map<String, Object> mapx = sessionDao.getMyAndFriendRoomByMine(fa_id,id);
			//有
			if(mapx!=null && !mapx.isEmpty()){
				String [] ids = new String[]{mapx.get("id").toString()};
				sessionDao.msgHasRead(fa_id, ids);
			}
			
		} catch (Exception e) {
			throw new  RuntimeException("该会话室的内容已读方法出现异常",e); 
		}
		
	}
	//分页查询我和好友的消息页面
	@Override
	public List<Map<String, Object>> selectMyFriendAndMeMsgByPage(String mid, String fid, Integer curpage,
			Integer pagesize) {
		try {
			List<Map<String, Object>> list = sessionDao.selectMyFriendAndMeMsgByPage(mid,fid,curpage,pagesize);
			for (Map<String, Object> map : list) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Calendar   cal   =   Calendar.getInstance();
				cal.add(Calendar.DATE,   -1);
				String yesterday = sdf.format(cal.getTime());
				long yestdaytime = sdf.parse(yesterday).getTime();
				Date zx = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(map.get("day").toString());
				long nowtime = zx.getTime();
				if(nowtime>=yestdaytime){
					map.put("day", TimeUtil.formatTime(zx));
				}
				
			}
			return list;
			
		} catch (Exception e) {
			throw new  RuntimeException("//分页查询我和好友的消息页面方法出现异常",e); 
		}
	}
	//分页查询我和好友的消息数量
	@Override
	public Long selectMyFriendAndMeMsgByCount(String mid, String fid) {
		try {
			return sessionDao.selectMyFriendAndMeMsgByCount(mid,fid);
			
		} catch (Exception e) {
			throw new  RuntimeException("分页查询我和好友的消息数量页查询我和好友的消息页面方法出现异常",e); 
		}
	}
	//删除某个消息
	@Override
	public Map<String, Object> deleteSessionSelfMsg(String mid, String fid, String id) {
		try {
			Map<String, Object> map = new HashMap<>();
			if(mid==null || fid==null || id==null){
				map.put("tip", "不能为空");
				return map;
			}
			//查询room id;
			String idr = sessionDao.getRoomIdByFriendAndMine(mid,fid);
			//删除
			sessionDao.deleteSessionMsgByPid(id,idr);
			map.put("tip", "success");
			map.put("id", id);
			return map;
			
		} catch (Exception e) {
			throw new  RuntimeException("删除某个消息方法出现异常",e); 
		}
	}
	//某条会话信息已读
	@Override
	public void MsgIsReadById(String id) {
		try {
			sessionDao.MsgIsReadById(id);
			
		} catch (Exception e) {
			throw new  RuntimeException("分页查询我和好友的消息数量页查询我和好友的消息页面方法出现异常",e); 
		}
		
	}
	//分页查询系统消息
	@Override
	public List<Map<String, Object>> selectSystemMsgByPage(String fa_id, Integer curpage, Integer pagesize) {
		try {
			List<Map<String, Object>> list = sendmsgDao.selectSystemMsgByPage(fa_id,curpage, pagesize);
			for (Map<String, Object> map : list) {
				SimpleDateFormat sdfz = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar   cal   =   Calendar.getInstance();
				cal.add(Calendar.DATE,   -1);
				String yesterday = sdfz.format(cal.getTime());
				long yestdaytime = sdfz.parse(yesterday).getTime();
				Date dd=(Date)map.get("day");
				long nowtime = dd.getTime();
				if(nowtime>=yestdaytime){
					map.put("day", TimeUtil.formatTime(dd));
				}else{
					map.put("day", sdf.format(dd));
				}
			}
			return list ;
		} catch (Exception e) {
			throw new  RuntimeException("分页查询系统消息方法出现异常",e); 
		}
	}
	//分页查询系统消息数量
	@Override
	public Long selectSystemMsgCount(String fa_id) {
		try {
			return sendmsgDao.selectSystemMsgCount(fa_id);
			
		} catch (Exception e) {
			throw new  RuntimeException("分页查询系统消息数量方法出现异常",e); 
		}
	}
	//分页查询我的提醒
	@Override
	public List<Map<String, Object>> selectRemindBypage(String fa_id, Integer curpage, Integer pagesize) {
		try {
			List<Map<String, Object>> list = sendmsgDao.selectRemindBypage(fa_id,curpage,pagesize);
			for (Map<String, Object> map : list) {
				SimpleDateFormat sdfz = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Calendar   cal   =   Calendar.getInstance();
				cal.add(Calendar.DATE,   -1);
				String yesterday = sdfz.format(cal.getTime());
				long yestdaytime = sdfz.parse(yesterday).getTime();
				Date dd=(Date)map.get("day");
				long nowtime = dd.getTime();
				if(nowtime>=yestdaytime){
					map.put("day", TimeUtil.formatTime(dd));
				}else{
					map.put("day", sdf.format(dd));
				}
			}
			return list;
			
		} catch (Exception e) {
			throw new  RuntimeException("分页查询我的提醒方法出现异常",e); 
		}
	}
	//分页查询我的提醒数量
	@Override
	public Long selectRemindByCount(String fa_id) {
		try {
			
			
			return sendmsgDao.selectRemindByCount(fa_id);
			
		} catch (Exception e) {
			throw new  RuntimeException("分页查询我的提醒方法出现异常",e); 
		}
	}
	//删除某个提醒
	@Override
	public Map<String, Object> deleteSystemRemind(String fa_id, String id) {
		try {
			Map<String, Object> map = new HashMap<>();
			
			//删除
			sendmsgDao.deleteSystemRemind(fa_id,id);
			map.put("tip", "success");
			return map;
			
		} catch (Exception e) {
			throw new  RuntimeException("删除某个提醒方法出现异常",e); 
		}
	}
	//忽略某个提醒
	@Override
	public Map<String, Object> ignoreSystemRemind(HttpServletRequest request, FaUser fu, String id) {
		try {
			Map<String, Object> map = new HashMap<>();
			Integer version = fuDao.getVersionById(fu.getFa_id());
			if(fu.getFa_ignore_msg()!=null && !fu.getFa_ignore_msg().equals("")){
				String[] split = fu.getFa_ignore_msg().split(",");
				for (String str : split) {
					if(str.equals(id)){
						map.put("tip", "您已经把该用户屏蔽了");
						return map;
					}
				}
				fu.setFa_ignore_msg(fu.getFa_ignore_msg()+","+id);
			}else{
				fu.setFa_ignore_msg(id);
			}
			fuDao.UpdateUserIgnore(fu.getFa_id(),fu.getFa_ignore_msg(),version);
			request.getSession().setAttribute(Constant.SESSION_USER, fu);
			
			map.put("tip", "success");
			return map;
			
		} catch (Exception e) {
			throw new  RuntimeException("忽略某个提醒方法出现异常",e); 
		}
	}
	//同意成为好友
	@Override
	public Map<String, Object> agreeBecomeTheFriend(String fa_id, String id) {
		try {
			Map<String, Object> map = new HashMap<>();
			Date date = new Date();
			//改变好友申请信息状态
			sendmsgDao.updateFriendApplyStatus(fa_id,id,1,date);
			
			//查询好友忽略的人
			String ignoreIds = fuDao.getIgonreIdSById(id);
			boolean tof = true;
			if(ignoreIds!=null && ignoreIds.length()>0){
				String[] inid = ignoreIds.split(",");
				for (String str : inid) {
					if(fa_id.equals(str)){
						tof = false;
						break;
					}
				}
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			if(tof){
				//发送成为好友信息给对方
				
				FaSentMessage fsm = new FaSentMessage();
				fsm.setFa_id(sdf.format(date)+RandomTools.getRandomString(6));
				fsm.setFa_userid(id);
				fsm.setFa_friendid(fa_id);
				fsm.setFa_msg_type(2);
				fsm.setFa_time(date);
				sendmsgDao.saveMsg(fsm);	
			}
			
			
			
			
			//创建好友表
			List<FaMyFriend> lf = new ArrayList<>();
			FaMyFriend f1 = new FaMyFriend();
			FaMyFriend f2 = new FaMyFriend();
			f1.setFa_id(sdf.format(date)+RandomTools.getRandomString(11));
			f1.setFa_userid(fa_id);
			f1.setFa_friendid(id);
			f1.setFa_time(date);
			f2.setFa_id(sdf.format(date)+RandomTools.getRandomString(11));
			f2.setFa_userid(id);
			f2.setFa_friendid(fa_id);
			f2.setFa_time(date);
			lf.add(f1);
			lf.add(f2);
			fmfDao.saveFriendMsg(lf);
			map.put("tip", "success");
			return map;
			
		} catch (Exception e) {
			throw new  RuntimeException("//同意成为好友方法出现异常",e); 
		}
	}
	//拒绝成为好友
	@Override
	public Map<String, Object> stopBecomeTheFriend(String fa_id, String id) {
		try {
			Map<String, Object> map = new HashMap<>();
			Date date = new Date();
			//改变好友申请信息状态
			sendmsgDao.updateFriendApplyStatus(fa_id,id,2,date);
			//查询好友忽略的人
			String ignoreIds = fuDao.getIgonreIdSById(id);
			boolean tof = true;
			if(ignoreIds!=null && ignoreIds.length()>0){
				String[] inid = ignoreIds.split(",");
				for (String str : inid) {
					if(fa_id.equals(str)){
						tof = false;
						break;
					}
				}
			}
			if(tof){
				//发送成为好友信息给对方
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				FaSentMessage fsm = new FaSentMessage();
				fsm.setFa_id(sdf.format(date)+RandomTools.getRandomString(6));
				fsm.setFa_userid(id);
				fsm.setFa_friendid(fa_id);
				fsm.setFa_msg_type(8);
				fsm.setFa_time(date);
				sendmsgDao.saveMsg(fsm);
			}
			
			
			map.put("tip", "success");
			return map;
			
		} catch (Exception e) {
			throw new  RuntimeException("//拒绝成为好友方法出现异常",e); 
		}
	}
	//查询是否已经关注他
	@Override
	public Integer isFollowToHim(String fa_id, String id) {
		try {
			//查询是否关注他
			Long count2 =flDao.IsFriend(fa_id, id);
			if(count2>0){
				return 1;
			}else{
				return 0;
			}
			
			
		} catch (Exception e) {
			throw new  RuntimeException("查询是否已经关注他方法出现异常",e); 
		}
	}
	//查询是否已经是好友
	@Override
	public Integer isFriendToHim(String fa_id, String id) {
		try {
			
			//查询是否是好友
			Long count1 = fmfDao.getCountByMyIdAndFrId(fa_id,id);
			if(count1>0){
				return 1;
			}else{
				return 0;
			}
		} catch (Exception e) {
			throw new  RuntimeException("查询是否已经是好友方法出现异常",e); 
		}
	}
	//分页查询商店信息
	@Override
	public List<Map<String, Object>> selectShopProByPage(Integer curpage, Integer pagesize, Integer typess) {
		try {
			return fgDao.selectShopProByPage(curpage,pagesize,typess);
		} catch (Exception e) {
			throw new  RuntimeException("分页查询商店信息方法出现异常",e); 
		}
	}
	//分页查询商店信息数量
	@Override
	public Long selectShopProCount(Integer typess) {
		try {
			return fgDao.selectShopProCount(typess);
		} catch (Exception e) {
			throw new  RuntimeException("分页查询商店信息数量方法出现异常",e); 
		}
	}
	//分页查询固件下载信息
	@Override
	public List<FaWare> selectFirmwareByPage(Integer curpage, Integer pagesize) {
		try {
			return fwDao.getWareByPage(curpage, pagesize, null);
		} catch (Exception e) {
			throw new  RuntimeException("//分页查询固件下载信息方法出现异常",e); 
		}
	}
	//分页查询固件下载信息数量
	@Override
	public Long selectFirmwareCount() {
		try {
			return fwDao.getTotalByWare(null);
		} catch (Exception e) {
			throw new  RuntimeException("//分页查询固件下载信息数量方法出现异常",e); 
		}
	}
	//最新抽奖记录
	@Override
	public List<Map<String, Object>> getLotteryUserMsg() {
		try {
			return fldDao.getLotteryUserMsg();
		} catch (Exception e) {
			throw new  RuntimeException("最新抽奖记录方法出现异常",e); 
		}
	}
	
}
