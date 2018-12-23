package feiao.forum.util;

import java.io.UnsupportedEncodingException;

import org.apache.commons.codec.binary.Base64;

public class CookieUtils {
	/** 
     * 编码 
     * @param cookieStr 
     * @return 
     */  
    public static String encodeBase64(String cookieStr){  
          
        try {  
            cookieStr = new String(Base64.encodeBase64(cookieStr.getBytes("UTF-8")));  
        } catch (UnsupportedEncodingException e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  
        return cookieStr;  
    }  
  
    /** 
     * 解码 
     * @param cookieStr 
     * @return 
     */  
    public static String decodeBase64(String cookieStr){  
        try {  
            cookieStr = new String(Base64.decodeBase64(cookieStr.getBytes()), "UTF-8");  
        } catch (UnsupportedEncodingException e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  
        return cookieStr;  
    }  
}
