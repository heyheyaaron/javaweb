package feiao.forum.pojo;

import java.io.Serializable;
/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name  会员等级表
 */
public class FaRank implements Serializable{
	

	private static final long serialVersionUID = -1928839344157342747L;
//	  `fa_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员等级id',
	private Integer fa_id;
//	  `fa_name` varchar(100) DEFAULT NULL COMMENT '名字',
	private String fa_name;
//	  `fa_start` int(11) DEFAULT NULL COMMENT '开始积分',
	private Integer fa_start;
//	  `fa_end` int(11) DEFAULT NULL COMMENT '结束积分',
	private Integer fa_end;
//	会员图标
	private String fa_image;
//	
//	  `fa_notev` int(1) DEFAULT '0' COMMENT '1:发帖时需要验证',
	private Integer fa_notev;
//	  `fa_rev` int(1) DEFAULT '0' COMMENT '1:评论时需要验证',
	private Integer fa_rev;

	public Integer getFa_notev() {
		return fa_notev;
	}

	public void setFa_notev(Integer fa_notev) {
		this.fa_notev = fa_notev;
	}

	public Integer getFa_rev() {
		return fa_rev;
	}

	public void setFa_rev(Integer fa_rev) {
		this.fa_rev = fa_rev;
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

	public Integer getFa_start() {
		return fa_start;
	}

	public void setFa_start(Integer fa_start) {
		this.fa_start = fa_start;
	}

	public Integer getFa_end() {
		return fa_end;
	}

	public void setFa_end(Integer fa_end) {
		this.fa_end = fa_end;
	}

	public String getFa_image() {
		return fa_image;
	}

	public void setFa_image(String fa_image) {
		this.fa_image = fa_image;
	}
	
}
