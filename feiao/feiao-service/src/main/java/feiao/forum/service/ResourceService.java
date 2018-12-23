package feiao.forum.service;

import java.util.List;
import java.util.Map;

import feiao.forum.pojo.Column;
import feiao.forum.pojo.Resource;


public interface ResourceService {
	//查询所有资源
	List<Map<String, Object>> selectAllReasource();
	//查询所有资源不包括栏目
	List<Map<String, Object>> selectAllReasourceNo();
	//删除权限
	String deleteResourceData(Integer id);
	//增加权限
	String addResourceData(Resource re);
	//根据id获取资源
	Resource getResourceById(Integer id);
	//修改权限
	String updateResourceData(Resource resource);
	//查询所有资源不包括栏目和功能
	List<Map<String, Object>> selectAllReNoBtn();
	//查询所有资源不包括功能按钮
	List<Map<String, Object>> selectAllRes();
	//增加栏目
	String addColumnData(Resource re, Column col);
	//修改栏目
	String updateColumnData(Resource resource, Column col);
	//删除栏目
	String deleteColumnData(Integer id);
	//根据栏目id查询文章
	Column getColumnById(Integer id);

}
