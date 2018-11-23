package auction.test.chung;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import auction.repository.art.ArtDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:/spring/application-config.xml")
public class Test02 {

	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ArtDao artDao;
	
	@Test
	public void test() {
		log.debug("Logging test!");
		log.debug("artDao = {}", artDao);
	}
}
