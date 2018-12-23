package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaComment;

@Repository
public interface FaCommentDao {
	//查询评论数量
	Long selectMymyAnswerCount(String fa_id);
	//查询该帖子的评论数
	Long findCountByNoteId(String string);
	Long findCountByNoteIds(String string);
	//分页查询会员回复的帖子
	List<Map<String, Object>> selectMemberReply(String id, Integer curpage, Integer pagesize);
	//分页查询会员回复的帖子的评论数
	Long selectMemberReplyCount(String id);
	//分页查询会员心情的回复
	List<Map<String, Object>> getMoreMoodMsg(String id, Integer curpage, Integer pagesize);
	//分页查询会员心情的回复数量
	Long getMoreMoodMsgCount(String id);
	//保存评论
	void saveComment(FaComment fc);
	//分页查看帖子的所有内容
	List<Map<String, Object>> selectAllCommentByNote(Integer curpage, Integer pagesize);
	//批量删除评论
	void deleteComments(String id);
	//分页查看我的帖子回复的所有内容
	List<Map<String, Object>> selectMyCommentByNote(String fu_id, Integer curpage, Integer pagesize);
	//查询该帖子的最新评论
	FaComment getNewComment(String string);
	//查询该楼层前面有多少条数据
	Long getCountByCeng(Integer floor, String id);
	//根据id查询评论
	FaComment getFcById(String rid);
	//查询该帖子的数据
	List<Map<String, Object>> getCommentByPage(Integer curpage, Integer pagesize, String id);
	List<Map<String, Object>> getMoreMoodMsgs(String id, Integer curpage, Integer pagesize);

}
