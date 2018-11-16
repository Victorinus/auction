package auction.repository.auction;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import auction.entity.Auction;

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
	public Auction find(int no) {
		Auction auction = sqlSession.selectOne("find", no);
		log.debug(auction.toString());
		return auction;
	}

	@Override
	public void edit(Auction auction) {
		int result = sqlSession.update("edit", auction);
		log.debug("결과값 = {}", result);
	}

	@Override
	public void delete(int auction_no) {
		int result = sqlSession.delete("delete", auction_no);
		log.debug("결과값 = {}", result);
	}

}
