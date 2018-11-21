package auction.util;

import org.springframework.stereotype.Service;

import auction.entity.Page;

@Service
public interface PagingUtil {
	Page paging(int curPage);
	void setPageCnt();
	void setRangeCnt();
	void rangeSetting(int curPage);
	void setCurRange(int curPage);
	void setStartIndex(int curPage);
}
