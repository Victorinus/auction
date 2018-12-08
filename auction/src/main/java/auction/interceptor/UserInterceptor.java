package auction.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
//	로그인이 되어 있는지 검사하기 위한 필터
//	preHandle() : controller보다 먼저 수행되는 메소드 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.debug("────preHandle────");
		
		HttpSession session = request.getSession();
		
		boolean login = session.getAttribute("login") != null;
		
		if(login) {
			log.debug("세션 값 존재o");
			return true;
		}
		else {
			log.debug("세션 값 존재x");
			return false;
		}
	}
}