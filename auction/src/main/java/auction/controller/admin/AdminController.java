package auction.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import auction.entity.Auction;


//관리자기능 관련 컨트롤러
@Controller
public class AdminController {
	
	@RequestMapping("/register")
	public String register() {
		return "/admin/register";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(@ModelAttribute Auction auction) {
		
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
