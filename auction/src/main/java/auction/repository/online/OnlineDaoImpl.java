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
	
//	이하 경매 상태(진행/예정/종료)에 따른 List 호출하는 메소드
	@Override
	public List<View> currentList(int sn, int fn) {
		return sqlSession.selectList("currentList");
	}
	
	@Override
	public List<View> currentSearch(String art_artist, String art_nm, int lot, int sn, int fn){
		/*if(search.getArtist()==null && search.getTitle()==null && 
				search.getEprice_min()==null && search.getEprice_max()==null && search.getLot()==0) {
			return currentList(sn, fn);
		}*/
		log.debug("작가명 = {}", art_artist);
		Paging paging = Paging.builder()
												.art_artist(art_artist)
												.art_nm(art_nm)
												.lot(lot)
												.sn(sn)
												.fn(fn)
											.build();
		log.debug("paging = {}", paging);
		return sqlSession.selectList("currentSearch", paging);
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

//	이하 PagingUtil에서 필요로 하는 전체 경매 또는 출품된 작품의 수 계산 메소드 호출
	@Override
	public int getResultAuctionCount() {
		return sqlSession.selectOne("resultAuctionCount");
	}

	@Override
	public int getUpcomingAuctionCount() {
		return sqlSession.selectOne("upcomingAuctionCount");
	}
	
	@Override
	public int getArtCount() {
		return sqlSession.selectOne("artCount");
	}

}
