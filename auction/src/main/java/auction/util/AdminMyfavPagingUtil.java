package auction.util;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import auction.repository.myfav.MyfavDao;
import lombok.Getter;

@Service
@Getter
public class AdminMyfavPagingUtil {
	
	private int page;
	private int count;
	private int sn, fn, sb, fb;
	private int pagesize, blocksize, totalpage;
	
	private String searchType, searchKey;
	private String param;
	
	private Logger log= LoggerFactory.getLogger(getClass());
	
	@Autowired
	private MyfavDao myfavDao;

	public void calculate(int page, Map<String, Object> map) {
		log.debug("page, map = {}, {}", page, map);
		searchType = (String) map.get("searchType"); 
		searchKey = (String) map.get("searchKey");
		
		if(searchType.equals("") && searchKey.equals("")) {
			log.debug("myfavDao.getListCount()");
			count = myfavDao.getListCount();
		}
		else {
			log.debug("myfavDao.getSearchCount()");
			count = myfavDao.getSearchCount(map);
		}

		pagesize = 10;
		
		sn = (page - 1) * pagesize + 1;
		fn = page * pagesize;
		
		totalpage = (count + pagesize - 1) / pagesize;
		
		blocksize = 10;
		sb = (page-1) / blocksize * blocksize + 1;
		fb = sb + (blocksize-1);
		
		if(fb>totalpage)	fb = totalpage;
		
		if(searchType != null || searchKey != null) {
			param = "&searchType="+searchType+"&searchKey="+searchKey;
		}
		else{
			param = "";
		}

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
