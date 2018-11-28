package auction.util;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import auction.entity.Search;
import auction.repository.online.OnlineDao;
import lombok.Getter;

@Service
@Getter 
public class OnlinePagingUtil {
	
	private int page;
	private String art_artist;
	private String art_nm;
	private int art_eprice_min;
	private int art_eprice_max;
	private int lot;
	private int no;
	private String sortType;
	
	private int sn, fn, sb, fb;
	private String param;
	private int count;
	private int pagesize, blocksize, totalpage;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private OnlineDao onlineDao;

	public void setHttpServletRequest(@ModelAttribute Search search, HttpServletRequest request) {
		log.debug("PagingUtil : search, request");
		
		this.art_artist = search.getArt_artist();
		this.art_nm = search.getArt_nm();
		this.sortType = "lot asc";
		
//		[1] 사용자가 입력한 작품번호의 변환 처리(String → int)
		try {
			this.lot = Integer.parseInt(search.getLot());
		}
		catch(Exception e) {
			this.lot = 0;
		}
		
//		[2] 사용자가 입력한 추정가의 변환 처리(String →  int)
		try {
			String[] eprices_min = search.getArt_eprice_min().split("￦|,");
			StringBuffer sb_min = new StringBuffer();
			for(int i=0; i<eprices_min.length; i++) {
				sb_min.append(eprices_min[i]);
			}
			this.art_eprice_min = Integer.parseInt(sb_min.toString());
	
			String[] eprices_max = search.getArt_eprice_max().split("￦|,");
			StringBuffer sb_max = new StringBuffer();
			for(int i=0; i<eprices_max.length; i++) {
				sb_max.append(eprices_max[i]);
			}
			this.art_eprice_max = Integer.parseInt(sb_max.toString());
		}
		catch(Exception e) {
			this.art_eprice_min = 0;
			this.art_eprice_max = 0;
		}
		
//		[3] page 파라미터의 변환 처리 
		try {
			this.page = Integer.parseInt(request.getParameter("page"));
			if(this.page <= 0)	throw new Exception();
		}
		catch(Exception e) {
			this.page = 1;
		}

//		[4] 계산 메소드 실행	
		try {
			current();
		}
		catch(Exception e) {}
	}

	public void setHttpServletRequest(@ModelAttribute Search search, @RequestParam String no, HttpServletRequest request) {
		log.debug("PagingUtil : search, no, request");
		
		this.art_artist = search.getArt_artist();
		this.art_nm = search.getArt_nm();
		
//		[1] 사용자가 입력한 작품번호의 변환 처리(String → int)
		try {
			this.lot = Integer.parseInt(search.getLot());
		}
		catch(Exception e) {
			this.lot = 0;
		}
		
//		[2] 사용자가 입력한 추정가의 변환 처리(String →  int)
		try {
			String[] eprices_min = search.getArt_eprice_min().split("￦|,");
			StringBuffer sb_min = new StringBuffer();
			for(int i=0; i<eprices_min.length; i++) {
				sb_min.append(eprices_min[i]);
			}
			this.art_eprice_min = Integer.parseInt(sb_min.toString());
	
			String[] eprices_max = search.getArt_eprice_max().split("￦|,");
			StringBuffer sb_max = new StringBuffer();
			for(int i=0; i<eprices_max.length; i++) {
				sb_max.append(eprices_max[i]);
			}
			this.art_eprice_max = Integer.parseInt(sb_max.toString());
		}
		catch(Exception e) {
			this.art_eprice_min = 0;
			this.art_eprice_max = 0;
		}		
//		[3] page 파라미터의 변환 처리 
		try {
			this.page = Integer.parseInt(request.getParameter("page"));
			if(this.page <= 0)	throw new Exception();
		}
		catch(Exception e) {
			this.page = 1;
		}

//		[4] no 파라미터의 변환 처리
		this.no = Integer.parseInt(no);
		
		log.debug("작가명 = {}", art_artist);
		log.debug("작품명 = {}", art_nm);
		log.debug("lot = {}", lot);
		log.debug("최소가 = {}", art_eprice_min);
		log.debug("최대가 = {}", art_eprice_max);
		log.debug("page : {}", page);
		log.debug("no : {}", this.no);
		
//		[5] 계산 메소드 실행	
		try {
			detail();
		}
		catch(Exception e) {}

	}
	
	public void setHttpServletRequest(HttpServletRequest request) {		
		log.debug("PagingUtil : request");
		try {
			this.page = Integer.parseInt(request.getParameter("page"));
			if(this.page <= 0)	throw new Exception();
		}
		catch(Exception e) {
			this.page = 1;
		}
//		계산 메소드 실행
		try {
			if(request.getRequestURI().endsWith("/result")) {
				result();
			}
			else if(request.getRequestURI().endsWith("/upcoming")) {
				upcoming();
			}
			else {}
		}
		catch(Exception e) {}
	}
	
//	이하 계산 메소드
	private void result() {
		count = onlineDao.getResultAuctionCount();
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
		count = onlineDao.getUpcomingAuctionCount();
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
		count = onlineDao.getArtCount(
				art_artist, art_nm, art_eprice_min, art_eprice_max, lot);
		log.debug("count = {}", count);
		pagesize = 10;
		
		sn = (page-1) * pagesize+1;
		fn = page * pagesize;
		
		totalpage = (count+pagesize-1) / pagesize;
		
		blocksize = 4;
		sb = (page-1) / blocksize * blocksize + 1;
		fb = sb + (blocksize-1);
		
		if(fb>totalpage)	fb = totalpage;
		if(art_artist != null || art_nm != null || art_eprice_min != 0 || art_eprice_max != 0  || lot != 0) {
			param = "&art_artist="+art_artist+"&art_nm="+art_nm+"&art_eprice_min="+art_eprice_min+"&art_eprice_max="+art_eprice_max+"&lot="+lot;
		}
		else {
			param ="";
		}
	}

	private void detail() {
		count = onlineDao.getResultArtCount(
				art_artist, art_nm, art_eprice_min, art_eprice_max, lot, no);
		log.debug("count : {}", count);
		pagesize = 10;
		
		sn = (page-1) * pagesize+1;
		fn = page * pagesize;
		
		totalpage = (count+pagesize-1) / pagesize;
		
		blocksize = 4;
		sb = (page-1) / blocksize * blocksize + 1;
		fb = sb + (blocksize-1);
		
		if(fb>totalpage)	fb = totalpage;
		log.debug("sn, fn, sb, fb, totalpage = {}, {}, {}, {}, {}", sn, fn, sb, fb, totalpage);
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