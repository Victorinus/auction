package auction.test.member;

import org.apache.ibatis.session.SqlSession;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:/auction/application-config.xml"})
public class Test {
	
	@Autowired
	private SqlSession sqlsession;
	
	private Logger log = LoggerFactory.getLogger(getClass());
	
	@org.junit.Test
	public void test() {
		int totalCount= 25;
		int countList = 10;
		
		int totalPage = totalCount/countList;
		
		if(totalCount%countList>0) {
			totalPage++;
		}
	}
	
}
