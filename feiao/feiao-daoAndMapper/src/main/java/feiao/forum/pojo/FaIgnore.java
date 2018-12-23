package feiao.forum.pojo;

import java.io.Serializable;
/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 用户忽略的用户表
 */
public class FaIgnore implements Serializable{
/**
	 * 
	 */
	private static final long serialVersionUID = 4564652964303156383L;
//	`fa_id` varchar(20) NOT NULL COMMENT '忽略主键',
	private String fa_id;
//	  `fa_userid` varchar(20) DEFAULT NULL COMMENT '我的id',
	private String fa_userid;
//	  `fa_ignore` varchar(20) DEFAULT NULL COMMENT '忽略的人的id',
	private String fa_ignore;
	public String getFa_id() {
		return fa_id;
	}
	public void setFa_id(String fa_id) {
		this.fa_id = fa_id;
	}
	public String getFa_userid() {
		return fa_userid;
	}
	public void setFa_userid(String fa_userid) {
		this.fa_userid = fa_userid;
	}
	public String getFa_ignore() {
		return fa_ignore;
	}
	public void setFa_ignore(String fa_ignore) {
		this.fa_ignore = fa_ignore;
	}
	
}
