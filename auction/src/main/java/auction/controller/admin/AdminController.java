package auction.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//관리자기능 관련 컨트롤러
@Controller
public class AdminController {
	
	@RequestMapping("/register")
	public String register() {
		return "/admin/register";
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
