package auction.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import auction.entity.Page;
import auction.repository.auction.AuctionDao;


/**
 * 페이징에 필요한 기능 구현 클래스
 */
@Service("pagingUtil")
public class PagingUtilImpl implements PagingUtil{
	
	@Autowired
	private AuctionDao auctionDao;
	@Autowired
	private Page page;
	
	//Controller에서 curPage(현재페이지)를 받아와 페이징 처리를 하는 메소드
	public Page paging(int curPage) {

		//현재페이지
		page.setCurPage(curPage);
		
		//총 게시물 수
		page.setListCnt(auctionDao.getListCnt());
		
		//총 페이지 수
		setPageCnt();
		
       //총 블럭 수
        setRangeCnt();
        
        //블럭의 범위
        rangeSetting(curPage);
        
        //DB 질의를 위한 Index
        setStartIndex(curPage);
		
		return page;
	}
	
	
	// 페이지 수를 설정하는 메소드
	public void setPageCnt() {
		page.setPageCnt((int) Math.ceil(page.getListCnt() * 1.0 / page.getPageSize()));
	}

	// 블럭 수를 설정하는 메소드
	public void setRangeCnt() {
		page.setRangeCnt((int) Math.ceil(page.getPageCnt() * 1.0 / page.getRangeSize()));
	}

	// 블럭의 범위를 설정하는 메소드
	public void rangeSetting(int curPage) {
		//현재블럭범위
		setCurRange(curPage);
		//시작페이지
		page.setStartPage((page.getCurRange() - 1) * page.getRangeSize() + 1);
		//마지막페이지
		page.setEndPage(page.getStartPage() + page.getRangeSize() - 1);
		//블럭의 가장 마지막 부분의 잉여 페이지 처리
		if (page.getEndPage() > page.getPageCnt()) {
			page.setEndPage(page.getPageCnt());
		}
		//이전페이지
		page.setPrevPage(page.getCurPage() - 1);
		//다음페이지
		page.setNextPage(page.getCurPage() + 1);
	}

	// 현재 블럭 범위를 설정하는 메소드
	public void setCurRange(int curPage) {
		page.setCurRange((int) ((curPage - 1) / page.getRangeSize() + 1));
	}

	// 시작 Index를 설정하는 메소드
	public void setStartIndex(int curPage) {
		page.setStartIndex((curPage - 1) * page.getPageSize());
	}

}









