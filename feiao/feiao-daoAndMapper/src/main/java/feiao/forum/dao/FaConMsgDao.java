package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaConMsg;
import feiao.forum.pojo.FaConType;

@Repository
public interface FaConMsgDao {
	//异步加载该分类下的内容
	List<Map<String, Object>> getConMsgByPage(Integer curpage, Integer pagesize, Integer id);
	//异步加载该分类下的内容数量
	Long getCountByPid(Integer id);
	//根据id查询内容信息
	FaConMsg getFCMForId(String bid);
	//增加
	void saveConMsg(FaConMsg fl);
	//修改内容
	void updateConMsg(FaConMsg fl);
	//删除内容
	void deleteConMsg(String[] ids);
	//异步加载内容分类的没有子元素的数据
	List<Map<String, Object>> selectAllMsgByCid();
	//查询首页版头信息
	List<Map<String, Object>> findIndexHead();
	//查询首页版尾通用信息
	List<Map<String, Object>> findIndexEndNor();
	//查询首页版尾公司信息
	List<Map<String, Object>> findIndexEndCom();
	//查询首页banner图
	List<Map<String, Object>> findIndexBanner();
	//查询微博
	Map<String, Object> findIndexWB();
	//查询微信
	Map<String, Object> findIndexWX();
	//查询QQ
	Map<String, Object> findIndexQQ();
	//查询会员底部信息
	List<Map<String, Object>> findlistMbEnd();
	//根据pid 查询内容编辑信息
	List<FaConMsg> findAllContentByPid(Integer i);
	
}
