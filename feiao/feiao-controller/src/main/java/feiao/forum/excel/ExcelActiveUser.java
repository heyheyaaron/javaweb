package feiao.forum.excel;

import java.util.Map;

public class ExcelActiveUser {
	private String name;
	private String tel;
	private String email;
	private String time;
	private String tn;
	private String adress;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTn() {
		return tn;
	}
	public void setTn(String tn) {
		this.tn = tn;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public ExcelActiveUser() {
		super();
	}
	public ExcelActiveUser(Map<String, Object> map) {
		super();
		if(map.get("name")!=null){
			this.name = map.get("name").toString();
		}else{
			this.name = "该会员没有设置昵称或已被删除";
		}
		if(map.get("tel")!=null){
			this.tel = map.get("tel").toString();
		}else{
			this.tel = "该会员已被删除";
		}
		if(map.get("email")!=null){
			this.email = map.get("email").toString();
		}else{
			this.email = "该会员已被删除";
		}
		
		
		
		
		this.time = map.get("times").toString();
		this.tn = map.get("tn").toString();
		this.adress = map.get("adress").toString();
	}
	
}
