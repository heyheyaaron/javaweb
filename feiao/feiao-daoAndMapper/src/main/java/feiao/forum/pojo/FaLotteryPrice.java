package feiao.forum.pojo;

import java.io.Serializable;
/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 奖品信息表
 */
public class FaLotteryPrice implements Serializable{

	private static final long serialVersionUID = 7751277910433015150L;
	//	`fa_id` varchar(15) DEFAULT NULL COMMENT '奖品id',
	private Integer fa_id;
//	  `fa_name` varchar(50) DEFAULT NULL COMMENT '奖品名字',
	private String fa_name;
//	  `fa_type` int(1) DEFAULT '0' COMMENT '奖品类型：0：飞镖，1：物品',
	private Integer fa_type;
//	  `fa_num` int(11) DEFAULT '0' COMMENT '类型为飞镖时奖品数量',
	private Integer fa_num;
//	  `fa_img` varchar(100) DEFAULT NULL COMMENT '奖品图片',
	private String fa_img;
//	  `fa_percent` double(5,2) DEFAULT NULL COMMENT '概率'
	private Double fa_percent;
	//排序
	private Integer fa_sort;
	
	public Integer getFa_sort() {
		return fa_sort;
	}
	public void setFa_sort(Integer fa_sort) {
		this.fa_sort = fa_sort;
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
	public Integer getFa_type() {
		return fa_type;
	}
	public void setFa_type(Integer fa_type) {
		this.fa_type = fa_type;
	}
	public Integer getFa_num() {
		return fa_num;
	}
	public void setFa_num(Integer fa_num) {
		this.fa_num = fa_num;
	}
	public String getFa_img() {
		return fa_img;
	}
	public void setFa_img(String fa_img) {
		this.fa_img = fa_img;
	}
	public Double getFa_percent() {
		return fa_percent;
	}
	public void setFa_percent(Double fa_percent) {
		this.fa_percent = fa_percent;
	}
	
	
	
}
