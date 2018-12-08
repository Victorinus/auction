package auction.controller.auction;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import auction.entity.Art;
import auction.entity.Auction;
import auction.entity.Bid;
import auction.entity.Search;
import auction.entity.View;
import auction.repository.member.MemberDao;
import auction.repository.myfav.MyfavDao;
import auction.repository.online.OnlineDao;
import auction.util.OnlinePagingUtil;

//온라인경매 관련 컨트롤러
@Controller
public class AuctionController {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private OnlineDao onlineDao;
	
	@Autowired
	private MyfavDao myfavDao;
	
	@Autowired
	private OnlinePagingUtil pagingUtil;
	
	@Autowired
	private ServletContext application;
	
//	진행경매	
	@RequestMapping("/online/current")
	public String onlineCurrent(
								@ModelAttribute Search search, 
								HttpServletRequest request, 
								HttpSession session,
								Model model) {		
		pagingUtil.setHttpServletRequest(search, request);
		model.addAttribute("util", pagingUtil);		
		model.addAttribute("currentAuction", onlineDao.currentAuction());
		model.addAttribute(
				"currentList", onlineDao.currentSearch(
						pagingUtil.getArt_artist(), 
						pagingUtil.getArt_nm(), 
						pagingUtil.getArt_eprice_min(), 
						pagingUtil.getArt_eprice_max(),
						pagingUtil.getLot(), 
						pagingUtil.getSn(), 
						pagingUtil.getFn()));
		String user_id = (String) session.getAttribute("user_id");
		if(user_id != null) {
			int user_sq = memberDao.getUser(user_id);
			model.addAttribute("myfavList", myfavDao.list(user_sq));		
		}
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
	
//	경매결과
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
	
//	상세보기(경매결과)
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
	
//	현재경매 작품 상세페이지
	@RequestMapping("/online/curdetail")
	public String onlineCurDetail(
									@RequestParam int art_sq,
									@RequestParam int auction_sq,
									HttpSession session,
									Model model
			) {
		View view = onlineDao.find(art_sq, auction_sq);
		List<Bid> bid = onlineDao.getBid(art_sq, auction_sq);
		String user_id = (String) session.getAttribute("user_id");
		int user_sq = memberDao.getUser(user_id);
		model.addAttribute("myfavList", myfavDao.list(user_sq));		
		model.addAttribute("view", view);
		model.addAttribute("bid", bid);
		return "auction/online/curdetail";
	}
	
//	이미지(art) 출력
	@RequestMapping("/image/art")
	@ResponseBody
	public ResponseEntity<ByteArrayResource> artImage(
							@ModelAttribute Art art) throws IOException{
		String path = application.getRealPath("/image/art");
		File target = new File(path, art.getArt_image());
		if(!target.exists())	throw new FileNotFoundException();
		
		byte[] arr = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(arr);
		
		return ResponseEntity.ok()
				.contentType(getImageType(art.getArt_image()))
				.contentLength(arr.length)
				.body(resource);
	}

//	이미지(auction) 출력
	@RequestMapping("/image/auction")
	@ResponseBody
	public ResponseEntity<ByteArrayResource> auctionImage(
							@ModelAttribute Auction auction) throws IOException{
		String path = application.getRealPath("/image/auction");
		File target = new File(path, auction.getAuction_image());
		if(!target.exists())	throw new FileNotFoundException();
		
		byte[] arr = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(arr);
		
		return ResponseEntity.ok()
				.contentType(getImageType(auction.getAuction_image()))
				.contentLength(arr.length)
				.body(resource);
	}
	
	private MediaType getImageType(String image) {
		if(image.endsWith(".jpg"))		return MediaType.IMAGE_JPEG;
		if(image.endsWith(".png"))		return MediaType.IMAGE_PNG;
		if(image.endsWith(".gif"))		return MediaType.IMAGE_GIF;
		if(image.endsWith(".jpeg"))		return MediaType.IMAGE_JPEG;
		return null;
	}
	

	
	
}
