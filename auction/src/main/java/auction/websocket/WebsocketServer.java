package auction.websocket;

import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import auction.repository.auction.AuctionDao;

/**
 * 웹소켓 서버 파일
 * 	- TextWebSocketHandler 를 상속받아 "Text"를 주고받을 수 있는 서버를 구현
 */
public class WebsocketServer extends TextWebSocketHandler{

	@Autowired
	private AuctionDao auctionDao;
	
	//전체 연결을 관리할 수 있는 저장소 - Set<WebSocketSession>
	private Set<WebSocketSession> set = new HashSet<>();
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		set.add(session);
		log.debug("연결 수립됨 = {}", session);
	}


	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
//		set.remove(session);
		log.debug("연결 종료됨 = {}, {}", session, status);
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		log.debug("메시지 수신됨 = {}, {}", session, message);
//		session.sendMessage(message);
		
		//테스트
//		Integer result = 0;
//		for(int i = 0; i < 10; i++) {
//			Thread.sleep(1000L);
//			result++;
//			TextMessage newMessage = new TextMessage(result.toString());
//			log.debug("Text = " + result);
//			session.sendMessage(newMessage);
//		}
		int auction_sq = Integer.parseInt(message.getPayload());
		String auction_start = auctionDao.getStart(auction_sq);
		System.out.println(auction_start);
		TextMessage newMessage = new TextMessage(auction_start.toString());
		session.sendMessage(newMessage);
	}
	
	
}
