package auction.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//회원기능 관련 컨트롤러
@Controller
public class MemberController {
	
	@RequestMapping("/member")
	public String auction() {
		return "member";
	}
	
}
