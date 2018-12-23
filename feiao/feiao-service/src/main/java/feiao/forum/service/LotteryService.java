package feiao.forum.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import feiao.forum.pojo.FaLotteryPrice;

public interface LotteryService {
	//根据id 查询奖品信息
	FaLotteryPrice getPrizeById(Integer id);
	//增加奖品
	String addPrizeData(FaLotteryPrice flp);
	//修改奖品
	String updatePrizeData(FaLotteryPrice flp);
	//删除奖品
	Integer deletePrizeData(Integer id);
	//展示奖品信息
	List<FaLotteryPrice> getAllPrize();
	//分页展示奖品兑换信息
	List<Map<String, Object>> getLotteryMsgByPage(Integer curpage, Integer pagesize, Date ss, Date ee,
			Integer prizeType);
	//奖品兑换信息个数
	Long getTotalByLotteryMsg(Date ss, Date ee, Integer prizeType);
	//确认兑奖
	Integer surePrize(String id);
	//取消兑奖
	Integer cancelPrize(String id);

}
