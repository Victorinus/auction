package auction.repository.auction.current;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import auction.entity.Auction;
import auction.entity.Current;
import auction.entity.Search;

@Repository("currentDao")
public class CurrentDaoImpl implements CurrentDao {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public Auction currentAuction() {
		return sqlSession.selectOne("currentAuction");
	}
	
	@Override
	public List<Current> currentList() {
		return sqlSession.selectList("currentList");
	}

	public List<Current> currentSearch(Search search){
		log.debug("검색어 = {}", search);
		if(search.getArtist()==null && search.getTitle()==null && 
				search.getEprice_min()==null && search.getEprice_max()==null && search.getLot()==0) {
			return currentList();
		}
		return sqlSession.selectList("currentSearch", search);
	}
	
//	@Override
//	public List<Current> currentSearch(Search search) {
//		return sqlSession.selectList("currentSearch", search);
//	}

}
