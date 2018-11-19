package auction.repository.online;

import java.util.List;

import org.springframework.stereotype.Repository;

import auction.entity.Auction;
import auction.entity.View;
import auction.entity.Search;

@Repository
public interface OnlineDao {

	Auction currentAuction();
	
	List<View> currentList();
	
	List<View> currentSearch(Search search);

	List<Auction> upcomingList();

	List<Auction> resultList();

}
