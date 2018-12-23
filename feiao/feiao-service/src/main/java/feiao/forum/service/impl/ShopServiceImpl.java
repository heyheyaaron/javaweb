package feiao.forum.service.impl;

import java.io.FileInputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import feiao.forum.dao.FaGoodsDao;
import feiao.forum.dao.FaInteDao;
import feiao.forum.dao.FaLotteryDateDao;
import feiao.forum.dao.FaLotteryPriceDao;
import feiao.forum.dao.FaShopMsgDao;
import feiao.forum.dao.FaUserDao;
import feiao.forum.dao.FaUserViceDao;
import feiao.forum.pojo.FaGoods;
import feiao.forum.pojo.FaInte;
import feiao.forum.pojo.FaLotteryDate;
import feiao.forum.pojo.FaLotteryPrice;
import feiao.forum.pojo.FaShopMsg;
import feiao.forum.pojo.FaUser;
import feiao.forum.service.Constant;
import feiao.forum.service.ShopService;
import feiao.forum.service.util.FeiaoDataMsg;
@Service
public class ShopServiceImpl implements ShopService{
	//商品
	@Autowired
	private FaGoodsDao fgDao;
	//商品记录
	@Autowired
	private FaShopMsgDao fsmDao;
	//会员
	@Autowired
	private FaUserDao userDao;
	//会员积分记录
	@Autowired
	private FaInteDao fiDao;
	@Autowired
	private FaInteDao inteDao;
	@Autowired
	private FaLotteryPriceDao flpDao;
	@Autowired
	private FaLotteryDateDao fldDao;
	//根据id查询商品信息
	@Override
	public FaGoods getGoodById(Integer id) {
		try {
			
			return fgDao.getGoodById(id);
		} catch (Exception e) {
			throw new RuntimeException("根据id查询商品信息方法出现问题",e);
		}
	}
	//增加商品
	@Override
	public String addGoodData(FaGoods fg) {
		try {
			if(fg.getFa_name()==null){
				return "商品名称不能为空";
			}
			if(fg.getFa_num()==null){
				return "兑换价格不能为空";
			}
			if(fg.getFa_cost()==null){
				return "库存量不能为空";
			}
			if(fg.getFa_num()<1||fg.getFa_num()>999999999){
				return "价格范围为1~999999999";
			}
			if(fg.getFa_cost()<1||fg.getFa_cost()>999999999){
				return "库存范围为1~999999999";
			}
			if(fg.getFa_starttime()!=null && fg.getFa_endtime()==null){
				return "请填写结束日期";
			}
			if(fg.getFa_starttime()==null && fg.getFa_endtime()!=null){
				return "请填写开始日期";
			}
			if(fg.getFa_islong().equals(1)){
				if(fg.getFa_starttime()!=null && fg.getFa_endtime()!=null){
					if(fg.getFa_endtime().getTime()<fg.getFa_starttime().getTime()){
						return "开始时间不能大于结束时间，请重新输入";
					}
				}
			}
			
			fgDao.saveGood(fg);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加商品方法出现问题",e);
		}
	}
	//修改商品
	@Override
	public String updateGoodData(FaGoods fg) {
		try {
			if(fg.getFa_name()==null){
				return "商品名称不能为空";
			}
			if(fg.getFa_num()==null){
				return "兑换价格不能为空";
			}
			if(fg.getFa_cost()==null){
				return "库存量不能为空";
			}
			if(fg.getFa_num()<1||fg.getFa_num()>999999999){
				return "价格范围为1~999999999";
			}
			if(fg.getFa_cost()<1||fg.getFa_cost()>999999999){
				return "库存范围为1~999999999";
			}
			if(fg.getFa_starttime()!=null && fg.getFa_endtime()==null){
				return "请填写结束日期";
			}
			if(fg.getFa_starttime()==null && fg.getFa_endtime()!=null){
				return "请填写开始日期";
			}
			if(fg.getFa_islong().equals(1)){
				if(fg.getFa_starttime()!=null && fg.getFa_endtime()!=null){
					if(fg.getFa_endtime().getTime()<fg.getFa_starttime().getTime()){
						return "开始时间不能大于结束时间，请重新输入";
					}
				}
			}
			fgDao.updateGood(fg);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改商品方法出现问题",e);
		}
	}
	//删除商品
	@Override
	public Integer deleteGoodData(Integer id) {
		try {
			
			fgDao.deleteGood(id);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("删除商品方法出现问题",e);
		}
	}
	//分页展示商品信息
	@Override
	public List<FaGoods> getGoodByPage(Integer curpage, String search, Integer pagesize) {
		try {
			
			return fgDao.getGoodByPage((curpage-1)*pagesize,search,pagesize);
			
		} catch (Exception e) {
			throw new RuntimeException("分页展示商品信息方法出现问题",e);
		}
	}
	//分页展示商品信息显示的总数
	@Override
	public Long getTotalByGood(String search) {
		try {
			
			return fgDao.getTotalByGood(search);
			 
		} catch (Exception e) {
			throw new RuntimeException("分页展示商品信息显示的总数方法出现问题",e);
		}
	}
	//分页展示商品数据
	@Override
	public List<Map<String, Object>> getShopMsgByPage(Integer curpage, Integer pagesize, Date ss, Date ee,
			Integer prizeType) {
		try {
			
			return fsmDao.getShopMsgByPage(curpage,pagesize,ss,ee,prizeType);
			 
		} catch (Exception e) {
			throw new RuntimeException("分页展示商品数据方法出现问题",e);
		}
	}
	//分页展示商品数据的数量
	@Override
	public Long getTotalByShopMsg(Date ss, Date ee, Integer prizeType) {
		try {
			
			return fsmDao.getTotalByShopMsg(ss,ee,prizeType);
			 
		} catch (Exception e) {
			throw new RuntimeException("分页展示商品数据的数量方法出现问题",e);
		}
	}
	//根据主键查询商品订单
	@Override
	public FaShopMsg getFSMById(String id) {
		try {
			
			return fsmDao.getFSMById(id);
			 
		} catch (Exception e) {
			throw new RuntimeException("根据主键查询商品订单方法出现问题",e);
		}
	}
	//发货/退款
	@Override
	public String changeShopData(String id, Integer type) {
		try {
			if(!type.equals(1) && !type.equals(4)){
				return "该订单状态不能操作";
			}
			//发货
			if(type.equals(1)){
				fsmDao.changeType(id,2);
			}
			//退款
			if(type.equals(4)){
				FaShopMsg fsm = fsmDao.getFSMById(id);
				FaUser user = userDao.getMemberById(fsm.getFa_userid());
				if(user!=null && user.getFa_id()!=null){
					fsmDao.returnInteForUser(fsm.getFa_userid(),user.getFa_feibiao()+fsm.getFa_cost(),user.getVersion());
					//获得会员积分记录表
					List<FaInte> lfi = new ArrayList<>();
					FaInte fid = FeiaoDataMsg.saveInteData(user.getFa_id(), "退款", fsm.getFa_cost(), 1, "积分商城退款操作",user.getFa_feibiao()+fsm.getFa_cost());
					lfi.add(fid);
					fiDao.saveFaInte(lfi);
				}
				
				fsmDao.changeType(id,5);
				
			}
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("发货/退款方法出现问题",e);
		}
	}
	//兑换商品
	@Override
	public String createShopGood(FaUser fu, Integer id, Integer count, String adress, HttpServletRequest request) {
		try {
			FaGoods sg = getGoodById(id);
			if(fu==null || fu.getFa_id()==null){
				return "您还没有登录，请先登录";
			}
			fu = userDao.getMemberById(fu.getFa_id());
			
			Date date = new Date();
			if(sg.getFa_islong()>0){
				if(date.getTime()<sg.getFa_starttime().getTime() || date.getTime()>sg.getFa_endtime().getTime()){
					return "兑换失败，请在该商品的兑换日期中兑换";
				}
			}
			if(fu.getFa_feibiao()<sg.getFa_cost()*count){
				return "您没有足够的飞镖兑换该商品";
			}
			fu.setFa_feibiao(fu.getFa_feibiao()-sg.getFa_cost()*count);
			userDao.updateByInteAndFeiBiao(fu);
			//飞镖日记录表
			List<FaInte> lf = new ArrayList<>();
			FaInte f1 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "兑换商品", -sg.getFa_cost()*count, 1, "兑换商品",fu.getFa_feibiao());
			lf.add(f1);
			inteDao.saveFaInte(lf);
			
			//生成兑换订单
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			FaShopMsg fsm = new FaShopMsg();
			fsm.setFa_id(sdf.format(date)+RandomStringUtils.randomNumeric(11));
			fsm.setFa_adress(adress);
			fsm.setFa_cost(sg.getFa_cost());
			fsm.setFa_goodid(sg.getFa_id());
			fsm.setFa_goodname(sg.getFa_name());
			fsm.setFa_num(count);
			fsm.setFa_time(date);
			fsm.setFa_type(1);
			fsm.setFa_userid(fu.getFa_id());
			fsmDao.saveFsm(fsm);
			request.getSession().setAttribute(Constant.SESSION_USER, fu);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("兑换商品方法出现问题",e);
		}
	}
	//抽奖
	@Override
	public String saveLotteryData(FaUser fu, Integer id, HttpServletRequest request,Integer cost,String ees, String als) {
		try {
			
			if(fu==null || fu.getFa_id()==null){
				return "您还没有登录，请先登录";
			}
			fu = userDao.getMemberById(fu.getFa_id());
			//查询奖品信息
			FaLotteryPrice ly = flpDao.getPrizeById(id);
			
			if(fu.getFa_feibiao()<cost){
				return "您的飞镖不够本次抽奖";
			}
			Date date = new Date();
			SimpleDateFormat sdfs = new SimpleDateFormat("yyyy-MM-dd");
			long zero = sdfs.parse(sdfs.format(date)).getTime();
			//获取当天时间
			//long current=System.currentTimeMillis();//当前时间毫秒数
			
	       // =current/(1000*3600*24)*(1000*3600*24)-TimeZone.getDefault().getRawOffset();//今天零点零分零秒的毫秒数
	        long twelve=zero+24*60*60*1000-1;//今天23点59分59秒的毫秒数
	        Date st = new Date(zero);
	        Date et = new Date(twelve);
	        System.err.println(zero);
	        System.err.println(twelve);
	        System.err.println(st);
	        System.err.println(et);
	        //查询当天抽奖次数
	        Long al= fldDao.findLotteryTimes(st,et);
	        System.err.println("抽奖总额："+al);
	        System.err.println("抽奖总额："+Integer.parseInt(als));
	        if(al>=Long.parseLong(als)){
	        	return "今天的奖品已经发完啦，明天再抽吧！";
	        }
	        //查询该会员当天的抽奖次数
	        Long ee = fldDao.findMemLotteryTimes(st,et,fu.getFa_id());
	        System.err.println("抽奖总额："+ee);
	        System.err.println("抽奖总额："+Integer.parseInt(ees));
	        if(ee>=Long.parseLong(ees)){
	        	return "您今天的抽奖次数已达到上限，明天再抽吧！！";
	        }
			//减会员飞镖
			fu.setFa_feibiao(fu.getFa_feibiao()-cost);
			System.err.println("减少后的飞镖："+fu.getFa_feibiao());
			//飞镖日记录表
			List<FaInte> lf = new ArrayList<>();
			FaInte f1 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "抽奖消耗", -cost, 1, "抽奖消耗",fu.getFa_feibiao());
			lf.add(f1);
			
			//获得奖品
			FaLotteryDate fld = new FaLotteryDate();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			fld.setFa_id(sdf.format(date)+RandomStringUtils.randomNumeric(11));
			fld.setFa_userid(fu.getFa_id());
			fld.setFa_time(date);
			fld.setFa_adress("");
			//判断是否奖励飞镖
			if(ly.getFa_type()>0){
				fld.setFa_isfinish(1);
				fld.setFa_name(ly.getFa_name());
			}else{
				fld.setFa_isfinish(2);
				fld.setFa_name("飞镖"+ly.getFa_num()+"个");
				fu.setFa_feibiao(fu.getFa_feibiao()+ly.getFa_num());
				System.err.println("增加后的飞镖："+fu.getFa_feibiao());
				FaInte f2 = FeiaoDataMsg.saveInteData(fu.getFa_id(), "抽奖获得", ly.getFa_num(), 1, "抽奖获得",fu.getFa_feibiao());
				lf.add(f2);
			}
			
			fldDao.saveFld(fld);
			userDao.updateByInteAndFeiBiao(fu);
			inteDao.saveFaInte(lf);
			request.getSession().setAttribute(Constant.SESSION_USER, fu);
			return "success,"+fld.getFa_id();
			 
		} catch (Exception e) {
			throw new RuntimeException("根据主键查询商品订单方法出现问题",e);
		}
	}
	//修改地址
	@Override
	public String saveLotteryAdress(FaUser fu, String id, String name, String tel, String adress) {
		try {
			if(fu==null || fu.getFa_id()==null){
				return "您还没有登录，请先登录";
			}
			if(name==null || name.equals("")){
				return "姓名不能为空";
			}
			if(tel==null || tel.equals("")){
				return "电话不能为空";
			}
			if(adress==null || adress.equals("")){
				return "地址不能为空";
			}
			FaLotteryDate fld = fldDao.getFld(id);
			if(!fld.getFa_userid().equals(fu.getFa_id())){
				return "会员身份有误";
			}
			fldDao.updateAdressById(fu.getFa_id(),fld.getFa_id(),name+"  电话："+tel+"  地址："+adress);
			return "success";
			 
		} catch (Exception e) {
			throw new RuntimeException("//修改地址方法出现问题",e);
		}
	}

}
