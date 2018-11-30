package auction.controller.member;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import auction.entity.Myfav;

@Controller
public class FavoriteController {

	private Logger log = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/member/myfav")
	public String favorite(@ModelAttribute Myfav myfav) {
		log.debug("FavoriteController 호출!");
		return "member/myfav";
	}
	
}
