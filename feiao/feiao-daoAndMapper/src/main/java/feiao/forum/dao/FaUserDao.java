package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.ibatis.annotations.Param;
import org.junit.runners.Parameterized.Parameters;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaLoginEmail;
import feiao.forum.pojo.FaUser;

@Repository
public interface FaUserDao {
	//根据积分范围更新用户等级信息
	void updateMbByInte(Integer fa_id,Integer fa_start, Integer fa_end);
	//根据手机邮箱或者登录名查询账户id
	String findUserHonorByUsername(String username);
	//根据手机邮箱查询账户手机
	String findTelByUsername(String username);
	//查询会员总数
	Long getTotalByMember(@Param("search")String search, @Param("rankid")Integer rankid, @Param("groupid")Integer groupid, @Param("telid")String telid);
	//分页展示会员信息
	List<Map<String, Object>> getMemberByPage(@Param("curpage")Integer curpage, @Param("search")String search, @Param("pagesize")Integer pagesize, @Param("rankid")Integer rankid, @Param("groupid")Integer groupid, @Param("telid")String telid);
	//验证登录名是否重复
	Long validateUserNameIsTrue(String username);
	//验证手机是否重复
	Long validateTelIsTrue(String tel);
	//验证邮箱是否重复
	Long validateEmailIsTrue(String email);
	//增加会员
	void addMember(FaUser fu);
	//根据id查询会员信息
	FaUser getMemberById(String id);
	//根据id查询会员的乐观锁
	Integer getVersionById(String fa_id);
	//修改会员
	void updateMember(FaUser fu);
	//删除会员
	void deleteMemberData(String[] ids);
	//验证手机是否重复不包括自己
	Long validateTelIsTrueMe(String tel, String id);
	//验证邮箱是否重复不包括自己
	Long validateEmailIsTrueMe(String email, String id);
	//根据条件查询会员邮箱
	List<String> getEmailByTerms(@Param("rankid")Integer rankid, @Param("groupid")Integer groupid, @Param("labelid")Integer labelid, @Param("telid")Integer telid);
	//根据分类组合查询会员id
	List<String> getUserIdByTerms(@Param("rankid")Integer rankid, @Param("groupid")Integer groupid, @Param("labelid")Integer labelid, @Param("telid")Integer telid);
	//分页展示版主信息
	List<Map<String, Object>> getModeratorByPage(@Param("curpage")Integer curpage, @Param("search")String search, @Param("pagesize")Integer pagesize, @Param("isMo")Integer isMo, @Param("oneMo")Integer oneMo);
	//查询版主数量
	Long getTotalByModerator(@Param("search")String search, @Param("isMo")Integer isMo,@Param("oneMo")Integer oneMo);
	//根据手机和邮箱验证会员是否存在
	Long selectUserByTelOrEmail(String userId);
	//增加版主
	void addModerator(String str, Integer typeMo, Integer oneMo);
	//根据手机邮箱或者登录名查询账户id和版主信息 
	Map<String, Object> findUserIdAndMoByUsername(String userId);
	//删除版主
	Integer deleteModerator(String[] ids);
	//根据id 查询会员昵称
	String getNameByUserId(String id);
	//根据手机和邮箱名称查询会员信息
	FaUser getUserByTelAndEmail(String username);
	//保存邮箱注册信息
	Long getCountByEmailRe(String email);
	void updateEmailRe(String email, String md5);
	void saveEmailRe(String email, String md5);
	//根据id查询code
	FaLoginEmail getEmailRe(String email);
	//删除邮箱注册表
	void deleteEmailRe(String email);
	//根据id修改密码
	void resetPsw(String id, String md5);
	//保存个人基本信息
	void saveBaseMb(FaUser fu);
	//保存个人职业信息
	void saveJobMb(FaUser fu);
	//保存个人活动信息
	void saveActiveMb(FaUser fu);
	//更新积分与飞镖的信息
	void updateByInteAndFeiBiao(FaUser fu);
	//更新隐藏好友列表信息
	void saveFriendState(String id, Integer friendType, Integer version);
	//更新用户提醒信息
	void UpdateUserIgnore(String id, String ids, Integer version);
	//更新头像
	void setImageById(String fa_id, String imageUrl);
	//密码修改密码
	void setPswByPsw(String fa_id, String md5, Integer version);
	//更新邮箱
	void setEmail(String fa_id, String email, Integer version);
	//更新手机
	void setTel(String fa_id, String tel, Integer version);
	//保存密保
	void saveMibaoById(FaUser fu);
	//分页查询我搜索会员信息
	List<Map<String, Object>> getMemberBySearchAndPage(@Param("curpage")Integer curpage, @Param("pagesize")Integer pagesize, @Param("username")String username,
			@Param("syncbbs")Integer syncbbs, @Param("tel")String tel, @Param("email")String email, @Param("sex")Integer sex, @Param("lifeplace")Integer lifeplace);
	//分页查询我搜索会员信息数量
	Long selectMyFriendCount(@Param("username")String username, @Param("syncbbs")Integer syncbbs, @Param("tel")String tel, @Param("email")String email, @Param("sex")Integer sex,
			@Param("lifeplace")Integer lifeplace);
	//模糊查询我的好友信息
	List<Map<String, Object>> searchMemberByVague(String fa_id, String username);
	//改变是否屏蔽非好友信息
	void changeFriendMsgType(String fa_id, Integer isFriendMsg);
	//根据id 查询忽略人的信息
	String getIgonreIdSById(String id);
	//查询用户名是否重复
	Long getCountByUsernameAndMyId(String fa_id, String fa_username);
	//更新用户等级
	void updateMemberRank(String fa_id, Integer fa_rank);
	

}
