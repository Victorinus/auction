package auction;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import auction.entity.Member;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:/auction/application-config.xml"})
public class JoinTest {
	
	@Autowired
	private SqlSession sqlsession;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Test
	public void test() {
		log.debug("sqlSession={}", sqlsession);
		Member member = 
		
	}
	
}
