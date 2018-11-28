package auction.repository.auction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import auction.entity.Auction;
import auction.entity.Page;

@Service("auctionDao")
public class AuctionDaoImpl implements AuctionDao {

	@Autowired
	private SqlSession sqlSession;
	
	private Logger log = LoggerFactory.getLogger(getClass()); 
	
	@Override
	public void insert(Auction auction) {
		int result = sqlSession.insert("admin_auction_regist", auction);
		log.debug("결과값 = {}", result);
	}

	@Override
	public List<Auction> list() {
		List<Auction> list = sqlSession.selectList("admin_auction_list");
		for(Auction auction : list) {
			log.debug("결과 = {}", auction);
		}
		return list;
	}
	
	@Override
	public List<Auction> list(Page page, String sortType) {
		Map<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("sortType", sortType);
		List<Auction> list = sqlSession.selectList("admin_auction_listPage", map);
		for(Auction auction : list) {
			log.debug("결과 = {}", auction);
		}
		return list;
	}
	
	@Override
	public List<Auction> search(Page page, String sortType, String searchType, String searchKey) {
		Map<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("sortType", sortType);
		map.put("searchType", searchType);
		map.put("searchKey", searchKey);
		List<Auction> list = sqlSession.selectList("admin_auction_search", map);
		for(Auction auction : list) {
			log.debug("결과 = {}", auction);
		}
		return list;
	}

	@Override
	public int getListCnt() {
		int result = sqlSession.selectOne("admin_auction_listCnt");
		log.debug("결과값 = {}", result);
		return result;
	}
	
	@Override
	public int getSearchCnt(String searchType, String searchKey) {
		Map<String, String> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchKey", searchKey);
		int result = sqlSession.selectOne("admin_auction_searchCnt", map);
		log.debug("결과값 = {}", result);
		return result;
	}
	
	@Override
	public Auction find(int auction_sq) {
		Auction auction = sqlSession.selectOne("admin_auction_find", auction_sq);
		log.debug(auction.toString());
		return auction;
	}

	@Override
	public void edit(Auction auction) {
		int result = sqlSession.update("admin_auction_edit", auction);
		log.debug("결과값 = {}", result);
	}

	@Override
	public void delete(int auction_sq) {
		int result = sqlSession.delete("admin_auction_delete", auction_sq);
		log.debug("결과값 = {}", result);
	}

	@Override
	public String getStart(int auction_sq) {
		String auction_start = sqlSession.selectOne("admin_auction_getStart", auction_sq);
		return auction_start;
	}
	
	@Override
	public String getEnd(int auction_sq) {
		String auction_end = sqlSession.selectOne("admin_auction_getEnd", auction_sq);
		return auction_end;
	}


	
}
