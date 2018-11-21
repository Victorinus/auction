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
		int result = sqlSession.insert("regist", auction);
		log.debug("결과값 = {}", result);
	}

	@Override
	public List<Auction> list() {
		List<Auction> list = sqlSession.selectList("list");
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
		List<Auction> list = sqlSession.selectList("listPage", map);
		for(Auction auction : list) {
			log.debug("결과 = {}", auction);
		}
		return list;
	}

	@Override
	public int getListCnt() {
		int listCnt = sqlSession.selectOne("listCnt");
		log.debug("결과값 = {}", listCnt);
		return listCnt;
	}
	
	@Override
	public Auction find(int auction_sq) {
		Auction auction = sqlSession.selectOne("find", auction_sq);
		log.debug(auction.toString());
		return auction;
	}

	@Override
	public void edit(Auction auction) {
		int result = sqlSession.update("edit", auction);
		log.debug("결과값 = {}", result);
	}

	@Override
	public void delete(int auction_sq) {
		int result = sqlSession.delete("delete", auction_sq);
		log.debug("결과값 = {}", result);
	}


	
}
