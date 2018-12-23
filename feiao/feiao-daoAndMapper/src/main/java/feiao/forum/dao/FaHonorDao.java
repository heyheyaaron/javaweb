package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaHonor;

@Repository
public interface FaHonorDao {
	//根据id查询勋章信息
	FaHonor get(Integer id);
	//分页展示勋章信息
	List<Map<String, Object>> getFaHonorByPage(@Param("curpage")Integer curpage,@Param("pagesize")Integer pagesize,@Param("search")String search);
	//查询勋章总数
	Long getTotalByFaHonor(@Param("search")String search);
	//增加勋章
	void addFaHonor(FaHonor faHonor);
	//修改勋章
	void updateFaHonor(FaHonor faHonor);
	//删除勋章
	void deleteFaHonor(Integer id);
	//删除勋章与会员的关系表
	void deleteFaHonorAndUser(Integer id);
	//根据会员id和勋章ID查询之间的关系
	Long findCountByUserAndHonor(String userId, Integer fa_id);
	//绑定会员与勋章之间的关系
	void sendFaHonor(String idz, String userId, Integer fa_id);
	//根据会员id查询勋章信息
	List<Map<String, Object>> getHonorByUserId(String id);
	//查询注册勋章id
	List<Integer> finIdbycondition(Integer i);
	//删除用户绑定的某个勋章
	void deleteHonorByMbAndHr(String userId, Integer fa_id);
}
