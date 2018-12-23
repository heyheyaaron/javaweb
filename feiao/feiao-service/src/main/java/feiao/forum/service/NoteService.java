package feiao.forum.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import feiao.forum.pojo.FaComment;
import feiao.forum.pojo.FaConMsg;
import feiao.forum.pojo.FaNote;
import feiao.forum.pojo.FaUser;
import feiao.forum.pojo.FaUserVote;

public interface NoteService {
	//查询发帖数量
	Long selectMyNoteCount(String fa_id);
	//查询评论数量
	Long selectMymyAnswerCount(String fa_id);
	//分页查询会员发表的帖子
	List<Map<String, Object>> selectMemberNote(String id, Integer curpage, Integer pagesize);
	//分页查询会员发表的帖子
	List<Map<String, Object>> selectMemberReply(String id, Integer curpage, Integer pagesize);
	//查询回复评论数量
	Long selectMemberReply(String id);
	//分页查看用户的心情
	List<Map<String, Object>> selectMemberMood(String id, Integer curpage, Integer pagesize);
	//分页查看用户的心情数量
	Long selectMemberMoodCount(String id);
	//分页查询会员心情的回复
	List<Map<String, Object>> getMoreMoodMsg(String id, Integer curpage, Integer pagesize);
	//分页查询会员心情的回复数量
	Long getMoreMoodMsgCount(String id);
	//确认转播
	String sureReturn(HttpServletRequest request, String fa_id, Integer iscode, String pid, String desc,
			String vode, String fid);
	//确认评论
	Map<String, Object> sureReply(HttpServletRequest request, String fa_id, Integer iscode, String pid, String desc, String vode,
			String fid, String rid);
	//发送心情
	String sureSendMyGood(HttpServletRequest request, String fa_id, Integer iscode, String desc, String vode);
	//删除我的心情
	Map<String, Object> deleteMyMood(String fa_id, String id);
	//分页查询所有帖子回复的评论
	List<Map<String, Object>> selectAllCommentByNote(Integer curpage, Integer pagesize);
	//分页查询我和好友的心情
	Map<String, Object> selectFriendMood(String id, Integer curpage, Integer pagesize);
	//分页查询我和好友的心情的一个
	Map<String, Object> selectFriendMoodByOne(String id);
	//删除我的帖子
	Map<String, Object> deleteMyNote(String fa_id, String id);
	//分页查询会员收藏的帖子
	List<Map<String, Object>> selectCollectNote(String id, Integer curpage, Integer pagesize);
	//分页查询会员收藏的帖子数量
	Long selectCollectNoteCount(String id);
	//取消收藏我的帖子
	Map<String, Object> deleteMyCollect(String fa_id, String id);
	//分页查询我的帖子的回复
	List<Map<String, Object>> selectMyCommentByNote(String fa_id, Integer curpage, Integer pagesize);
	////获取板块帖子的总数
	Long getNoteCountBySectionId(Integer id);
	//查询版主信息
	List<Map<String, Object>> getUserNameBySection(Integer id);
	//查询有图帖子推荐
	List<FaConMsg> hasImageRead();
	//查询无图帖子推荐
	List<FaConMsg> noImageRead();
	//分页查询模块中的帖子
	List<Map<String, Object>> selectAllNoteBySection(Integer curpage, Integer pagesize, Integer pid, Integer types,
			Integer sort);
	//分页查询模块中的帖子数量
	Long selectAllNoteBySectionCount(Integer pid, Integer types, Integer sort);
	//签到
	String signIsTrue(FaUser fu, HttpServletRequest request);
	//是否已签到
	Integer signIsTrueOrFalse(HttpServletRequest request,FaUser fu);
	//版主修改版块信息
	String updateSectionMsg(FaUser fu, Integer nid, String desc);
	//保存主题帖子
	Map<String, Object> saveThemeNote(FaUser fu, FaNote fn, String code, Integer iscode, HttpServletRequest request, String[] details);
	//查询帖子的评论数
	Long findCountByNoteId(String fa_id);
	Long findCountByNoteIds(String fa_id);
	//分页查询该帖子的评论
	List<Map<String, Object>> selectNoteComment(String id, Integer curpage, Integer pagesize);
	//查询该楼层前面有多少条数据
	Long getCountByCeng(Integer floor, String id);
	//发表回复
	String createCommentByNote(FaUser fu, FaComment fc, String code, Integer iscode, HttpServletRequest request);
	//今天发帖数
	Long getCountByToday();
	//查询热帖
	List<Map<String, Object>> getHotNote();
	//查询推荐贴
	List<Map<String, Object>> getTjNote();
	//更新帖子的阅读数
	void updateReadCount(String id);
	//支持或者反对
	String trueOrFalseByNote(FaUser fu, String id, Integer tof, HttpServletRequest request);
	//支持 && 反对数量
	Long getCountTofById(String fa_id, Integer i);
	//高亮帖子
	void glNoteData(String ids, Integer types);
	//热搜帖子
	void rsNoteData(String ids, Integer types);
	//置顶帖子
	void zdNoteData(String ids, Integer types);
	//精华帖子
	void jhNoteData(String ids, Integer types, HttpServletRequest request);
	//移动帖子
	void moveNoteData(String ids, Integer typeid);
	//标签帖子
	void biaoqianNoteData(String ids, Integer typeid);
	//升降帖子
	void udNoteData(String ids, Integer typeid);
	//报名
	String myjoin(String nid, FaUser fu, Integer total);
	//获取该板块的子版块信息
	List<Map<String, Object>> getSectionByPid(Integer fa_id);
	//查询我的投票记录
	List<FaUserVote> getUserVoteByNoteIdAndUserid(String fa_id, String fa_id2);
	//投票
	String tijiaovote(FaUser fu, String[] bbss, String nid, Integer dod, HttpServletRequest request);
	//查询主页右侧最新活动
	List<Map<String, Object>> getHdNote(Integer id);
	//处理反馈帖子
	void updateNoteDealStatus(String id, Integer status);
	//修改主题帖子
	Map<String, Object> updateThemeNote(FaUser fu, FaNote fn, String code, Integer iscode, HttpServletRequest request,
			String[] details, String[] delids);
	//分页查询搜索中的帖子
	List<Map<String, Object>> searchNoteBySearchName(Integer curpage, Integer pagesize, String search);
	//分页查询搜索中的帖子数量
	Long searchNoteBySearchNameCount(String search);
	//分页查询反馈模块中的帖子
	List<Map<String, Object>> selectFankuiNoteBySection(Integer curpage, Integer pagesize, Integer protype,
			Integer prostyle, Integer proquest, Integer handletype);
	//分页查询反馈模块中的帖子数量
	Long selectFankuiNoteBySectionCount(Integer protype, Integer prostyle, Integer proquest, Integer handletype);
	//查看投票人
	List<Map<String, Object>> getVoteMemberMsgByNoteId(String fa_id);
	List<Map<String, Object>> searchNoteByMany(Integer curpage, Integer pagesize, String sname, Integer tieOrUser,
			Integer types, Integer sorts, Integer section, Date parse, Date parse2);
	Long searchNoteBySearchNameCounts(String sname, Integer tieOrUser, Integer types, Integer sorts, Integer section,
			Date st, Date et);

}
