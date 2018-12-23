package feiao.forum.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import feiao.forum.pojo.FaLabel;

@Repository
public interface FaLabelDao {
	//根据id查询标签信息
	FaLabel get(Integer id);
	//分页展示标签信息
	List<Map<String, Object>> getlabelByPage(@Param("curpage")Integer curpage,@Param("pagesize")Integer pagesize,@Param("search")String search);
	//查询标签总数
	Long getTotalByLabel(@Param("search")String search);
	//增加标签
	void addLabel(FaLabel faLabel);
	//修改标签
	void updateLabel(FaLabel faLabel);
	//删除标签
	void deleteLabel(Integer id);
	//删除标签与会员的关系表
	void deleteLabelAndUser(Integer id);
	//根据会员id查询标签信息
	List<Map<String, Object>> getLabelByUserId(String id);
	//异步加载所有标签信息
	List<FaLabel> getAllLabel();
	//根据会员id,查询标签
	List<Integer> getLabelIdByUserId(String fa_id);
	//删除该会员的标签
	void deleteLabelByUserId(String id);
	//绑定标签
	void saveUserAndLabel(List<Map<String, Object>> list);
}
