package feiao.forum.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 操作Cookie工具类
 * 
 */
public final class CookieTools {
	
	/**
	 * 向用户浏览器新增Cookie
	 * @param cookieName cookie的名称
	 * @param cookieValue cookie的值
	 * @param maxAge cookie的存活时间
	 */
	public static void addCookie(String cookieName,
							String cookieValue, int maxAge,HttpServletResponse response,HttpServletRequest request){
		/** 获取Cookie */
		Cookie cookie = getCookie(cookieName,request);
		/** 判断Cookie */
		if (cookie == null){
			/** 创建一个新的Cookie */
			cookie = new Cookie(cookieName, cookieValue);
		}else{
			cookie.setValue(cookieValue);
		}
		/** 设置Cookie的过期时间(按秒计算) */
		cookie.setMaxAge(maxAge);
		/** 设置Cookie的访问路径 http://localhost:8080/ http://www.it.com */
		cookie.setPath("/");
		/** 设置Cookie跨二级域名访问 http://www.itcast.cn http://t.cast.cn */
		//cookie.setDomain(".cast.cn");
		response.addCookie(cookie);
	}
	/**
	 * 向用户浏览器修改Cookie
	 * @param cookieName cookie的名称
	 * @param cookieValue cookie的值
	 * @param maxAge cookie的存活时间
	 */
	public static void updateCookie(String cookieName,
			String cookieValue, int maxAge,HttpServletResponse response,HttpServletRequest request){
		/** 获取Cookie */
		Cookie cookie = getCookie(cookieName,request);
		/** 判断Cookie */
		if (cookie == null){
			/** 创建一个新的Cookie */
			cookie = new Cookie(cookieName, cookieValue);
		}
		/** 设置Cookie的过期时间(按秒计算) */
		cookie.setMaxAge(maxAge);
		/** 设置Cookie的访问路径 http://localhost:8080/ http://www.it.com */
		cookie.setPath("/");
		cookie.setValue(cookieValue);
		/** 设置Cookie跨二级域名访问 http://www.itcast.cn http://t.cast.cn */
		//cookie.setDomain(".cast.cn");
		response.addCookie(cookie);
	}
	/**
	 * 根据cookie名称获取指定的cookie
	 * @param cookieName cookie的名称
	 * @return cookie
	 */
	public static Cookie getCookie(String cookieName,HttpServletRequest request){
		/** 获取用户浏览器中所有的cookie */
		Cookie[] cookies = request.getCookies();
		/** 判断cookies */
		if (cookies != null){
			/** 迭代所有的cookie */
			for (Cookie cookie : cookies){
				if (cookie.getName().equals(cookieName)){
					return cookie;
				}
			}
		}
		return null;
	}
	/**
	 * 根据cookie名称删除指定的cookie
	 * @param cookieName cookie的名称
	 */
	public static void removeCookie(String cookieName,HttpServletResponse response,HttpServletRequest request){
		/** 获取cookie */
		Cookie cookie = getCookie(cookieName,request);
		if (cookie != null){
			/** 设置Cookie失效 */
			cookie.setMaxAge(0);
			/** 设置Cookie的访问路径 http://localhost:8080/ http://www.it.com */
			cookie.setPath("/");
			/** 添加Cookie */
			response.addCookie(cookie);
		}
	}
}