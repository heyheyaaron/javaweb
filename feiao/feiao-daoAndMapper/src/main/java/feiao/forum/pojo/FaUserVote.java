package feiao.forum.pojo;

import java.io.Serializable;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 投票贴
  */
public class FaUserVote implements Serializable{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 477572638961350733L;
	private String fa_id;
//	  `fa_noteid` varchar(21) DEFAULT NULL COMMENT '帖子id/问题id',
	private String fa_noteid;
	private String fa_userid;
	private String fa_vid;
	
	public String getFa_vid() {
		return fa_vid;
	}
	public void setFa_vid(String fa_vid) {
		this.fa_vid = fa_vid;
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
	
	
}
