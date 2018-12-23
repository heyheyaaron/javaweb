package feiao.forum.socket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;

import feiao.forum.service.Constant;
import feiao.forum.service.CoreService;
 
  
public class WebsocketEndPoint  implements WebSocketHandler {  
  
	private static final List<WebSocketSession> users = new ArrayList<>();
	@Autowired
	private CoreService service;
	//用户进入系统监听
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//System.out.println("成功进入了系统。。。");
		users.add(session);
	}

	//
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		
	    //将消息进行转化，因为是消息是json数据，可能里面包含了发送给某个人的信息，所以需要用json相关的工具类处理之后再封装成TextMessage，
	   // 我这儿并没有做处理，消息的封装格式一般有{from:xxxx,to:xxxxx,msg:xxxxx}，来自哪里，发送给谁，什么消息等等	
		Map<String, Object> map = JSON.parseObject(message.getPayload().toString(),new TypeReference<Map<String, Object>>(){} );
	    TextMessage msgs = new TextMessage(map.get("id").toString()+","+map.get("day").toString()+","+map.get("msg").toString());
	    if(map.get("to")!=null){
	    	/** 获取Session中的用户 */
	    	//System.err.println("aa");
	    	System.err.println(map.get("from").toString());
	    	System.err.println(map.get("to").toString());
	    	System.err.println(map.get("id").toString());
	    	System.err.println(map.get("day").toString());
	    	System.err.println(msgs);
	    	sendMessageToUser(map.get("from").toString(),map.get("to").toString(),msgs,map.get("id").toString());
	    }else{
	    	sendMessagesToUsers(msgs);
	    }
	    
	    
	    
	    //给所有用户群发消息
	    //sendMessagesToUsers(msg);
	    //给指定用户群发消息
	    //sendMessageToUser(userId,msg);
		

	}
        
        //后台错误信息处理方法
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		//System.err.println("bb");
	}

	//用户退出后的处理，不如退出之后，要将用户信息从websocket的session中remove掉，这样用户就处于离线状态了，也不会占用系统资源
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		
		//System.err.println("cc");
		//System.out.println(session.getHandshakeAttributes().get(Constant.SESSION_USERH));
		//System.out.println(session.getHandshakeAttributes().get(Constant.SESSION_USER));
		//System.out.println(session.isOpen());
		if(session.isOpen()){
			session.getHandshakeAttributes().remove(Constant.SESSION_SOCKET);
			//System.err.println("cc");
		}
		users.remove(session.getHandshakeAttributes().get(Constant.SESSION_SOCKET));
		System.out.println("安全退出了系统");
		
	}

	@Override
	public boolean supportsPartialMessages() {
		//System.err.println("dd");
		return false;
	}
	
	/**
	 * 给所有的用户发送消息
	 */
	public void sendMessagesToUsers(TextMessage message){
		
		for(WebSocketSession user : users){
			try {
				
			    //isOpen()在线就发送
				if(user.isOpen()){
					user.sendMessage(message);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 发送消息给指定的用户
	 */
	public void sendMessageToUser(String myid,String userId,TextMessage message,String idx){
		for(WebSocketSession user : users){
			Map<String, Object> map = (Map<String, Object>) user.getHandshakeAttributes().get(Constant.SESSION_SOCKET);
			//System.out.println("空？:"+map);
			if(map!=null){
				String  u= map.get("myid").toString();
				String  i= map.get("toid").toString();
				//System.err.println(u);
				if(u.equals(userId)){
					try {
					    //isOpen()在线就发送
						if(user.isOpen()){
							if(myid.equals(i)){
								if(idx.length()>2){
									service.MsgIsReadById(idx);
									user.sendMessage(message);
								}
								
							}
							
							
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			
		}
	}
}   
