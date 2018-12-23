package feiao.forum.pojo;

import java.io.Serializable;

/**
 * 
 * @author OwenLCH
 * @project feiao
 * @name 会员与产品型号的关系表
 */
public class ErpPds implements Serializable{

	private static final long serialVersionUID = 1027887448180101022L;
//	  `ID` int(1) NOT NULL AUTO_INCREMENT COMMENT '主键',
	private Integer ID;
//	  `WLM` varchar(50) NOT NULL COMMENT '产品盒码',
	private String WLM;
//	  `FWMM` varchar(50) DEFAULT NULL COMMENT '加密后的注册码',
	private String FWMM;
//	  `PRDNO` varchar(50) DEFAULT NULL COMMENT '产品代号',
	private String PRDNO;
//	  `userid` varchar(20) DEFAULT NULL COMMENT '绑定会员id',
	private String userid;
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public String getWLM() {
		return WLM;
	}
	public void setWLM(String wLM) {
		WLM = wLM;
	}
	public String getFWMM() {
		return FWMM;
	}
	public void setFWMM(String fWMM) {
		FWMM = fWMM;
	}
	public String getPRDNO() {
		return PRDNO;
	}
	public void setPRDNO(String pRDNO) {
		PRDNO = pRDNO;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
			  
}
