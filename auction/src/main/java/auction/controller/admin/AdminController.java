package auction.controller.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		return "redirect:/list";
	}
	
	@RequestMapping("/commission")
	public String commission() {
		return "/admin/commission";
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", auctionDao.list());
		return "/admin/list";
	}

	@RequestMapping("/edit")
	public String edit(Model model, @RequestParam int auction_no) {
		Auction auction = auctionDao.find(auction_no);
		model.addAttribute("auction", auction);
		return "/admin/edit";
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String edit(@ModelAttribute Auction auction) {
		auctionDao.edit(auction);
		return "redirect:/list";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam int auction_no) {
		auctionDao.delete(auction_no);
		return "redirect:/list";
	}
	
}
