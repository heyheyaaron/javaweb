package feiao.forum.pojo;

import java.io.Serializable;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 版块中帖子分类
 */

public class FaSectionType implements Serializable {
	
/**
	 * 
	 */
	private static final long serialVersionUID = -6146729876442863058L;
//	  `fa_id` varchar(20) NOT NULL COMMENT '版块分类id',
	private String fa_id;
//	  `fa_pid` int(11) DEFAULT NULL COMMENT '属于哪个版块',
	private Integer fa_pid;
//	  `fa_name` varchar(50) DEFAULT NULL COMMENT '分类名字',
	private String fa_name;
	public String getFa_id() {
		return fa_id;
	}
	public void setFa_id(String fa_id) {
		this.fa_id = fa_id;
	}
	public Integer getFa_pid() {
		return fa_pid;
	}
	public void setFa_pid(Integer fa_pid) {
		this.fa_pid = fa_pid;
	}
	public String getFa_name() {
		return fa_name;
	}
	public void setFa_name(String fa_name) {
		this.fa_name = fa_name;
	}
			 

}
