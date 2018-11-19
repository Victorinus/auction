package auction.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import auction.repository.online.OnlineDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:/spring/application-config.xml"})
public class Test01 {
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private OnlineDao currentDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private CommonsMultipartResolver multipartResolver;
	
	@Test
	public void test() {
		log.debug("Logging Test!");
		log.debug("currentDao = {}", currentDao);
		log.debug("sqlSession = {}", sqlSession);
		log.debug("multipartResolver = {}", multipartResolver);	
	}
}
