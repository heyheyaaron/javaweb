package feiao.forum.pojo;

import java.io.Serializable;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 用户收藏帖子id
 */
public class FaCollect implements Serializable{
	
/**
	 * 
	 */
	private static final long serialVersionUID = -666820243016679865L;
//	  `fa_id` varchar(20) NOT NULL COMMENT '收藏主键',
	private String fa_id;
//	  `fa_userid` varchar(20) DEFAULT NULL COMMENT '用户收藏id',
	private String fa_userid;
//	  `fa_tiezi` varchar(25) DEFAULT NULL COMMENT '帖子id',
	private String fa_tiezi;
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
	public String getFa_tiezi() {
		return fa_tiezi;
	}
	public void setFa_tiezi(String fa_tiezi) {
		this.fa_tiezi = fa_tiezi;
	}
	  
}
