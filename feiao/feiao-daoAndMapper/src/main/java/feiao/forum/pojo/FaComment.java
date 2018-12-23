package feiao.forum.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 评论
 */
public class FaComment implements Serializable {
	
/**
	 * 
	 */
	private static final long serialVersionUID = 3806620797079368514L;
//			  `fa_id` varchar(25) NOT NULL COMMENT '评论主键',
	private String fa_id;
//			  `fa_pid` varchar(21) DEFAULT NULL COMMENT '该评论的来源（心情或帖子）',
	private String fa_pid;
//			  `fa_userid` varchar(20) DEFAULT NULL COMMENT '用户id',
	private String fa_userid;
//			  `fa_desc` varchar(1000) DEFAULT NULL COMMENT '评论内容',
	private String fa_desc;
//			  `fa_time` datetime DEFAULT NULL COMMENT '评论时间',
	private Date fa_time;
//			  `fa_ceng` int(11) DEFAULT NULL COMMENT '评论楼层',
	private Integer fa_ceng;
//			  
	//回复谁
	private String fa_toid;
	//0心情，1帖子
	private Integer fa_moodornote;
	//属于哪个帖子
	private String fa_source;
	
	public String getFa_source() {
		return fa_source;
	}
	public void setFa_source(String fa_source) {
		this.fa_source = fa_source;
	}
	public Integer getFa_moodornote() {
		return fa_moodornote;
	}
	public void setFa_moodornote(Integer fa_moodornote) {
		this.fa_moodornote = fa_moodornote;
	}
	public String getFa_toid() {
		return fa_toid;
	}
	public void setFa_toid(String fa_toid) {
		this.fa_toid = fa_toid;
	}
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
	public Integer getFa_ceng() {
		return fa_ceng;
	}
	public void setFa_ceng(Integer fa_ceng) {
		this.fa_ceng = fa_ceng;
	}
	
			 
}
