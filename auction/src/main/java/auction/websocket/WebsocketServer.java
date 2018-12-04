package auction.websocket;

import java.util.HashSet;
import java.util.Set;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import auction.entity.Bid;
import auction.repository.online.OnlineDao;

/**
 * 웹소켓 서버 파일
 * 	- TextWebSocketHandler 를 상속받아 "Text"를 주고받을 수 있는 서버를 구현
 */
public class WebsocketServer extends TextWebSocketHandler{

	@Autowired
	private OnlineDao onlineDao;
	
	//전체 연결을 관리할 수 있는 저장소 - Set<WebSocketSession>
	private Set<WebSocketSession> set = new HashSet<>();
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		set.add(session);
		log.debug("연결 수립됨 = {}", session);
	}


	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		set.remove(session);
		log.debug("연결 종료됨 = {}, {}", session, status);
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		log.debug("메시지 수신됨 = {}, {}", session, message);
		
		//클라이언트에게서 메시지를 받는다
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(message.getPayload());
		int a_sq = Integer.parseInt((String)jsonObject.get("a_sq"));
		int art_sq = Integer.parseInt((String)jsonObject.get("art_sq"));
		String bid_user = (String) jsonObject.get("bid_user");
		int bid_price = Integer.parseInt((String) jsonObject.get("bid_price"));
//		log.debug("A_SQ : {}", a_sq);//테스트
//		log.debug("ART_SQ : {}", art_sq);//테스트
//		log.debug("bid_user : {}", bid_user);//테스트
//		log.debug("bid_price : {}", bid_price);//테스트
		Bid bid = Bid.builder().
							a_sq(a_sq).
							art_sq(art_sq).
							user_id(bid_user).
							bid_bp(bid_price).
						build();
		
		//DB에 입력한다
		int bid_sq = onlineDao.insertBid(bid);
		
		//DB입력에 성공 시 메시지를 보낸다
		if(bid_sq > 0) {
			//DB에서 응찰일자를 가져와 추가
			String bid_dt = onlineDao.getBidDate(bid_sq);
			jsonObject.put("bid_date", bid_dt);
			
			String sendMsg = jsonObject.toJSONString();
			
			TextMessage newMessage = new TextMessage(sendMsg.toString());
			
			for(WebSocketSession ws : set) {
				ws.sendMessage(newMessage);
				//log.debug("newMessage = {}", newMessage);//테스트
			}
		}
	}
	
	
}
