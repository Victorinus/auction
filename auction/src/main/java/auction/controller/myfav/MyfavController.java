package auction.controller.myfav;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import auction.repository.myfav.MyfavDao;

@Controller
public class MyfavController {

	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private MyfavDao myfavDao;
	
	@RequestMapping("/myfav/register")
	public Model register(
						@RequestParam(required=false) int a_sq,
						@RequestParam(required=false) int art_sq,
						HttpSession session,
						Model model) {
		log.debug("a_sq = {}", a_sq);
		log.debug("art_sq = {}", art_sq);
		log.debug("sessionId = {}", session.getId());
		int count = myfavDao.find(a_sq, art_sq);
		if(count == 0) {
			myfavDao.insert(a_sq, art_sq);
			return model.addAttribute("count", count);
//			return "redirect:/online/current";
		}
		else {
			myfavDao.delete(a_sq, art_sq);
			return model.addAttribute("count", count);
//			return "redirect:/online/current";
		}
	}
	
	@RequestMapping("/member/myfav")
	public String myfav(
						@RequestParam(defaultValue="1") int user_no,
						Model model) {
		model.addAttribute("myfavList", myfavDao.getMyfavList(user_no));		
		return "member/myfav";
	}
	
}
