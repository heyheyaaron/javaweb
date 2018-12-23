package feiao.forum.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaSection;

@Repository
public interface FaSectionDao {
	//异步加载所有版块信息
	List<Map<String, Object>> selectAllModel();
	//根据id 查询版块信息
	FaSection getModelById(Integer id);
	//增加版块
	void saveModel(FaSection fs);
	//修改版块
	void updateModel(FaSection fs);
	//查询该版块下子版块个数
	Long getModelCidCount(Integer id);
	//删除版块
	void deleteModel(Integer id);
	//查询所有父版块
	List<Map<String, Object>> findIndexModel();
	//查询所有版块信息
	List<FaSection> getAllSection();
	//版主修改版块信息
	void updateSectionMsg(String desc, Integer nid);
	
	
	

}
