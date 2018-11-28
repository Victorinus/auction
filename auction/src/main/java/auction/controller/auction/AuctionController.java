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
import org.springframework.web.bind.annotation.RequestParam;

import auction.entity.Search;
import auction.repository.online.OnlineDao;
import auction.util.OnlinePagingUtil;

//온라인경매 관련 컨트롤러
@Controller
public class AuctionController {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private OnlineDao onlineDao;
	
	@Autowired
	private OnlinePagingUtil pagingUtil;
	
//	진행경매	
	@RequestMapping("/online/current")
	public String onlineCurrent(
								@ModelAttribute Search search, 
								HttpServletRequest request, 
								Model model) {		
		pagingUtil.setHttpServletRequest(search, request);
		model.addAttribute("util", pagingUtil);
		model.addAttribute(
				"currentList", onlineDao.currentSearch(
						pagingUtil.getArt_artist(), 
						pagingUtil.getArt_nm(), 
						pagingUtil.getArt_eprice_min(), 
						pagingUtil.getArt_eprice_max(),
						pagingUtil.getLot(), 
						pagingUtil.getSortType(),
						pagingUtil.getSn(), 
						pagingUtil.getFn()));
		return "auction/online/current";
	}
	
//	예정경매
	@RequestMapping("/online/upcoming")
	public String onlineUpcoming(
								HttpServletRequest request, 
								Model model) {
		pagingUtil.setHttpServletRequest(request);
		model.addAttribute(
				"upcomingList", onlineDao.upcomingList(
						pagingUtil.getSn(), 
						pagingUtil.getFn()));
		return "auction/online/upcoming";
	}
	
//	종료경매 목록
	@RequestMapping("/online/result")
	public String onlineResult(
								HttpServletRequest request, 
								Model model) {
		pagingUtil.setHttpServletRequest(request);
		model.addAttribute("util", pagingUtil);
		model.addAttribute(
				"resultList", onlineDao.resultList(
						pagingUtil.getSn(), 
						pagingUtil.getFn()));
		return "auction/online/result";
	}	
	
//	종료경매 상세보기
	@RequestMapping("/online/detail")
	public String onlineDetail(
								@ModelAttribute Search search,
								@RequestParam(required=false) String no,
								HttpServletRequest request,
								Model model) {
		pagingUtil.setHttpServletRequest(search, no, request);
		model.addAttribute("util", pagingUtil);
		model.addAttribute(
				"detailList", onlineDao.detailSearch(
							pagingUtil.getArt_artist(), 
							pagingUtil.getArt_nm(), 
							pagingUtil.getLot(), 
							pagingUtil.getArt_eprice_min(), 
							pagingUtil.getArt_eprice_max(), 
							pagingUtil.getSn(),
							pagingUtil.getFn(),
							pagingUtil.getNo()));
		return "auction/online/detail";
	}
	
//	이미지 출력
//	@RequestMapping("/image")
//	@ResponseBody
	public ResponseEntity<ByteArrayResource> image(){
		return null;
	}
	
}
