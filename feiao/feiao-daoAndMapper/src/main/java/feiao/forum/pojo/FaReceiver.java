package feiao.forum.pojo;

import java.io.Serializable;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 收货人信息表
 */
public class FaReceiver implements Serializable{

	private static final long serialVersionUID = 9084449434341756460L;
//	`fa_id` varchar(25) NOT NULL COMMENT '主键',
	private String fa_id;
//	  `fa_userid` varchar(20) DEFAULT NULL COMMENT '用户id',
	private String fa_userid;
	//	  `fa_name` varchar(20) DEFAULT NULL COMMENT '收货人姓名',
	private String fa_name;
	//	  `fa_tel` varchar(20) DEFAULT NULL COMMENT '收货人手机',
	private String fa_tel;
	//	  `fa_pr` varchar(20) DEFAULT NULL COMMENT '省',
	private String fa_pr;
	//	  `fa_ci` varchar(20) DEFAULT NULL COMMENT '市',
	private String fa_ci;
	//	  `fa_ar` varchar(20) DEFAULT NULL COMMENT '区',
	private String fa_ar;
	//	  `fa_detail` varchar(100) DEFAULT NULL COMMENT '住址',
	private String fa_detail;
	//	  `fa_map` varchar(10) DEFAULT NULL COMMENT '邮编',
	private String fa_map;
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
	public String getFa_tel() {
		return fa_tel;
	}
	public void setFa_tel(String fa_tel) {
		this.fa_tel = fa_tel;
	}
	public String getFa_pr() {
		return fa_pr;
	}
	public void setFa_pr(String fa_pr) {
		this.fa_pr = fa_pr;
	}
	public String getFa_ci() {
		return fa_ci;
	}
	public void setFa_ci(String fa_ci) {
		this.fa_ci = fa_ci;
	}
	public String getFa_ar() {
		return fa_ar;
	}
	public void setFa_ar(String fa_ar) {
		this.fa_ar = fa_ar;
	}
	public String getFa_detail() {
		return fa_detail;
	}
	public void setFa_detail(String fa_detail) {
		this.fa_detail = fa_detail;
	}
	public String getFa_map() {
		return fa_map;
	}
	public void setFa_map(String fa_map) {
		this.fa_map = fa_map;
	}
	
	
}
