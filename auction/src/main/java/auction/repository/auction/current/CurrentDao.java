package auction.repository.auction.current;

import java.util.List;

import org.springframework.stereotype.Repository;

import auction.entity.Auction;
import auction.entity.Current;
import auction.entity.Search;

@Repository
public interface CurrentDao {

	Auction currentAuction();
	
	List<Current> currentList();
	
	List<Current> currentSearch(Search search);

}
