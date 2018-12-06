package auction.repository.search;

import java.util.List;

import org.springframework.stereotype.Repository;

import auction.entity.View;
import auction.entity.search.Search;

@Repository
public interface SearchDao {

	int getListCount();

	int getSearchCount(Search search);
	
	List<View> list();

}
