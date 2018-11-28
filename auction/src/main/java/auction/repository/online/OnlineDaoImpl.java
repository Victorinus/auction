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

@Repository("onlineDao")
public class OnlineDaoImpl implements OnlineDao {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private SqlSession sqlSession;
	
//	이하 경매 상태(진행/예정/종료)에 따른 List 호출하는 메소드
//	진행경매 : 목록
	@Override
	public List<View> currentList(String sortType, int sn, int fn) {
		Paging paging = Paging.builder()
											.sortType(sortType)
											.sn(sn)
											.fn(fn)
										.build();
		return sqlSession.selectList("currentList", paging);
	}
	
//	진행경매 : 검색
	@Override
	public List<View> currentSearch(
									String art_artist, 
									String art_nm, 
									int lot, 
									int art_eprice_min, 
									int art_eprice_max,
									String sortType,
									int sn, 
									int fn){
		if(art_artist==null && art_nm==null 
				&& art_eprice_min==0 && art_eprice_max==0 && lot==0) {
			log.debug("currentList");
			log.debug("sortType = {}", sortType);
			return currentList(sortType, sn, fn);
		}
		log.debug("currentSearch");
		log.debug("sortType = {}", sortType);
		Paging paging = Paging.builder()
												.art_artist(art_artist)
												.art_nm(art_nm)
												.lot(lot)
												.sn(sn)
												.fn(fn)
												.art_eprice_min(art_eprice_min)
												.art_eprice_max(art_eprice_max)
											.build();		
		return sqlSession.selectList("currentSearch", paging);

	}

//	예정경매
	@Override
	public List<Auction> upcomingList(int sn, int fn) {
		Paging paging = Paging.builder().sn(sn).fn(fn).build();
		return sqlSession.selectList("upcomingList", paging);
	}

//	경매결과
	@Override
	public List<Auction> resultList(int sn, int fn) {
		Paging paging = Paging.builder().sn(sn).fn(fn).build();
		return sqlSession.selectList("resultList", paging);
	}
	
	@Override
	public List<View> detailList(int sn, int fn, int no) {
		Paging paging = Paging.builder().sn(sn).fn(fn).no(no).build();
		return sqlSession.selectList("detailList", paging);
	}
	
	@Override
	public List<View> detailSearch(
												String art_artist, 
												String art_nm, 
												int lot, 
												int art_eprice_min, 
												int art_eprice_max, 
												int sn, 
												int fn, 
												int no) {
		if(art_artist == null && art_nm == null 
				&& lot == 0 && art_eprice_min == 0 && art_eprice_max == 0) {
			log.debug("detailList");
			return detailList(sn, fn, no);
		}
		log.debug("detailSearch");
		Paging paging = Paging.builder()
						.art_artist(art_artist)
						.art_nm(art_nm)
						.lot(lot)
						.art_eprice_min(art_eprice_min)
						.art_eprice_max(art_eprice_max)
						.sn(sn)
						.fn(fn)
						.no(no)
					.build();
		return sqlSession.selectList("detailSearch", paging);
		
	}

	//	이하 PagingUtil에서 필요로 하는 전체 경매 또는 출품된 작품의 수 계산 메소드 호출
	@Override
	public int getArtCount(
							String art_artist, 
							String art_nm, 
							int art_eprice_min, 
							int art_eprice_max, 
							int lot) {
		if(art_artist==null && art_nm==null 
				&& art_eprice_min==0 && art_eprice_max==0 && lot==0) {
			return sqlSession.selectOne("artListCount");
		}
		Paging paging = Paging.builder()
												.art_artist(art_artist)
												.art_nm(art_nm)
												.lot(lot)
												.art_eprice_min(art_eprice_min)
												.art_eprice_max(art_eprice_max)
											.build();
		return sqlSession.selectOne("artSearchCount", paging);
	}
	
	@Override
	public int getUpcomingAuctionCount() {
		return sqlSession.selectOne("upcomingAuctionCount");
	}

	@Override
	public int getResultAuctionCount() {
		return sqlSession.selectOne("resultAuctionCount");
	}
	
	@Override
	public int getResultArtCount(
									String art_artist, 
									String art_nm, 
									int art_eprice_min, 
									int art_eprice_max, 
									int lot,
									int no) {
		if(art_artist == null && art_nm == null 
				&& art_eprice_min == 0 && art_eprice_max == 0 && lot == 0) {
			log.debug("resultArtCount");
			return sqlSession.selectOne("resultArtCount", no);
		}
		log.debug("resultSearchCount");
		Paging paging = Paging.builder()
						.art_artist(art_artist)
						.art_nm(art_nm)
						.art_eprice_min(art_eprice_min)
						.art_eprice_max(art_eprice_max)
						.lot(lot)
						.no(no)
					.build();
		return sqlSession.selectOne("resultSearchCount", paging);
	}

}
