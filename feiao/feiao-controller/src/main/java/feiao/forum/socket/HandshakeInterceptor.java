package feiao.forum.socket;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;  
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;  
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import feiao.forum.pojo.FaUser;
import feiao.forum.pojo.User;
import feiao.forum.service.Constant;


  
public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor{  
  
    @Override  
    public boolean beforeHandshake(ServerHttpRequest request,  
            ServerHttpResponse response, WebSocketHandler wsHandler,  
            Map<String, Object> attributes) throws Exception {  
        //System.out.println("Before Handshake");  
      //将ServerHttpRequest转换成request请求相关的类，用来获取request域中的用户信息	
      		if (request instanceof ServletServerHttpRequest) {
      			ServletServerHttpRequest servletRequest  = (ServletServerHttpRequest) request;
      			HttpServletRequest httpRequest = servletRequest.getServletRequest();
      			//Constants.CURRENT_USER这个是我定义的常量，是request域的key，通过key就可以获取到用户信息了
      			/** 获取Session中的用户 */
      			FaUser fu = (FaUser)httpRequest
      						.getSession().getAttribute(Constant.SESSION_USER);
      			
      			//Constants.CURRENT_WEBSOCKET_USER也是常量，用来存储WebsocketSession的key值
      			Map<String, Object> map = new HashMap<>();
      			map.put("myid", fu.getFa_id());
      			map.put("toid", httpRequest.getParameter("toid").toString());
      			attributes.put(Constant.SESSION_SOCKET,map);
      			
      			//System.out.println("保存的信息："+attributes.get(Constant.SESSION_USER));
      		}
        return super.beforeHandshake(request, response, wsHandler, attributes);  
    }  
  
    @Override  
    public void afterHandshake(ServerHttpRequest request,  
            ServerHttpResponse response, WebSocketHandler wsHandler,  
            Exception ex) {  
        //System.out.println("After Handshake");  
        super.afterHandshake(request, response, wsHandler, ex);  
    }  
  
} 
