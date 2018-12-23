package feiao.forum.dao;

import java.util.List;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaLabel;
import feiao.forum.pojo.FaMibao;

@Repository
public interface FaMibaoDao {
	//根据id查询密保信息
	FaMibao get(Integer id);
	
	
	//增加密保
	void addMibao(FaMibao faMibao);
	//修改密保
	void updateMibao(FaMibao faMibao);
	//删除密保
	void deleteMibao(Integer id);
	
	
	//异步加载所有密保信息
	List<FaMibao> getAllMibao();
}
