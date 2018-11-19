package auction.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import auction.entity.Search;
import auction.repository.online.OnlineDao;
import lombok.Getter;

@Service
@Getter
public class PagingUtil {
	
	private int page;
	private Search search;
	private int sn, fn, sb, fb;
	private String param;
	private int count;
	private int pagesize, blocksize, totalpage;
	
	@Autowired
	private OnlineDao onlineDao;
	
	public PagingUtil(@ModelAttribute Search search) {
		
	}
	
}
