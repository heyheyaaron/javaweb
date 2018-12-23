package feiao.forum.pojo;

import java.io.Serializable;

public class FaGroups implements Serializable{
	

	private static final long serialVersionUID = -9191865025248641333L;
//	  `fa_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员用户组主键',
	private Integer fa_id;
//	  `fa_name` varchar(100) DEFAULT NULL COMMENT '名称',
	private String fa_name;
//	  `fa_image` varchar(1000) DEFAULT NULL COMMENT '图标',
	private String fa_image;
//	  `fa_desc` varchar(1000) DEFAULT NULL COMMENT '描述',
	private String fa_desc;
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
	public String getFa_image() {
		return fa_image;
	}
	public void setFa_image(String fa_image) {
		this.fa_image = fa_image;
	}
	public String getFa_desc() {
		return fa_desc;
	}
	public void setFa_desc(String fa_desc) {
		this.fa_desc = fa_desc;
	}
	
	
}
