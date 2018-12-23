package feiao.forum.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 个人中心用户发表心情
 */
public class FaSelfMood  implements Serializable{
	
/**
	 * 
	 */
	private static final long serialVersionUID = 1390119863847140329L;
//	  `fa_id` varchar(20) NOT NULL COMMENT '个人中心心情id',
	private String fa_id;
//	  `fa_userid` varchar(20) DEFAULT NULL COMMENT '用户id',
	private String fa_userid;
//	  `fa_desc` varchar(1000) DEFAULT NULL COMMENT '内容',
	private String fa_desc;
//	  `fa_time` datetime DEFAULT NULL COMMENT '发表时间',
	private Date fa_time;
//	  `fa_isreturn` int(1) DEFAULT '0' COMMENT '0:不是转播，1：是转播',
	private Integer fa_isreturn;
//	  `fa_returnpid` varchar(20) DEFAULT NULL COMMENT '转播父id',
	private String fa_returnpid;
//	  `fa_ceng` int(11) DEFAULT NULL COMMENT '评论楼层',
	private Integer fa_ceng;
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
	public String getFa_desc() {
		return fa_desc;
	}
	public void setFa_desc(String fa_desc) {
		this.fa_desc = fa_desc;
	}
	public Date getFa_time() {
		return fa_time;
	}
	public void setFa_time(Date fa_time) {
		this.fa_time = fa_time;
	}
	public Integer getFa_isreturn() {
		return fa_isreturn;
	}
	public void setFa_isreturn(Integer fa_isreturn) {
		this.fa_isreturn = fa_isreturn;
	}
	public String getFa_returnpid() {
		return fa_returnpid;
	}
	public void setFa_returnpid(String fa_returnpid) {
		this.fa_returnpid = fa_returnpid;
	}
	public Integer getFa_ceng() {
		return fa_ceng;
	}
	public void setFa_ceng(Integer fa_ceng) {
		this.fa_ceng = fa_ceng;
	}
	  
}
