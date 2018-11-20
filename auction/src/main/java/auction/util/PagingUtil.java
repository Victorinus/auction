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
@Getter @NoArgsConstructor
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
	
	public PagingUtil(HttpServletRequest request) {
		setHttpServletRequest(request);
	}

	public void setHttpServletRequest(HttpServletRequest request) {
		log.debug("page={}", request.getParameter("page"));
		try {
			this.page = Integer.parseInt(request.getParameter("page"));
			if(this.page <= 0)	throw new Exception();
		}
		catch(Exception e) {
			this.page = 1;
		}
		log.debug("page try/catch문 이후={}", request.getParameter("page"));
		try {
			calculate();
		}
		catch(Exception e) {}
	}
	
	private void calculate() {
		count = onlineDao.getCount();
		pagesize = 4;
		
		sn = (page-1) * page+1;
		fn = page * pagesize;
		
		totalpage = (count+pagesize-1) / pagesize;
		
		blocksize = 4;
		sb = (page-1) / blocksize * blocksize + 1;
		fb = sb + (blocksize-1);
		if(fb>blocksize)	fb = totalpage;
	}
	
}
