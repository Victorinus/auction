package auction.controller.auction;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//경매 관련 컨트롤러
@Controller
public class AuctionController {
	
	@RequestMapping("/auction")
	public String auction() {
		return "auction";
	}
	
}
