package auction.controller.info;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//안내 및 소개 기능 관련 컨트롤러
@Controller
public class InfoController {
	
	@RequestMapping("/info")
	public String auction() {
		return "info";
	}
	
}
