package feiao.forum.service;

import java.util.List;
import java.util.Map;

import feiao.forum.pojo.FaConMsg;
import feiao.forum.pojo.FaConType;

public interface ContentService {
	//根据id获取内容分类信息
	FaConType getConTypeById(Integer id);
	//增加内容分类
	String addConTypeData(FaConType fct);
	//修改内容分类
	String updateConTypeData(FaConType fct);
	//删除内容分类
	Integer deleteConTypeData(Integer id);
	//异步加载所有内容分类信息
	List<FaConType> getAllConType();
	//异步加载内容分类的内容树
	List<Map<String, Object>> loadConmsgTree();
	//异步加载该分类下的内容
	List<Map<String, Object>> getConMsgByPage(Integer curpage, Integer pagesize, Integer id);
	//异步加载该分类下的内容数量
	Long getCountByPid(Integer id);
	//根据id查询内容信息
	FaConMsg getFCMForId(String bid);
	//增加内容
	String addConMsgData(FaConMsg fl);
	//修改内容
	String updateConMsgData(FaConMsg fl);
	//删除内容
	Integer deleteConMsgData(String[] id);
	//异步加载内容分类的没有子元素的数据
	List<Map<String, Object>> selectAllMsgByCid();
	//查询微博
	Map<String, Object> findIndexWB();
	//查询微信
	Map<String, Object> findIndexWX();
	//查询QQ
	Map<String, Object> findIndexQQ();
}
