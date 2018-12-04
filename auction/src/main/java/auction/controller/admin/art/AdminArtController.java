package auction.controller.admin.art;

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

import auction.entity.Art;
import auction.entity.Page;
import auction.repository.art.ArtDao;
import auction.util.AdminPagingUtil;
import auction.util.UUIDUtil;


//관리자_상품 기능 관련 컨트롤러
@Controller
public class AdminArtController {
        
        @Autowired
        private ArtDao artDao;
        @Autowired
        private ServletContext application;
        @Autowired
        private AdminPagingUtil pagingUtil;
        @Autowired
        private UUIDUtil uuidUtil;
        
        private Logger log = LoggerFactory.getLogger(getClass());
        
        @RequestMapping("/admin/art/register")
        public String register() {
                return "/admin/art/register";
        }
        
        @RequestMapping(value="/admin/art/register", method=RequestMethod.POST)
        public String register(@ModelAttribute Art art, @RequestParam(required=false) MultipartFile image) throws IllegalStateException, IOException {

        	//파일의 존재 및 이미지형식 검사
            if(!image.isEmpty() && image.getContentType().startsWith("image")) {
                String path = application.getRealPath("/image/art");
                //파일명 중복을 피해가 위해 랜덤문자열을 추가하여 저장
                String saveName = uuidUtil.getSaveName(image.getOriginalFilename());
                File target = new File(path, saveName);        
                image.transferTo(target);
                
                //객체에 이미지 추가
                art.setArt_image(saveName);
            }
            //DB등록
            artDao.insert(art);
                    
            return "redirect:/admin/art/list";
        }
        
        @RequestMapping("/admin/art/list")
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
			if (searchType.equals("empty") || searchKey.equals("empty")) {
				model.addAttribute("list", artDao.list(page, sortType));
			} else {
				model.addAttribute("list", artDao.search(page, sortType, searchType, searchKey));
			}
			return "/admin/art/list";
        }

        @RequestMapping("/admin/art/detail")
        public String detail(Model model, @RequestParam int art_sq) {
            Art art = artDao.find(art_sq);
            model.addAttribute("art", art);
            return "/admin/art/detail";
        }
        
        @RequestMapping("/admin/art/edit")
        public String edit(Model model, @RequestParam int art_sq) {
            Art art = artDao.find(art_sq);
            model.addAttribute("art", art);
            return "/admin/art/edit";
        }
        
        @RequestMapping(value="/admin/art/edit", method=RequestMethod.POST)
        public String edit(@ModelAttribute Art art, @RequestParam(required=false) MultipartFile image, @RequestParam(required=false) String prevImage) throws IllegalStateException, IOException {

			// 파일의 존재 및 이미지형식 검사
			if (!image.isEmpty() && image.getContentType().startsWith("image")) {
				String path = application.getRealPath("/image/art");
                //파일명 중복을 피해가 위해 랜덤문자열을 추가하여 저장
                String saveName = uuidUtil.getSaveName(image.getOriginalFilename());
                File target = new File(path, saveName);        
                image.transferTo(target);
	
				// 기존이미지가 있다면 삭제
				if (prevImage != null) {
					File prevTarget = new File(path, prevImage);
					prevTarget.delete();
				}
	
				// 객체에 이미지 추가
				art.setArt_image(saveName);
			}else if(image.isEmpty()){
				art.setArt_image(prevImage);
			}
			artDao.edit(art);
	
			return "redirect:/admin/art/detail?art_sq=" + art.getArt_sq();
        }
        
        @RequestMapping("/admin/art/delete")
        public String delete(@RequestParam int art_sq) {
            artDao.delete(art_sq);
            return "redirect:/admin/art/list";
        }
        
}

