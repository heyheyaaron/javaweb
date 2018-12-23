package feiao.forum.pojo;

import java.io.Serializable;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 用户好友分类表
 */
public class FaFriendType implements Serializable{

	private static final long serialVersionUID = -6304167600727814745L;
	//	`fa_id` varchar(25) NOT NULL COMMENT '好友分组id',
	private String fa_id;
//	  `fa_userid` varchar(20) DEFAULT NULL COMMENT '我的id',
	private String fa_userid;
//	  `fa_name` varchar(100) DEFAULT NULL COMMENT '分组名称',
	private String fa_name;
	
	//忽略
	private Integer fa_ignore;
	
	
	public Integer getFa_ignore() {
		return fa_ignore;
	}
	public void setFa_ignore(Integer fa_ignore) {
		this.fa_ignore = fa_ignore;
	}
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
	public String getFa_name() {
		return fa_name;
	}
	public void setFa_name(String fa_name) {
		this.fa_name = fa_name;
	}
	
	
}
