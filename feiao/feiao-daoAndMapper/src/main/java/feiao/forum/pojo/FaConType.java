package feiao.forum.pojo;

import java.io.Serializable;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 网站内容管理分类
 */
public class FaConType implements Serializable{
	

	private static final long serialVersionUID = 206915961079618252L;
	
//	  `fa_id` int(11) NOT NULL DEFAULT '0' COMMENT '内容分类主键',
	private Integer fa_id;
//	  `fa_name` varchar(500) DEFAULT NULL COMMENT '名称',
	private String fa_name;
//	  `fa_sort` int(11) DEFAULT '0' COMMENT '排序',
	private Integer fa_sort;
	//fa_pid
	private Integer fa_pid;
	private String fa_desc;
	
	
	public String getFa_desc() {
		return fa_desc;
	}
	public void setFa_desc(String fa_desc) {
		this.fa_desc = fa_desc;
	}
	public Integer getFa_pid() {
		return fa_pid;
	}
	public void setFa_pid(Integer fa_pid) {
		this.fa_pid = fa_pid;
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
	public Integer getFa_sort() {
		return fa_sort;
	}
	public void setFa_sort(Integer fa_sort) {
		this.fa_sort = fa_sort;
	}
	
	
	 
	 
}
