package feiao.forum.pojo;

import java.io.Serializable;
/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 后台员工角色权限中间表
 */
public class RoleAndResource implements Serializable{
	
	private static final long serialVersionUID = 8618971717537555961L;
	/*`id` varchar(20) NOT NULL COMMENT '中间表',
	  `role_id` int(5) DEFAULT NULL COMMENT '角色id',
	  `re_code` varchar(100) DEFAULT NULL COMMENT '权限主键',*/
	private String id;
	private Integer role_id;
	private Integer re_code;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	public Integer getRe_code() {
		return re_code;
	}
	public void setRe_code(Integer re_code) {
		this.re_code = re_code;
	}
	
	
}
