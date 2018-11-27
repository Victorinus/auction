package auction.repository.online;

import java.util.List;

import org.springframework.stereotype.Repository;

import auction.entity.Auction;
import auction.entity.View;

@Repository
public interface OnlineDao {
	
	List<View> currentList(int sn, int fn);
	
	List<View> currentSearch(
										String art_artist, 
										String art_nm, 
										int lot, 
										int sn, 
										int fn, 
										int art_eprice_min, 
										int art_eprice_max);
	
	List<Auction> upcomingList(int sn, int fn);
	
	List<Auction> resultList(int sn, int fn);
	
	List<View> detailList(int sn, int fn, int no);
	
	List<View> detailSearch(
										String art_artist, 
										String art_nm, 
										int lot, 
										int art_eprice_min, 
										int art_eprice_max, 
										int sn, 
										int fn, 
										int no);
	
	int getResultAuctionCount();
	
	int getUpcomingAuctionCount();
	
	int getArtCount(
						String art_artist, 
						String art_nm, 
						int art_eprice_min, 
						int art_eprice_max, 
						int lot);
	
	int getResultArtCount(String art_artist, String art_nm, int art_eprice_min, int art_eprice_max, int lot, int no);

}
