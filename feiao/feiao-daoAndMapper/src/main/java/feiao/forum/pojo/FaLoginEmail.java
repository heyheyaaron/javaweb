package feiao.forum.pojo;

import java.io.Serializable;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 注册邮箱的秘钥
 */
public class FaLoginEmail implements Serializable {
	

	private static final long serialVersionUID = -6767190931346128849L;
//		  `fa_email` varchar(200) NOT NULL COMMENT '邮箱',
	private String fa_email;
//		  `fa_code` varchar(50) DEFAULT NULL COMMENT '注册邮箱的秘钥',
	private String fa_code;
	public String getFa_email() {
		return fa_email;
	}
	public void setFa_email(String fa_email) {
		this.fa_email = fa_email;
	}
	public String getFa_code() {
		return fa_code;
	}
	public void setFa_code(String fa_code) {
		this.fa_code = fa_code;
	}	  
	
}
