package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaListener;

@Repository
public interface FaListenerDao {
	//分页查询我的收听信息
	List<Map<String, Object>> selectMyFollowByPage(String fa_id, Integer curpage, Integer pagesize);
	//根据id查询关注数
	Long getCountById(String string);
	//取关
	void deleteMyFollow(String id, String fa_id);
	//修改备注名
	void updateMyFollow(String idz, String fa_id, String namez);
	//根据id查询粉丝数
	Long getCountByIdFans(String string);
	//分页查询我的听众信息
	List<Map<String, Object>> selectMyFansByPage(String fa_id, Integer curpage, Integer pagesize);
	//查询是否属互相关注
	Long IsFriend(String fa_id, String string);
	//关注
	void saveListener(FaListener fl);

}
