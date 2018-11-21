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
	public String onlineCurrent(
			@ModelAttribute Search search, HttpServletRequest request, Model model) {
		log.debug("search = {}", search);
		
		if(search.getArt_artist()==null && search.getArt_nm()==null && search.getLot()==null) {
			pagingUtil.setHttpServletRequest(request);
			
			model.addAttribute("util", pagingUtil);
			model.addAttribute("currentList", onlineDao.currentList(pagingUtil.getSn(), pagingUtil.getFn()));
		}
		
		pagingUtil.setHttpServletRequest(search, request);
		
//		log.debug("sn, fn, sb, fb = {}, {}, {}, {}", 
//				pagingUtil.getSn(), pagingUtil.getFn(), pagingUtil.getSb(), pagingUtil.getFb());
//		log.debug("pagingUtil = {}", pagingUtil);
		log.debug("작가명(art_artist) = {}", pagingUtil.getArt_artist());
		log.debug("작품명(art_nm) = {}", pagingUtil.getArt_nm());
		log.debug("최소 추정가(art_eprice_min) = {}", pagingUtil.getArt_eprice_min());
		log.debug("최대 추정가(art_eprice_max) = {}", pagingUtil.getArt_eprice_max());
		log.debug("번호(lot) = {}", pagingUtil.getLot());
		
		model.addAttribute("util", pagingUtil);
		model.addAttribute(
				"currentList", onlineDao.currentSearch(pagingUtil.getArt_artist(), pagingUtil.getArt_nm(), pagingUtil.getLot(), pagingUtil.getSn(), pagingUtil.getFn()));
		return "auction/online/current";
	}
	
//	예정경매
	@RequestMapping("/online/upcoming")
	public String onlineUpcoming(HttpServletRequest request, Model model) {
		pagingUtil.setHttpServletRequest(request);
		model.addAttribute(
				"upcomingList", onlineDao.upcomingList(pagingUtil.getSn(), pagingUtil.getFn()));
		return "auction/online/upcoming";
	}
	
//	경매결과
	@RequestMapping("/online/result")
	public String onlineResult(HttpServletRequest request, Model model) {
		pagingUtil.setHttpServletRequest(request);
		log.debug("sn, fn, sb, fb = {}, {}, {}, {}", 
				pagingUtil.getSn(), pagingUtil.getFn(), pagingUtil.getSb(), pagingUtil.getFb());
		log.debug("pagingUtil = {}", pagingUtil);
		model.addAttribute("util", pagingUtil);
		model.addAttribute(
				"resultList", onlineDao.resultList(pagingUtil.getSn(), pagingUtil.getFn()));
		return "auction/online/result";
	}	
	
//	이미지 출력
//	@RequestMapping("/image")
//	@ResponseBody
	public ResponseEntity<ByteArrayResource> image(){
		return null;
	}

}
