package auction.repository.auction;

import java.util.List;

import org.springframework.stereotype.Service;

import auction.entity.Auction;
import auction.entity.Page;

@Service
public interface AuctionDao {
	void insert(Auction auction);
	List<Auction> list();
	List<Auction> list(Page page, String sortType);
	List<Auction> search(Page page, String sortType, String searchType, String searchKey);
	int getListCnt();
	int getSearchCnt(String searchType, String searchKey);
	Auction find(int no);
	void edit(Auction auction);
	void delete(int auction_sq);
}
