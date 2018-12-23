package feiao.forum.pojo;

import java.io.Serializable;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 会员附属表（判断是否能加积分）
 */
public class FaUserVice implements Serializable{



	private static final long serialVersionUID = -3128161380169535537L;
//	  `fa_id` varchar(20) NOT NULL COMMENT '会员id',
	private String fa_id;
//	  `fa_respeak_type` int(1) DEFAULT '0' COMMENT '发表回复是否得到积分，0：是，1 否',
	private Integer fa_respeak_type;
//	  `fa_theme_type` int(1) DEFAULT '0' COMMENT '发表主题帖子是否得到积分，0：是，1 否',
	private Integer fa_theme_type;
//	  `fa_jing_type` int(1) DEFAULT '0' COMMENT '加精是否得到积分，0：是，1 否',
	private Integer fa_jing_type;
//	  `fa_del_type` int(1) DEFAULT '0' COMMENT '帖子被删是否得到积分，0：是，1 否',
	private Integer fa_del_type;
//	  `fa_login_type` int(1) DEFAULT '0' COMMENT '登录/签到是否得到积分，0：是，1 否',
	private Integer fa_login_type;
//	  `fa_vote_type` int(1) DEFAULT '0' COMMENT '参与投票是否得到积分，0：是，1 否',
	private Integer fa_vote_type;
//	  `fa_title_type` int(1) DEFAULT '0' COMMENT '设置头像是否得到积分，0：是，1 否',
	private Integer fa_title_type;
//	  `fa_email_type` int(1) DEFAULT '0' COMMENT '邮箱认证是否得到积分，0：是，1 否',
	private Integer fa_email_type;
//	  `fa_pro_type` int(1) DEFAULT '0' COMMENT '产品注册是否得到积分，0：是，1 否',
	private Integer fa_pro_type;
//	  `fa_respeak_times` int(1) DEFAULT '0' COMMENT '周期内发表回复得到积分次数 0为无限次数',
	private Integer fa_respeak_times;
//	  `fa_theme_times` int(1) DEFAULT '0' COMMENT '周期内发表主题帖子得到积分次数 0为无限次数',
	private Integer fa_theme_times;
//	  `fa_jing_times` int(1) DEFAULT '0' COMMENT '周期内加精得到积分次数 0为无限次数',
	private Integer fa_jing_times;
//	  `fa_del_times` int(1) DEFAULT '0' COMMENT '周期内帖子被删得到积分次数 0为无限次数',
	private Integer fa_del_times;
//	  `fa_login_times` int(1) DEFAULT '0' COMMENT '周期内登录/签到得到积分次数 0为无限次数',
	private Integer fa_login_times;
//	  `fa_vote_times` int(1) DEFAULT '0' COMMENT '周期内参与投票得到积分次数 0为无限次数',
	private Integer fa_vote_times;
//	  `fa_title_times` int(1) DEFAULT '0' COMMENT '周期内设置头像得到积分次数 0为无限次数',
	private Integer fa_title_times;
//	  `fa_email_times` int(1) DEFAULT '0' COMMENT '周期内邮箱认证得到积分次数 0为无限次数',
	private Integer fa_email_times;
//	  `fa_pro_times` int(1) DEFAULT '0' COMMENT '周期内产品注册得到积分次数 0为无限次数',
	private Integer fa_pro_times;
	//签到
	private Integer fa_sign_times;
	private Integer fa_sign_type;
	public String getFa_id() {
		return fa_id;
	}
	public void setFa_id(String fa_id) {
		this.fa_id = fa_id;
	}
	public Integer getFa_respeak_type() {
		return fa_respeak_type;
	}
	public void setFa_respeak_type(Integer fa_respeak_type) {
		this.fa_respeak_type = fa_respeak_type;
	}
	public Integer getFa_theme_type() {
		return fa_theme_type;
	}
	public void setFa_theme_type(Integer fa_theme_type) {
		this.fa_theme_type = fa_theme_type;
	}
	public Integer getFa_jing_type() {
		return fa_jing_type;
	}
	public void setFa_jing_type(Integer fa_jing_type) {
		this.fa_jing_type = fa_jing_type;
	}
	public Integer getFa_del_type() {
		return fa_del_type;
	}
	public void setFa_del_type(Integer fa_del_type) {
		this.fa_del_type = fa_del_type;
	}
	public Integer getFa_login_type() {
		return fa_login_type;
	}
	public void setFa_login_type(Integer fa_login_type) {
		this.fa_login_type = fa_login_type;
	}
	public Integer getFa_vote_type() {
		return fa_vote_type;
	}
	public void setFa_vote_type(Integer fa_vote_type) {
		this.fa_vote_type = fa_vote_type;
	}
	public Integer getFa_title_type() {
		return fa_title_type;
	}
	public void setFa_title_type(Integer fa_title_type) {
		this.fa_title_type = fa_title_type;
	}
	public Integer getFa_email_type() {
		return fa_email_type;
	}
	public void setFa_email_type(Integer fa_email_type) {
		this.fa_email_type = fa_email_type;
	}
	public Integer getFa_pro_type() {
		return fa_pro_type;
	}
	public void setFa_pro_type(Integer fa_pro_type) {
		this.fa_pro_type = fa_pro_type;
	}
	public Integer getFa_respeak_times() {
		return fa_respeak_times;
	}
	public void setFa_respeak_times(Integer fa_respeak_times) {
		this.fa_respeak_times = fa_respeak_times;
	}
	public Integer getFa_theme_times() {
		return fa_theme_times;
	}
	public void setFa_theme_times(Integer fa_theme_times) {
		this.fa_theme_times = fa_theme_times;
	}
	public Integer getFa_jing_times() {
		return fa_jing_times;
	}
	public void setFa_jing_times(Integer fa_jing_times) {
		this.fa_jing_times = fa_jing_times;
	}
	public Integer getFa_del_times() {
		return fa_del_times;
	}
	public void setFa_del_times(Integer fa_del_times) {
		this.fa_del_times = fa_del_times;
	}
	public Integer getFa_login_times() {
		return fa_login_times;
	}
	public void setFa_login_times(Integer fa_login_times) {
		this.fa_login_times = fa_login_times;
	}
	public Integer getFa_vote_times() {
		return fa_vote_times;
	}
	public void setFa_vote_times(Integer fa_vote_times) {
		this.fa_vote_times = fa_vote_times;
	}
	public Integer getFa_title_times() {
		return fa_title_times;
	}
	public void setFa_title_times(Integer fa_title_times) {
		this.fa_title_times = fa_title_times;
	}
	public Integer getFa_email_times() {
		return fa_email_times;
	}
	public void setFa_email_times(Integer fa_email_times) {
		this.fa_email_times = fa_email_times;
	}
	public Integer getFa_pro_times() {
		return fa_pro_times;
	}
	public void setFa_pro_times(Integer fa_pro_times) {
		this.fa_pro_times = fa_pro_times;
	}
	public Integer getFa_sign_times() {
		return fa_sign_times;
	}
	public void setFa_sign_times(Integer fa_sign_times) {
		this.fa_sign_times = fa_sign_times;
	}
	public Integer getFa_sign_type() {
		return fa_sign_type;
	}
	public void setFa_sign_type(Integer fa_sign_type) {
		this.fa_sign_type = fa_sign_type;
	}
		  
}