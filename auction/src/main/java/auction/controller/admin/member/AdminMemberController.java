package auction.controller.admin.member;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import auction.entity.Member;
import auction.repository.member.MemberDao;
import auction.repository.myfav.MyfavDao;
import auction.util.AdminMemberPagingUtil;
import auction.util.AdminMyfavPagingUtil;

@Controller
public class AdminMemberController {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MyfavDao myfavDao;
	@Autowired
	private AdminMemberPagingUtil adminPagingUtil;
	@Autowired
	private AdminMyfavPagingUtil myfavPagingUtil; 
	
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
		
		adminPagingUtil.calculate(page, map);
		model.addAttribute("util", adminPagingUtil);
		
		map.put("pagesize", adminPagingUtil.getPagesize());
		map.put("blocksize", adminPagingUtil.getBlocksize());
		map.put("sn", adminPagingUtil.getSn());
		map.put("fn", adminPagingUtil.getFn());
		map.put("sb", adminPagingUtil.getSb());
		map.put("fb", adminPagingUtil.getFb());
		
		if(searchType.equals("") && searchKey.equals("")) {
			model.addAttribute("list", memberDao.userList(map));
			return "admin/member/list";
		}
		else {
			model.addAttribute("list", memberDao.userSearch(map));
			return "admin/member/list";
		}
	}
	
	// 회원정보수정
	@RequestMapping("/admin/member/edit")
	public String edit(@RequestParam int user_sq, Model model) {
		log.debug("user_sq = {}", user_sq);
		model.addAttribute("member", memberDao.find(user_sq));
		return "admin/member/edit";
	}
	@RequestMapping(value="/admin/member/edit", method=RequestMethod.POST)
	public String edit(
					@ModelAttribute Member init,
					Model model) {
		log.debug("member = {}", init);
		String reg_dt = init.getReg_dt().substring(0, 19);
		/*String chg_dt = init.getChg_dt().substring(0, 19);*/
		Member member = Member.builder()				
													.user_sq(init.getUser_sq())
													.user_id(init.getUser_id())
													.user_pw(init.getUser_pw())
													.user_nm(init.getUser_nm())
													.user_birth(init.getUser_birth())
													.user_gender(init.getUser_gender())
													.user_phone(init.getUser_phone())
													.user_tel(init.getUser_tel())
													.user_email(init.getUser_email())
													.user_post(init.getUser_post())
													.user_addr1(init.getUser_addr1())
													.user_addr2(init.getUser_addr2())
													.user_grade(init.getUser_grade())
													.reg_dt(reg_dt)
													/*.chg_dt(chg_dt)*/
													.build();
		log.debug("member = {}", member);
		memberDao.edit(member);
		
		return "redirect: /auction/admin/member/edit?user_sq="+init.getUser_sq();
	}
	
//	관심작품 목록 및 검색
	@RequestMapping("/admin/member/myfav")
	public String myfav(
							Model model,
							@RequestParam(defaultValue="1") int page,
							@RequestParam(defaultValue="") String searchType,
							@RequestParam(defaultValue="") String searchKey) {
		Map<String, Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchKey", searchKey);
		
		myfavPagingUtil.calculate(page, map);
		model.addAttribute("util", myfavPagingUtil);
		
		map.put("pagesize", myfavPagingUtil.getPagesize());
		map.put("blocksize", myfavPagingUtil.getBlocksize());
		map.put("sn", myfavPagingUtil.getSn());
		map.put("fn", myfavPagingUtil.getFn());
		map.put("sb", myfavPagingUtil.getSb());
		map.put("fb", myfavPagingUtil.getFb());
		
		if(searchType.equals("") && searchKey.equals("")) {
			model.addAttribute("list", myfavDao.getAdminMyfavList(map));
			return "admin/member/myfav";
		}
		else {
			model.addAttribute("list", myfavDao.getAdminMyfavSearch(map));
			return "admin/member/myfav";
		}
	}

}
