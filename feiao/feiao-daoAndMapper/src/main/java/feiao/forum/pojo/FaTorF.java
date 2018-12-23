package feiao.forum.pojo;

import java.io.Serializable;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 对帖子或心情或评论表示支持或反对
 */
public class FaTorF implements Serializable {
	
/**
	 * 
	 */
	private static final long serialVersionUID = -4452021504711556342L;
//	  `fa_id` varchar(25) NOT NULL COMMENT '支付或反对id',
	private String fa_id;
//	  `fa_msgid` varchar(25) DEFAULT NULL COMMENT '帖子，心情，回复的id',
	private String fa_msgid;
//	  `fa_userid` varchar(20) DEFAULT NULL COMMENT '用户id',
	private String fa_userid;
//	  `fa_tf` int(1) DEFAULT '0' COMMENT '0:支付，1：反对',
	private Integer fa_tf;
	public String getFa_id() {
		return fa_id;
	}
	public void setFa_id(String fa_id) {
		this.fa_id = fa_id;
	}
	public String getFa_msgid() {
		return fa_msgid;
	}
	public void setFa_msgid(String fa_msgid) {
		this.fa_msgid = fa_msgid;
	}
	public String getFa_userid() {
		return fa_userid;
	}
	public void setFa_userid(String fa_userid) {
		this.fa_userid = fa_userid;
	}
	public Integer getFa_tf() {
		return fa_tf;
	}
	public void setFa_tf(Integer fa_tf) {
		this.fa_tf = fa_tf;
	}
	  
}
