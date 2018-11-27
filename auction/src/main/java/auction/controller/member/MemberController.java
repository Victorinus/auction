package auction.controller.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import auction.entity.Member;
import auction.repository.member.MemberDao;


//회원기능 관련 컨트롤러
@Controller
public class MemberController {
	
	@Autowired
	private MemberDao memberdao;
	
//	회원가입을 위한 페이지(페이지 이동만)
	@RequestMapping("/joinform")
	public String join() {
		return "/member/joinform";
	}
	
	//정보를 가지고 넘어갈때(member를 넘겨줌)
	@RequestMapping(value="/joinform", method=RequestMethod.POST)
	public String regist(@ModelAttribute Member member) {
		memberdao.regist(member);
		return "member/joinresult";
		
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
