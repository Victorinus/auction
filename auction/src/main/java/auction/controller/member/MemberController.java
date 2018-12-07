package auction.controller.member;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import auction.entity.Member;
import auction.repository.member.MemberDao;


//회원기능 관련 컨트롤러
@Controller
public class MemberController {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private MemberDao memberDao;
	
//	회원가입을 위한 페이지(페이지 이동만)
	@RequestMapping("/member/joinform")
	public String join() {
		return "/member/joinform";
	}
	
	//정보를 가지고 넘어갈때(member를 넘겨줌)
	@RequestMapping(value="/member/joinform", method=RequestMethod.POST)
	public String regist(@ModelAttribute Member member) {
		memberDao.regist(member);
		return "member/joinresult";
	}
	
//	로그인
	@RequestMapping("/member/login")
	public String login() {
		return "/member/login";
	}
	
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String login(
							@RequestParam String user_id,
							@RequestParam String user_pw,
							@RequestParam(required=false) String save_id,
							HttpSession session,
							Model model) {
		log.debug("MemberController : login 호출");
		int count = memberDao.login(user_id, user_pw);
		
		if(count != 0) {
			session.setAttribute("user_id", user_id);
			log.debug("usert_id = {}", user_id);
			String user_grade = memberDao.getGrade(user_id);
			log.debug("user_grade = {}", user_grade);
			session.setAttribute("user_grade", user_grade);
			
			return "redirect:/";
		}
		else {
			log.debug("로그인 실패");
			return "redirect:loginfail";
		}
	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user_id");
		session.removeAttribute("user_grade");
		return "redirect:/";
	}
	
//	내정보 확인 페이지
	@RequestMapping("/member/mypage")
	public String myPage() {
		
		return "/member/mypage";
	}
	
	@RequestMapping("/member/modify")
	public String modify() {
		return "/member/modify";
	}
	@RequestMapping("/member/payment")
	public String payment() {
		return "/member/payment";
	}
	@RequestMapping("/member/qna")
	public String qna() {
		return "/member/qna";
	}
	@RequestMapping("/member/biddingList")
	public String biddingList() {
		return "/member/biddingList";
	}
	@RequestMapping("/member/onlineBiddingList")
	public String onlineBiddingList() {
		return "/member/onlineBiddingList";
	}
}
