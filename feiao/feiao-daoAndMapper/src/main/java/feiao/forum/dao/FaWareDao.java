package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import feiao.forum.pojo.FaRank;
import feiao.forum.pojo.FaWare;

@Repository
public interface FaWareDao {
	//根据id查询固件信息
	FaWare get(String id);
	//分页展示固件信息
	List<FaWare> getWareByPage(@Param("curpage")Integer curpage,@Param("pagesize")Integer pagesize,@Param("search")String search);
	//查询固件总数
	Long getTotalByWare(@Param("search")String search);
	//增加固件
	void addWare(FaWare faWare);
	//修改固件
	void updateWare(FaWare faWare);
	//删除固件
	void deleteWare(String id);
	
}
