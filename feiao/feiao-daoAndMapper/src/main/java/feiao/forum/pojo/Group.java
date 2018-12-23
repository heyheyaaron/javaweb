package feiao.forum.pojo;

import java.io.Serializable;
/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 后台用户组
 */
public class Group implements Serializable{
	

	private static final long serialVersionUID = -2766675462372158500L;
	//	  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户组id',
	private Integer  id;
//	  `name` varchar(50) DEFAULT NULL COMMENT '名字',
	private String name;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	  
}
