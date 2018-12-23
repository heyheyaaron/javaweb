package feiao.forum.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaReceiver;

@Repository
public interface FaReceiverDao {
	//修改联系人
	void update(FaReceiver fr);
	//新增联系人
	void save(FaReceiver fr);
	List<FaReceiver> selectReByUserId(String id);
	void delete(String id, String fa_id);
	//根据id查询联系人
	FaReceiver get(String adid);

}
