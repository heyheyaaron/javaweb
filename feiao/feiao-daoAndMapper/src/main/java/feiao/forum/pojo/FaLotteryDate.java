package feiao.forum.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 抽奖记录表
  */
public class FaLotteryDate implements Serializable{

	private static final long serialVersionUID = -7438160881051904012L;
//	`fa_id` varchar(25) NOT NULL COMMENT '抽奖记录id',
	private String fa_id;
//	  `fa_userid` varchar(20) DEFAULT NULL COMMENT '用户id',
	private String fa_userid;
//	  `fa_name` varchar(50) DEFAULT NULL COMMENT '奖品名字',
	private String fa_name;
//	  `fa_time` datetime DEFAULT NULL COMMENT '抽奖时间',
	private Date fa_time;

//	  `fa_isfinish` int(1) DEFAULT '0' COMMENT '0:为兑奖，1：已兑奖',
	private Integer fa_isfinish;
//	  `fa_adress` varchar(200) DEFAULT NULL COMMENT '地址信息'
	private String fa_adress;
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
	public String getFa_name() {
		return fa_name;
	}
	public void setFa_name(String fa_name) {
		this.fa_name = fa_name;
	}
	public Date getFa_time() {
		return fa_time;
	}
	public void setFa_time(Date fa_time) {
		this.fa_time = fa_time;
	}
	
	public Integer getFa_isfinish() {
		return fa_isfinish;
	}
	public void setFa_isfinish(Integer fa_isfinish) {
		this.fa_isfinish = fa_isfinish;
	}
	public String getFa_adress() {
		return fa_adress;
	}
	public void setFa_adress(String fa_adress) {
		this.fa_adress = fa_adress;
	}
	
	
}
