package feiao.forum.pojo;

import java.io.Serializable;
/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 后台员工角色表
 */
public class Role implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4026415141159268994L;
	/*`id` int(5) NOT NULL AUTO_INCREMENT COMMENT '角色id',
	  `name` varchar(50) DEFAULT NULL COMMENT '角色姓名',
	  `remark` varchar(200) DEFAULT NULL COMMENT '角色描述',
	  `code` varchar(50) DEFAULT NULL COMMENT '角色代码',*/
	private Integer id;
	private String name;
	private String remark;
	private String code;
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
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
}
