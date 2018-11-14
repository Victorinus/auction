package auction.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//회원기능 관련 컨트롤러
@Controller
public class MemberController {
	
	@RequestMapping("/join")
	public String join() {
		return "/member/join";
	}
	@RequestMapping("/login")
	public String login() {
		return "/member/login";
	}
	@RequestMapping("/modify")
	public String modify() {
		return "/member/modify";
	}
	@RequestMapping("/myPage")
	public String myPage() {
		return "/member/myPage";
	}
	@RequestMapping("/payment")
	public String payment() {
		return "/member/payment";
	}
	@RequestMapping("/qna")
	public String qna() {
		return "/member/qna";
	}
	@RequestMapping("/biddingList")
	public String biddingList() {
		return "/member/biddingList";
	}
	@RequestMapping("/onlineBiddingList")
	public String onlineBiddingList() {
		return "/member/onlineBiddingList";
	}
}
