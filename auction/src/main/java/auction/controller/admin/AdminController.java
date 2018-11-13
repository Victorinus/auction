package auction.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//관리자기능 관련 컨트롤러
@Controller
public class AdminController {
	
	@RequestMapping("/admin")
	public String auction() {
		return "admin";
	}
	
}
