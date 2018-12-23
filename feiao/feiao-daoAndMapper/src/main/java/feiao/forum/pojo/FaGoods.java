package feiao.forum.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 商品详细列表
 */
public class FaGoods implements Serializable{

	private static final long serialVersionUID = 3663393649382692707L;
	//	`fa_id` varchar(25) NOT NULL COMMENT '商品主键',
	private Integer fa_id;
//	  `fa_name` varchar(100) DEFAULT NULL COMMENT '商品名字',
	private String fa_name;
//	  `fa_cost` int(11) DEFAULT NULL COMMENT '价格',
	private Integer fa_cost;
//	  `fa_num` int(11) DEFAULT NULL COMMENT '库存',
	private Integer fa_num;
//	  `fa_isreturn` int(1) DEFAULT '0' COMMENT '0:不归还，1：归还',
	private Integer fa_isreturn;
//	  `fa_starttime` datetime DEFAULT NULL COMMENT '兑换开始时间',
	private Date fa_starttime;
//	  `fa_endtime` datetime DEFAULT NULL COMMENT '兑换结束时间',
	private Date fa_endtime;
//	  `fa_islong` int(1) DEFAULT '0' COMMENT '0:永久兑换，1：不是',
	private Integer fa_islong;
//	  `fa_desc` mediumtext COMMENT '描述',
	private String fa_desc;
	//图片
	private String fa_image;
	//温馨提示
	private String fa_tips;
	
	
	public String getFa_image() {
		return fa_image;
	}
	public void setFa_image(String fa_image) {
		this.fa_image = fa_image;
	}
	public String getFa_tips() {
		return fa_tips;
	}
	public void setFa_tips(String fa_tips) {
		this.fa_tips = fa_tips;
	}
	
	public Integer getFa_id() {
		return fa_id;
	}
	public void setFa_id(Integer fa_id) {
		this.fa_id = fa_id;
	}
	public String getFa_name() {
		return fa_name;
	}
	public void setFa_name(String fa_name) {
		this.fa_name = fa_name;
	}
	public Integer getFa_cost() {
		return fa_cost;
	}
	public void setFa_cost(Integer fa_cost) {
		this.fa_cost = fa_cost;
	}
	public Integer getFa_num() {
		return fa_num;
	}
	public void setFa_num(Integer fa_num) {
		this.fa_num = fa_num;
	}
	public Integer getFa_isreturn() {
		return fa_isreturn;
	}
	public void setFa_isreturn(Integer fa_isreturn) {
		this.fa_isreturn = fa_isreturn;
	}
	public Date getFa_starttime() {
		return fa_starttime;
	}
	public void setFa_starttime(Date fa_starttime) {
		this.fa_starttime = fa_starttime;
	}
	public Date getFa_endtime() {
		return fa_endtime;
	}
	public void setFa_endtime(Date fa_endtime) {
		this.fa_endtime = fa_endtime;
	}
	public Integer getFa_islong() {
		return fa_islong;
	}
	public void setFa_islong(Integer fa_islong) {
		this.fa_islong = fa_islong;
	}
	public String getFa_desc() {
		return fa_desc;
	}
	public void setFa_desc(String fa_desc) {
		this.fa_desc = fa_desc;
	}
	
	
}
