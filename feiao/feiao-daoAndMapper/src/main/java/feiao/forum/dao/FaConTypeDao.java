package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaConType;

@Repository
public interface FaConTypeDao {
	//根据id查询内容分类信息
	FaConType get(Integer id);
	//增加内容分类
	void addConType(FaConType faConType);
	//修改内容分类
	void updateConType(FaConType faConType);
	//删除内容分类
	void deleteConType(Integer id);
	//异步加载所有内容分类信息
	List<FaConType> getAllConType();
	//查询标签下有没有内容
	Long findCountByTypeCid(Integer id);
	//异步加载内容分类的内容树
	List<Map<String, Object>> loadConmsgTree();
	//查询标签下有没有子标签
	Long findCountByTypebid(Integer id);
}
