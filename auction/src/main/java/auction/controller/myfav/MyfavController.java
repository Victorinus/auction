package auction.controller.myfav;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import auction.repository.member.MemberDao;
import auction.repository.myfav.MyfavDao;

@Controller
@SessionAttributes("user_id")
public class MyfavController {

	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private MyfavDao myfavDao;
	
	@Autowired
	private MemberDao memberDao;
	
//	이하 사용자
//	관심작품 등록/해제
	@RequestMapping("/myfav/register")
	public Model register(
						@RequestParam(required=false) int a_sq,
						@RequestParam(required=false) int art_sq,
						@RequestParam(required=false) int lot,
						HttpSession session,
						Model model) {		
		log.debug("a_sq = {}", a_sq);
		log.debug("art_sq = {}", art_sq);
		log.debug("user_id from Session = {}", session.getAttribute("user_id"));
		String user_id = (String) session.getAttribute("user_id");
		
		int user_sq = memberDao.getUser(user_id);
		int count = myfavDao.find(user_sq, a_sq, art_sq);
		log.debug("count = {}", count);
		if(count == 0) {
			myfavDao.insert(user_sq, a_sq, art_sq);
			return model.addAttribute("count", count);
//			return "redirect:/online/current";
		}
		else {
			myfavDao.delete(user_sq, a_sq, art_sq);
			return model.addAttribute("count", count);
//			return "redirect:/online/current";
		}
	}
	
//	관심작품 목록 반환
	@RequestMapping("/member/myfav")
	public String myfav(
						HttpSession session,
						Model model) {
		String user_id = (String) session.getAttribute("user_id");
		int user_sq = memberDao.getUser(user_id);
		model.addAttribute("myfavList", myfavDao.getMyfavList(user_sq));		
		return "member/myfav";
	}
	
//	이하 관리자
//	관심작품 삭제
	@RequestMapping("/admin/member/myfav/delete")
	public String delete(
							@RequestParam(required=false) int user_sq,
							@RequestParam(required=false) int a_sq,
							@RequestParam(required=false) int art_sq,
							Model model) {
		log.debug("user_sq = {}", user_sq);
		log.debug("a_sq = {}", a_sq);
		log.debug("art_sq = {}", art_sq);
		int count = myfavDao.find(user_sq, a_sq, art_sq);
		log.debug("count = {}", count);
		if(count != 0) {
			myfavDao.delete(user_sq, a_sq, art_sq);
			return "redirect:/admin/member/myfav";
		}
		return null;		
	}
}
