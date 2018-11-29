package auction.admin.auction.test;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import auction.util.UUIDUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:/spring/application-config.xml"})
public class TestEdit {

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private UUIDUtil uuidUtil;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Test
	public void test() {
//		log.debug("결과 = {}", sqlSession);
		Map<String, Object> map = new HashMap<>();
		map.put("sq", 13);
		map.put("saveName", uuidUtil.getSaveName("Waterloo Bridge, Gray Weather.jpeg"));
		sqlSession.update("admin_auction_testEditImage", map);
	}
}
