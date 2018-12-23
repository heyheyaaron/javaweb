package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaSectionType;

@Repository
public interface FaSectionTypeDao {
	//异步加载该版块下的分类信息
	List<Map<String, Object>> selectAllReType(Integer id);
	//分页展示某版块分类信息
	List<Map<String, Object>> getMlTypeByPage(Integer curpage, Integer pagesize, Integer id);
	//分页展示版块分类信息的总数
	Long getTotalByMlType(Integer id);
	//根据di 查询版块分类信息
	FaSectionType getMlTypeById(String id);
	//增加版块分类
	void addMlType(FaSectionType fst);
	//修改版块分类
	void updateMlType(FaSectionType fst);
	//删除版块分类
	void deleteMlType(String id);

}
