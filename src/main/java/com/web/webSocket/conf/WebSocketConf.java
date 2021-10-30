package com.web.webSocket.conf;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.web.webSocket.handler.WebSocketHandler;

@Configuration
@EnableWebSocket
public class WebSocketConf implements WebSocketConfigurer{

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		
		//pure webSocket
//		registry.addHandler(new WebSocketHandler(), "/websocket").setAllowedOrigins("*")
		
		//SockJs
		registry.addHandler(new WebSocketHandler(), "/websocket").setAllowedOrigins("*").withSockJS();
		
	}

	
}
