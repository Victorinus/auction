package auction.controller.admin.member;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import auction.repository.member.MemberDao;
import auction.util.MemberPagingUtil;

@Controller
public class AdminMemberController {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberPagingUtil pagingUtil;
	
	//회원 목록 및 검색
	@RequestMapping("/admin/member/list")
	public String userList(
						Model model,
						@RequestParam(defaultValue="1") int page,
						@RequestParam(defaultValue="") String searchType,
						@RequestParam(defaultValue="") String searchKey) {
		Map<String, Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchKey", searchKey);
		
		pagingUtil.calculate(page, map);
		model.addAttribute("util", pagingUtil);
		
		map.put("pagesize", pagingUtil.getPagesize());
		map.put("blocksize", pagingUtil.getBlocksize());
		map.put("sn", pagingUtil.getSn());
		map.put("fn", pagingUtil.getFn());
		map.put("sb", pagingUtil.getSb());
		map.put("fb", pagingUtil.getFb());
		
		if(searchType.equals("") && searchKey.equals("")) {
			model.addAttribute("list", memberDao.userList(map));
			return "admin/member/list";
		}
		else {
			model.addAttribute("list", memberDao.userSearch(map));
			return "admin/member/list";
		}
	}
	
	// 회원 강제탈퇴
	@RequestMapping("/admin/member/delete")
	public String delete(
					@RequestParam int user_sq,
					Model model) {
		log.debug("user_sq = {}", user_sq);
		
		memberDao.delete(user_sq);
		return "redirect: admin/member/list";
	}
}
