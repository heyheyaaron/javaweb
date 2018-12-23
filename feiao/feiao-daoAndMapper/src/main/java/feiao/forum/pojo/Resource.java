package feiao.forum.pojo;

import java.io.Serializable;
/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 后台员工权限表
 */
public class Resource implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1403151476329086752L;
	/*`code` varchar(100) NOT NULL COMMENT '权限主键（0001...0002）,',
	  `name` varchar(50) DEFAULT NULL COMMENT '权限名字',
	  `type` varchar(10) DEFAULT NULL COMMENT 'menu与button',
	  `url` varchar(100) DEFAULT NULL COMMENT '访问地址',
	  `permission` varchar(100) DEFAULT NULL COMMENT '资源请求权限',*/
	private Integer id;
	private String name;
	private Integer isHeader;
	private String url;
	private String permission;
	private Integer parentId;
	private String icon;
	private Integer ishiddent;
	private Integer isbutton;
	private Integer sort;
	
	
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public Integer getIsbutton() {
		return isbutton;
	}
	public void setIsbutton(Integer isbutton) {
		this.isbutton = isbutton;
	}
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
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public Integer getIsHeader() {
		return isHeader;
	}
	public void setIsHeader(Integer isHeader) {
		this.isHeader = isHeader;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public Integer getIshiddent() {
		return ishiddent;
	}
	public void setIshiddent(Integer ishiddent) {
		this.ishiddent = ishiddent;
	}
	@Override
	public String toString() {
		return "Resource [id=" + id + ", name=" + name + ", isHeader=" + isHeader + ", url=" + url + ", permission="
				+ permission + ", parentId=" + parentId + ", icon=" + icon + ", ishiddent=" + ishiddent + ", isbutton="
				+ isbutton + ", sort=" + sort + "]";
	}
	
	
	
}
