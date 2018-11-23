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
public class OnlinePagingUtil {
	
	private int page;
	private String art_artist;
	private String art_nm;
	private int art_eprice_min;
	private int art_eprice_max;
	private int lot;

	private int sn, fn, sb, fb;
	private String param;
	private int count;
	private int pagesize, blocksize, totalpage;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private OnlineDao onlineDao;

	public void setHttpServletRequest(@ModelAttribute Search search, HttpServletRequest request) {
		log.debug("페이징유틸 : search, request");
		log.debug("작가명 = {}", search.getArt_artist());
		log.debug("작품명 = {}", search.getArt_nm());
		log.debug("번호 = {}", search.getLot());
		log.debug("최소가 = {}", search.getArt_eprice_min());
		log.debug("최대가 = {}", search.getArt_eprice_max());
		
		this.art_artist = search.getArt_artist();
		this.art_nm = search.getArt_nm();
		
//		[1] 사용자가 입력한 작품번호의 변환 처리(String → int)
		try {
			this.lot = Integer.parseInt(search.getLot());
		}
		catch(Exception e) {
			this.lot = 0;
		}
		log.debug("변환된 번호 = {}", lot);
		
//		[2] 사용자가 입력한 추정가의 변환 처리(String →  int)
//		e.g. ￦10,000,000 → 10000000
		
//		if(search.getArt_eprice_min() != null && search.getArt_eprice_max() != null) {
		try {
			String eprice_min = search.getArt_eprice_min().substring(1);
			String[] eprices_min = eprice_min.split(",");
			StringBuffer sb_min = new StringBuffer();
			for(int i=0; i<eprices_min.length; i++) {
				sb_min.append(eprices_min[i]);
			}
			this.art_eprice_min = Integer.parseInt(sb_min.toString());
//			log.debug("변환된 최소가 = {}", art_eprice_min);
	
			String eprice_max = search.getArt_eprice_max().substring(1);
			String[] eprices_max = eprice_max.split(",");
			StringBuffer sb_max = new StringBuffer();
			for(int i=0; i<eprices_max.length; i++) {
				sb_max.append(eprices_max[i]);
			}
			this.art_eprice_max = Integer.parseInt(sb_max.toString());
//			log.debug("변환된 최대가 = {}", art_eprice_max);
		}
		catch(Exception e) {
			this.art_eprice_min = 0;
			this.art_eprice_max = 0;
		}
		log.debug("변환된 최소가 = {}", art_eprice_min);
		log.debug("변환된 최대가 = {}", art_eprice_max);
//		}
			
//		[3] page 파라미터의 변환 처리 
		try {
			this.page = Integer.parseInt(request.getParameter("page"));
			if(this.page <= 0)	throw new Exception();
		}
		catch(Exception e) {
			this.page = 1;
		}
		
		log.debug(request.getRequestURI());
		
//		[4] 로그에 찍힌 요청주소에 해당하는 계산 메소드 배정(?)
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