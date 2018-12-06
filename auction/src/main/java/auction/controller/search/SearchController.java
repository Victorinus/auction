package auction.controller.search;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import auction.entity.search.Search;
import auction.repository.search.SearchDao;
import auction.util.SearchPagingUtil;

@Controller
public class SearchController {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private SearchPagingUtil pagingUtil;
	
	@Autowired
	private SearchDao searchDao;
	
	@RequestMapping("/search")
	public String search(
						@RequestParam(defaultValue="1") int page,
						@RequestParam(defaultValue="") String date_st,
						@RequestParam(defaultValue="") String date_fn,
						@RequestParam(defaultValue="") String type,
						@RequestParam(defaultValue="") String key,
						@RequestParam(defaultValue="") String medium,
						Model model) {
		//전체선택시 배열인지 여부 판정 : false
		//log.debug("type = {}, {}", type, type.getClass().isArray());
		
		Search search = Search.builder()
												.date_st(date_st)
												.date_fn(date_fn)
												.type(type)
												.key(key)
												.medium(medium)
											.build();
		log.debug("search = {}", search);
		
		pagingUtil.calculate(page, search);
		model.addAttribute("util", pagingUtil);
		
		if(date_st.equals("") && date_fn.equals("") 
				&& type.equals("") && key.equals("") && medium.equals("")) {
			log.debug("searchDao.list");
			model.addAttribute("searchList", searchDao.list());
		}
		else {
			search = Search.builder()
										.date_st(date_st)
										.date_fn(date_fn)
										.type(type)
										.key(key)
										.medium(medium)
									.build();
			log.debug("searchDao.search");
			log.debug("search = {}", search);
//			searchDao.search();
		}
		
		return "search/search";
	}
}
