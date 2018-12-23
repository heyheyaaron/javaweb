package feiao.forum.pojo;

public class FaWare {
	
//	  `fa_id` varchar(15) NOT NULL COMMENT '固件表主键',
	private String fa_id;
//	  `fa_name` varchar(100) DEFAULT NULL COMMENT '名称（型号）',
	private String fa_name;
//	  `fa_image` varchar(200) DEFAULT NULL COMMENT '图片',
	private String fa_image;
//	  `fa_sort` int(11) DEFAULT NULL COMMENT '排序',
	private Integer fa_sort;
//	  `fa_url` varbinary(500) DEFAULT NULL COMMENT '链接',
	private String fa_url;
	public String getFa_id() {
		return fa_id;
	}
	public void setFa_id(String fa_id) {
		this.fa_id = fa_id;
	}
	public String getFa_name() {
		return fa_name;
	}
	public void setFa_name(String fa_name) {
		this.fa_name = fa_name;
	}
	public String getFa_image() {
		return fa_image;
	}
	public void setFa_image(String fa_image) {
		this.fa_image = fa_image;
	}
	public Integer getFa_sort() {
		return fa_sort;
	}
	public void setFa_sort(Integer fa_sort) {
		this.fa_sort = fa_sort;
	}
	public String getFa_url() {
		return fa_url;
	}
	public void setFa_url(String fa_url) {
		this.fa_url = fa_url;
	}
	
	
	
	  
}
