package feiao.forum.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 活动贴
 */
public class FaNoteActive implements Serializable{
	

	private static final long serialVersionUID = 5537975176893462173L;
//	  `fa_id` varchar(20) NOT NULL COMMENT '主键id',
	private String fa_id;
//	  `fa_noteid` varchar(21) DEFAULT NULL COMMENT '帖子id',
	private String fa_noteid;
//	  `fa_userid` varchar(20) DEFAULT NULL COMMENT '会员id',
	private String fa_userid;
//	  `fa_name` varchar(100) DEFAULT NULL COMMENT '参与者姓名',
	private String fa_name;
//	  `fa_tel` varchar(20) DEFAULT NULL COMMENT '参与者联系方式',
	private String fa_tel;
	//报名时间
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
	public String getFa_noteid() {
		return fa_noteid;
	}
	public void setFa_noteid(String fa_noteid) {
		this.fa_noteid = fa_noteid;
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
	public String getFa_tel() {
		return fa_tel;
	}
	public void setFa_tel(String fa_tel) {
		this.fa_tel = fa_tel;
	}	  
	
}
