package auction.controller.admin;

import java.io.File;
import java.io.IOException;

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
import auction.repository.auction.AuctionDao;
import auction.util.PagingUtilImpl;


//관리자기능 관련 컨트롤러
@Controller
public class AdminController {
	
	@Autowired
	private AuctionDao auctionDao;
	@Autowired
	private ServletContext application;
	@Autowired
	private PagingUtilImpl pagingUtil;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/register")
	public String register() {
		return "/admin/register";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(@ModelAttribute Auction auction, @RequestParam MultipartFile image) throws IllegalStateException, IOException {
		
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
		return "redirect:/list";
	}
	
	@RequestMapping("/commission")
	public String commission() {
		return "/admin/commission";
	}
	
	@RequestMapping("/list")
	public String list(@RequestParam(defaultValue="1") int curPage, Model model) {
		model.addAttribute("pagination", pagingUtil.paging(curPage));
		model.addAttribute("list", auctionDao.list());
		return "/admin/list";
	}

	@RequestMapping("/edit")
	public String edit(Model model, @RequestParam int auction_sq) {
		Auction auction = auctionDao.find(auction_sq);
		model.addAttribute("auction", auction);
		return "/admin/edit";
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String edit(@ModelAttribute Auction auction) {
		auctionDao.edit(auction);
		return "redirect:/list";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam int auction_sq) {
		auctionDao.delete(auction_sq);
		return "redirect:/list";
	}
	
}
