package auction.repository.auction;

import java.util.List;

import org.springframework.stereotype.Service;

import auction.entity.Auction;

@Service
public interface AuctionDao {
	void insert(Auction auction);
	List<Auction> list();
}
