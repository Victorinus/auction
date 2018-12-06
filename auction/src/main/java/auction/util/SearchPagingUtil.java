package auction.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import auction.entity.search.Search;
import auction.repository.search.SearchDao;
import lombok.Getter;

@Service
@Getter
public class SearchPagingUtil {

	private int page;
	private int count;
	private int sn, fn, sb, fb;
	private int pagesize, blocksize, totalpage;
	private String param;
	
	@Autowired
	private SearchDao searchDao;
	
	public void calculate(int page, Search search) {
		if(search.getDate_st().equals("") && search.getDate_fn().equals("")
				&& search.getType().equals("") && search.getKey().equals("")
						&& search.getMedium().equals("")) {
			count = searchDao.getListCount();
		}
		else {
			count = searchDao.getSearchCount(search);
		}

		pagesize = 10;
		
		sn = (page - 1) * pagesize + 1;
		fn = page * pagesize;
		
		totalpage = (count + pagesize - 1) / pagesize;
		
		blocksize = 10;
		sb = (page-1) / blocksize * blocksize + 1;
		fb = sb + (blocksize-1);
		
		if(fb>totalpage)	fb = totalpage;
		
//		if() {
//			param = "";
//		}
//		else{
//			param = "";
//		}
	}

	public boolean hasMorePrevPage() {
		return sb>1;
	}
	
	public boolean hasMoreNextPage() {
		return fb<totalpage;
	}
	
	public boolean isCurrentPage(int page) {
		return this.page == page;
	}
	
}
