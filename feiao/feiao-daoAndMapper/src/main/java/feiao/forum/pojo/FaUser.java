package feiao.forum.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 飞傲用户信息
 */
 
public class FaUser implements Serializable{
/**
	 * 
	 */
	private static final long serialVersionUID = 4131513555779987957L;
	//	`fa_id` varchar(20) NOT NULL COMMENT '用户主键',
	private String fa_id;
//	  `fa_username` varchar(100) DEFAULT NULL COMMENT '用户登录名',
	private String fa_username;
//	  `fa_telphone` varchar(11) DEFAULT NULL COMMENT '用户手机',
	private String fa_telphone;
//	  `fa_email` varchar(100) DEFAULT NULL COMMENT '用户邮箱',
	private String fa_email;
//	  `fa_password` varchar(100) DEFAULT NULL COMMENT '用户密码',
	private String fa_password;
//	  `fa_sex` int(1) DEFAULT '0' COMMENT '0:男，1：女',
	private Integer fa_sex;
//	  `fa_qq` varchar(20) DEFAULT NULL COMMENT 'qq',
	private String fa_qq;
//	  `fa_weibo` varchar(500) DEFAULT NULL COMMENT '微博地址',
	private String fa_weibo;
//	  `fa_life` varchar(200) DEFAULT NULL COMMENT '居住地',
	private Integer fa_life;
//	  `fa_hide_base` int(1) DEFAULT '0' COMMENT '0:公开，1：好友可见，2：保密',
	private Integer fa_hide_base;
//	  `fa_edu` int(1) DEFAULT '0' COMMENT '0,其他，1~6：小学~博士',
	private Integer fa_edu;
//	  `fa_school` varchar(30) DEFAULT NULL COMMENT '毕业学校',
	private String fa_school;
//	  `fa_hide_job` int(1) DEFAULT NULL COMMENT '0:公开，1：好友可见，2：保密',
	private Integer fa_hide_job;
//	  `fa_hide_active` int(1) DEFAULT NULL COMMENT '0:公开，1：好友可见，2：保密',
	private Integer fa_hide_active;
//	  `fa_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
	private String fa_name;
	//	  `fa_idc` varchar(50) DEFAULT NULL COMMENT '证件号：身份证',
	private String fa_idc;
//	  `fa_idctype` varchar(50) DEFAULT NULL COMMENT '证件类型',
	private String fa_idctype;
//	  `fa_title_img` varchar(500) DEFAULT NULL COMMENT '用户头像',
	private String fa_title_img;
//	  `fa_mibao_qu_st` varchar(500) DEFAULT NULL COMMENT '密保问题1',
	private String fa_mibao_qu_st;
//	  `fa_mibao_qu_nd` varchar(500) DEFAULT NULL COMMENT '密保问题2',
	private String fa_mibao_qu_nd;
//	  `fa_mibao_qu_rd` varchar(500) DEFAULT NULL COMMENT '密保问题3',
	private String fa_mibao_qu_rd;
//	  `fa_mibao_ar_st` varchar(500) DEFAULT NULL COMMENT '密保答案1',
	private String fa_mibao_ar_st;
//	  `fa_mibao_ar_nd` varchar(500) DEFAULT NULL COMMENT '密保答案2',
	private String fa_mibao_ar_nd;
//	  `fa_mibao_ar_rd` varchar(500) DEFAULT NULL COMMENT '密保答案3',
	private String fa_mibao_ar_rd;
//	  `fa_feibiao` int(11) DEFAULT NULL COMMENT '积分：飞镖',
	private Integer fa_feibiao;
//	  `fa_jifen` int(11) DEFAULT NULL COMMENT '积分：总积分',
	private Integer fa_jifen;
//	  `fa_ishost` int(1) DEFAULT '0' COMMENT '0:不是版主，1：版主',
	private Integer fa_ishost;
//	  `fa_issystem` int(1) DEFAULT '0' COMMENT '0:不是系统人员,1:是',
	private Integer fa_issystem;
//	  `fa_speaker` int(11) DEFAULT '0' COMMENT '收听数量',
	private Integer fa_speaker;
//	  `fa_listener` int(11) DEFAULT '0' COMMENT '听众数量',
	private Integer fa_listener;
//	  `fa_isgetmsg` int(1) DEFAULT '0' COMMENT '0:接收全部人信息，1：只接收好友信息',
	private Integer fa_isgetmsg;
	//0:正常，1：封停
	private Integer fa_status;
	//会员等级
	private Integer fa_rank;
	//乐观锁
	private Integer version;
	//封停理由
	private String fa_delanswer;
	////绑定版块id
	private Integer fa_sectionid;
	//`fa_hide_friend` int(1) DEFAULT '0' COMMENT '0:公开，1：好友可见，2：保密 3:注册用户可见',
	private Integer fa_hide_friend;
	//忽略全部提醒
	private String fa_ignore_msg;
	//注册时间
	private Date fa_createtime;
	//仅接受好友发的信息
	private Integer fa_isfriendmsg;
	
	
	public Integer getFa_isfriendmsg() {
		return fa_isfriendmsg;
	}
	public void setFa_isfriendmsg(Integer fa_isfriendmsg) {
		this.fa_isfriendmsg = fa_isfriendmsg;
	}
	public Date getFa_createtime() {
		return fa_createtime;
	}
	public void setFa_createtime(Date fa_createtime) {
		this.fa_createtime = fa_createtime;
	}
	public String getFa_ignore_msg() {
		return fa_ignore_msg;
	}
	public void setFa_ignore_msg(String fa_ignore_msg) {
		this.fa_ignore_msg = fa_ignore_msg;
	}
	public Integer getFa_hide_friend() {
		return fa_hide_friend;
	}
	public void setFa_hide_friend(Integer fa_hide_friend) {
		this.fa_hide_friend = fa_hide_friend;
	}
	public Integer getFa_sectionid() {
		return fa_sectionid;
	}
	public void setFa_sectionid(Integer fa_sectionid) {
		this.fa_sectionid = fa_sectionid;
	}
	public String getFa_delanswer() {
		return fa_delanswer;
	}
	public void setFa_delanswer(String fa_delanswer) {
		this.fa_delanswer = fa_delanswer;
	}
	public Integer getVersion() {
		return version;
	}
	public void setVersion(Integer version) {
		this.version = version;
	}
	public Integer getFa_rank() {
		return fa_rank;
	}
	public void setFa_rank(Integer fa_rank) {
		this.fa_rank = fa_rank;
	}
	public String getFa_id() {
		return fa_id;
	}
	public void setFa_id(String fa_id) {
		this.fa_id = fa_id;
	}
	public String getFa_username() {
		return fa_username;
	}
	public void setFa_username(String fa_username) {
		this.fa_username = fa_username;
	}
	public String getFa_telphone() {
		return fa_telphone;
	}
	public void setFa_telphone(String fa_telphone) {
		this.fa_telphone = fa_telphone;
	}
	public String getFa_email() {
		return fa_email;
	}
	public void setFa_email(String fa_email) {
		this.fa_email = fa_email;
	}
	public String getFa_password() {
		return fa_password;
	}
	public void setFa_password(String fa_password) {
		this.fa_password = fa_password;
	}
	public Integer getFa_sex() {
		return fa_sex;
	}
	public void setFa_sex(Integer fa_sex) {
		this.fa_sex = fa_sex;
	}
	public String getFa_qq() {
		return fa_qq;
	}
	public void setFa_qq(String fa_qq) {
		this.fa_qq = fa_qq;
	}
	public String getFa_weibo() {
		return fa_weibo;
	}
	public void setFa_weibo(String fa_weibo) {
		this.fa_weibo = fa_weibo;
	}
	
	public Integer getFa_life() {
		return fa_life;
	}
	public void setFa_life(Integer fa_life) {
		this.fa_life = fa_life;
	}
	public Integer getFa_hide_base() {
		return fa_hide_base;
	}
	public void setFa_hide_base(Integer fa_hide_base) {
		this.fa_hide_base = fa_hide_base;
	}
	public Integer getFa_edu() {
		return fa_edu;
	}
	public void setFa_edu(Integer fa_edu) {
		this.fa_edu = fa_edu;
	}
	public String getFa_school() {
		return fa_school;
	}
	public void setFa_school(String fa_school) {
		this.fa_school = fa_school;
	}
	public Integer getFa_hide_job() {
		return fa_hide_job;
	}
	public void setFa_hide_job(Integer fa_hide_job) {
		this.fa_hide_job = fa_hide_job;
	}
	public Integer getFa_hide_active() {
		return fa_hide_active;
	}
	public void setFa_hide_active(Integer fa_hide_active) {
		this.fa_hide_active = fa_hide_active;
	}
	public String getFa_name() {
		return fa_name;
	}
	public void setFa_name(String fa_name) {
		this.fa_name = fa_name;
	}
	public String getFa_idc() {
		return fa_idc;
	}
	public void setFa_idc(String fa_idc) {
		this.fa_idc = fa_idc;
	}
	public String getFa_idctype() {
		return fa_idctype;
	}
	public void setFa_idctype(String fa_idctype) {
		this.fa_idctype = fa_idctype;
	}
	public String getFa_title_img() {
		return fa_title_img;
	}
	public void setFa_title_img(String fa_title_img) {
		this.fa_title_img = fa_title_img;
	}
	public String getFa_mibao_qu_st() {
		return fa_mibao_qu_st;
	}
	public void setFa_mibao_qu_st(String fa_mibao_qu_st) {
		this.fa_mibao_qu_st = fa_mibao_qu_st;
	}
	public String getFa_mibao_qu_nd() {
		return fa_mibao_qu_nd;
	}
	public void setFa_mibao_qu_nd(String fa_mibao_qu_nd) {
		this.fa_mibao_qu_nd = fa_mibao_qu_nd;
	}
	public String getFa_mibao_qu_rd() {
		return fa_mibao_qu_rd;
	}
	public void setFa_mibao_qu_rd(String fa_mibao_qu_rd) {
		this.fa_mibao_qu_rd = fa_mibao_qu_rd;
	}
	public String getFa_mibao_ar_st() {
		return fa_mibao_ar_st;
	}
	public void setFa_mibao_ar_st(String fa_mibao_ar_st) {
		this.fa_mibao_ar_st = fa_mibao_ar_st;
	}
	public String getFa_mibao_ar_nd() {
		return fa_mibao_ar_nd;
	}
	public void setFa_mibao_ar_nd(String fa_mibao_ar_nd) {
		this.fa_mibao_ar_nd = fa_mibao_ar_nd;
	}
	public String getFa_mibao_ar_rd() {
		return fa_mibao_ar_rd;
	}
	public void setFa_mibao_ar_rd(String fa_mibao_ar_rd) {
		this.fa_mibao_ar_rd = fa_mibao_ar_rd;
	}
	public Integer getFa_feibiao() {
		return fa_feibiao;
	}
	public void setFa_feibiao(Integer fa_feibiao) {
		this.fa_feibiao = fa_feibiao;
	}
	public Integer getFa_jifen() {
		return fa_jifen;
	}
	public void setFa_jifen(Integer fa_jifen) {
		this.fa_jifen = fa_jifen;
	}
	public Integer getFa_ishost() {
		return fa_ishost;
	}
	public void setFa_ishost(Integer fa_ishost) {
		this.fa_ishost = fa_ishost;
	}
	public Integer getFa_issystem() {
		return fa_issystem;
	}
	public void setFa_issystem(Integer fa_issystem) {
		this.fa_issystem = fa_issystem;
	}
	public Integer getFa_speaker() {
		return fa_speaker;
	}
	public void setFa_speaker(Integer fa_speaker) {
		this.fa_speaker = fa_speaker;
	}
	public Integer getFa_listener() {
		return fa_listener;
	}
	public void setFa_listener(Integer fa_listener) {
		this.fa_listener = fa_listener;
	}
	public Integer getFa_isgetmsg() {
		return fa_isgetmsg;
	}
	public void setFa_isgetmsg(Integer fa_isgetmsg) {
		this.fa_isgetmsg = fa_isgetmsg;
	}
	public Integer getFa_status() {
		return fa_status;
	}
	public void setFa_status(Integer fa_status) {
		this.fa_status = fa_status;
	}
	
	
}
