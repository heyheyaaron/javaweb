package feiao.forum.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import feiao.forum.pojo.FaGoods;
import feiao.forum.pojo.FaShopMsg;
import feiao.forum.pojo.FaUser;

public interface ShopService {
	//根据id 查询商品信息
	FaGoods getGoodById(Integer id);
	//增加商品
	String addGoodData(FaGoods fg);
	//修改商品
	String updateGoodData(FaGoods fg);
	//删除商品
	Integer deleteGoodData(Integer id);
	//分页展示商品信息
	List<FaGoods> getGoodByPage(Integer curpage, String search, Integer pagesize);
	//分页展示商品信息的总数
	Long getTotalByGood(String search);
	//分页展示商品数据
	List<Map<String, Object>> getShopMsgByPage(Integer curpage, Integer pagesize, Date ss, Date ee, Integer prizeType);
	//分页展示商品数据的数量
	Long getTotalByShopMsg(Date ss, Date ee, Integer prizeType);
	//根据主键查询商品订单
	FaShopMsg getFSMById(String id);
	//发货/退款
	String changeShopData(String id, Integer type);
	//兑换商品
	String createShopGood(FaUser fu, Integer id, Integer count, String adress, HttpServletRequest request);
	//抽奖
	String saveLotteryData(FaUser fu, Integer id, HttpServletRequest request,Integer cost, String string, String string2);
	//修改地址
	String saveLotteryAdress(FaUser fu, String id, String name, String tel, String adress);

}
