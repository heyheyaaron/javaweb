package feiao.forum.pojo;

import java.io.Serializable;
/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 用户标签表
 */
public class FaLabel implements Serializable{
	

	private static final long serialVersionUID = -3501103328619560278L;
//	  `fa_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签id',
	private Integer fa_id;
//	  `fa_name` varchar(100) DEFAULT NULL COMMENT '标签名字',
	private String fa_name;
//	  `fa_sort` int(3) DEFAULT NULL COMMENT '排序',
	private Integer fa_sort;
	public Integer getFa_id() {
		return fa_id;
	}
	public void setFa_id(Integer fa_id) {
		this.fa_id = fa_id;
	}
	public String getFa_name() {
		return fa_name;
	}
	public void setFa_name(String fa_name) {
		this.fa_name = fa_name;
	}
	public Integer getFa_sort() {
		return fa_sort;
	}
	public void setFa_sort(Integer fa_sort) {
		this.fa_sort = fa_sort;
	}
	  
}
