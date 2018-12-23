package feiao.forum.pojo;

import java.io.Serializable;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 网站内容信息
 */
public class FaConMsg implements Serializable{
	

	private static final long serialVersionUID = -7981540713807485425L;
//	  `fa_id` varchar(15) NOT NULL COMMENT '主键',
	private String fa_id;
//	  `fa_name` varchar(50) DEFAULT NULL COMMENT '名称',
	private String fa_name;
//	  `fa_desc` mediumtext COMMENT '描述',
	private String fa_desc;
//	  `fa_image` varchar(500) DEFAULT NULL COMMENT '图片',
	private String fa_image;
//	  `fa_sort` int(11) DEFAULT NULL COMMENT '排序',
	private Integer fa_sort;
//	  `fa_pid` int(11) DEFAULT NULL COMMENT '内容分类id',
	private Integer fa_pid;
	private String fa_url;
	
	public String getFa_url() {
		return fa_url;
	}
	public void setFa_url(String fa_url) {
		this.fa_url = fa_url;
	}
	public String getFa_id() {
		return fa_id;
	}
	public void setFa_id(String fa_id) {
		this.fa_id = fa_id;
	}
	public String getFa_name() {
		return fa_name;
	}
	public void setFa_name(String fa_name) {
		this.fa_name = fa_name;
	}
	public String getFa_desc() {
		return fa_desc;
	}
	public void setFa_desc(String fa_desc) {
		this.fa_desc = fa_desc;
	}
	public String getFa_image() {
		return fa_image;
	}
	public void setFa_image(String fa_image) {
		this.fa_image = fa_image;
	}
	public Integer getFa_sort() {
		return fa_sort;
	}
	public void setFa_sort(Integer fa_sort) {
		this.fa_sort = fa_sort;
	}
	public Integer getFa_pid() {
		return fa_pid;
	}
	public void setFa_pid(Integer fa_pid) {
		this.fa_pid = fa_pid;
	}
	
	
}
