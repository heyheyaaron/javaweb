package feiao.forum.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaNote;
import feiao.forum.pojo.FaNoteActive;
import feiao.forum.pojo.FaNoteVote;
import feiao.forum.pojo.FaUserVote;

@Repository
public interface FaNoteDao {
	//分页展示帖子信息
	List<Map<String, Object>> getNoteByPage(@Param("curpage")Integer curpage, @Param("search")String search, @Param("pagesize")Integer pagesize, @Param("noteTpye")Integer noteTpye, @Param("modelid")Integer modelid);
	//查询帖子总数
	Long getTotalByNote(@Param("search")String search, @Param("noteTpye")Integer noteTpye, @Param("modelid")Integer modelid);
	//删除帖子
	void deleteNoteData(String[] ids);
	//置顶帖子
	void zdNoteData(String[] ids);
	//精华帖子
	void jhNoteData(String[] ids);
	//高亮帖子
	void glNoteData(String[] ids);
	//根据id 查询帖子信息
	FaNote getNoteById(String id);
	//修改帖子信息（后台）
	void updateNote(FaNote fn);
	//根据投票调查贴id信息查询调查和投票的数据
	List<FaNoteVote> getVoteMsgByNoteId(String id);
	//异步加载活动帖的参与者信息
	List<Map<String, Object>> findAllPreMsgByNoteId(String id);
	//更新这个时间段的热搜数据
	void updateNewHotData();
	//删除上级时间段的热搜数据
	void removeHotedData();
	//根据帖子id查询绑定的标签
	List<String> getTypeNameById(String fa_id);
	//查询发帖数量
	Long selectMyNoteCount(String fa_id);
	//分页查询会员发表的帖子
	List<Map<String, Object>> selectMemberNote(String id, Integer curpage, Integer pagesize);
	//删除我的帖子
	Integer deleteMyNote(String fa_id, String id);
	//分页查询会员收藏的帖子
	List<Map<String, Object>> selectCollectNote(String id, Integer curpage, Integer pagesize);
	//查询收藏帖子数量
	Long selectCollectNoteCount(String fa_id);
	//取消我收藏的帖子
	void deleteMyCollect(String fa_id, String id);
	//获取板块帖子的总数
	Long getNoteCountBySectionId(Integer id);
	//查询版主信息
	List<Map<String, Object>> getUserNameBySection(Integer id);
	//分页查询模块中的帖子
	List<Map<String, Object>> selectAllNoteBySection(@Param("curpage")Integer curpage, @Param("pagesize")Integer pagesize, @Param("pid")Integer pid, @Param("types")Integer types,
			@Param("sort")Integer sort);
	//分页查询模块中的帖子数量
	Long selectAllNoteBySectionCount(@Param("pid")Integer pid, @Param("types")Integer types, @Param("sort")Integer sort);
	//保存帖子
	void saveNote(FaNote fn);
	//批量保存投票信息
	void saveVoteMsg(List<Map<String, Object>> listz);
	//分页查询该帖子的评论
	List<Map<String, Object>> selectNoteComment(String id, Integer curpage, Integer pagesize);
	
	//更新楼层信息
	void updateFloor(Integer i, String fa_id,Date date);
	//今天发帖数
	Long getCountByToday(String format);
	//查询热帖
	List<Map<String, Object>> getHotNote();
	//更新帖子的阅读数
	void updateReadCount(String fa_id, Integer i, Integer fa_reading);
	//高亮帖子
	void changegl(String ids, Integer types);
	//热搜帖子
	void changers(String ids, Integer types);
	//置顶帖子
	void changezd(String ids, Integer types);
	//精华帖子
	void changejh(String ids, Integer types);
	//移动帖子
	void moveNoteData(String ids, Integer typeid);
	//标签帖子
	void biaoqianNoteData(String ids, Integer typeid);
	//升降帖子
	void udNoteData(String ids, Integer typeid);
	//查询是否已经报名
	FaNoteActive findActiveByUserId(String fa_id, String nid);
	//查询是否已经满人
	Long findCountActiveByNoteId(String nid);
	//保存参与者人数
	void saveNoteActive(FaNoteActive fna);
	//获取该板块的子版块信息
	List<Map<String, Object>> getSectionByPid(Integer fa_id);
	//查询我的投票记录
	List<FaUserVote> getUserVoteByNoteIdAndUserid(String fa_id, String fn_id);
	//查询投票信息
	FaNoteVote getVoteById(String str);
	//更新人数
	void updateCountByVote(Integer i, String string);
	//保存投票
	void insertUserVote(FaUserVote fuv);
	//处理反馈帖子
	void updateNoteDealStatus(String id, Integer status);
	//修改帖子
	void updateNotes(FaNote fn);
	//分页查询搜索中的帖子
	List<Map<String, Object>> searchNoteBySearchName(@Param("curpage")Integer curpage, @Param("pagesize")Integer pagesize, @Param("search")String search);
	//分页查询搜索中的帖子数量
	Long searchNoteBySearchNameCount(String search);
	//分页查询反馈模块中的帖子
	List<Map<String, Object>> selectFankuiNoteBySection(@Param("curpage")Integer curpage, @Param("pagesize")Integer pagesize, @Param("protype")Integer protype,
			@Param("prostyle")Integer prostyle, @Param("proquest")Integer proquest, @Param("handletype")Integer handletype);
	//分页查询反馈模块中的帖子数量
	Long selectFankuiNoteBySectionCount(@Param("protype")Integer protype, @Param("prostyle")Integer prostyle, @Param("proquest")Integer proquest, @Param("handletype")Integer handletype);
	//删除帖子投票选项
	void deleteNoteVote(String[] ids);
	//查看投票人
	List<Map<String, Object>> getVoteMemberMsgByNoteId(String fa_id);
	//删除评论
	void deleteCommentData(String id, String nid);
	//删除评论里的回复
	void deleteCommentCidData(String id, String nid);
	List<Map<String, Object>> searchNoteBySearchMany(@Param("curpage")Integer curpage, @Param("pagesize")Integer pagesize, @Param("sname")String sname, @Param("tieOrUser")Integer tieOrUser,
			@Param("types")Integer types, @Param("sorts")Integer sorts, @Param("section")Integer section, @Param("startDay")Date startDay, @Param("endDay")Date endDay);
	Long searchNoteBySearchNameCounts(@Param("sname")String sname, @Param("tieOrUser")Integer tieOrUser,
			@Param("types")Integer types, @Param("sorts")Integer sorts, @Param("section")Integer section, @Param("startDay")Date startDay, @Param("endDay")Date endDay);

}
