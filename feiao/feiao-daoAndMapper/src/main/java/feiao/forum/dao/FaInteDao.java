package feiao.forum.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaInte;

@Repository
public interface FaInteDao {
	//查询该会员积分记录表(后台)
	List<Map<String, Object>> getMemberInteByPage(@Param("curpage")Integer curpage, @Param("pagesize")Integer pagesize, @Param("ss")Date ss,@Param("ee")Date ee, @Param("userId")String userId);
	//查询该会员积分记录表总数(后台)
	Long getTotalByMemberInte(@Param("ss")Date ss, @Param("ee")Date ee, @Param("userId")String userId);
	//批量保存保存
	void saveFaInte(List<FaInte> lfi);
	//查询该会员积分记录表（前台）
	List<Map<String, Object>> getFiioerInteByPage(@Param("curpage")Integer curpage, @Param("pagesize")Integer pagesize, @Param("ss")Date ss,@Param("ee")Date ee, @Param("userId")String userId, @Param("types")Integer types,
			@Param("buyOrSelf")Integer buyOrSelf);
	//查询该会员积分记录表总数（前台）
	Long getTotalByFiioerInte(@Param("ss")Date ss, @Param("ee")Date ee, @Param("userId")String userId, @Param("types")Integer types, @Param("buyOrSelf")Integer buyOrSelf);

}
