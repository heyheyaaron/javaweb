package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.ErpPds;
import feiao.forum.pojo.FaProduct;

@Repository
public interface FaProductDao {
	//根据id 查询产品信息
	FaProduct getProById(String id);
	//判断该id 是否存
	Long proIdIsTrue(String fa_id);
	//增加产品信息
	void addPro(FaProduct fp);
	//修改产品信息
	void updatePro(FaProduct fp);
	//删除产品
	void deletePro(String id);
	//删除产品下的产品详细信息
	void deleteErp(String id);
	//分页展示产品信息
	List<FaProduct> getProByPage(@Param("curpage")Integer curpage, @Param("pagesize")Integer pagesize, @Param("search")String search);
	//查询总数
	Long getTotalByPro(@Param("search")String search);
	//删除产品具体信息
	void deleteProErp(Integer id);
	////分页展示产品具体信息
	List<Map<String, Object>> getProErpByPage(@Param("curpage")Integer curpage, @Param("id")String id, @Param("pagesize")Integer pagesize);
	//查询该型号总数
	Long getTotalByProErp(String id);
	//导入产品信息
	void allSave(List<ErpPds> lep);
	//异步加载所有手机型号信息
	List<Map<String, Object>> getAllPro();
	//查询我的所有产品
	List<Map<String, Object>> getAllProductById(String fa_id);
	//查询注册码是否已被使用
	ErpPds getErp(String proId);
	//注册产品
	void registerProduct(String fa_id, String proId);

}
