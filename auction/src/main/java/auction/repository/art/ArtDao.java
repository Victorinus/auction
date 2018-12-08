package auction.repository.art;

import java.util.List;

import org.springframework.stereotype.Service;

import auction.entity.Art;
import auction.entity.Auction;
import auction.entity.Eval;
import auction.entity.Page;

@Service
public interface ArtDao {
        void insert(Art art);
        List<Art> list();
        List<Art> list(Page page, String sortType);
        List<Art> search(Page page, String sortType, String searchType, String searchKey);
        int getListCnt();
        int getSearchCnt(String searchType, String searchKey);
        Art find(int no);
        void edit(Art art);
        void delete(int art_sq);
		int getEvalListCnt();
		int getEvalSearchCnt(String searchType, String searchKey);
		List<Eval> evalList(Page page, String sortType);
		List<Eval> evalSearch(Page page, String sortType, String searchType, String searchKey);
		void evalReg(Eval eval);
		void editStatusEx(int art_sq);
		void editStatusEntry(int art_sq);
}
