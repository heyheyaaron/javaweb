package feiao.forum.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import feiao.forum.dao.FaFriendTypeDao;
import feiao.forum.dao.FaGroupsDao;
import feiao.forum.dao.FaHonorDao;
import feiao.forum.dao.FaInteDao;
import feiao.forum.dao.FaLabelDao;
import feiao.forum.dao.FaMibaoDao;
import feiao.forum.dao.FaProductDao;
import feiao.forum.dao.FaRankDao;
import feiao.forum.dao.FaSentMessageDao;
import feiao.forum.dao.FaUserDao;
import feiao.forum.dao.FaUserViceDao;
import feiao.forum.pojo.FaFriendType;
import feiao.forum.pojo.FaGroups;
import feiao.forum.pojo.FaHonor;
import feiao.forum.pojo.FaInte;
import feiao.forum.pojo.FaLabel;
import feiao.forum.pojo.FaMibao;
import feiao.forum.pojo.FaProduct;
import feiao.forum.pojo.FaRank;
import feiao.forum.pojo.FaSentMessage;
import feiao.forum.pojo.FaUser;
import feiao.forum.pojo.FaUserVice;
import feiao.forum.service.Constant;
import feiao.forum.service.MemberService;
import feiao.forum.service.util.FeiaoDataMsg;
import feiao.forum.service.util.InteRP;
import feiao.forum.service.util.UserNameUtil;
import feiao.forum.util.MD5;
import feiao.forum.util.RandomTools;
@Service
public class MemberServiceImpl implements MemberService{
	//会员标签
	@Autowired
	private FaLabelDao labelDao;
	//密保
	@Autowired
	private FaMibaoDao mibaoDao;
	//会员等级
	@Autowired
	private FaRankDao rankDao;
	//会员勋章
	@Autowired
	private FaHonorDao honorDao;
	//会员信息
	@Autowired
	private FaUserDao userDao;
	//会员附属信息
	@Autowired
	private FaUserViceDao fuvDao;
	//会员组
	@Autowired
	private FaGroupsDao groupsDao;
	//消息推送
	@Autowired
	private FaSentMessageDao fsmDao;
	//会员积分记录
	@Autowired
	private FaInteDao inteDao;
	//朋友分组
	@Autowired
	private FaFriendTypeDao fftDao;
	//******************************************后台**********************TODO*********************************************
	//分页展示标签信息
	@Override
	public List<Map<String, Object>> getLabelByPage(Integer curpage, String search, Integer pagesize) {
		try {
			
			return labelDao.getlabelByPage((curpage-1)*pagesize, pagesize, search);
		} catch (Exception e) {
			throw new RuntimeException("分页展示标签信息方法出现异常",e);
		}
	}
	//查询标签总数
	@Override
	public Long getTotalByLabel(String search) {
		try {
			
			return labelDao.getTotalByLabel(search);
		} catch (Exception e) {
			throw new RuntimeException("查询标签总数方法出现异常",e);
		}
	}
	//根据id获取标签信息
	@Override
	public FaLabel getLabelById(Integer id) {
		try {
			
			return labelDao.get(id);
		} catch (Exception e) {
			throw new RuntimeException("根据id获取标签信息方法出现异常",e);
		}
	}
	//增加标签
	@Override
	public String addLabelData(FaLabel fl) {
		try {
			if(fl.getFa_name()==null || fl.getFa_name().equals("")){
				return "标签名字不能为空";
			}
			if(fl.getFa_sort()==null){
				return "排序不能为空";
			}
			if(fl.getFa_sort()<0 || fl.getFa_sort()>999){
				return "排序范围为0~999";
			}
			labelDao.addLabel(fl);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加标签方法出现异常",e);
		}
	}
	//修改标签
	@Override
	public String updateLabelData(FaLabel fl) {
		try {
			if(fl.getFa_name()==null || fl.getFa_name().equals("")){
				return "标签名字不能为空";
			}
			if(fl.getFa_sort()==null){
				return "排序不能为空";
			}
			if(fl.getFa_sort()<0 || fl.getFa_sort()>999){
				return "排序范围为0~999";
			}
			labelDao.updateLabel(fl);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改标签方法出现异常",e);
		}
	}
	//删除标签
	@Override
	public Integer deleteLabeData(Integer id) {
		try {
			labelDao.deleteLabel(id);
			labelDao.deleteLabelAndUser(id);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("删除标签方法出现异常",e);
		}
	}
	//根据id获取密保信息
	@Override
	public FaMibao getMibaoById(Integer id) {
		try {
			
			return mibaoDao.get(id);
		} catch (Exception e) {
			throw new RuntimeException("根据id获取密保信息方法出现异常",e);
		}
	}
	//增加密保
	@Override
	public String addMibaoData(FaMibao fl) {
		try {
			if(fl.getFa_name()==null || fl.getFa_name().equals("")){
				return "密保名字不能为空";
			}
			if(fl.getFa_sort()==null){
				return "排序不能为空";
			}
			if(fl.getFa_sort()<0 || fl.getFa_sort()>999){
				return "排序范围为0~999";
			}
			mibaoDao.addMibao(fl);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加密保方法出现异常",e);
		}
	}
	//修改密保
	@Override
	public String updateMibaoData(FaMibao fl) {
		try {
			if(fl.getFa_name()==null || fl.getFa_name().equals("")){
				return "密保名字不能为空";
			}
			if(fl.getFa_sort()==null){
				return "排序不能为空";
			}
			if(fl.getFa_sort()<0 || fl.getFa_sort()>999){
				return "排序范围为0~999";
			}
			mibaoDao.updateMibao(fl);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改密保方法出现异常",e);
		}
	}
	//删除密保
	@Override
	public Integer deleteMibaoData(Integer id) {
		try {
			mibaoDao.deleteMibao(id);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("删除密保方法出现异常",e);
		}
	}
	//异步加载所有密保信息
	@Override
	public List<FaMibao> getAllMibao() {
		try {
			return mibaoDao.getAllMibao();
		} catch (Exception e) {
			throw new RuntimeException("异步加载所有密保信息方法出现异常",e);
		}
	}
	//分页展示勋章信息
	@Override
	public List<Map<String, Object>> getHonorByPage(Integer curpage, String search, Integer pagesize) {
		try {
			
			return honorDao.getFaHonorByPage((curpage-1)*pagesize, pagesize, search);
		} catch (Exception e) {
			throw new RuntimeException("分页展示勋章信息方法出现异常",e);
		}
	}
	//查询勋章总数
	@Override
	public Long getTotalByHonor(String search) {
		try {
			
			return honorDao.getTotalByFaHonor(search);
		} catch (Exception e) {
			throw new RuntimeException("查询勋章总数方法出现异常",e);
		}
	}
	//根据id获取勋章信息
	@Override
	public FaHonor getHonorById(Integer id) {
		try {
			
			return honorDao.get(id);
		} catch (Exception e) {
			throw new RuntimeException("根据id获取勋章信息方法出现异常",e);
		}
	}
	//增加勋章
	@Override
	public String addHonorData(FaHonor fh) {
		try {
			if(fh.getFa_name()==null || fh.getFa_name().equals("")){
				return "勋章名字不能为空";
			}
			if(fh.getFa_desc()==null || fh.getFa_desc().equals("")){
				return "勋章描述不能为空";
			}
			if(fh.getFa_image()==null || fh.getFa_image().equals("")){
				return "勋章图片不能为空";
			}
			
			honorDao.addFaHonor(fh);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加勋章方法出现异常",e);
		}
	}
	//修改勋章
	@Override
	public String updateHonorData(FaHonor fh) {
		try {
			if(fh.getFa_name()==null || fh.getFa_name().equals("")){
				return "勋章名字不能为空";
			}
			if(fh.getFa_desc()==null || fh.getFa_desc().equals("")){
				return "勋章描述不能为空";
			}
			if(fh.getFa_image()==null || fh.getFa_image().equals("")){
				return "勋章图片不能为空";
			}
			honorDao.updateFaHonor(fh);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改勋章方法出现异常",e);
		}
	}
	//发送勋章
	@Override
	public String sendHonorData(FaHonor fh,String username) {
		try {
			if(fh.getFa_id()==null || fh.getFa_id().equals("")){
				return "请选择需要发送的勋章";
			}
			
			if(username==null || username.equals("")){
				return "请填写需要发送的会员";
			}
			//根据手机邮箱或者登录名查询账户id
			String userId = userDao.findUserHonorByUsername(username);
			if(userId!=null && !userId.equals("")){
				Long count = honorDao.findCountByUserAndHonor(userId,fh.getFa_id());
				
				if(count<=0){
					SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
					Date date = new Date();
					String ds = sdf.format(date);
					String idz = ds +RandomTools.getRandomString(10);
					honorDao.sendFaHonor(idz,userId,fh.getFa_id());
				}else{
					return "该会员已经有这勋章了";
				}
				
			}else{
				return "该会员不存在";
			}
			
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("发送勋章方法出现异常",e);
		}
	}
	////删除某会员勋章
	@Override
	public String delMbHonorData(FaHonor fh,String username) {
		try {
			if(fh.getFa_id()==null || fh.getFa_id().equals("")){
				return "请选择需要删除的勋章";
			}
			
			if(username==null || username.equals("")){
				return "请填写需要删除的会员";
			}
			//根据手机邮箱或者登录名查询账户id
			String userId = userDao.findUserHonorByUsername(username);
			if(userId!=null && !userId.equals("")){
				honorDao.deleteHonorByMbAndHr(userId,fh.getFa_id());
				
				
				
			}else{
				return "该会员不存在";
			}
			
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("发送勋章方法出现异常",e);
		}
	}
	//删除勋章
	@Override
	public Integer deleteHonorData(Integer id) {
		try {
			honorDao.deleteFaHonor(id);
			honorDao.deleteFaHonorAndUser(id);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("删除勋章方法出现异常",e);
		}
	}
	
	//分页展示用户组信息
	@Override
	public List<Map<String, Object>> getGroupsByPage(Integer curpage, String search, Integer pagesize) {
		try {
			
			return groupsDao.getFaGroupsByPage((curpage-1)*pagesize, pagesize, search);
		} catch (Exception e) {
			throw new RuntimeException("分页展示用户组信息方法出现异常",e);
		}
	}
	//查询用户组总数
	@Override
	public Long getTotalByGroups(String search) {
		try {
			
			return groupsDao.getTotalByFaGroups(search);
		} catch (Exception e) {
			throw new RuntimeException("查询用户组总数方法出现异常",e);
		}
	}
	//根据id获取用户组信息
	@Override
	public FaGroups getGroupsById(Integer id) {
		try {
			
			return groupsDao.get(id);
		} catch (Exception e) {
			throw new RuntimeException("根据id获取用户组信息方法出现异常",e);
		}
	}
	//增加用户组
	@Override
	public String addGroupsData(FaGroups fg) {
		try {
			if(fg.getFa_name()==null || fg.getFa_name().equals("")){
				return "用户组名字不能为空";
			}
			if(fg.getFa_desc()==null || fg.getFa_desc().equals("")){
				return "用户组描述不能为空";
			}
			if(fg.getFa_image()==null || fg.getFa_image().equals("")){
				return "用户组图片不能为空";
			}
			
			groupsDao.addFaGroups(fg);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加用户组方法出现异常",e);
		}
	}
	//修改用户组
	@Override
	public String updateGroupsData(FaGroups fg) {
		try {
			if(fg.getFa_name()==null || fg.getFa_name().equals("")){
				return "用户组名字不能为空";
			}
			if(fg.getFa_desc()==null || fg.getFa_desc().equals("")){
				return "用户组描述不能为空";
			}
			if(fg.getFa_image()==null || fg.getFa_image().equals("")){
				return "用户组图片不能为空";
			}
			groupsDao.updateFaGroups(fg);
			
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改用户组方法出现异常",e);
		}
	}
	
	//删除用户组
	@Override
	public Integer deleteGroupsData(Integer id) {
		try {
			groupsDao.deleteFaGroups(id);
			groupsDao.deleteFaGroupsAndUser(id);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("删除用户组方法出现异常",e);
		}
	}
	//异步加载所有用户组信息
	@Override
	public List<Map<String, Object>> getAllMbGroup() {
		try {
			return groupsDao.getAllMbGroup();
		} catch (Exception e) {
			throw new RuntimeException("异步加载所有用户组信息信息方法出现异常",e);
		}
	}
	
	//根据用户id 查询该会员绑定用户组情况
	@Override
	public List<Integer> getGroupIdByUserId(String id) {
		try {
			return groupsDao.getGroupIdByUserId(id);
		} catch (Exception e) {
			throw new RuntimeException("根据用户id 查询该会员绑定用户组情况",e);
		}
	}
	
	//异步加载所有会员等级
	@Override
	public List<FaRank> selectAllRank() {
		
		try {
			return rankDao.getAllRank();
		} catch (Exception e) {
			throw new RuntimeException("异步加载所有会员等级方法出现异常",e);
		}
	}
	//分页展示等级信息
	@Override
	public List<Map<String, Object>> getRankByPage(Integer curpage, String search, Integer pagesize) {
		try {
			
			return rankDao.getRankByPage((curpage-1)*pagesize, pagesize, search);
		} catch (Exception e) {
			throw new RuntimeException("分页展示等级信息方法出现异常",e);
		}
	}
	//查询等级总数
	@Override
	public Long getTotalByRank(String search) {
		try {
			
			return rankDao.getTotalByRank(search);
		} catch (Exception e) {
			throw new RuntimeException("查询等级总数方法出现异常",e);
		}
	}
	//根据id获取等级信息
	@Override
	public FaRank getRankById(Integer id) {
		try {
			
			return rankDao.get(id);
		} catch (Exception e) {
			throw new RuntimeException("根据id获取等级信息方法出现异常",e);
		}
	}
	//增加等级
	@Override
	public String addRankData(FaRank fr) {
		try {
			if(fr.getFa_name()==null || fr.getFa_name().equals("")){
				return "等级名字不能为空";
			}
			if(fr.getFa_start()==null || fr.getFa_start().equals("")){
				return "等级内最低积分不能为空";
			}
			if(fr.getFa_end()==null || fr.getFa_end().equals("")){
				return "等级内最高积分不能为空";
			}
			
			rankDao.addRank(fr);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加等级方法出现异常",e);
		}
	}
	//修改等级
	@Override
	public String updateRankData(FaRank fr) {
		try {
			if(fr.getFa_name()==null || fr.getFa_name().equals("")){
				return "等级名字不能为空";
			}
			if(fr.getFa_start()==null || fr.getFa_start().equals("")){
				return "等级内最低积分不能为空";
			}
			if(fr.getFa_end()==null || fr.getFa_end().equals("")){
				return "等级内最高积分不能为空";
			}
			rankDao.updateRank(fr);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改等级方法出现异常",e);
		}
	}
	//删除等级
	@Override
	public Integer deleteRankData(Integer id) {
		try {
			
			Long ct = rankDao.getUserByRank(id);
			if(ct>0){
				return 2;
			}else{
				rankDao.deleteRank(id);
			}
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("删除等级方法出现异常",e);
		}
	}
	//为所有会员匹配新规则
	@Override
	public Integer mateRank() {
		try {
			List<FaRank> list = rankDao.getAllRank();
			for (FaRank fr : list) {
				userDao.updateMbByInte(fr.getFa_id(),fr.getFa_start(),fr.getFa_end());
			}
			
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("为所有会员匹配新规则方法出现异常",e);
		}
	}
	
	
	//分页展示会员信息
	@Override
	public List<Map<String, Object>> getMemberByPage(Integer curpage, String search, Integer pagesize,Integer rankid,Integer groupid, String telid) {
		try {
			
			return userDao.getMemberByPage((curpage-1)*pagesize, search, pagesize,rankid,groupid,telid);
		} catch (Exception e) {
			throw new RuntimeException("分页展示会员信息方法出现异常",e);
		}
	}
	//查询会员总数
	@Override
	public Long getTotalByMember(String search,Integer rankid,Integer groupid, String telid) {
		try {
			
			return userDao.getTotalByMember(search,rankid,groupid,telid);
		} catch (Exception e) {
			throw new RuntimeException("查询会员总数方法出现异常",e);
		}
	}
	//验证登录名是否重复
	@Override
	public Integer validateUserNameIsTrue(String username) {
		try {
			
			Long count = userDao.validateUserNameIsTrue(username);
			if(count<=0){
				return 1;
			}else{
				return 0;
			}
		} catch (Exception e) {
			throw new RuntimeException("验证登录名是否重复方法出现异常",e);
		}
	}
	//验证手机是否重复
	@Override
	public Integer validateTelIsTrue(String tel) {
		try {
			
			Long count = userDao.validateTelIsTrue(tel);
			if(count<=0){
				return 1;
			}else{
				return 0;
			}
		} catch (Exception e) {
			throw new RuntimeException("验证手机是否重复方法出现异常",e);
		}
	}
	//验证邮箱是否重复
	@Override
	public Integer validateEmailIsTrue(String email) {
		try {
			
			Long count = userDao.validateEmailIsTrue(email);
			if(count<=0){
				return 1;
			}else{
				return 0;
			}
		} catch (Exception e) {
			throw new RuntimeException("验证邮箱是否重复方法出现异常",e);
		}
	}
	//验证手机是否重复不包括自己
	@Override
	public Integer validateTelIsTrueMe(String tel,String id) {
		try {
			
			Long count = userDao.validateTelIsTrueMe(tel,id);
			if(count<=0){
				return 1;
			}else{
				return 0;
			}
		} catch (Exception e) {
			throw new RuntimeException("验证手机是否重复方法出现异常",e);
		}
	}
	//验证邮箱是否重复不包括自己
	@Override
	public Integer validateEmailIsTrueMe(String email,String id) {
		try {
			
			Long count = userDao.validateEmailIsTrueMe(email,id);
			if(count<=0){
				return 1;
			}else{
				return 0;
			}
		} catch (Exception e) {
			throw new RuntimeException("验证邮箱是否重复方法出现异常",e);
		}
	}
	//增加会员
	@Override
	public String addMemberData(FaUser fu,HttpServletRequest request) {
		try {
			if(fu.getFa_username()==null){
				return "登录名不能为空";
			}
			if(fu.getFa_telphone()==null){
				return "手机号码不能为空";
			}
			if(fu.getFa_email()==null){
				return "邮箱不能为空";
			}
			if(fu.getFa_password()==null){
				return "密码不能为空";
			}
			if(fu.getFa_username().length()<3 ||fu.getFa_username().length()>20){
				return "昵称长度为3到20位";
			}
			if(fu.getFa_password().length()<6 ||fu.getFa_password().length()>18){
				return "密码长度为6到18位";
			}
			if(fu.getFa_telphone().length()!=11){
				return "手机长度为11位";
			}
			InteRP rps = FeiaoDataMsg.findRP(request.getSession().getServletContext());
			FaUserVice fuv = new FaUserVice();
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
			fu.setFa_title_img("/img/download/uc/13/91/68/02/90/139168029/w200h200.jpg");
			fu.setFa_password(MD5.getMD5(fu.getFa_password()));
			fu.setFa_jifen(rps.getEmailInte());
			fu.setFa_feibiao(rps.getEmailFb());
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
			Date date = new Date();
			String ds = sdf.format(date);
			
			String idz = ds +RandomStringUtils.randomNumeric(8)+RandomTools.getRandomString(2);
			fu.setFa_id(idz);
			//查询0积分的会员等级
			List<Integer> list= rankDao.getRankIdByInte(0);
			if(list!=null && !list.isEmpty()){
				fu.setFa_rank(list.get(0));
			}
			fu.setFa_createtime(date);
			userDao.addMember(fu);
			fuv.setFa_id(fu.getFa_id());
			fuvDao.addMember(fuv);
			
			//查询注册勋章id
			List<Integer> listhonor = honorDao.finIdbycondition(1);
			for (Integer ints : listhonor) {
				//发送勋章
				String idh = ds +RandomTools.getRandomString(10);
				honorDao.sendFaHonor(idh, idz, ints);
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
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加会员方法出现异常",e);
		}
	}
	//根据id查询会员信息
	@Override
	public FaUser getMemberById(String id) {
		try {
			
			return userDao.getMemberById(id);
		
		} catch (Exception e) {
			throw new RuntimeException("根据id查询会员信息方法出现异常",e);
		}
	}
	//修改会员
	@Override
	public String updateMemberData(FaUser fu,Integer[] groups) {
		try {
			if(fu.getFa_ishost()==null){
				return "请选择版主类别";
			}
			if(fu.getFa_username()==null){
				return "登录名不能为空";
			}
			if(fu.getFa_email()==null){
				return "邮箱不能为空";
			}
			
			if(fu.getFa_username().length()<3 ||fu.getFa_username().length()>20){
				return "昵称长度为3到20位";
			}
			boolean numeric = UserNameUtil.isNumeric(fu.getFa_username());
			if(numeric){
				return "昵称不能全是数字";
			}
			if(fu.getFa_username().indexOf("@") != -1){  
				return "昵称不能包含@字符";
			} 
			Long counts =userDao.getCountByUsernameAndMyId(fu.getFa_id(),fu.getFa_username());
			
			if(counts>0){
				
				return "该昵称已存在";
			}
			if(fu.getFa_password()!=null && fu.getFa_password()!=""){
				if(fu.getFa_password().length()<6 ||fu.getFa_password().length()>18){
					return "密码长度为6到18位";
				}else{
					fu.setFa_password(MD5.getMD5(fu.getFa_password()));
				}
			}
			if(fu.getFa_telphone()!=null && !fu.getFa_telphone().equals("")){
				Integer istel = validateTelIsTrueMe(fu.getFa_telphone(),fu.getFa_id());
				if(istel<1){
					return "手机号码已存在";
				}
				if(fu.getFa_telphone().length()!=11){
					return "手机长度为11位";
				}
			}
			
			if(fu.getFa_ishost().equals(2)){
				fu.setFa_sectionid(0);
			}
			if(fu.getFa_ishost().equals(1)){
				if(fu.getFa_sectionid().equals(0)){
					return "请选择需要管理的版块";
				}
			}
			Integer version = userDao.getVersionById(fu.getFa_id());
			fu.setVersion(version);
			userDao.updateMember(fu);
			groupsDao.deleteGroupsByUserId(fu.getFa_id());
			//会员绑定用户组
			
			if(groups!=null){
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
				for (Integer gid : groups) {
					
					Date date = new Date();
					String ds = sdf.format(date);
					String idz = ds +RandomTools.getRandomString(10);
					groupsDao.bindFaGroups(idz,gid,fu.getFa_id());
				}
				
			}
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改会员方法出现异常",e);
		}
	}
	//删除会员
	@Override
	public Integer deleteMemberData(String[] ids) {
		try {
			userDao.deleteMemberData(ids);
			fuvDao.deleteMember(ids);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("删除会员信息方法出现异常",e);
		}
	}
	//根据会员id查询勋章信息
	@Override
	public List<Map<String, Object>> getHonorByUserId(String id) {
		try {
			return honorDao.getHonorByUserId(id);
		} catch (Exception e) {
			throw new RuntimeException("//根据会员id查询勋章信息方法出现异常",e);
		}
	}
	//根据会员id查询标签信息
	@Override
	public List<Map<String, Object>> getLabelByUserId(String id) {
		try {
			return labelDao.getLabelByUserId(id);
		} catch (Exception e) {
			throw new RuntimeException("根据会员id查询标签信息方法出现异常",e);
		}
	}
	//异步加载所有标签信息
	@Override
	public List<FaLabel> getAllLabel() {
		try {
			return labelDao.getAllLabel();
		} catch (Exception e) {
			throw new RuntimeException("异步加载所有标签信息方法出现异常",e);
		}
	}
	//根据条件查询会员邮箱
	@Override
	public List<String> getEmailByTerms(Integer rankid, Integer groupid, Integer labelid, Integer telid) {
		try {
			return userDao.getEmailByTerms(rankid, groupid,labelid,telid);
		} catch (Exception e) {
			throw new RuntimeException("根据条件查询会员邮箱方法出现异常",e);
		}
	}
	//根据手机号或者邮箱号发送站内消息
	@Override
	public void sendMsg(String[] emails, String title, String descz) {
		try {
			List<FaSentMessage> list = new ArrayList<>();
			for (String str : emails) {
				String userId = userDao.findUserHonorByUsername(str);
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
				Date date = new Date();
				String id = sdf.format(date)+RandomTools.getRandomString(10);
				FaSentMessage fsm = new FaSentMessage();
				fsm.setFa_id(id);
				fsm.setFa_userid(userId);
				fsm.setFa_title(title);
				fsm.setFa_msg(descz);
				fsm.setFa_msg_type(0);
				fsm.setFa_isread(0);
				fsm.setFa_friend_type(0);
				fsm.setFa_friend_istrue(0);
				fsm.setFa_time(new Date());
				list.add(fsm);
				
			}
			fsmDao.saveMsgs(list);
		} catch (Exception e) {
			throw new RuntimeException("根据手机号或者邮箱号发送站内消息方法出现异常",e);
		}
		
	}
	//根据分类组合群发消息
	@Override
	public Integer sendMsgs(Integer rankid, Integer groupid, Integer labelid, String title, String descz, Integer telid) {
		try {
			List<String> list = userDao.getUserIdByTerms(rankid,groupid,labelid,telid);
			if(list==null||list.isEmpty()){
				return 6;
			}
			
			List<FaSentMessage> listz = new ArrayList<>();
			for (String userId : list) {
				//System.err.println(str);
				//String userId = userDao.findUserHonorByUsername(str);
				SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmm");
				Date date = new Date();
				String id = sdf.format(date)+RandomTools.getRandomString(10);
				FaSentMessage fsm = new FaSentMessage();
				fsm.setFa_id(id);
				fsm.setFa_userid(userId);
				fsm.setFa_title(title);
				fsm.setFa_msg(descz);
				fsm.setFa_msg_type(0);
				fsm.setFa_isread(0);
				fsm.setFa_friend_type(0);
				fsm.setFa_friend_istrue(0);
				fsm.setFa_time(new Date());
				listz.add(fsm);
			}
			
			fsmDao.saveMsgs(listz);
			return 1;
			
		} catch (Exception e) {
			throw new RuntimeException("根据分类组合群发消息方法出现异常",e);
		}
	}
	//查询该会员积分记录表（后台）
	@Override
	public List<Map<String, Object>> getMemberInteByPage(Integer curpage, Integer pagesize, Date ss, Date ee,
			String userId) {
		try {
			
			return inteDao.getMemberInteByPage((curpage-1)*pagesize,pagesize,ss,ee,userId);
		} catch (Exception e) {
			throw new RuntimeException("查询该会员积分记录表方法出现异常",e);
		}
	}
	//查询该会员积分记录表（前台）
	@Override
	public List<Map<String, Object>> getFiioerInteByPage(Integer curpage, Integer pagesize, Date ss, Date ee,
			String id,Integer types, Integer buyOrSelf) {
		try {
			
			return inteDao.getFiioerInteByPage((curpage-1)*pagesize,pagesize,ss,ee,id,types,buyOrSelf);
		} catch (Exception e) {
			throw new RuntimeException("查询该会员积分记录表方法出现异常",e);
		}
	}
	//查询该会员积分记录表总数（后台）
	@Override
	public Long getTotalByMemberInte(Date ss, Date ee, String userId) {
		try {
			
			return inteDao.getTotalByMemberInte(ss,ee,userId);
		} catch (Exception e) {
			throw new RuntimeException("查询该会员积分记录表总数方法出现异常",e);
		}
	}
	//查询该会员积分记录表总数（前台）
	@Override
	public Long getTotalByFiioerInte(Date ss, Date ee, String userId,Integer types, Integer buyOrSelf) {
		try {
			
			return inteDao.getTotalByFiioerInte(ss,ee,userId,types,buyOrSelf);
		} catch (Exception e) {
			throw new RuntimeException("查询该会员积分记录表总数方法出现异常",e);
		}
	}
	
	//更新每天凌晨的签到信息（删帖）
	@Override
	public void updateDeleteTime() {
		try {
			fuvDao.updateDeleteTime();
			
		} catch (Exception e) {
			throw new RuntimeException("更新每天凌晨的签到信息（删帖）方法出现异常",e);
		}
		
	}
	//更新每天凌晨的签到信息（邮箱）
	@Override
	public void updateEmailTime() {
		try {
			fuvDao.updateEmailTime();
			
		} catch (Exception e) {
			throw new RuntimeException("更新每天凌晨的签到信息（邮箱）方法出现异常",e);
		}
		
	}
	//更新每天凌晨的签到信息（加精）
	@Override
	public void updateJingTime() {
		try {
			fuvDao.updateJingTime();
			
		} catch (Exception e) {
			throw new RuntimeException("更新每天凌晨的签到信息（加精）方法出现异常",e);
		}
		
	}
	//更新每天凌晨的签到信息（登录）
	@Override
	public void updateLoginTime() {
		try {
			fuvDao.updateLoginTime() ;
			
		} catch (Exception e) {
			throw new RuntimeException("更新每天凌晨的签到信息（登录）方法出现异常",e);
		}
		
	}
	//更新每天凌晨的签到信息（签到）
	@Override
	public void updateSignTime() {
		try {
			fuvDao.updateSignTime() ;
			
		} catch (Exception e) {
			throw new RuntimeException("更新每天凌晨的签到信息（签到）方法出现异常",e);
		}
		
	}
	//更新每天凌晨的签到信息（产品注册）
	@Override
	public void updateProTime() {
		try {
			fuvDao.updateProTime();
			
		} catch (Exception e) {
			throw new RuntimeException("更新每天凌晨的签到信息（产品注册）方法出现异常",e);
		}
		
	}
	//更新每天凌晨的签到信息（发表回复）
	@Override
	public void updateRespeakTime() {
		try {
			fuvDao.updateRespeakTime();
			
		} catch (Exception e) {
			throw new RuntimeException("更新每天凌晨的签到信息（发表回复）方法出现异常",e);
		}
		
	}
	//更新每天凌晨的签到信息（发帖）
	@Override
	public void updateThemeTime() {
		try {
			fuvDao.updateThemeTime();
			
		} catch (Exception e) {
			throw new RuntimeException("更新每天凌晨的签到信息（发帖）方法出现异常",e);
		}
		
	}
	//更新每天凌晨的签到信息（头像）
	@Override
	public void updateTitleTime() {
		try {
			fuvDao.updateTitleTime();
			
		} catch (Exception e) {
			throw new RuntimeException("更新每天凌晨的签到信息（头像）方法出现异常",e);
		}
		
	}
	//更新每天凌晨的签到信息（投票）
	@Override
	public void updateVoteTime() {
		try {
			fuvDao.updateVoteTime();
			
		} catch (Exception e) {
			throw new RuntimeException("更新每天凌晨的签到信息（投票）方法出现异常",e);
		}
		
	}
	//根据手机或邮箱查询id
	@Override
	public String getTelByTelOrEmail(String username) {
		try {
			return userDao.findUserHonorByUsername(username);
			
		} catch (Exception e) {
			throw new RuntimeException("根据手机或邮箱查询id方法出现异常",e);
		}
	}
	//根据id修改密码
	@Override
	public String resetPsw(String id, String password) {
		try {
			if(password.length()<6||password.length()>18){
				return "密码长度为6到18";
			}
			if(id==null||id.equals("")){
				return "找不到账户，请重新操作";
			}
			userDao.resetPsw(id,MD5.getMD5(password));
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("根据id修改密码方法出现异常",e);
		}
	}
	//******************************************前台**********************TODO*********************************************
	//保存个人基本信息
	@Override
	public String saveBaseMb(FaUser fu) {
		try {
			if(fu.getFa_username()==null||fu.getFa_username().equals("")){
				return "用户名不能为空";
			}
			if(fu.getFa_username().length()<3 || fu.getFa_username().length()>20){
				return "用户名长度为3到20位";
			}
			boolean numeric = UserNameUtil.isNumeric(fu.getFa_username());
			if(numeric){
				return "用户名不能由纯数字组成";
			}
			if(fu.getFa_username().indexOf("@") != -1){  
				return "用户名不能包含@字符串";
			} 
			//查询用户名是否重复
			Long count =userDao.getCountByUsernameAndMyId(fu.getFa_id(),fu.getFa_username());
			if(count>0){
				return "用户名重复";
			}
			Integer version = userDao.getVersionById(fu.getFa_id());
			fu.setVersion(version);
			userDao.saveBaseMb(fu);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("保存个人基本信息方法出现异常",e);
		}
	}
	///保存个人职业信息
	@Override
	public String saveJobMb(FaUser fu) {
		try {
			Integer version = userDao.getVersionById(fu.getFa_id());
			fu.setVersion(version);
			userDao.saveJobMb(fu);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("//保存个人职业信息方法出现异常",e);
		}
	}
	//保存个人活动信息
	@Override
	public String saveActiveMb(FaUser fu) {
		try {
			Integer version = userDao.getVersionById(fu.getFa_id());
			fu.setVersion(version);
			userDao.saveActiveMb(fu);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("//保存个人活动信息方法出现异常",e);
		}
	}
	//查询我绑定的用户组
	@Override
	public List<Map<String, Object>> getGroupsByUserId(String fa_id) {
		try {
			return groupsDao.getGroupsByUserId(fa_id);
		} catch (Exception e) {
			throw new RuntimeException("查询我绑定的用户组方法出现异常",e);
		}
	}
	//根据会员id,查询标签
	@Override
	public List<Integer> getLabelIdByUserId(String fa_id) {
		try {
			return labelDao.getLabelIdByUserId(fa_id);
		} catch (Exception e) {
			throw new RuntimeException("根据会员id,查询标签方法出现异常",e);
		}
	}
	//绑定标签
	@Override
	public String bindLabel(String id, Integer[] ids) {
		try {
			
			labelDao.deleteLabelByUserId(id);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			List<Map<String, Object>> list = new ArrayList<>();
			if(ids!=null && ids.length>0){
				for (Integer inid : ids) {
					String code = sdf.format(new Date())+RandomTools.getRandomString(6);
					Map<String, Object> map = new HashMap<>();
					map.put("code", code);
					map.put("id", id);
					map.put("inid", inid);
					list.add(map);
				}
				labelDao.saveUserAndLabel(list);
			}
			
			//return labelDao.getLabelIdByUserId(fa_id);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("绑定标签方法出现异常",e);
		}
	}
	//更新隐藏好友列表信息
	@Override
	public String saveFriendState(String id, Integer friendType) {
		try { 
			Integer version = userDao.getVersionById(id);
			userDao.saveFriendState(id,friendType,version);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("更新隐藏好友列表信息方法出现异常",e);
		}
	}
	//保存密保
	@Override
	public String saveMibaoByid(FaUser fu) {
		try { 
			Integer version = userDao.getVersionById(fu.getFa_id());
			fu.setVersion(version);
			userDao.saveMibaoById(fu);
			
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("更新隐藏好友列表信息方法出现异常",e);
		}
	}
	//查询该用户的用户组
	@Override
	public List<String> getGroupByUserId(String id) {
		try { 
			
			
			return groupsDao.getGroupNameByUserId(id);
		} catch (Exception e) {
			throw new RuntimeException("更新隐藏好友列表信息方法出现异常",e);
		}
	}
	//查询会员是否需要验证
	@Override
	public Integer isVcodeForUser(Integer fa_rank) {
		try { 
			
			
			FaRank fk = rankDao.get(fa_rank);
			return fk.getFa_rev();
		} catch (Exception e) {
			throw new RuntimeException("更新隐藏好友列表信息方法出现异常",e);
		}
	}
	//查询会员是否需要验证
	@Override
	public Integer isVcodeForUserNote(Integer fa_rank) {
		try { 
			
			
			FaRank fk = rankDao.get(fa_rank);
			return fk.getFa_notev();
		} catch (Exception e) {
			throw new RuntimeException("更新隐藏好友列表信息方法出现异常",e);
		}
	}
	//判断用户名是否重复
	@Override
	public String usernameIsTrue(String username) {
		try { 
			boolean numeric = UserNameUtil.isNumeric(username);
			if(numeric){
				return  "昵称不能由纯数字组成";
			}
			if(username.indexOf("@") != -1){  
				return "昵称不能包含@字符串";
			} 
			//查询用户名是否重复
			Long count =userDao.validateUserNameIsTrue(username);
			if(count>0){
				
				return "该昵称已被使用";
			}else{
				return "success";
			}
			
		} catch (Exception e) {
			throw new RuntimeException("判断用户名是否重复",e);
		
		}
	}
	
	
	
	
}
