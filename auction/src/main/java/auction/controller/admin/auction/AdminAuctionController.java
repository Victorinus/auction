package auction.controller.admin.auction;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import auction.entity.Auction;
import auction.entity.Page;
import auction.repository.auction.AuctionDao;
import auction.util.AdminPagingUtil;


//관리자_경매 관련 컨트롤러
@Controller
public class AdminAuctionController {
	
	@Autowired
	private AuctionDao auctionDao;
	@Autowired
	private ServletContext application;
	@Autowired
	private AdminPagingUtil pagingUtil;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/auction/register")
	public String register() {
		return "/admin/auction/register";
	}
	
	@RequestMapping(value="/auction/register", method=RequestMethod.POST)
	public String register(@ModelAttribute Auction auction, @RequestParam(required=false) MultipartFile image) throws IllegalStateException, IOException {
		
		//파일의 존재 및 이미지형식 검사
		if(image != null && image.getContentType().startsWith("image")) {
			String path = application.getRealPath("/image/auction");
			File target = new File(path, image.getOriginalFilename());	
			image.transferTo(target);
			
			//객체에 이미지 추가
			auction.setAuction_image(image.getOriginalFilename());
			
			//DB등록
			auctionDao.insert(auction);
			
		}
		return "redirect:/auction/list";
	}
	
	@RequestMapping("/auction/list")
	public String list(
				@RequestParam(defaultValue="1") int curPage,
				Model model,
				@RequestParam(defaultValue="dt") String sortType,
				@RequestParam(defaultValue="empty") String searchType,
				@RequestParam(defaultValue="empty") String searchKey
			) {
		Page page = pagingUtil.paging(curPage, searchType, searchKey);
		model.addAttribute("page", page);
		if(searchType.equals("empty") || searchKey.equals("empty")) {
			System.out.println("리스트");
			model.addAttribute("list", auctionDao.list(page, sortType));
		}else {
			System.out.println("검색");
			model.addAttribute("list", auctionDao.search(page, sortType, searchType, searchKey));
		}
		return "/admin/auction/list";
	}

	@RequestMapping("/auction/edit")
	public String edit(Model model, @RequestParam int auction_sq) {
		Auction auction = auctionDao.find(auction_sq);
		model.addAttribute("auction", auction);
		return "/admin/auction/edit";
	}
	
	@RequestMapping(value="/auction/edit", method=RequestMethod.POST)
	public String edit(@ModelAttribute Auction auction, @RequestParam(required=false) MultipartFile image, @RequestParam(required=false) String prevImage) throws IllegalStateException, IOException {
		
		//파일의 존재 및 이미지형식 검사
		if(image != null && image.getContentType().startsWith("image")) {
			String path = application.getRealPath("/image/auction");
			File target = new File(path, image.getOriginalFilename());
			image.transferTo(target);
			
			//기존이미지가 있다면 삭제
			if(prevImage != null) {
				File prevTarget = new File(path, prevImage);
				prevTarget.delete();
			}
			
			//객체에 이미지 추가
			auction.setAuction_image(image.getOriginalFilename());
		
			auctionDao.edit(auction);
		}
		return "redirect:/auction/list";
	}
	
	@RequestMapping("/auction/delete")
	public String delete(@RequestParam int auction_sq) {
		auctionDao.delete(auction_sq);
		return "redirect:/auction/list";
	}
	
}


