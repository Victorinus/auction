package auction.controller.auction;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//경매 관련 컨트롤러
@Controller
public class AuctionController {
	
	@RequestMapping("/offline/current")
	public String offlineCurrent() {
		return "auction/offline/current";
	}
	
	@RequestMapping("/offline/result")
	public String offlineResult() {
		return "auction/offline/result";
	}
	
	@RequestMapping("/offline/upcoming")
	public String offlineUpcoming() {
		return "auction/offline/upcoming";
	}
	
	@RequestMapping("/online/current")
	public String onlineCurrent() {
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
