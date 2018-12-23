package feiao.forum.emailUtil;
import com.sun.mail.util.MailSSLSocketFactory;
import org.apache.log4j.Logger;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.List;
import java.util.Properties;
public class EmailUtil {
	 private static Logger logger = Logger.getLogger("EmailUtil.class");

	    //用户名密码验证，需要实现抽象类Authenticator的抽象方法PasswordAuthentication
	    static class MyAuthenricator extends Authenticator{
	        String u = null;
	        String p = null;
	        public MyAuthenricator(String u,String p){
	            this.u=u;
	            this.p=p;
	        }
	        @Override
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(u,p);
	        }
	    }

	    public static  void send(String getUserEmail,String title,String context){
	        Properties prop = new Properties();
	        //协议
	        prop.setProperty("mail.transport.protocol", "smtps");
	        //服务器
	        prop.setProperty("mail.smtp.host", "smtp.exmail.qq.com");
	        //端口
	        prop.setProperty("mail.smtp.port", "25");
	        //使用smtp身份验证
	        prop.setProperty("mail.smtp.auth", "true");
	        //使用SSL，企业邮箱必需！
	        //开启安全协议
	        MailSSLSocketFactory sf = null;
	        try {
	            sf = new MailSSLSocketFactory();
	            sf.setTrustAllHosts(true);
	        } catch (GeneralSecurityException e1) {
	            e1.printStackTrace();
	        }
//	        prop.put("mail.smtp.ssl.enable", "true");
	        prop.put("mail.smtp.starttls.enable", "true");
	        prop.put("mail.smtp.ssl.socketFactory", sf);
	        //发件人，进行权限认证
	        Session session = Session.getDefaultInstance(prop, new MyAuthenricator("cert@fiio.net", "ZEFsGMB8YAUZjqjf"));
//	        session.setDebug(true);
	        MimeMessage mimeMessage = new MimeMessage(session);
	        try {
	        //发件人地址
	            mimeMessage.setFrom(new InternetAddress("cert@fiio.net",""));
	            //收件人的地址
	            mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(getUserEmail));
	            mimeMessage.setSubject(title);
	            mimeMessage.setSentDate(new Date());
	            
	            // MiniMultipart类是一个容器类，包含MimeBodyPart类型的对象
	            Multipart mainPart = new MimeMultipart();
	            // 创建一个包含HTML内容的MimeBodyPart
	            BodyPart html = new MimeBodyPart();
	            // 设置HTML内容
	            html.setContent(context, "text/html; charset=utf-8");
	            mainPart.addBodyPart(html);
	            
	            mimeMessage.setContent(mainPart);
	            /*mimeMessage.setText(context);*/
	            mimeMessage.saveChanges();
	            Transport.send(mimeMessage);
	        } catch (Exception e) {
	            logger.error("scan 邮件异常 " +e);

	        }
	    }
	    public static  void sends(List<String> list,String title,String context){
	    	Properties prop = new Properties();
	    	//协议
	    	prop.setProperty("mail.transport.protocol", "smtps");
	    	//服务器
	    	prop.setProperty("mail.smtp.host", "smtp.exmail.qq.com");
	    	//端口
	    	prop.setProperty("mail.smtp.port", "25");
	    	//使用smtp身份验证
	    	prop.setProperty("mail.smtp.auth", "true");
	    	//使用SSL，企业邮箱必需！
	    	//开启安全协议
	    	MailSSLSocketFactory sf = null;
	    	try {
	    		sf = new MailSSLSocketFactory();
	    		sf.setTrustAllHosts(true);
	    	} catch (GeneralSecurityException e1) {
	    		e1.printStackTrace();
	    	}
//	        prop.put("mail.smtp.ssl.enable", "true");
	    	prop.put("mail.smtp.starttls.enable", "true");
	    	prop.put("mail.smtp.ssl.socketFactory", sf);
	    	//发件人，进行权限认证
	    	Session session = Session.getDefaultInstance(prop, new MyAuthenricator("cert@fiio.net", "ZEFsGMB8YAUZjqjf"));
//	        session.setDebug(true);
	    	MimeMessage mimeMessage = new MimeMessage(session);
	    	try {
	    		//发件人地址
	    		mimeMessage.setFrom(new InternetAddress("cert@fiio.net",""));
	    		//收件人的地址
	    		Address[] address=new Address[list.size()];
                //InternetAddress[] address = new InternetAddress[arr.length];
                for (int i = 0; i < list.size(); i++) {
                    address[i] = new InternetAddress(list.get(i));
                    
                }
	    		mimeMessage.addRecipients(Message.RecipientType.TO, address);
	    		mimeMessage.setSubject(title);
	    		mimeMessage.setSentDate(new Date());
	    		
	    		// MiniMultipart类是一个容器类，包含MimeBodyPart类型的对象
	    		Multipart mainPart = new MimeMultipart();
	    		// 创建一个包含HTML内容的MimeBodyPart
	    		BodyPart html = new MimeBodyPart();
	    		// 设置HTML内容
	    		html.setContent(context, "text/html; charset=utf-8");
	    		mainPart.addBodyPart(html);
	    		
	    		mimeMessage.setContent(mainPart);
	    		/*mimeMessage.setText(context);*/
	    		mimeMessage.saveChanges();
	    		Transport.send(mimeMessage);
	    	} catch (Exception e) {
	    		logger.error("scan 邮件异常 " +e);
	    		
	    	}
	    }
	    
}
