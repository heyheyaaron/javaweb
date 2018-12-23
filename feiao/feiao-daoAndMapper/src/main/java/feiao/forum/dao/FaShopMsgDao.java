package feiao.forum.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaShopMsg;

@Repository
public interface FaShopMsgDao {
	//分页展示商品数据
	List<Map<String, Object>> getShopMsgByPage(@Param("curpage")Integer curpage, @Param("pagesize")Integer pagesize, @Param("ss")Date ss, @Param("ee")Date ee, @Param("prizeType")Integer prizeType);
	//分页展示商品数据的数量
	Long getTotalByShopMsg(@Param("ss")Date ss, @Param("ee")Date ee, @Param("prizeType")Integer prizeType);
	//根据主键查询商品订单
	FaShopMsg getFSMById(String id);
	//改变订单状态
	void changeType(String id, Integer i);
	//归还飞镖
	void returnInteForUser(String fa_userid, Integer i, Integer version);
	//加载兑换奖品信息
	List<Map<String, Object>> showMyShopData(String fa_id, Integer curpage, Integer pagesize);
	//加载兑换奖品数量
	Long showMyShopCount(String fa_id);
	//生成兑换订单
	void saveFsm(FaShopMsg fsm);

}
