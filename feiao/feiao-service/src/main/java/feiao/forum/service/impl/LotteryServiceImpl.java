package feiao.forum.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import feiao.forum.dao.FaLotteryDateDao;
import feiao.forum.dao.FaLotteryPriceDao;
import feiao.forum.pojo.FaLotteryPrice;
import feiao.forum.service.LotteryService;

@Service
public class LotteryServiceImpl implements LotteryService{
	@Autowired
	private FaLotteryPriceDao flpDao;
	@Autowired
	private FaLotteryDateDao fldDao;
	//根据id 查询奖品信息
	@Override
	public FaLotteryPrice getPrizeById(Integer id) {
		try {
			
			return flpDao.getPrizeById(id);
		} catch (Exception e) {
			throw new RuntimeException("根据id 查询奖品信息方法出现异常",e);
		}
	}
	//增加奖品
	@Override
	public String addPrizeData(FaLotteryPrice flp) {
		try {
			if(flp.getFa_name()==null || flp.getFa_name().equals("")){
				return "奖品名字不能为空";
			}
			if(flp.getFa_num()==null || flp.getFa_num().equals("")){
				return "奖品数量不能为空";
			}
			if(flp.getFa_percent()==null || flp.getFa_percent().equals("")){
				return "奖品概率不能为空";
			}
			if(flp.getFa_sort()==null || flp.getFa_sort().equals("")){
				return "奖品排序不能为空";
			}
			if(flp.getFa_num()<1 || flp.getFa_num()>999){
				return "奖品数量范围为1~999";
			}
			if(flp.getFa_percent()<1 || flp.getFa_percent()>999999){
				return "奖品概率范围为1~999999";
			}
			if(flp.getFa_sort()<0 || flp.getFa_sort()>999){
				return "奖品排序范围为0~999";
			}
			flpDao.savePrize(flp);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加奖品方法出现异常",e);
		}
	}
	//修改奖品
	@Override
	public String updatePrizeData(FaLotteryPrice flp) {
		try {
			if(flp.getFa_name()==null || flp.getFa_name().equals("")){
				return "奖品名字不能为空";
			}
			if(flp.getFa_num()==null || flp.getFa_num().equals("")){
				return "奖品数量不能为空";
			}
			if(flp.getFa_percent()==null || flp.getFa_percent().equals("")){
				return "奖品概率不能为空";
			}
			if(flp.getFa_sort()==null || flp.getFa_sort().equals("")){
				return "奖品排序不能为空";
			}
			if(flp.getFa_num()<1 || flp.getFa_num()>999){
				return "奖品数量范围为1~999";
			}
			if(flp.getFa_percent()<1 || flp.getFa_percent()>999999){
				return "奖品概率范围为1~999";
			}
			if(flp.getFa_sort()<0 || flp.getFa_sort()>999){
				return "奖品排序范围为0~999";
			}
			flpDao.updatePrize(flp);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改奖品方法出现异常",e);
		}
	}
	//删除奖品
	@Override
	public Integer deletePrizeData(Integer id) {
		try {
			
			flpDao.deletePrizeById(id);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("删除奖品方法出现异常",e);
		}
	}
	//展示奖品信息
	@Override
	public List<FaLotteryPrice> getAllPrize() {
		try {
			
			return flpDao.getAllPrize();
		} catch (Exception e) {
			throw new RuntimeException("展示奖品信息方法出现异常",e);
		}
	}
	//分页展示奖品兑换信息
	@Override
	public List<Map<String, Object>> getLotteryMsgByPage(Integer curpage, Integer pagesize, Date ss, Date ee,
			Integer prizeType) {
		try {
			curpage = (curpage-1)*pagesize;
			return fldDao.getLotteryMsgByPage(curpage,pagesize,ss,ee,prizeType);
		} catch (Exception e) {
			throw new RuntimeException("分页展示奖品兑换信息方法出现异常",e);
		}
	}
	//奖品兑换信息个数
	@Override
	public Long getTotalByLotteryMsg(Date ss, Date ee, Integer prizeType) {
		try {
			
			return fldDao.getTotalByLotteryMsg(ss,ee,prizeType);
		} catch (Exception e) {
			throw new RuntimeException("奖品兑换信息个数方法出现异常",e);
		}
	}
	//确认兑奖
	@Override
	public Integer surePrize(String id) {
		try {
			fldDao.surePrize(id);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("确认兑奖方法出现异常",e);
		}
	}
	////取消兑奖
	@Override
	public Integer cancelPrize(String id) {
		try {
			
			fldDao.cancelPrize(id);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("取消兑奖方法出现异常",e);
		}
	}

}
