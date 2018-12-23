package feiao.forum.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaLotteryDate;

@Repository
public interface FaLotteryDateDao {
	//分页展示奖品兑换信息
	List<Map<String, Object>> getLotteryMsgByPage(@Param("curpage")Integer curpage, @Param("pagesize")Integer pagesize, @Param("ss")Date ss, @Param("ee")Date ee,
			@Param("prizeType")Integer prizeType);
	//奖品兑换信息个数
	Long getTotalByLotteryMsg(@Param("ss")Date ss, @Param("ee")Date ee, @Param("prizeType")Integer prizeType);
	//确认兑奖
	Integer surePrize(String id);
	//取消兑奖
	Integer cancelPrize(String id);
	//加载抽奖信息数据
	List<Map<String, Object>> showMyLotteryData(String fa_id, Integer curpage, Integer pagesize);
	//加载抽奖信息数量
	Long showMyLotteryCount(String fa_id);
	//更新抽奖中的联系人信息
	void updateAdressById(String fa_id, String id, String string);
	//最新抽奖记录
	List<Map<String, Object>> getLotteryUserMsg();
	//生成奖品记录表
	void saveFld(FaLotteryDate fld);
	//根据id查询信息
	FaLotteryDate getFld(String id);
	//查询当天抽奖次数
	Long findLotteryTimes(Date st, Date et);
	//查询该会员当天的抽奖次数
	Long findMemLotteryTimes(Date st, Date et, String fa_id);
}
