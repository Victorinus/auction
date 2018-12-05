package auction.controller.search;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchController {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/search")
	public String search(@RequestParam(required=false) String keyword) {
		log.debug("keyword = {}", keyword);
		log.debug("SearchController 호출!");
		return "redirect:/";
	}
}
