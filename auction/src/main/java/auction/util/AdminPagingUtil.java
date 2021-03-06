package auction.util;

import org.springframework.stereotype.Service;

import auction.entity.Page;

@Service
public interface AdminPagingUtil {
        Page paging(int curPage, String searchType, String searchKey, String uri);
        void setPageCnt();
        void setRangeCnt();
        void rangeSetting(int curPage);
        void setCurRange(int curPage);
        void setStartIndex(int curPage);
}

