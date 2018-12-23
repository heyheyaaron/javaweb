package feiao.forum.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import feiao.forum.dao.FaProductDao;
import feiao.forum.dao.FaWareDao;
import feiao.forum.pojo.ErpPds;
import feiao.forum.pojo.FaHonor;
import feiao.forum.pojo.FaProduct;
import feiao.forum.pojo.FaWare;
import feiao.forum.service.ProductService;
import feiao.forum.util.RandomTools;
@Service
public class ProductServiceImpl implements ProductService {
	//会员产品
	@Autowired
	private FaProductDao proDao;
	//固件
	@Autowired
	private FaWareDao fwDao;
	
	//根据id 查询产品信息
	@Override
	public FaProduct getProById(String id) {
		try {
			
			return proDao.getProById(id);
		} catch (Exception e) {
			throw new RuntimeException("//根据id 查询产品信息方法出现异常",e);
		}
	}
	//增加产品信息
	@Override
	public String addProData(FaProduct fp) {
		try {
			if(fp.getFa_id()==null ||fp.getFa_id().equals("")){
				return "产品代号不能为空";
			}
			Long count = proDao.proIdIsTrue(fp.getFa_id());
			int i =count.intValue();
			if(i>0){
				return "该产品代号已存在";
			}
			fp.setFa_time(new Date());
			proDao.addPro(fp);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加产品信息方法出现异常",e);
		}
	}
	//修改产品信息
	@Override
	public String updateProData(FaProduct fp) {
		try {
			
			proDao.updatePro(fp);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加产品信息方法出现异常",e);
		}
	}
	//删除产品
	@Override
	public Integer deleteProData(String id) {
		try {
			//删除产品
			proDao.deletePro(id);
			//删除产品下的产品详细信息
			proDao.deleteErp(id);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("增加产品信息方法出现异常",e);
		}
	}
	//删除产品具体信息
	@Override
	public Integer deleteProErpData(Integer id) {
		try {
			//删除产品
			proDao.deleteProErp(id);
			
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("增加产品信息方法出现异常",e);
		}
	}
	//分页展示产品信息
	@Override
	public List<FaProduct> getProByPage(Integer curpage, String search, Integer pagesize) {
		try {
			
			return proDao.getProByPage((curpage-1)*pagesize, pagesize, search);
		} catch (Exception e) {
			throw new RuntimeException("//分页展示产品信息方法出现异常",e);
		}
	}
	//查询总数
	@Override
	public Long getTotalByPro(String search) {
		try {
			
			return proDao.getTotalByPro(search);
		} catch (Exception e) {
			throw new RuntimeException("//分页展示产品信息方法出现异常",e);
		}
	}
	//分页展示产品具体信息
	@Override
	public List<Map<String, Object>> getProErpByPage(Integer curpage, String id, Integer pagesize) {
		try {
			
			return proDao.getProErpByPage((curpage-1)*pagesize,id, pagesize);
		} catch (Exception e) {
			throw new RuntimeException("分页展示产品具体信息方法出现异常",e);
		}
	}
	//查询该型号总数
	@Override
	public Long getTotalByProErp(String id) {
		try {
			
			return proDao.getTotalByProErp(id);
		} catch (Exception e) {
			throw new RuntimeException("/查询该型号总数方法出现异常",e);
		}
	}
	//导入产品信息
	@Override
	public String excelToPro(List<Map<Integer, Object>> list) {
		try {
			List<ErpPds> lep = new ArrayList<>();
			for (Map<Integer, Object> map : list) {
				ErpPds ep = new ErpPds();
				ep.setWLM(map.get(0).toString());
				ep.setFWMM(map.get(1).toString());
				ep.setPRDNO(map.get(2).toString());
				lep.add(ep);
			}
			proDao.allSave(lep);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("导入产品信息方法出现异常",e);
		}
	}
	//异步加载所有手机型号信息
	@Override
	public List<Map<String, Object>> getAllPro() {
		try {
			
			return proDao.getAllPro();
		} catch (Exception e) {
			throw new RuntimeException("异步加载所有手机型号信息方法出现异常",e);
		}
	}
	//分页展示固件信息
	@Override
	public List<FaWare> getWareByPage(Integer curpage, String search, Integer pagesize) {
		try {
			 
			List<FaWare> list = fwDao.getWareByPage((curpage-1)*pagesize, pagesize, search);
			return list;
		} catch (Exception e) {
			throw new RuntimeException("分页展示固件信息方法出现异常",e);
		}
	}
	//查询固件总数
	@Override
	public Long getTotalByWare(String search) {
		try {
			
			return fwDao.getTotalByWare(search);
		} catch (Exception e) {
			throw new RuntimeException("查询固件总数方法出现异常",e);
		}
	}
	//根据id获取固件信息
	@Override
	public FaWare getWareById(String id) {
		try {
			
			return fwDao.get(id);
		} catch (Exception e) {
			throw new RuntimeException("根据id获取固件信息方法出现异常",e);
		}
	}
	//增加固件
	@Override
	public String addWareData(FaWare fw) {
		try {
			if(fw.getFa_name()==null || fw.getFa_name().equals("")){
				return "固件名称（型号）不能为空";
			}
			if(fw.getFa_sort()==null){
				return "排序不能为空";
			}
			if(fw.getFa_sort()<0 || fw.getFa_sort()>999){
				return "排序范围为0~999";
			}
			if(fw.getFa_image()==null || fw.getFa_image().equals("")){
				return "固件图片不能为空";
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String id = sdf.format(new Date())+RandomStringUtils.randomNumeric(5)+RandomTools.getRandomString(2);
			fw.setFa_id(id);
			fwDao.addWare(fw);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("增加固件方法出现异常",e);
		}
	}
	//修改固件
	@Override
	public String updateWareData(FaWare fw) {
		try {
			if(fw.getFa_name()==null || fw.getFa_name().equals("")){
				return "固件名称（型号）不能为空";
			}
			if(fw.getFa_sort()==null){
				return "排序不能为空";
			}
			if(fw.getFa_sort()<0 || fw.getFa_sort()>999){
				return "排序范围为0~999";
			}
			if(fw.getFa_image()==null || fw.getFa_image().equals("")){
				return "固件图片不能为空";
			}
			fwDao.updateWare(fw);
			return "success";
		} catch (Exception e) {
			throw new RuntimeException("修改固件方法出现异常",e);
		}
	}
	
	//删除固件
	@Override
	public Integer deleteWareData(String id) {
		try {
			fwDao.deleteWare(id);
			return 1;
		} catch (Exception e) {
			throw new RuntimeException("删除固件方法出现异常",e);
		}
	}
}
