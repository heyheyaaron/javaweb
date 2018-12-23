package feiao.forum.dao;

import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaTorF;

@Repository
public interface FaTorFDao {
	//根据回复id 与用户ID查询支持或反对表
	FaTorF getFtfByUserIdAndNoteId(String fa_id, String id);
	//保存支持或反对操作
	void saveTft(FaTorF ftf);
	//更新支持或反对操作
	void updateTft(FaTorF ftf);
	//支持 && 反对数量
	Long getCountTofById(String fa_id, Integer i);
	

}
