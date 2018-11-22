package auction.repository.online;

import java.util.List;

import org.springframework.stereotype.Repository;

import auction.entity.Auction;
import auction.entity.Paging;
import auction.entity.View;
import auction.entity.Search;

@Repository
public interface OnlineDao {
	
	List<View> currentList(int sn, int fn);
	
	List<View> currentSearch(String art_artist, String art_nm, int lot, int sn, int fn);

	List<Auction> upcomingList(int sn, int fn);

	List<Auction> resultList(int sn, int fn);

	int getResultAuctionCount();

	int getUpcomingAuctionCount();
	
	int getArtCount(String art_artist, String art_nm, int lot);

}
