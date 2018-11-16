package auction.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:/spring/application-config.xml"})
public class Test01 {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
//		log.debug("auctionDao = {}", auctionDao);
		log.debug("sqlSession = {}", sqlSession);
	}
}
