package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaGoods;

@Repository
public interface FaGoodsDao {
	//根据id查询商品信息
	FaGoods getGoodById(Integer id);
	//增加商品
	void saveGood(FaGoods fg);
	//修改商品
	void updateGood(FaGoods fg);
	//删除商品
	void deleteGood(Integer id);
	//分页展示商品信息
	List<FaGoods> getGoodByPage(@Param("curpage")Integer curpage, @Param("search")String search, @Param("pagesize")Integer pagesize);
	//分页展示商品信息显示的总数
	Long getTotalByGood(@Param("search")String search);
	//分页查询商店信息
	List<Map<String, Object>> selectShopProByPage(@Param("curpage")Integer curpage, @Param("pagesize")Integer pagesize, @Param("typess")Integer typess);
	//分页查询商店信息数量
	Long selectShopProCount(@Param("typess")Integer typess);

}
