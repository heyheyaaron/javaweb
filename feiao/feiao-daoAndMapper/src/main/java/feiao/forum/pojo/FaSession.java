package feiao.forum.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 会话记录表
 */
public class FaSession implements Serializable{

	private static final long serialVersionUID = -8464284238865604962L;
//	`fa_id` varchar(25) NOT NULL COMMENT '对话主键',
	private String fa_id;
//	  `fa_senter` varchar(20) DEFAULT NULL COMMENT '发送者id',
	private String fa_pid;
//	  `fa_getter` varchar(20) DEFAULT NULL COMMENT '接受者id',
	private Integer fa_sendorget;
//	  `fa_time` datetime DEFAULT NULL COMMENT '会话创建时间',
	private Date fa_time;
//	  `fa_isread` int(1) DEFAULT '0' COMMENT '0：未读，1：已读',
	private Integer fa_isread;
//	  `fa_msg` mediumtext COMMENT '传输消息',
	private String fa_msg;
	public String getFa_id() {
		return fa_id;
	}
	public void setFa_id(String fa_id) {
		this.fa_id = fa_id;
	}
	
	public String getFa_pid() {
		return fa_pid;
	}
	public void setFa_pid(String fa_pid) {
		this.fa_pid = fa_pid;
	}
	
	public Integer getFa_sendorget() {
		return fa_sendorget;
	}
	public void setFa_sendorget(Integer fa_sendorget) {
		this.fa_sendorget = fa_sendorget;
	}
	public Date getFa_time() {
		return fa_time;
	}
	public void setFa_time(Date fa_time) {
		this.fa_time = fa_time;
	}
	public Integer getFa_isread() {
		return fa_isread;
	}
	public void setFa_isread(Integer fa_isread) {
		this.fa_isread = fa_isread;
	}
	public String getFa_msg() {
		return fa_msg;
	}
	public void setFa_msg(String fa_msg) {
		this.fa_msg = fa_msg;
	}
	
}
