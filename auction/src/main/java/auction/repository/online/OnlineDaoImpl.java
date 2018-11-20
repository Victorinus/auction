package auction.repository.online;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import auction.entity.Auction;
import auction.entity.Paging;
import auction.entity.View;
import auction.entity.Search;

@Repository("onlineDao")
public class OnlineDaoImpl implements OnlineDao {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public Auction currentAuction() {
		return sqlSession.selectOne("currentAuction");
	}
	
	@Override
	public List<View> currentList() {
		return sqlSession.selectList("currentList");
	}

	public List<View> currentSearch(Search search){
		log.debug("검색어 = {}", search);
		if(search.getArtist()==null && search.getTitle()==null && 
				search.getEprice_min()==null && search.getEprice_max()==null && search.getLot()==0) {
			return currentList();
		}
		return sqlSession.selectList("currentSearch", search);
	}

	@Override
	public List<Auction> upcomingList() {
		return sqlSession.selectList("upcomingList");
	}

	@Override
	public List<Auction> resultList() {
		return sqlSession.selectList("resultList");
	}

	@Override
	public int getCount() {
		return sqlSession.selectOne("count");
	}

}
