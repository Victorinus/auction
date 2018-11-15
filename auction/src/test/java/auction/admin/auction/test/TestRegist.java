package auction.admin.auction.test;

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
public class TestRegist {

	@Autowired
	private SqlSession sqlSession;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Test
	public void regist() {
		log.debug("sqlSession = {}", sqlSession);
	}
	
	
}
