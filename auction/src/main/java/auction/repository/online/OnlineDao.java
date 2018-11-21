package auction.repository.online;

import java.util.List;

import org.springframework.stereotype.Repository;

import auction.entity.Auction;
import auction.entity.Paging;
import auction.entity.View;
import auction.entity.Search;

@Repository
public interface OnlineDao {
	
	List<View> currentList();
	
	List<View> currentSearch(Search search);

	List<Auction> upcomingList(int sn, int fn);

	List<Auction> resultList(int sn, int fn);

	int getCount();

}
