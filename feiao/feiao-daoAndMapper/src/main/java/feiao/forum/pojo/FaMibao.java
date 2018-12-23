package feiao.forum.pojo;

import java.io.Serializable;
/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 密保问题
 */
public class FaMibao implements Serializable{


	private static final long serialVersionUID = -5692052351814718759L;
//  `fa_mibao` int(11) NOT NULL AUTO_INCREMENT COMMENT '密保主键',
	private Integer fa_id;
//  `fa_name` varchar(1000) DEFAULT NULL COMMENT '密保问题',
	private String fa_name;
//  `fa_sort` int(11) DEFAULT NULL COMMENT '密保排序',
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
