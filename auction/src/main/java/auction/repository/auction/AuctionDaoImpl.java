package auction.repository.auction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import auction.entity.Art;
import auction.entity.Auction;
import auction.entity.Page;
import auction.entity.View;

@Repository("auctionDao")
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

	@Override
	public Map<String, View> exhibitList(int auction_sq) {
		List<Integer> sqList = sqlSession.selectList("admin_auction_exhibitList", auction_sq);
		Map<String, Integer> paramMap = new HashMap<>(); 
		paramMap.put("auction_sq", auction_sq);
		Map<String, View> map = new HashMap<>(); 
		for(Integer list : sqList) {
			paramMap.put("art_sq", list);
			map.put(list.toString(), sqlSession.selectOne("admin_auction_exhibitView", paramMap));
		}
		
		return map;
	}

	@Override
	public List<Art> getEntryList(Page page) {
		Map<String, Object> map = new HashMap<>();
		map.put("page", page);
		List<Art> list = sqlSession.selectList("admin_auction_getEntry", map);
		return list;
	}
	
	@Override
	public List<Art> getEntrySearch(Page page, String sortType, String searchType, String searchKey) {
		Map<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("sortType", sortType);
		map.put("searchType", searchType);
		map.put("searchKey", searchKey);
		List<Art> list = sqlSession.selectList("admin_auction_getEntrySearch", map);
		for(Art art : list) {
			log.debug("결과 = {}", art);
		}
		return list;
	}
	
	@Override
	public int getEntryListCnt() {
		int result = sqlSession.selectOne("admin_auction_getEntryCnt");
		log.debug("결과값 = {}", result);
		return result;
	}

	@Override
	public int getEntrySearchCnt(String searchType, String searchKey) {
		Map<String, String> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchKey", searchKey);
		int result = sqlSession.selectOne("admin_auction_entrySearchCnt", map);
		log.debug("결과값 = {}", result);
		return result;
	}

	@Override
	public void exRegist(int auction_sq, int art_sq) {
		Map<String, Integer> map = new HashMap<>();
		map.put("auction_sq", auction_sq);
		map.put("art_sq", art_sq);
		int result = sqlSession.insert("admin_auction_exRegist", map);
		log.debug("결과값 = {}", result);
	}

	@Override
	public void exDelete(int auction_sq, int art_sq) {
		Map<String, Integer> map = new HashMap<>();
		map.put("auction_sq", auction_sq);
		map.put("art_sq", art_sq);
		int result = sqlSession.delete("admin_auction_exDelete", map);
		log.debug("결과값 = {}", result);
	}

}
