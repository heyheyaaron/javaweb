package feiao.forum.service;
/**
 * 常量类
 * @author LEE.SIU.WAH
 * @email lixiaohua7@163.com
 * @date 2016年12月6日 上午11:07:54
 * @version 1.0
 */
public final class Constant {
	/** 定义存放在Session中的用户 */
	public static final String SESSION_USER = "session_user";
	public static final String SESSION_SOCKET = "session_socket";
	/** 定义Cookie的名称 */
	public static final String COOKIE_NAME = "feiao_cookie_users";

	/** 定义存放在Session中的用户 */
	public static final String SESSION_USERH = "session_userh";
	/** 定义Cookie的名称 */
	public static final String COOKIE_NAMEH = "feiao_cookie_userh";
	/** 定义Cookie中购物车的名称 */
	public static final String COOKIE_SHOPNAME = "feiao_shop_cars";
	/** 定义Cookie的有效时间(7天) 按秒计算  */
	public static final int MAX_AGE = 60 * 60 * 24 * 7;
	/** 定义存放在Session中的验证码 */
	public static final String SMS_CODE = "sms_code";
	/** 定义存放在Session中的验证码 */
	public static final String SMS_CODES = "sms_codes";
	/** 定义存放在Session中登录用户的总数量 */
	public static final String LOGIN_USER_COUNT = "login_user_count";
	
	//网站的IP地址
	public static final String URL_FA = "106.14.104.33" ;
	//网站域名
	public static final String WEB_FA = "http://bbs.fiio.net" ;
	//网站的域名（编辑器使用）
	public static final String URL_WEB = "http://bbs.fiio.net/attached/" ;
	
	
}
