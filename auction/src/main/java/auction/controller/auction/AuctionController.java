package auction.controller.auction;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//경매 관련 컨트롤러
@Controller
public class AuctionController {
	
//	@RequestMapping("/offline/current")
//	public String offlineCurrent() {
//		return "auction/offline/current";
//	}
//	
//	@RequestMapping("/offline/result")
//	public String offlineResult() {
//		return "auction/offline/result";
//	}
//	
//	@RequestMapping("/offline/upcoming")
//	public String offlineUpcoming() {
//		return "auction/offline/upcoming";
//	}
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/online/current")
	public String onlineCurrent() {
		return "auction/online/current";
	}
	
	@RequestMapping(value="/online/current", method=RequestMethod.POST)
	public String onlineCurrent(Model model) {
		
		return "auction/online/current";
	}
	
	@RequestMapping("/online/result")
	public String onlineResult() {
		return "auction/online/result";
	}
	
	@RequestMapping("/online/upcoming")
	public String onlineUpcoming() {
		return "auction/online/upcoming";
	}
	
	
}
