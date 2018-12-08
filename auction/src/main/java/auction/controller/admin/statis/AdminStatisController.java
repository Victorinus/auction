package auction.controller.admin.statis;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//관리자 통계기능을 관리하는 컨트롤러
@Controller
public class AdminStatisController {
	
	//통계 경매현황
	@RequestMapping("/admin/statis/aucsts")
	public String aucSts(Model model) {
		
		return "admin/statis/aucsts";
	}

	//통계 작품현황
	@RequestMapping("/admin/statis/artsts")
	public String artSts(Model model) {
		
		return "admin/statis/artsts";
	}

	//통계 금액정보
	@RequestMapping("/admin/statis/price")
	public String price(Model model) {
		
		return "admin/statis/price";
	}

	//통계 회원현황
	@RequestMapping("/admin/statis/memsts")
	public String memSts(Model model) {
		
		return "admin/statis/memsts";
	}

	//통계 회원순위
	@RequestMapping("/admin/statis/rank")
	public String rank(Model model) {
		
		return "admin/statis/rank";
	}

}
