package auction.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.debug("────preHandle────");
		HttpSession session = request.getSession();
		boolean admin = session.getAttribute("user_grade").equals("관리자");
		if(admin) {
			return true;
		}else {
			response.sendRedirect("/auction/home");
			return false;
		}
	}
}
