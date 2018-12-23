package feiao.forum.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import feiao.forum.pojo.FaGroups;
import feiao.forum.pojo.FaHonor;
import feiao.forum.pojo.FaLabel;
import feiao.forum.pojo.FaMibao;
import feiao.forum.pojo.FaNote;
import feiao.forum.pojo.FaProduct;
import feiao.forum.pojo.FaRank;
import feiao.forum.pojo.FaUser;

public interface MemberService {
	//分页展示标签信息
	List<Map<String, Object>> getLabelByPage(Integer curpage, String search, Integer pagesize);
	//查询标签总数
	Long getTotalByLabel(String search);
	//根据id获取标签信息
	FaLabel getLabelById(Integer id);
	//增加标签
	String addLabelData(FaLabel fl);
	//修改标签
	String updateLabelData(FaLabel fl);
	//删除标签
	Integer deleteLabeData(Integer id);
	
	
	
	
	//根据id获取密保信息
	FaMibao getMibaoById(Integer id);
	//增加密保
	String addMibaoData(FaMibao fm);
	//修改密保
	String updateMibaoData(FaMibao fm);
	//删除密保
	Integer deleteMibaoData(Integer id);
	//异步加载所有密保信息
	List<FaMibao> getAllMibao();
	
	
	
	//分页展示勋章信息
	List<Map<String, Object>> getHonorByPage(Integer curpage, String search, Integer pagesize);
	//查询勋章总数
	Long getTotalByHonor(String search);
	//根据id获取勋章信息
	FaHonor getHonorById(Integer id);
	//增加勋章
	String addHonorData(FaHonor fh);
	//修改勋章
	String updateHonorData(FaHonor fh);
	//删除勋章
	Integer deleteHonorData(Integer id);
	//发送勋章
	String sendHonorData(FaHonor fh, String username);
	
	
	
	
	//分页展示用户组信息
	List<Map<String, Object>> getGroupsByPage(Integer curpage, String search, Integer pagesize);
	//查询用户组总数
	Long getTotalByGroups(String search);
	//根据id获取用户组信息
	FaGroups getGroupsById(Integer id);
	//增加用户组
	String addGroupsData(FaGroups fg);
	//修改用户组
	String updateGroupsData(FaGroups fg);
	//删除用户组
	Integer deleteGroupsData(Integer id);
	
	
	
	
	
	//分页展示等级信息
	List<Map<String, Object>> getRankByPage(Integer curpage, String search, Integer pagesize);
	//查询等级总数
	Long getTotalByRank(String search);
	//根据id获取等级信息
	
	FaRank getRankById(Integer id);
	//增加等级
	String addRankData(FaRank fl);
	//修改等级
	String updateRankData(FaRank fl);
	//删除等级
	Integer deleteRankData(Integer id);
	//为所有会员匹配新规则
	Integer mateRank();
	
	
	//分页展示会员信息
	List<Map<String, Object>> getMemberByPage(Integer curpage, String search, Integer pagesize, Integer rankid, Integer groupid, String telid);
	
	//查询会员总数
	Long getTotalByMember(String search, Integer rankid, Integer groupid, String telid);
	//异步加载所有会员等级
	List<FaRank> selectAllRank();
	//验证登录名是否重复
	Integer validateUserNameIsTrue(String username);
	//验证手机是否重复
	Integer validateTelIsTrue(String tel);
	//验证邮箱是否重复
	Integer validateEmailIsTrue(String email);
	//增加会员
	String addMemberData(FaUser fu, HttpServletRequest request);
	//根据id查询会员信息
	FaUser getMemberById(String id);
	//修改会员
	String updateMemberData(FaUser fu, Integer[] groups);
	//删除会员
	Integer deleteMemberData(String[] ids);
	//根据会员id查询勋章信息
	List<Map<String, Object>> getHonorByUserId(String id);
	//根据会员id查询标签信息
	List<Map<String, Object>> getLabelByUserId(String id);
	//验证手机是否重复不包括自己
	Integer validateTelIsTrueMe(String tel, String id);
	//验证邮箱是否重复不包括自己
	Integer validateEmailIsTrueMe(String email, String id);
	//异步加载所有用户组信息
	List<Map<String, Object>> getAllMbGroup();
	//根据用户id 查询该会员绑定用户组情况
	List<Integer> getGroupIdByUserId(String id);
	//异步加载所有标签信息
	List<FaLabel> getAllLabel();
	//根据条件查询会员邮箱
	List<String> getEmailByTerms(Integer rankid, Integer groupid, Integer labelid, Integer telid);
	//根据手机号或者邮箱号发送站内消息
	void sendMsg(String[] emails, String title, String descz);
	//根据分类组合群发消息
	Integer sendMsgs(Integer rankid, Integer groupid, Integer labelid, String title, String descz, Integer telid);
	//查询该会员积分记录表
	List<Map<String, Object>> getMemberInteByPage(Integer curpage, Integer pagesize, Date ss, Date ee, String userId);
	//查询该会员积分记录表总数
	Long getTotalByMemberInte(Date ss, Date ee, String userId);
	
	//删帖积分变化
	void updateDeleteTime();
	//验证邮箱积分变化
	void updateEmailTime();
	//加精积分变化
	void updateJingTime();
	//登录签到积分变化
	void updateLoginTime();
	//产品祖册积分变化
	void updateProTime();
	//发表回复积分变化
	void updateRespeakTime();
	//发帖积分变化
	void updateThemeTime();
	//设置头像积分变化
	void updateTitleTime();
	//投票积分变化
	void updateVoteTime();
	//根据手机或邮箱查询id
	String getTelByTelOrEmail(String username);
	//根据id修改密码
	String resetPsw(String id, String password);
	//保存个人基本信息
	String saveBaseMb(FaUser fu);
	//保存个人职业信息
	String saveJobMb(FaUser fu);
	//保存个人活动信息
	String saveActiveMb(FaUser fu);
	//删除某会员勋章
	String delMbHonorData(FaHonor fh, String username);
	//签到
	void updateSignTime();
	//根据条件分页查询会员积分
	List<Map<String, Object>> getFiioerInteByPage(Integer curpage, Integer pagesize, Date ss, Date ee, String id,
			Integer types, Integer buyOrSelf);
	//分页数量
	Long getTotalByFiioerInte(Date ss, Date ee, String id, Integer types, Integer buyOrSelf);
	//查询我绑定的用户组
	List<Map<String, Object>> getGroupsByUserId(String fa_id);
	//根据会员id,查询标签
	List<Integer> getLabelIdByUserId(String fa_id);
	//绑定标签
	String bindLabel(String id, Integer[] ids);
	//更新隐藏好友列表信息
	String saveFriendState(String id, Integer friendType);
	//保存密保
	String saveMibaoByid(FaUser fus);
	//查询该用户的用户组
	List<String> getGroupByUserId(String id);
	//查询会员是否需要验证
	Integer isVcodeForUser(Integer fa_rank);
	//查询会员是否需要验证
	Integer isVcodeForUserNote(Integer fa_rank);
	//判断用户名是否重复
	String usernameIsTrue(String username);
	
	

}
