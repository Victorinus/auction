package auction.controller.info;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//안내 및 소개 기능 관련 컨트롤러
@Controller
public class InfoController {
	
	@RequestMapping("/intro")
	public String introduction() {
		return "/about/intro";
	}
	
	@RequestMapping("/location")
	public String location() {
		return "/about/location";
	}
	
	@RequestMapping("/history")
	public String history() {
		return "/about/history";
	}
	
	@RequestMapping("/notice")
	public String notice() {
		return "/about/notice";
	}
	
	@RequestMapping("/faq")
	public String faq() {
		return "/about/faq";
	}
}
