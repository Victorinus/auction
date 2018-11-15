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

	}

	@Override
	public List<Auction> list() {
		return null;
	}

}
