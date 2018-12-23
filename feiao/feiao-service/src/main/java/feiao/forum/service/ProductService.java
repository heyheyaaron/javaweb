package feiao.forum.service;

import java.util.List;
import java.util.Map;

import feiao.forum.pojo.FaProduct;
import feiao.forum.pojo.FaWare;

public interface ProductService {
	//根据id 查询产品信息
	FaProduct getProById(String id);
	//增加产品
	String addProData(FaProduct fp);
	//修改产品
	String updateProData(FaProduct fp);
	//删除产品
	Integer deleteProData(String id);
	//分页展示产品信息
	List<FaProduct> getProByPage(Integer curpage, String search, Integer pagesize);
	//查询总数
	Long getTotalByPro(String search);
	//删除产品具体信息
	Integer deleteProErpData(Integer id);
	//分页展示产品具体信息
	List<Map<String, Object>> getProErpByPage(Integer curpage, String id, Integer pagesize);
	//查询该型号总数
	Long getTotalByProErp(String id);
	//导入产品信息
	String excelToPro(List<Map<Integer, Object>> list);
	//异步加载所有手机型号信息
	List<Map<String, Object>> getAllPro();
	//删除固件
	Integer deleteWareData(String id);
	//修改固件
	String updateWareData(FaWare fw);
	//增加固件
	String addWareData(FaWare fw);
	//根据id获取固件信息
	FaWare getWareById(String id);
	//查询固件总数
	Long getTotalByWare(String search);

	List<FaWare> getWareByPage(Integer curpage, String search, Integer pagesize);
}
