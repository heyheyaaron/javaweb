package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import feiao.forum.pojo.Column;
import feiao.forum.pojo.Resource;

@Repository
public interface ResourceDao {
	//根据code主键获取资源
	Resource get(Integer code);
	//查询所有资源
	List<Map<String, Object>> selectAllReasource();
	//查询所有资源,不包括栏目
	List<Map<String, Object>> selectAllReasourceNo();
	//查询该权限子权限的个数
	Long getResourceCidCount(Integer id);
	//删除权限
	void deleteResource(Integer id);
	//增加权限
	void addResource(Resource re);
	//修改权限
	void updateResource(Resource re);
	//查询所有资源不展示栏目管理的内容和功能
	List<Map<String, Object>> selectAllReNoBtn();
	//查询所有资源不包括功能按钮
	List<Map<String, Object>> selectAllRes();
	//修改栏目url
	void updateResourceUrl(Integer id, String string);
	//新增栏目的内容
	void saveColumnByReId(Column col);
	//修改固定栏目
	void updateColumnBySys(Integer id, String name, Integer sort);
	//修改自创栏目
	void updateColumnByMySelf(Resource re);
	//修改栏目内容
	void updateColumnByReId(Column col);
	//删除栏目文章
	void deleteColumn(Integer id);
	//根据栏目id查询文章
	Column getColumnById(Integer id);

}
