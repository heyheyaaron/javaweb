package feiao.forum.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 用户收听的人列表
 */
public class FaListener implements Serializable{

	private static final long serialVersionUID = 7893513907502302793L;
	//	`fa_id` varchar(25) NOT NULL COMMENT '收听的主键（关注）',
	private String fa_id;
//	  `fa_listener` varchar(20) DEFAULT NULL COMMENT '我的收听人id',
	private String fa_listener;
//	  `fa_name` varchar(100) DEFAULT NULL COMMENT '我收听人的备注',
	private String fa_name;
//	  `fa_userid` varchar(20) DEFAULT NULL COMMENT '我的id',
	private String fa_userid;
	//日期
	private Date fa_time;
	
	public Date getFa_time() {
		return fa_time;
	}
	public void setFa_time(Date fa_time) {
		this.fa_time = fa_time;
	}
	public String getFa_id() {
		return fa_id;
	}
	public void setFa_id(String fa_id) {
		this.fa_id = fa_id;
	}
	public String getFa_listener() {
		return fa_listener;
	}
	public void setFa_listener(String fa_listener) {
		this.fa_listener = fa_listener;
	}
	public String getFa_name() {
		return fa_name;
	}
	public void setFa_name(String fa_name) {
		this.fa_name = fa_name;
	}
	public String getFa_userid() {
		return fa_userid;
	}
	public void setFa_userid(String fa_userid) {
		this.fa_userid = fa_userid;
	}
	
}
