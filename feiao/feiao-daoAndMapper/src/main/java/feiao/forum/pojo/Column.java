package feiao.forum.pojo;

import java.io.Serializable;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 栏目文章
 */
public class Column implements Serializable{
	

	private static final long serialVersionUID = 4112947528211180766L;
//	  `id` int(11) NOT NULL COMMENT '栏目id',
	private Integer id;
//	  `name` varchar(100) DEFAULT NULL COMMENT '栏目标题',
	private String title;
//	  `desc` mediumtext COMMENT '栏目内容',
	private String descz;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescz() {
		return descz;
	}
	public void setDescz(String descz) {
		this.descz = descz;
	}
	
	
			  
}
