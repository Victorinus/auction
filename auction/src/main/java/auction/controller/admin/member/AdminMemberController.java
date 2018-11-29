package auction.controller.admin.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import auction.repository.member.MemberDao;

//관리자가 회원을 관리하는 컨트롤러
@Controller
public class AdminMemberController {
	
	@Autowired
	private MemberDao memberdao;
	
	//회원목록 보여주는 컨트롤러
	@RequestMapping("/admin/member/userlist")
	public String userList(Model model) {
		model.addAttribute("list", memberdao.userList());
		return "admin/member/userlist";
		
	}

}
