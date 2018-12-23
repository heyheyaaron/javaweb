package feiao.forum.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaLotteryPrice;

@Repository
public interface FaLotteryPriceDao {
	//根据id 查询奖品信息
	FaLotteryPrice getPrizeById(Integer id);
	//保存奖品
	void savePrize(FaLotteryPrice flp);
	//修改图片
	void updatePrize(FaLotteryPrice flp);
	//删除奖品
	void deletePrizeById(Integer id);
	//展示奖品信息
	List<FaLotteryPrice> getAllPrize();
	

}
