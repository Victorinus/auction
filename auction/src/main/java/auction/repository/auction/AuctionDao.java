package auction.repository.auction;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import auction.entity.Art;
import auction.entity.Auction;
import auction.entity.Page;
import auction.entity.View;

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
		String getStart(int auction_sq);
		String getEnd(int auction_sq);
		Map<String, View> exhibitList(int auction_sq);
		List<Art> getEntryList(Page page);
		List<Art> getEntrySearch(Page page, String sortType, String searchType, String searchKey);
		int getEntryListCnt();
		int getEntrySearchCnt(String searchType, String searchKey);
		void exRegist(int auction_sq, int art_sq);
		void exDelete(int auction_sq, int art_sq);
}

