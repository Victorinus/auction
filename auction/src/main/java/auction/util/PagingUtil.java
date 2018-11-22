package auction.util;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	private String art_artist;
	private String art_nm;
	private String art_eprice_min;
	private String art_eprice_max;
	private int lot;

	private int sn, fn, sb, fb;
	private String param;
	private int count;
	private int pagesize, blocksize, totalpage;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private OnlineDao onlineDao;

	public void setHttpServletRequest(@ModelAttribute Search search, HttpServletRequest request) {
		log.debug("PagingUtil : search, request");
		log.debug("작가명, 작품명, 번호 = {}, {}, {}", search.getArt_artist(), search.getArt_nm(), search.getLot());
		
		this.art_artist = search.getArt_artist();
		this.art_nm = search.getArt_nm();
		this.art_eprice_min = search.getArt_eprice_min();
		this.art_eprice_max = search.getArt_eprice_max();
		try {
			this.lot = Integer.parseInt(search.getLot());
		}
		catch(Exception e) {
			this.lot = 0;
		}
		
//		page 파라미터 받아서 변환 처리 
		try {
			this.page = Integer.parseInt(request.getParameter("page"));
			if(this.page <= 0)	throw new Exception();
		}
		catch(Exception e) {
			this.page = 1;
		}
		
		log.debug(request.getRequestURI());
//		위 로그에 찍힌 요청주소에 해당하는 계산 메소드 배정(?)
		try {
//			if(request.getRequestURI().endsWith("/result")) {
//				result();
//			}
//			else if(request.getRequestURI().endsWith("/upcoming")) {
//				upcoming();
//			}
			if(request.getRequestURI().endsWith("/current")){
				current();
			}
			else {}
		}
		catch(Exception e) {}
	}
	
	public void setHttpServletRequest(HttpServletRequest request) {		
		log.debug("PagingUtil : request");
//		page 파라미터 받아서 변환 처리 
		try {
			this.page = Integer.parseInt(request.getParameter("page"));
			if(this.page <= 0)	throw new Exception();
		}
		catch(Exception e) {
			this.page = 1;
		}
		
//		위 로그에 찍힌 요청주소에 해당하는 계산 메소드 배정(?)
		try {
			if(request.getRequestURI().endsWith("/result")) {
				result();
			}
			else if(request.getRequestURI().endsWith("/upcoming")) {
				upcoming();
			}
//			else if(request.getRequestURI().endsWith("/current")){
//				current();
//			}
			else {}
		}
		catch(Exception e) {}
	}
	
//	종료된 경매의 페이징 처리
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
	
//	예정된 경매의 페이징 처리 : pagesize=1로 설정(네비게이터 별도 양식 적용할 것!)
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
	
//	진행중인 경매의 페이징 처리
	private void current() {
		count = onlineDao.getArtCount(art_artist, art_nm, lot);
		log.debug("count = {}", count);
		pagesize = 10;
		
		sn = (page-1) * pagesize+1;
		fn = page * pagesize;
		
		totalpage = (count+pagesize-1) / pagesize;
		
		blocksize = 4;
		sb = (page-1) / blocksize * blocksize + 1;
		fb = sb + (blocksize-1);
		
		if(fb>totalpage)	fb = totalpage;
		log.debug("sn, fn, sb, fb, totalpage= {}, {}, {}, {}, {}", sb, fn, sb, fb, totalpage);
		if(art_artist != null || art_nm != null || lot != 0) {
			param = "&art_artist="+art_artist+"&art_nm="+art_nm+"&lot="+lot;
		}
		else {
			param ="";
		}
	}

//	기타 처리사항
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
