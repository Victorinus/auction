package auction.controller.admin.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import auction.entity.Page;
import auction.entity.Paging;
import auction.repository.member.MemberDao;
import auction.util.AdminPagingUtil;

//관리자가 회원을 관리하는 컨트롤러
@Controller
public class AdminMemberController {
	
	@Autowired
	private MemberDao memberdao;
	@Autowired
	private AdminPagingUtil paigingUtil;
	
	//회원목록 보여주는 컨트롤러
	@RequestMapping("/admin/member/userlist")
	public String userList(
			Model model,
			HttpServletRequest request,
			@RequestParam(defaultValue="1") int curPage, //현재페이지
			@RequestParam(defaultValue="dt") String sortType,//정렬기준
			@RequestParam(defaultValue="empty") String searchType,//검색기준
			@RequestParam(defaultValue="empty") String searchKey
			) {
		String uri = request.getRequestURI();//전송된 URI 가져오기
		Page page = paigingUtil.paging(curPage, searchType, searchKey, uri);//pageVo 가져오기
		//검색조건이 없을 경우
		if (searchType.equals("empty") || searchKey.equals("empty")) {
			model.addAttribute("list", memberdao.list(page, sortType));
		} else {
			model.addAttribute("list", artDao.search(page, sortType, searchType, searchKey));
		}
		return "admin/member/userlist";
		
	}

}
