package feiao.forum.pojo;

import java.io.Serializable;
import java.util.Date;
/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 后台员工表
 */
 
public class User implements Serializable{
	
	private static final long serialVersionUID = 7942640082810162532L;
	/*`username` varchar(50) NOT NULL COMMENT '员工用户id',
	  `password` varchar(50) DEFAULT NULL COMMENT '密码',
	  `isdel` int(1) DEFAULT '0' COMMENT '是否删除，0为没删除，1为已删除',
	  `deltime` datetime DEFAULT NULL COMMENT '删除时间',
	  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
	  `salt` varchar(50) DEFAULT NULL COMMENT '加密盐',
	  `role_id` int(3) DEFAULT NULL COMMENT '角色id',*/
	private String username;
	private String password;
	private Integer isdel;
	private Date deltime;
	private String name;
	private String salt;
	private Integer role_id;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getIsdel() {
		return isdel;
	}
	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}
	public Date getDeltime() {
		return deltime;
	}
	public void setDeltime(Date deltime) {
		this.deltime = deltime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", isdel=" + isdel + ", deltime=" + deltime
				+ ", name=" + name + ", salt=" + salt + ", role_id=" + role_id + "]";
	}
	
}
