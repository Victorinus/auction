package auction.controller.auction.guide;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuctionGuideController {
	
	@RequestMapping("/biddingGuide")
	public String bidding() {
		return "guide/biddingGuide";
	}
	@RequestMapping("/onlineBiddingGuide")
	public String onlineBidding() {
		return "guide/onlineBiddingGuide";
	}
	@RequestMapping("/commissionGuide")
	public String commission() {
		return "guide/commissionGuide";
	}
	@RequestMapping("/privateSaleGuide")
	public String privateSale() {
		return "guide/privateSaleGuide";
	}
}
