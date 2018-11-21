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
	public List<View> currentList() {
		return sqlSession.selectList("currentList");
	}

	public List<View> currentSearch(Search search){
		if(search.getArtist()==null && search.getTitle()==null && 
				search.getEprice_min()==null && search.getEprice_max()==null && search.getLot()==0) {
			return currentList();
		}
		return sqlSession.selectList("currentSearch", search);
	}

	@Override
	public List<Auction> upcomingList(int sn, int fn) {
		Paging paging = Paging.builder().sn(sn).fn(fn).build();
		return sqlSession.selectList("upcomingList", paging);
	}

	@Override
	public List<Auction> resultList(int sn, int fn) {
		Paging paging = Paging.builder().sn(sn).fn(fn).build();
		return sqlSession.selectList("resultList", paging);
	}

	@Override
	public int getCount() {
		return sqlSession.selectOne("count");
	}
}
