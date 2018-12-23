package feiao.forum.pojo;

import java.io.Serializable;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 版块信息
 */
public class FaSection implements Serializable {

/**
	 * 
	 */
	private static final long serialVersionUID = 1646297256624402419L;
//	`fa_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '版块id',
	private Integer fa_id;
//	  `fa_desc` mediumtext COMMENT '版块信息',
	private String fa_desc;
	//版块名字
	private String fa_name;
	//版块父id
	private Integer fa_pid;
	//排序
	private Integer fa_sort;
	
//  `fa_postg` mediumtext COMMENT '发帖权限(用户组)',
	private String fa_postg;
//  `fa_repliesg` mediumtext COMMENT '回帖权限(用户组)',
	private String fa_repliesg;
//  `fa_zang` mediumtext COMMENT '点赞权限(用户组)',
	private String fa_zang;
//  `fa_voteg` mediumtext COMMENT '投票权限(用户组)',
	private String fa_voteg;
//  `fa_readg` mediumtext COMMENT '浏览权限(用户组)',
	private String fa_readg;
//  `fa_postr` varchar(1000) DEFAULT NULL COMMENT '发帖权限(会员等级)',
	private String fa_postr;
//  `fa_repliesr` varchar(1000) DEFAULT NULL COMMENT '回帖权限(会员等级)',
	private String fa_repliesr;
//  `fa_zanr` varchar(1000) DEFAULT NULL COMMENT '点赞权限(会员等级)',
	private String fa_zanr;
//  `fa_voter` varchar(1000) DEFAULT NULL COMMENT '投票权限(会员等级)',
	private String fa_voter;
//  `fa_readr` varchar(1000) DEFAULT NULL COMMENT '浏览权限(会员等级)',
	private String fa_readr;
	  
	public Integer getFa_id() {
		return fa_id;
	}
	public void setFa_id(Integer fa_id) {
		this.fa_id = fa_id;
	}
	public String getFa_desc() {
		return fa_desc;
	}
	public void setFa_desc(String fa_desc) {
		this.fa_desc = fa_desc;
	}
	public Integer getFa_pid() {
		return fa_pid;
	}
	public void setFa_pid(Integer fa_pid) {
		this.fa_pid = fa_pid;
	}
	public String getFa_name() {
		return fa_name;
	}
	public void setFa_name(String fa_name) {
		this.fa_name = fa_name;
	}
	public Integer getFa_sort() {
		return fa_sort;
	}
	public void setFa_sort(Integer fa_sort) {
		this.fa_sort = fa_sort;
	}
	public String getFa_postg() {
		return fa_postg;
	}
	public void setFa_postg(String fa_postg) {
		this.fa_postg = fa_postg;
	}
	public String getFa_repliesg() {
		return fa_repliesg;
	}
	public void setFa_repliesg(String fa_repliesg) {
		this.fa_repliesg = fa_repliesg;
	}
	public String getFa_zang() {
		return fa_zang;
	}
	public void setFa_zang(String fa_zang) {
		this.fa_zang = fa_zang;
	}
	public String getFa_voteg() {
		return fa_voteg;
	}
	public void setFa_voteg(String fa_voteg) {
		this.fa_voteg = fa_voteg;
	}
	public String getFa_readg() {
		return fa_readg;
	}
	public void setFa_readg(String fa_readg) {
		this.fa_readg = fa_readg;
	}
	public String getFa_postr() {
		return fa_postr;
	}
	public void setFa_postr(String fa_postr) {
		this.fa_postr = fa_postr;
	}
	public String getFa_repliesr() {
		return fa_repliesr;
	}
	public void setFa_repliesr(String fa_repliesr) {
		this.fa_repliesr = fa_repliesr;
	}
	public String getFa_zanr() {
		return fa_zanr;
	}
	public void setFa_zanr(String fa_zanr) {
		this.fa_zanr = fa_zanr;
	}
	public String getFa_voter() {
		return fa_voter;
	}
	public void setFa_voter(String fa_voter) {
		this.fa_voter = fa_voter;
	}
	public String getFa_readr() {
		return fa_readr;
	}
	public void setFa_readr(String fa_readr) {
		this.fa_readr = fa_readr;
	}
	
}


  
 