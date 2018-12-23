package feiao.forum.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 我的好友信息
 */
public class FaMyFriend implements Serializable{

	private static final long serialVersionUID = -8372618771557566164L;
	//	`fa_id` varchar(25) NOT NULL COMMENT '好友主键',
	private String fa_id;
//	  `fa_userid` varchar(20) DEFAULT NULL COMMENT '我的id',
	private String fa_userid;
//	  `fa_friendid` varchar(20) DEFAULT NULL COMMENT '我的好友id',
	private String fa_friendid;
//	  `fa_type` int(11) DEFAULT NULL COMMENT '好友分类',
	private String fa_type;
	//好友备注
	private String fa_beizhu;
	//时间
	private Date fa_time;
	
	public Date getFa_time() {
		return fa_time;
	}
	public void setFa_time(Date fa_time) {
		this.fa_time = fa_time;
	}
	public String getFa_beizhu() {
		return fa_beizhu;
	}
	public void setFa_beizhu(String fa_beizhu) {
		this.fa_beizhu = fa_beizhu;
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
	public String getFa_friendid() {
		return fa_friendid;
	}
	public void setFa_friendid(String fa_friendid) {
		this.fa_friendid = fa_friendid;
	}
	public String getFa_type() {
		return fa_type;
	}
	public void setFa_type(String fa_type) {
		this.fa_type = fa_type;
	}
	
	
	
}
