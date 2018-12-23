package feiao.forum.pojo;

import java.io.Serializable;
import java.util.Date;
/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 产品信息表
 */
public class FaProduct implements Serializable{
	

	private static final long serialVersionUID = -995193855801893818L;
//	  `fa_id` varchar(50) NOT NULL COMMENT '产品代码',
	private String fa_id;
//	  `fa_title` varchar(200) DEFAULT NULL COMMENT '产品标签',
	private String fa_title;
//	  `fa_image` varchar(500) DEFAULT NULL COMMENT '产品图片',
	private String fa_image;
//	  `fa_ma` varchar(100) DEFAULT NULL COMMENT '产品条形码',
	private String fa_ma;
//	  `fa_type` varchar(100) DEFAULT NULL COMMENT '产品型号',
	private String fa_type;
	//创建时间
	private Date fa_time;
	
	public Date getFa_time() {
		return fa_time;
	}
	public void setFa_time(Date fa_time) {
		this.fa_time = fa_time;
	}
	public String getFa_id() {
		return fa_id;
	}
	public void setFa_id(String fa_id) {
		this.fa_id = fa_id;
	}
	public String getFa_title() {
		return fa_title;
	}
	public void setFa_title(String fa_title) {
		this.fa_title = fa_title;
	}
	public String getFa_image() {
		return fa_image;
	}
	public void setFa_image(String fa_image) {
		this.fa_image = fa_image;
	}
	public String getFa_ma() {
		return fa_ma;
	}
	public void setFa_ma(String fa_ma) {
		this.fa_ma = fa_ma;
	}
	public String getFa_type() {
		return fa_type;
	}
	public void setFa_type(String fa_type) {
		this.fa_type = fa_type;
	}
	
			  
}
