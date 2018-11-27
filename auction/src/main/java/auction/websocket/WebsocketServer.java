package auction.websocket;

import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/**
 * 웹소켓 서버 파일
 * 	- TextWebSocketHandler 를 상속받아 "Text"를 주고받을 수 있는 서버를 구현
 */
public class WebsocketServer extends TextWebSocketHandler{

	//전체 연결을 관리할 수 있는 저장소 - Set<WebSocketSession>
	private Set<WebSocketSession> set = new HashSet<>();
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		set.add(session);
		log.debug("연결 수립됨 = {}", session);
	}


	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		set.remove(session);
//		log.debug("연결 종료됨 = {}, {}", session, status);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		log.debug("메시지 수신됨 = {}, {}", session, message);
		//session에 메시지 회신
//		session.sendMessage(message);
		
		Integer result = 1;
		for(int i = 0; i < 10; i++) {
			result++;

		TextMessage newMessage = new TextMessage(result.toString());
		log.debug("Text = " + result);
		
		//전체에게 메시지 회신
		for(WebSocketSession ws : set) {
			ws.sendMessage(message);
		}
		}
	}
	
}
