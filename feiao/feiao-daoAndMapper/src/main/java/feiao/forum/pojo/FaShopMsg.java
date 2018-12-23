package feiao.forum.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 商品兑换信息
 */
public class FaShopMsg implements Serializable{

	private static final long serialVersionUID = -8207916571165634993L;
	//	 `fa_id` varchar(25) NOT NULL COMMENT '兑换信息',
	public String fa_id;
//	  `fa_userid` varchar(20) DEFAULT NULL COMMENT '用户id',
	public String fa_userid;
//	  `fa_goodname` varchar(100) DEFAULT NULL COMMENT '商品名字',
	public String fa_goodname;
//	  `fa_cost` int(11) DEFAULT NULL COMMENT '话费数量',
	public Integer fa_cost;
//	  `fa_adress` varchar(200) DEFAULT NULL COMMENT '收货信息',
	public String fa_adress;
//	  `fa_time` date DEFAULT NULL COMMENT '兑换日期',
	public Date fa_time;
//	  `fa_type` int(1) DEFAULT '0' COMMENT '0:待发货，1：已发货，2：已收货，3已退货',
	public Integer fa_type;
	
	public Integer fa_goodid;
	public Integer fa_num;
	
	
	public Integer getFa_num() {
		return fa_num;
	}
	public void setFa_num(Integer fa_num) {
		this.fa_num = fa_num;
	}
	public Integer getFa_goodid() {
		return fa_goodid;
	}
	public void setFa_goodid(Integer fa_goodid) {
		this.fa_goodid = fa_goodid;
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
	public String getFa_goodname() {
		return fa_goodname;
	}
	public void setFa_goodname(String fa_goodname) {
		this.fa_goodname = fa_goodname;
	}
	public Integer getFa_cost() {
		return fa_cost;
	}
	public void setFa_cost(Integer fa_cost) {
		this.fa_cost = fa_cost;
	}
	public String getFa_adress() {
		return fa_adress;
	}
	public void setFa_adress(String fa_adress) {
		this.fa_adress = fa_adress;
	}
	public Date getFa_time() {
		return fa_time;
	}
	public void setFa_time(Date fa_time) {
		this.fa_time = fa_time;
	}
	public Integer getFa_type() {
		return fa_type;
	}
	public void setFa_type(Integer fa_type) {
		this.fa_type = fa_type;
	}
	
}
