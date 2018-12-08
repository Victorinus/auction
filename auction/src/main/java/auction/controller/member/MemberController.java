package auction.controller.member;

import java.security.NoSuchAlgorithmException;

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

import auction.encrypt.EncryptService;
import auction.entity.Member;
import auction.repository.member.MemberDao;


//회원기능 관련 컨트롤러
@Controller
public class MemberController {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private EncryptService encryptService;
	
//	서버에서의 암호화 처리
	public String encrypt(String user_pw) throws NoSuchAlgorithmException {
		String origin = user_pw;
		String salt = "itbank";
		for(int i=0; i<10; i++) {
			origin = encryptService.encrypt(origin+salt);
			log.debug(i+1+"회차 : "+origin);
		}
		return origin;
	}	
	
//	회원가입
	@RequestMapping("/member/joinform")
	public String join() {
		return "/member/joinform";
	}
	@RequestMapping(value="/member/joinform", method=RequestMethod.POST)
	public String regist(@ModelAttribute Member init) throws NoSuchAlgorithmException {
		try{
			String encrypted_pw = encrypt(init.getUser_pw());
			Member member = Member.builder()
					.user_id(init.getUser_id())
					.user_pw(encrypted_pw)
					.user_nm(init.getUser_nm())
					.user_birth(init.getUser_birth())
					.user_gender(init.getUser_gender())
					.user_phone(init.getUser_phone())
					.user_tel(init.getUser_tel())
					.user_email(init.getUser_email())
					.user_post(init.getUser_post())
					.user_addr1(init.getUser_addr1())
					.user_addr2(init.getUser_addr2())
					.user_grade(init.getUser_grade())
					.build();
			memberDao.regist(member);
			return "member/joinresult";
		}catch(Exception e) {
			return "member/joinfail";
		}
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
							Model model) throws NoSuchAlgorithmException {
		String encrypted_pw = encrypt(user_pw);
		int count = memberDao.login(user_id, encrypted_pw);
		
		if(count != 0) {
			session.setAttribute("user_id", user_id);
			//log.debug("user_id = {}", user_id);
			String user_grade = memberDao.getGrade(user_id);
			//log.debug("user_grade = {}", user_grade);
			session.setAttribute("user_grade", user_grade);
			return "redirect:/";
		}
		else {
			return "redirect:/member/loginfail";
		}
	}
//	로그인 실패
	@RequestMapping("/member/loginfail")
	public String loginfail() {
		return "member/loginfail";
	}
	
//	로그아웃
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
