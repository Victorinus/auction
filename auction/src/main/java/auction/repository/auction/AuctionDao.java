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
	int getListCnt();
	Auction find(int no);
	void edit(Auction auction);
	void delete(int auction_no);
}
