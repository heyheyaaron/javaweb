package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaLabel;
import feiao.forum.pojo.FaTorF;

@Repository
public interface FaNoteProDao {
		//根据id查询产品类别信息
		Map<String,Object> getType(Integer id);
		//分页展示产品类别信息
		List<Map<String, Object>> getTypeByPage();
		//增加产品类别
		void addType(String name,Integer sort);
		//修改产品类别
		void updateType(Integer id,String name,Integer sort);
		//删除产品类别
		void deleteType(Integer id);
		
		//根据id查询产品型号信息
		Map<String,Object> getStyle(Integer id);
		//分页展示产品型号信息
		List<Map<String, Object>> getStyleByPage();
		//增加产品型号
		void addStyle(String name,Integer sort, Integer parentId);
		//修改产品型号
		void updateStyle(Integer id,String name,Integer sort, Integer parentId);
		//删除产品型号
		void deleteStyle(Integer id);
		
		//根据id查询产品问题信息
		Map<String,Object> getQuest(Integer id);
		//分页展示产品问题信息
		List<Map<String, Object>> getQuestByPage();
		//增加产品问题
		void addQuest(String name,Integer sort);
		//修改产品问题
		void updateQuest(Integer id,String name,Integer sort);
		//删除产品问题
		void deleteQuest(Integer id);
		List<Map<String, Object>> getStyleByPageByPid(Integer pid);
	

}
