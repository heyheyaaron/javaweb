package feiao.forum.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 会员积分变动记录表
 */
public class FaInte implements Serializable{

	private static final long serialVersionUID = -9218692682008250539L;
//	`fa_id` varchar(25) NOT NULL COMMENT '积分记录表id',
	private String fa_id;
//	  `fa_userid` varchar(20) DEFAULT NULL COMMENT '用户id',
	private String fa_userid;
//	  `fa_make` varchar(50) DEFAULT NULL COMMENT '用户操作',
	private String fa_make;
//	  `fa_change` int(11) DEFAULT NULL COMMENT '积分变化',
	private Integer fa_change;
	//	  `fa_changetype` int(1) DEFAULT '0' COMMENT '变化种类，0；积分，1：飞镖',
	private Integer fa_changetype;
	//	  `fa_changetime` datetime DEFAULT NULL COMMENT '变更时间',
	private Date fa_changetime;
	//	  `fa_detail` varchar(500) DEFAULT NULL COMMENT '详细',
	private String fa_detail;
	
	private Integer fa_end;
	
	public Integer getFa_end() {
		return fa_end;
	}
	public void setFa_end(Integer fa_end) {
		this.fa_end = fa_end;
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
	public String getFa_make() {
		return fa_make;
	}
	public void setFa_make(String fa_make) {
		this.fa_make = fa_make;
	}
	public Integer getFa_change() {
		return fa_change;
	}
	public void setFa_change(Integer fa_change) {
		this.fa_change = fa_change;
	}
	public Integer getFa_changetype() {
		return fa_changetype;
	}
	public void setFa_changetype(Integer fa_changetype) {
		this.fa_changetype = fa_changetype;
	}
	public Date getFa_changetime() {
		return fa_changetime;
	}
	public void setFa_changetime(Date fa_changetime) {
		this.fa_changetime = fa_changetime;
	}
	public String getFa_detail() {
		return fa_detail;
	}
	public void setFa_detail(String fa_detail) {
		this.fa_detail = fa_detail;
	}
	
	
}
