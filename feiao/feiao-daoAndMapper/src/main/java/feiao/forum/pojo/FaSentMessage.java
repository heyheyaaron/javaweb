package feiao.forum.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 信息提醒表
 */
public class FaSentMessage implements Serializable{

	private static final long serialVersionUID = -3912572894695541822L;
//	`fa_id` varchar(20) NOT NULL COMMENT '消息提醒id',
	private String fa_id;
//	  `fa_userid` varchar(20) DEFAULT NULL COMMENT '我的id',
	private String fa_userid;
//	  `fa_friendid` varchar(20) DEFAULT NULL COMMENT '好友id（群组id）',
	private String fa_friendid;
//	  `fa_msg` varchar(100) DEFAULT NULL COMMENT '内容信息',
	private String fa_msg;
//	  `fa_friend_type` int(11) DEFAULT NULL COMMENT '好友分组信息',
	private Integer fa_friend_type;
//	  `fa_friend_istrue` int(1) DEFAULT '0' COMMENT '好友请求，0:待接收，1：接收，2拒绝',
	private Integer fa_friend_istrue;
//	  `fa_msg_type` int(1) DEFAULT '0' COMMENT '0:一般信息，1：好友申请提醒，2：收听提醒，3：群组提醒',
	private Integer fa_msg_type;
//	  `fa_isread` int(1) DEFAULT '0' COMMENT '0:未读，1：已读',
	private Integer fa_isread;
	//内容标题
	private String fa_title;
	//fa_time
	private Date fa_time;
	private String fa_pid;
	private Integer fa_ceng;
	
	
	public String getFa_pid() {
		return fa_pid;
	}
	public void setFa_pid(String fa_pid) {
		this.fa_pid = fa_pid;
	}
	public Integer getFa_ceng() {
		return fa_ceng;
	}
	public void setFa_ceng(Integer fa_ceng) {
		this.fa_ceng = fa_ceng;
	}
	public Date getFa_time() {
		return fa_time;
	}
	public void setFa_time(Date fa_time) {
		this.fa_time = fa_time;
	}
	public String getFa_title() {
		return fa_title;
	}
	public void setFa_title(String fa_title) {
		this.fa_title = fa_title;
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
	public String getFa_msg() {
		return fa_msg;
	}
	public void setFa_msg(String fa_msg) {
		this.fa_msg = fa_msg;
	}
	public Integer getFa_friend_type() {
		return fa_friend_type;
	}
	public void setFa_friend_type(Integer fa_friend_type) {
		this.fa_friend_type = fa_friend_type;
	}
	public Integer getFa_friend_istrue() {
		return fa_friend_istrue;
	}
	public void setFa_friend_istrue(Integer fa_friend_istrue) {
		this.fa_friend_istrue = fa_friend_istrue;
	}
	public Integer getFa_msg_type() {
		return fa_msg_type;
	}
	public void setFa_msg_type(Integer fa_msg_type) {
		this.fa_msg_type = fa_msg_type;
	}
	public Integer getFa_isread() {
		return fa_isread;
	}
	public void setFa_isread(Integer fa_isread) {
		this.fa_isread = fa_isread;
	}
	
}
