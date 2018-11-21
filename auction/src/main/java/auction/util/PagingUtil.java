package auction.util;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import auction.repository.online.OnlineDao;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Service
@Getter 
public class PagingUtil {
	
	private int page;
//	private Search search;
	private int sn, fn, sb, fb;
//	private String param;
	private int count;
	private int pagesize, blocksize, totalpage;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private OnlineDao onlineDao;

	public void setHttpServletRequest(HttpServletRequest request) {
		log.debug(request.getRequestURI());
		try {
			this.page = Integer.parseInt(request.getParameter("page"));
			if(this.page <= 0)	throw new Exception();
		}
		catch(Exception e) {
			this.page = 1;
		}
		try {
			if(request.getRequestURI().endsWith("/result")) {
				result();
			}
			else if(request.getRequestURI().endsWith("/upcoming")) {
				upcoming();
			}
			else if(request.getRequestURI().endsWith("/current")){
				current();
			}
			else {}
		}
		catch(Exception e) {}
	}
	
	private void result() {
		count = onlineDao.getCount();
		pagesize = 4;
		
		sn = (page-1) * pagesize+1;
		fn = page * pagesize;
		
		totalpage = (count+pagesize-1) / pagesize;
		
		blocksize = 4;
		sb = (page-1) / blocksize * blocksize + 1;
		fb = sb + (blocksize-1);
		
		if(fb>totalpage)	fb = totalpage;
	}
	
	private void upcoming() {
		count = onlineDao.getCount();
		pagesize = 1;
		
		sn = (page-1) * pagesize+1;
		fn = page * pagesize;
		
		totalpage = (count+pagesize-1) / pagesize;
		
		blocksize = 4;
		sb = (page-1) / blocksize * blocksize + 1;
		fb = sb + (blocksize-1);
		
		if(fb>totalpage)	fb = totalpage;
	}
	
	private void current() {
		count = onlineDao.getCount();
		pagesize = 10;
		
		sn = (page-1) * pagesize+1;
		fn = page * pagesize;
		
		totalpage = (count+pagesize-1) / pagesize;
		
		blocksize = 4;
		sb = (page-1) / blocksize * blocksize + 1;
		fb = sb + (blocksize-1);

		if(fb>totalpage)	fb = totalpage;
	}
}
