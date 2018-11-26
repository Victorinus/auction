package auction.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


//회원기능 관련 컨트롤러
@Controller
public class MemberController {
	
//	회원가입을 위한 페이지
	@RequestMapping("/joinform")
	public String join() {
//		sqlSession.insert("regist_user", member);
		return "/member/joinform";
	}
	
//	로그인을 위한 페이지
	@RequestMapping("/login")
	public String login() {
		return "/member/login";
	}
	
//	수정을 위한 페이지
	@RequestMapping("/modify")
	public String modify() {
		return "/member/modify";
	}
	
//	내정보 확인 페이지
	@RequestMapping("/mypage")
	public String myPage() {
		return "/member/mypage";
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
