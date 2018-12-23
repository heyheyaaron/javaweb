package feiao.forum.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import feiao.forum.pojo.FaFriendType;
import feiao.forum.pojo.FaReceiver;
import feiao.forum.pojo.FaUser;
import feiao.forum.pojo.FaWare;

public interface CoreService {
	//查询首页版头信息
	List<Map<String, Object>> findIndexHead();
	//查询首页版尾通用信息
	List<Map<String, Object>> findIndexEndNor();
	//查询首页版尾公司信息
	List<Map<String, Object>> findIndexEndCom();
	//首页banner图
	List<Map<String, Object>> findIndexBanner();
	//查询所有父版块
	List<Map<String, Object>> findIndexModel();
	//登录
	String login(String username, String password, Integer key, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//保存邮箱注册信息
	Integer saveEmailByRe(String email, String md5);
	//注册邮箱时验证是否正确
	Integer vidEmail(String email, String code);
	//新建会员
	Integer createMember(String email, String password, HttpServletRequest request, String username);
	//会员底部信息
	List<Map<String, Object>> findlistMbEnd();
	//登录加积分
	void loginAddInteAndFeibiao(HttpServletRequest request,FaUser fu);
	
	
	
	
	//获取全部版块权限信息
	List<Map<String, Object>> getModelResource(FaUser fu);
	//根据id查询屏蔽的好友分组
	List<Map<String, Object>> getIgnoreForGroup(String fa_id);
	//查询屏蔽的好友
	List<Map<String, Object>> getIgnoreForFriends(String fa_id);
	//查询屏蔽的提醒
	List<Map<String, Object>> getIgnoreForMsg(String[] split);
	//屏蔽用户组
	String ignoreGroups(String id, String[] ids);
	//取消屏蔽指定用户
	String ignoreFriends(String[] ids);
	//屏蔽用户提醒
	String ignoreMsgs(HttpServletRequest request, String ids, String id);
	//上传用户头像
	String updateMyImage(HttpServletRequest request, String fa_id, String imageUrl);
	//密码修改密码
	String updatePswByPsw(HttpServletRequest request, HttpServletResponse response, String fa_id, String newpsw, String oripsw);
	
	//更新邮箱
	String updateEmailByEmail(HttpServletRequest request, String fa_id, String email, String codeName);
	//修改手机
	String updateTelByEmail(HttpServletRequest request, String fa_id, String tel, String codeName);
	//修改密码
	String updatePsw(HttpServletRequest request, HttpServletResponse response, String fa_id, String newpsw,
			String string);
	//新增或修改联系人
	String saveOrUpdateAdress(FaReceiver fr);
	////查询我的所有联系人
	List<FaReceiver> getAllReceiverById(String fa_id);
	//删除联系人
	String deleteAdress(String id, String fa_id);
	//查询我的所有产品
	List<Map<String, Object>> getAllProductById(String fa_id);
	//注册产品
	String registerProduct(String fa_id, String proId, HttpServletRequest request);
	//加载抽奖信息数据
	List<Map<String, Object>> showMyLotteryData(String fa_id, Integer curpage, Integer pagesize);
	//加载抽奖信息数量
	Long showMyLotteryCount(String fa_id);
	//更新抽奖中的联系人信息
	String updateLotteryAdress(String fa_id, String id, String adid);
	//加载兑换奖品信息
	List<Map<String, Object>> showMyShopData(String fa_id, Integer curpage, Integer pagesize);
	//加载兑换奖品数量
	Long showMyShopCount(String fa_id);
	//分页查询我的收听信息
	List<Map<String, Object>> selectMyFollowByPage(String fa_id, Integer curpage, Integer pagesize);
	//分页查询我的收听数量
	Long selectMyFollowCount(String fa_id);
	//取关
	String deleteMyFollow(String fa_id, String id);
	//修改备注名
	String updateMyFollow(String fa_id, String idz, String namez);
	//分页查询我的听众信息
	List<Map<String, Object>> selectMyFansByPage(String fa_id, Integer curpage, Integer pagesize);
	//分页查询我的听众数量
	Long selectMyFansCount(String fa_id);
	//关注
	String addMyFollow(String fa_id, String id);
	//查询我的所有分组信息
	List<FaFriendType> getAllGroupById(String fa_id);
	//分页查询我的好友信息数据
	List<Map<String, Object>> selectMyFriendByPage(String fa_id, Integer curpage, Integer pagesize, String searchname,
			String searchtype);
	//分页查询我的好友信息数量
	Long selectMyFriendCount(String fa_id, String searchname, String searchtype);
	//取消好友
	String deleteMyFriend(String fa_id, String id);
	//好友修改备注名
	String updateMyFriend(String fa_id, String ids, String namez);
	//设置好友分组
	String updateMyFriendType(String fa_id, String idx, String groups);
	//好友移动分组分组
	String changeMyGroups(String fa_id, String tid, String[] ids);
	//分页查询我搜索会员信息
	List<Map<String, Object>> selectMyFriendByPage(String fa_id, Integer curpage, Integer pagesize, String username,
			Integer syncbbs, String tel, String email, Integer sex, Integer lifeplace);
	//分页查询我搜索会员信息数量
	Long selectMyFriendCount(String fa_id, String username, Integer syncbbs, String tel, String email, Integer sex,
			Integer lifeplace);
	//加好友（发送消息）
	String addMyFriend(String fa_id, String id);
	//判断有没有未读信息
	Integer hasMyMsg(String fa_id);
	//查询我忽略的人的id与名称
	List<Map<String, Object>> findMyIgnoreMember(String fa_id);
	//模糊查询我的好友
	List<Map<String, Object>> searchMemberByVague(String fa_id, String username);
	//保存屏蔽的好友信息
	String saveIgnoreFriend(String fa_id, String[] users,Integer isFriendMsg);
	//查询我忽略的人的id与名称
	List<Map<String, Object>> findMyIgnoreMembers(String fa_id);
	//分页查询个人消息页面
	List<Map<String, Object>> selectMySendOrGetMsgByPage(String fa_id, Integer curpage, Integer pagesize);
	//分页查询会话信息总数
	Long selectMySendOrGetMsgCount(String fa_id);
	//忽略某个好友
	String ignoreByFriendId(String fa_id, String id);
	//批量删除对话
	String deleteSessionRoom(String fa_id, String[] ids);
	//批量已读对话
	String msgHasRead(String fa_id, String[] ids);
	//批量发送个人信息给好友
	String sendMyMsgToMyFriends(String fa_id, String[] users, String descs);
	//该会话室的内容已读
	void isReadMyFriendMsg(String fa_id, String id);
	//分页查询我和好友的消息页面
	List<Map<String, Object>> selectMyFriendAndMeMsgByPage(String mid, String fid, Integer curpage, Integer pagesize);
	//分页查询我和好友的消息数量
	Long selectMyFriendAndMeMsgByCount(String mid, String fid);
	//发送某个信息给好友
	Map<String, Object> sendMyMsgToMyOnlyFriend(String fa_id, String users, String descs);
	//删除某个消息
	Map<String, Object> deleteSessionSelfMsg(String mid, String fid, String id);
	//某条会话信息已读
	void MsgIsReadById(String id);
	//分页查询系统消息
	List<Map<String, Object>> selectSystemMsgByPage(String fa_id, Integer curpage, Integer pagesize);
	//分页查询系统消息数量
	Long selectSystemMsgCount(String fa_id);
	//批量删除系统消息
	String deleteSystemMsg(String fa_id, String[] ids);
	//批量已读系统信息
	String systemMsgHasRead(String fa_id, String[] ids);
	//分页查询我的提醒
	List<Map<String, Object>> selectRemindBypage(String fa_id, Integer curpage, Integer pagesize);
	//分页查询我的提醒数量
	Long selectRemindByCount(String fa_id);
	//删除某个提醒
	Map<String, Object> deleteSystemRemind(String fa_id, String id);
	//忽略某个提醒
	Map<String, Object> ignoreSystemRemind(HttpServletRequest request, FaUser fu, String id);
	//同意成为好友
	Map<String, Object> agreeBecomeTheFriend(String fa_id, String id);
	//拒绝成为好友
	Map<String, Object> stopBecomeTheFriend(String fa_id, String id);
	//查询是否已经关注他
	Integer isFollowToHim(String fa_id, String id);
	//查询是否已经是好友
	Integer isFriendToHim(String fa_id, String id);
	//分页查询商店信息
	List<Map<String, Object>> selectShopProByPage(Integer curpage, Integer pagesize, Integer typess);
	//分页查询商店信息数量
	Long selectShopProCount(Integer typess);
	//分页查询固件下载信息
	List<FaWare> selectFirmwareByPage(Integer curpage, Integer pagesize);
	//分页查询固件下载信息数量
	Long selectFirmwareCount();
	//最新抽奖记录
	List<Map<String, Object>> getLotteryUserMsg();
	
	
}
