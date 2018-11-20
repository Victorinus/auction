package auction.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter {
	
//	로그인이 되어 있는지 검사하기 위한 필터
//	preHandle() : controller보다 먼저 수행되는 메소드 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//session객체 가져오기
		HttpSession session = request.getSession();
		//login 처리를 담당하는 사용자 정보를 담고있는 객체를 가져옴
		Object obj = session.getAttribute("login");
		
		if(obj==null) {
			//로그인이 안되어져 있는 상태, 로그인 폼으로 보냄(redirect)
			response.sendRedirect("/login");
			return false; // Controller 요청으로 가지 않도록 처리
		}			
		
		return true;
	}
}
