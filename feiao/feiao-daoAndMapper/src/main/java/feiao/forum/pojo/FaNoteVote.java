package feiao.forum.pojo;

import java.io.Serializable;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 投票贴
  */
public class FaNoteVote implements Serializable{
	

	private static final long serialVersionUID = -2688184921629287835L;
//	  `fa_id` varchar(20) NOT NULL COMMENT '投票主键id',
	private String fa_id;
//	  `fa_noteid` varchar(21) DEFAULT NULL COMMENT '帖子id/问题id',
	private String fa_noteid;
//	  `fa_answertype` int(1) DEFAULT '0' COMMENT '0:答案 0:单选（问题） 1：多选（问题）',
	private Integer fa_answertype;
//	  `fa_aandq` varchar(500) DEFAULT NULL COMMENT '问题或者答案的内容',
	private String fa_aandq;
//	  `fa_count` int(11) DEFAULT '0' COMMENT '答案选择的人数',
	private Integer fa_count;
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
	public Integer getFa_answertype() {
		return fa_answertype;
	}
	public void setFa_answertype(Integer fa_answertype) {
		this.fa_answertype = fa_answertype;
	}
	public String getFa_aandq() {
		return fa_aandq;
	}
	public void setFa_aandq(String fa_aandq) {
		this.fa_aandq = fa_aandq;
	}
	public Integer getFa_count() {
		return fa_count;
	}
	public void setFa_count(Integer fa_count) {
		this.fa_count = fa_count;
	}
	@Override
	public String toString() {
		return "FaNoteVote [fa_id=" + fa_id + ", fa_noteid=" + fa_noteid + ", fa_answertype=" + fa_answertype
				+ ", fa_aandq=" + fa_aandq + ", fa_count=" + fa_count + "]";
	}	
	
}
