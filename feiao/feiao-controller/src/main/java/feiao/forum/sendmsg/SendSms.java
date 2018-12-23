/* 
 * Copyright (C), 2004-2011, 三五互联科技股份有限公司
 * File Name: sms.SendSms.java
 * Encoding UTF-8 
 * Version: 1.0 
 * Date: 2012-12-7
 * History:
 * 1. Date: 2012-12-7
 *    Author: chengke1
 *    Modification: 新建
 * 2. ...
 */
package feiao.forum.sendmsg;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

import feiao.forum.util.RandomTools;

/**
 * @author chengke1@35.cn
 *
 * @vesion Revison:0.01 2012-12-7
 */
public  class SendSms {

	/**
	 * @description 函数的目的/功能
	 * @param args
	 * @author xucy
	 */
	/*public static void main(String[] args) {
		try {
			sendSMSDemo("13543419415,13104881574","rrewww");
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
	public static void sendSMSDemo(String tel,String code) throws HttpException, IOException{ 
        HttpClient httpClient = new HttpClient();    
        String url = "http://119.145.253.67:8080/edeeserver/sendSMS.do";  
        PostMethod postMethod = new PostMethod(url);  
           SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
           String id = sdf.format(new Date())+RandomTools.getRandomString(2);
		   postMethod.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, 
		    "GBK"); 
		      String userId = "900869";
			  String password = "It201705";
		        NameValuePair[]    data    = {    
		        new    NameValuePair("UserName",userId),  
		        new    NameValuePair("TimeStamp",""),  
		        new    NameValuePair("Password",   password),  
		        new    NameValuePair("MobileNumber",tel),  
		        new    NameValuePair("MsgContent",    "【飞傲电子】您本次验证码是 "+code+" 请不要对外泄露"),  
		        new    NameValuePair("MsgIdentify",id)   };  
		        postMethod.setRequestBody(data);  
		        int    statusCode    =    httpClient.executeMethod(postMethod); 
		        System.out.println(statusCode); 
		        String soapRequestData =    postMethod.getResponseBodyAsString(); 
		        System.out.println("----------: "+soapRequestData); 
}

	/*public static void sendSMSDemo() throws HttpException, IOException{
    	HttpClient httpClient = new HttpClient();
    	String url = "http://119.145.253.67:8080/edeeserver/sendSMS.do";
    	PostMethod postMethod = new PostMethod(url);
    	postMethod.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
    	String UserName = "900869";
    	String password = "It201705";
    	String TimeStamp = "";
    	NameValuePair[] data = {
    	new NameValuePair("UserName",UserName),
    	new NameValuePair("TimeStamp", TimeStamp),
    	new NameValuePair("Password", password),
    	new NameValuePair("MobileNumber", "13543419415"),
    	new NameValuePair("MsgIdentify", "2123"),
    	new NameValuePair("MsgContent", "接口短信发送测试。即时短信发送")};
    	postMethod.setRequestBody(data);
    	System.out.println(postMethod.getRequestEntity().toString());
    	int statusCode = httpClient.executeMethod(postMethod);
    	System.out.println(statusCode);
    	String soapRequestData = postMethod.getResponseBodyAsString();
    	System.out.println(soapRequestData);
	}*/
}
