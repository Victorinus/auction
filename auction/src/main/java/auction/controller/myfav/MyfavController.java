package auction.controller.myfav;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import auction.entity.myfav.Myfav;
import auction.repository.myfav.MyfavDao;

@Controller
public class MyfavController {

	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private MyfavDao myfavDao;
	
	@RequestMapping("/myfav/register")
	public String register(
						@RequestParam(required=false) int a_sq,
						@RequestParam(required=false) int art_sq,
						HttpSession session) {
		log.debug("a_sq = {}", a_sq);
		log.debug("art_sq = {}", art_sq);
		log.debug("sessionId = {}", session.getId());
		int count = myfavDao.find(a_sq, art_sq);
		if(count == 0) {
			myfavDao.insert(a_sq, art_sq);
			return "redirect:/online/current";
		}
		else {
			myfavDao.delete(a_sq, art_sq);
			return "redirect:/online/current";
		}
	}
	
	@RequestMapping(value="/myfav/list", method=RequestMethod.POST)
	public String list(
						@RequestParam(defaultValue="1") int user_no,
						Model model) {
		List<Myfav> list = myfavDao.list(user_no);
		for(int i=0; i<list.size(); i++) {
			log.debug("결과 = {}", list.get(i));
		}
		model.addAttribute("myfavList", list);
		return "/myfav/list";
	}
	
}
