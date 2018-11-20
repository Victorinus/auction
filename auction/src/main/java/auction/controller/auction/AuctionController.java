package auction.controller.auction;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import auction.entity.Paging;
import auction.entity.Search;
import auction.repository.online.OnlineDao;
import auction.util.PagingUtil;

//온라인경매 관련 컨트롤러
@Controller
public class AuctionController {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private OnlineDao onlineDao;
	
	@Autowired
	private PagingUtil pagingUtil;
	
//	@RequestMapping("/offline/current")
//	public String offlineCurrent() {
//		return "auction/offline/current";
//	}
//	
//	@RequestMapping("/offline/result")
//	public String offlineResult() {
//		return "auction/offline/result";
//	}
//	
//	@RequestMapping("/offline/upcoming")
//	public String offlineUpcoming() {
//		return "auction/offline/upcoming";
//	}
	
//	진행경매
	@RequestMapping("/online/current")
	public String onlineCurrent(@ModelAttribute Search search, Model model) {
			model.addAttribute("currentAuction", onlineDao.currentAuction());
			model.addAttribute("currentList", onlineDao.currentSearch(search));
		return "auction/online/current";
	}
	
//	예정경매
	@RequestMapping("/online/upcoming")
	public String onlineUpcoming(Model model) {
		model.addAttribute("upcomingList", onlineDao.upcomingList());
		return "auction/online/upcoming";
	}
	
//	경매결과
	@RequestMapping("/online/result")
	public String onlineResult(Model model, HttpServletRequest request) {
		log.debug("page = {}", request.getParameter("page"));
		pagingUtil.setHttpServletRequest(request);
		model.addAttribute("resultList", onlineDao.resultList());
		return "auction/online/result";
	}	
	
//	이미지 출력
//	@RequestMapping("/image")
//	@ResponseBody
	public ResponseEntity<ByteArrayResource> image(){
		return null;
	}

}
