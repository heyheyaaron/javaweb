package feiao.forum.pojo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 帖子
 */
public class FaNote  implements Serializable{
	
/**
	 * 
	 */
	private static final long serialVersionUID = -5737698815373110711L;
//	  `fa_id` varchar(21) NOT NULL COMMENT '帖子id',
	private String fa_id;
//	  `fa_userid` varchar(20) DEFAULT NULL COMMENT '帖子发布者',
	private String fa_userid;
//	  `fa_start_time` datetime DEFAULT NULL COMMENT '帖子创建时间',
	
	private Date fa_start_time;
	private Date fa_changetime;
//	  `fa_desc` mediumtext COMMENT '帖子内容',
	private String fa_desc;
//	  `fa_type` int(1) DEFAULT '0' COMMENT '0:主题帖，1：活动贴',
	private Integer fa_type;
//	  `fa_jingpin` int(1) DEFAULT '0' COMMENT '1为精品',
	private Integer fa_jingpin;
//	  `fa_order` int(11) DEFAULT NULL COMMENT '排序',
	private Integer fa_order;
//	  `fa_title` varchar(100) DEFAULT NULL COMMENT '帖子标题',
	private String fa_title;
//	  `fa_ceng` int(11) DEFAULT '0' COMMENT '评论楼层',
	private Integer fa_ceng;
//	  `fa_total_people` int(11) DEFAULT '0' COMMENT '活动参与人数上限',
	private Integer fa_total_people;
//	  `fa_resource` int(11) DEFAULT '0' COMMENT '帖子属于哪个版块',
	private Integer fa_resource;
//	  `fa_type_re` varchar(20) DEFAULT NULL COMMENT '帖子属于该版块下哪个分类',
	private String fa_type_re;
//	  `fa_ping` int(11) DEFAULT NULL COMMENT '阅读量',
	private Integer fa_ping;
	
//	  `fa_nohot` int(1) DEFAULT '0' COMMENT '0:上热搜 1 不上热搜',
	private Integer fa_nohot;
//	  `fa_zhiding` int(1) DEFAULT '0' COMMENT '1:置顶',
	private Integer fa_zhiding;
//	  `fa_gaoliang` int(1) DEFAULT '0' COMMENT '1:高亮',
	private Integer fa_gaoliang;
//	  `fa_protype` varchar(500) DEFAULT NULL COMMENT '产品型号（反馈贴）',
	private String fa_protype;
//	  `fa_proversion` varchar(500) DEFAULT NULL COMMENT '软件版本（反馈贴）',
	private String fa_proversion;
//	  `fa_prodel` int(1) DEFAULT '0' COMMENT '0:待处理，1：处理中，2：已处理（反馈贴）',
	private Integer fa_prodel;
//	  `fa_finish_people` int(11) DEFAULT '0' COMMENT '已参与活动人数（活动贴）',
	private Integer fa_finish_people;
	//热搜阅读量
	private Integer fa_readed;
	//准备上热搜的阅读量
	private Integer fa_reading;
	private Integer fa_dod;
	private Integer fa_votetype;
	private Integer fa_biaoqian;
	
//	 `fa_protypes` int(11) DEFAULT '0',
	private Integer fa_protypes;
//	  `fa_prostyle` int(11) DEFAULT '0',
	private Integer fa_prostyle;
//	  `fa_proquest` int(11) DEFAULT '0',
	private Integer fa_proquest;
//	  `fa_version` varbinary(500) DEFAULT NULL COMMENT '固体版本',
	private String fa_version;
	
	private Date fa_votetime;
	
	
	public Date getFa_votetime() {
		return fa_votetime;
	}
	public void setFa_votetime(Date fa_votetime) {
		this.fa_votetime = fa_votetime;
	}
	private Integer fa_votemeb;
	
	public Integer getFa_votemeb() {
		return fa_votemeb;
	}
	public void setFa_votemeb(Integer fa_votemeb) {
		this.fa_votemeb = fa_votemeb;
	}
	public Integer getFa_protypes() {
		return fa_protypes;
	}
	public void setFa_protypes(Integer fa_protypes) {
		this.fa_protypes = fa_protypes;
	}
	public Integer getFa_prostyle() {
		return fa_prostyle;
	}
	public void setFa_prostyle(Integer fa_prostyle) {
		this.fa_prostyle = fa_prostyle;
	}
	public Integer getFa_proquest() {
		return fa_proquest;
	}
	public void setFa_proquest(Integer fa_proquest) {
		this.fa_proquest = fa_proquest;
	}
	public String getFa_version() {
		return fa_version;
	}
	public void setFa_version(String fa_version) {
		this.fa_version = fa_version;
	}
	public Integer getFa_biaoqian() {
		return fa_biaoqian;
	}
	public void setFa_biaoqian(Integer fa_biaoqian) {
		this.fa_biaoqian = fa_biaoqian;
	}
	public Integer getFa_dod() {
		return fa_dod;
	}
	public void setFa_dod(Integer fa_dod) {
		this.fa_dod = fa_dod;
	}
	public Integer getFa_votetype() {
		return fa_votetype;
	}
	public void setFa_votetype(Integer fa_votetype) {
		this.fa_votetype = fa_votetype;
	}
	public Integer getFa_readed() {
		return fa_readed;
	}
	public void setFa_readed(Integer fa_readed) {
		this.fa_readed = fa_readed;
	}
	public Integer getFa_reading() {
		return fa_reading;
	}
	public void setFa_reading(Integer fa_reading) {
		this.fa_reading = fa_reading;
	}
	public Integer getFa_nohot() {
		return fa_nohot;
	}
	public void setFa_nohot(Integer fa_nohot) {
		this.fa_nohot = fa_nohot;
	}
	public Integer getFa_zhiding() {
		return fa_zhiding;
	}
	public void setFa_zhiding(Integer fa_zhiding) {
		this.fa_zhiding = fa_zhiding;
	}
	public Integer getFa_gaoliang() {
		return fa_gaoliang;
	}
	public void setFa_gaoliang(Integer fa_gaoliang) {
		this.fa_gaoliang = fa_gaoliang;
	}
	public String getFa_protype() {
		return fa_protype;
	}
	public void setFa_protype(String fa_protype) {
		this.fa_protype = fa_protype;
	}
	public String getFa_proversion() {
		return fa_proversion;
	}
	public void setFa_proversion(String fa_proversion) {
		this.fa_proversion = fa_proversion;
	}
	public Integer getFa_prodel() {
		return fa_prodel;
	}
	public void setFa_prodel(Integer fa_prodel) {
		this.fa_prodel = fa_prodel;
	}
	public Integer getFa_finish_people() {
		return fa_finish_people;
	}
	public void setFa_finish_people(Integer fa_finish_people) {
		this.fa_finish_people = fa_finish_people;
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
	public Date getFa_start_time() {
		return fa_start_time;
	}
	public void setFa_start_time(Date fa_start_time) {
		this.fa_start_time = fa_start_time;
	}
	public String getFa_desc() {
		return fa_desc;
	}
	public void setFa_desc(String fa_desc) {
		this.fa_desc = fa_desc;
	}
	public Integer getFa_type() {
		return fa_type;
	}
	public void setFa_type(Integer fa_type) {
		this.fa_type = fa_type;
	}
	public Integer getFa_jingpin() {
		return fa_jingpin;
	}
	public void setFa_jingpin(Integer fa_jingpin) {
		this.fa_jingpin = fa_jingpin;
	}
	public Integer getFa_order() {
		return fa_order;
	}
	public void setFa_order(Integer fa_order) {
		this.fa_order = fa_order;
	}
	public String getFa_title() {
		return fa_title;
	}
	public void setFa_title(String fa_title) {
		this.fa_title = fa_title;
	}
	public Integer getFa_ceng() {
		return fa_ceng;
	}
	public void setFa_ceng(Integer fa_ceng) {
		this.fa_ceng = fa_ceng;
	}
	public Integer getFa_total_people() {
		return fa_total_people;
	}
	public void setFa_total_people(Integer fa_total_people) {
		this.fa_total_people = fa_total_people;
	}
	public Integer getFa_resource() {
		return fa_resource;
	}
	public void setFa_resource(Integer fa_resource) {
		this.fa_resource = fa_resource;
	}
	public String getFa_type_re() {
		return fa_type_re;
	}
	public void setFa_type_re(String fa_type_re) {
		this.fa_type_re = fa_type_re;
	}
	public Integer getFa_ping() {
		return fa_ping;
	}
	public void setFa_ping(Integer fa_ping) {
		this.fa_ping = fa_ping;
	}
	public Date getFa_changetime() {
		return fa_changetime;
	}
	public void setFa_changetime(Date fa_changetime) {
		this.fa_changetime = fa_changetime;
	}
	  
}
