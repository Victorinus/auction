package auction.controller.admin.auction;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

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
import auction.repository.art.ArtDao;
import auction.repository.auction.AuctionDao;
import auction.util.AdminPagingUtil;
import auction.util.UUIDUtil;


//관리자_경매 관련 컨트롤러
@Controller
public class AdminAuctionController {
	
	@Autowired
	private AuctionDao auctionDao;
	@Autowired
	private ArtDao artDao;
	@Autowired
	private ServletContext application;
	@Autowired
	private AdminPagingUtil pagingUtil;
	@Autowired
	private UUIDUtil uuidUtil;
	
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/admin/auction/register")
	public String register() {
		return "/admin/auction/register";
	}
	
	@RequestMapping(value="/admin/auction/register", method=RequestMethod.POST)
	public String register(@ModelAttribute Auction auction, @RequestParam(required=false) MultipartFile image) throws IllegalStateException, IOException {
		
		//파일의 존재 및 이미지형식 검사
		if(!image.isEmpty() && image.getContentType().startsWith("image")) {
			String path = application.getRealPath("/image/auction");
            //파일명 중복을 피해가 위해 랜덤문자열을 추가하여 저장
            String saveName = uuidUtil.getSaveName(image.getOriginalFilename());
            File target = new File(path, saveName);      
			image.transferTo(target);
			
			//객체에 이미지 추가
			auction.setAuction_image(saveName);
		}
		//DB등록
		auctionDao.insert(auction);
			
		return "redirect:/admin/auction/list";
	}
	
	@RequestMapping("/admin/auction/list")
	public String list(
				Model model,
				HttpServletRequest request,
				@RequestParam(defaultValue="1") int curPage,
				@RequestParam(defaultValue="dt") String sortType,
				@RequestParam(defaultValue="empty") String searchType,
				@RequestParam(defaultValue="empty") String searchKey
			) {
    	String uri = request.getRequestURI();
    	Page page = pagingUtil.paging(curPage, searchType, searchKey, uri);
		model.addAttribute("page", page);
		if(searchType.equals("empty") || searchKey.equals("empty")) {
			model.addAttribute("list", auctionDao.list(page, sortType));
		}else {
			model.addAttribute("list", auctionDao.search(page, sortType, searchType, searchKey));
		}
		return "/admin/auction/list";
	}

	@RequestMapping("/admin/auction/edit")
	public String edit(Model model, @RequestParam int auction_sq) {
		Auction auction = auctionDao.find(auction_sq);
		model.addAttribute("auction", auction);
		return "/admin/auction/edit";
	}
	
	@RequestMapping(value="/admin/auction/edit", method=RequestMethod.POST)
	public String edit(@ModelAttribute Auction auction, @RequestParam(required=false) MultipartFile image, @RequestParam(required=false) String prevImage) throws IllegalStateException, IOException {
		
		//파일의 존재 및 이미지형식 검사
		if(!image.isEmpty() && image.getContentType().startsWith("image")) {
			String path = application.getRealPath("/image/auction");
            //파일명 중복을 피해가 위해 랜덤문자열을 추가하여 저장
            String saveName = uuidUtil.getSaveName(image.getOriginalFilename());
            File target = new File(path, saveName);      
			image.transferTo(target);
			
			//기존이미지가 있다면 삭제
			if(prevImage != null) {
				File prevTarget = new File(path, prevImage);
				prevTarget.delete();
			}
			
			//객체에 이미지 추가
			auction.setAuction_image(saveName);
		}else if(image.isEmpty()){
			auction.setAuction_image(prevImage);
		}
		//DB 수정
		auctionDao.edit(auction);
		
		return "redirect:/admin/auction/list";
	}
	
	@RequestMapping("/admin/auction/delete")
	public String delete(@RequestParam int auction_sq) {
		auctionDao.delete(auction_sq);
		return "redirect:/admin/auction/list";
	}
	
	@RequestMapping("/admin/auction/exhibit")
	public String exhibit(
			Model model,
			HttpServletRequest request,
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="dt") String sortType,
			@RequestParam(defaultValue="empty") String searchType,
			@RequestParam(defaultValue="empty") String searchKey
		) {
		String uri = request.getRequestURI();
		Page page = pagingUtil.paging(curPage, searchType, searchKey, uri);
		model.addAttribute("page", page);
		if(searchType.equals("empty") || searchKey.equals("empty")) {
			model.addAttribute("list", auctionDao.list(page, sortType));
		}else {
			model.addAttribute("list", auctionDao.search(page, sortType, searchType, searchKey));
		}
		return "/admin/auction/exhibit";
	}
	
    @RequestMapping("/admin/auction/exdetail")
    public String exdetail(
    			Model model, 
    			HttpServletRequest request,
    			@RequestParam(defaultValue="1") int curPage,
    			@RequestParam(defaultValue="dt") String sortType,
    			@RequestParam(defaultValue="empty") String searchType,
    			@RequestParam(defaultValue="empty") String searchKey,
    			@RequestParam int auction_sq
			) {
		String uri = request.getRequestURI();
		Page page = pagingUtil.paging(curPage, searchType, searchKey, uri);
		//페이지정보
		model.addAttribute("page", page);
		//경매정보
		model.addAttribute("auction", auctionDao.find(auction_sq));
		//출품대기작품 리스트
		if(searchType.equals("empty") || searchKey.equals("empty")) {
			model.addAttribute("artEntry", auctionDao.getEntryList(page));
		}else {
			model.addAttribute("artEntry", auctionDao.getEntrySearch(page, sortType, searchType, searchKey));
		}
		//현재 등록된 작품 리스트
    	model.addAttribute("exList", auctionDao.exhibitList(auction_sq));
    	
        return "/admin/auction/exdetail";
    }
    
	@RequestMapping("/admin/auction/exreg")
	public String exReg(
				@RequestParam int auction_sq,
				@RequestParam int art_sq
			) {
		auctionDao.exRegist(auction_sq, art_sq);
		artDao.editStatusEx(art_sq);
		return "redirect:/admin/auction/exdetail?auction_sq="+auction_sq;
	}
    
	@RequestMapping("/admin/auction/exdel")
	public String exDel(
				@RequestParam int auction_sq,
				@RequestParam int art_sq
			) {
		auctionDao.exDelete(auction_sq, art_sq);
		artDao.editStatusEntry(art_sq);
		return "redirect:/admin/auction/exdetail?auction_sq="+auction_sq;
	}
	
	
}


