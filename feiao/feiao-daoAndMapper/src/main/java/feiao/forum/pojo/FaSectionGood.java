package feiao.forum.pojo;

import java.io.Serializable;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 版块推荐信息类
 */
public class FaSectionGood implements Serializable {
/**
	 * 
	 */
	private static final long serialVersionUID = 73652226156282078L;
//	`fa_id` varchar(25) NOT NULL COMMENT '推荐id',
	private String fa_id;
//	  `fa_pid` int(11) DEFAULT NULL COMMENT '属于哪个版块',
	private Integer fa_pid;
//	  `fa_tiezi` varchar(21) DEFAULT NULL COMMENT '推荐帖子id',
	private String fa_tiezi;
//	  `fa_name` varchar(50) DEFAULT NULL COMMENT '推荐帖子名字',
	private String fa_name;
//	  `fa_url` varchar(500) DEFAULT NULL COMMENT '图片',
	private String fa_url;
//	`fa_sort` int(11) DEFAULT NULL COMMENT '排序',
	private String fa_sort;
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
	public String getFa_tiezi() {
		return fa_tiezi;
	}
	public void setFa_tiezi(String fa_tiezi) {
		this.fa_tiezi = fa_tiezi;
	}
	public String getFa_name() {
		return fa_name;
	}
	public void setFa_name(String fa_name) {
		this.fa_name = fa_name;
	}
	public String getFa_url() {
		return fa_url;
	}
	public void setFa_url(String fa_url) {
		this.fa_url = fa_url;
	}
	public String getFa_sort() {
		return fa_sort;
	}
	public void setFa_sort(String fa_sort) {
		this.fa_sort = fa_sort;
	}
	  
}
