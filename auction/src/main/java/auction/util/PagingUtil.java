package auction.util;

import org.springframework.stereotype.Service;

import auction.entity.Page;

@Service
public interface PagingUtil {
	Page paging(int curPage);
}
