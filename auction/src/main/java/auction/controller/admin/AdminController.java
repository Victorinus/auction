package auction.controller.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import auction.entity.Auction;
import auction.repository.auction.AuctionDao;


//관리자기능 관련 컨트롤러
@Controller
public class AdminController {
	
	@Autowired
	private AuctionDao auctionDao;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/register")
	public String register() {
		return "/admin/register";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(@ModelAttribute Auction auction) {
		auctionDao.insert(auction);
		log.debug(auction.toString());
		return "redirect:/list";
	}
	
	@RequestMapping("/commission")
	public String commission() {
		return "/admin/commission";
	}
	
	@RequestMapping("/list")
	public String list() {
		return "/admin/list";
	}

	@RequestMapping("/edit")
	public String edit() {
		return "/admin/edit";
	}
}
