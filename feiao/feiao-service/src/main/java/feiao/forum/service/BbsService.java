package feiao.forum.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import feiao.forum.pojo.FaNote;
import feiao.forum.pojo.FaNoteVote;
import feiao.forum.pojo.FaSection;
import feiao.forum.pojo.FaSectionType;

public interface BbsService {
	//异步加载所有版块信息
	List<Map<String, Object>> selectAllModel();
	//根据id 查询版块信息
	FaSection getModelById(Integer id);
	//增加版块
	String addModelData(FaSection fs);
	//修改版块
	String updateModelData(FaSection fs);
	//删除版块
	String deleteModelData(Integer id);
	//分页展示版主信息
	List<Map<String, Object>> getModeratorByPage(Integer curpage, String search, Integer pagesize, Integer isMo, Integer oneMo);
	//查询版主数量
	Long getTotalByModerator(String search, Integer isMo, Integer oneMo);
	//验证该会员是否存在
	Integer selectUserByTelOrEmail(String userId);
	//增加版主
	String addModeratorData(String userId, Integer typeMo, Integer oneMo);
	//修改版主
	String updateModeratorData(String id, Integer typeMo, Integer oneMo);
	//删除版主
	Integer deleteModeratorData(String[] ids);
	//分页展示帖子信息
	List<Map<String, Object>> getNoteByPage(Integer curpage, String search, Integer pagesize, Integer noteTpye,
			Integer modelid);
	//查询帖子总数
	Long getTotalByNote(String search, Integer noteTpye, Integer modelid);
	//删除帖子
	Integer deleteNoteData(String[] ids,HttpServletRequest request);
	//置顶帖子
	Integer zdNoteData(String[] ids);
	//精华帖子
	Integer jhNoteData(String[] ids);
	//高亮帖子
	Integer glNoteData(String[] ids);
	//根据id 查询帖子信息
	FaNote getNoteById(String id);
	//根据id 查询会员昵称
	String getNameByUserId(String fa_userid);
	//异步加载该版块的分类信息
	List<Map<String, Object>> selectAllReType(Integer id);
	//分页展示某版块分类信息
	List<Map<String, Object>> getMlTypeByPage(Integer curpage, Integer pagesize, Integer id);
	////分页展示版块分类信息的总数
	Long getTotalByMlType(Integer id);
	//根据di 查询版块分类信息
	FaSectionType getMlTypeById(String id);
	//增加版块分类
	String addMlTypeData(FaSectionType fst);
	//修改版块分类
	String updateMlTypeData(FaSectionType fst);
	//删除版块分类
	Integer deleteMlTypeData(String id);
	//修改帖子信息（后台）
	String updateNote(FaNote fn);
	//根据投票调查贴id信息查询调查和投票的数据
	List<Map<String, Object>> getVoteMsgByNoteId(String id);
	//异步加载活动帖的参与者信息
	List<Map<String, Object>> findAllPreMsgByNoteId(String id);
	//删除上级时间段的热搜数据
	void removeHotedData();
	//更新这个时间段的热搜数据
	void updateNewHotData();
	//根据帖子id查询绑定的标签
	List<String> getTypeNameById(String fa_id);
	//分页展示产品类别信息
	List<Map<String, Object>> getTypeByPage();
	//根据id获取产品类别信息
	Map<String, Object> getTypeById(Integer id);
	//增加产品类别
	String addTypeData(String name, Integer sort);
	//修改产品类别
	String updateTypeData(Integer id, String name, Integer sort);
	//删除产品类别
	Integer deleteTypeData(Integer id);
	//分页展示产品型号信息
	List<Map<String, Object>> getStyleByPage();
	//根据id获取产品型号信息
	Map<String, Object> getStyleById(Integer id);
	//增加产品型号
	String addStyleData(String name, Integer sort, Integer parentId);
	//修改产品型号
	String updateStyleData(Integer id, String name, Integer sort, Integer parentId);
	//删除产品型号
	Integer deleteStyleData(Integer id);
	//分页展示产品问题信息
	List<Map<String, Object>> getQuestByPage();
	//根据id获取产品问题信息
	Map<String, Object> getQuestById(Integer id);
	//增加产品问题
	String addQuestData(String name, Integer sort);
	//修改产品问题号
	String updateQuestData(Integer id, String name, Integer sort);
	//删除产品问题
	Integer deleteQuestData(Integer id);
	List<Map<String, Object>> getStyleByPageByPid(Integer pid);
	Integer deleteNoteData(String id, HttpServletRequest request, String nid);
	//查询该帖子的数据
	List<Map<String, Object>> getCommentByPage(Integer curpage, Integer pagesize, String id);
	//查询该帖子的数据数量
	Long getTotalByComment(String id);
	
	

}
