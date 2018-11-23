package auction.admin.auction.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import auction.entity.Page;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:/spring/application-config.xml")
public class TestPage {
	
	@Autowired
	private Page page;
	
	@Test
	public void test() {
		System.out.println("page = "+page);
	}
}
