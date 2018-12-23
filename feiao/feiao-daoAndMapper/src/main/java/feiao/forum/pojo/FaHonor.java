package feiao.forum.pojo;

import java.io.Serializable;

public class FaHonor implements Serializable{
	
//	  `fa_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
	private Integer fa_id;
//	  `fa_name` varchar(100) DEFAULT NULL COMMENT '名字',
	private String fa_name;
//	  `fa_condition` int(2) DEFAULT '0' COMMENT '0:手动发放，1：注册任意产品，2：其他',
	private Integer fa_condition;
//	  `fa_image` varchar(500) DEFAULT NULL COMMENT '图片',
	private String fa_image;
	//描述
	private String fa_desc;
	
	
	public String getFa_desc() {
		return fa_desc;
	}
	public void setFa_desc(String fa_desc) {
		this.fa_desc = fa_desc;
	}
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
	public Integer getFa_condition() {
		return fa_condition;
	}
	public void setFa_condition(Integer fa_condition) {
		this.fa_condition = fa_condition;
	}
	public String getFa_image() {
		return fa_image;
	}
	public void setFa_image(String fa_image) {
		this.fa_image = fa_image;
	}
	
	
	 
}
