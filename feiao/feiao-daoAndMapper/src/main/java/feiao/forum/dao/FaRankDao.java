package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import feiao.forum.pojo.FaRank;

@Repository
public interface FaRankDao {
	//根据id查询等级信息
	FaRank get(Integer id);
	//分页展示等级信息
	List<Map<String, Object>> getRankByPage(@Param("curpage")Integer curpage,@Param("pagesize")Integer pagesize,@Param("search")String search);
	//查询等级总数
	Long getTotalByRank(@Param("search")String search);
	//增加等级
	void addRank(FaRank faRank);
	//修改等级
	void updateRank(FaRank faRank);
	//删除等级
	void deleteRank(Integer id);
	//查询该等级的会员数
	Long getUserByRank(Integer id);
	//查询所有会员等级信息
	List<FaRank> getAllRank();
	//根据积分查询会员等级
	List<Integer> getRankIdByInte(Integer i);
}
