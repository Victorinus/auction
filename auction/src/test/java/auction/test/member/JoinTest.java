package auction.test.member;

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
		Member member = Member.builder().user_sq(1).user_id("test").user_pw("test").user_nm("test").
							user_birth("19910601").user_gender("남자").user_phone("123-1234-1234").
							user_email("test@test.com").user_post("1234").user_addr1("test").user_addr2("test2").
							reg_dt("20181126").chg_dt("20181126").seesion_key("test").session_limit("1234").build();
		
		sqlsession.insert("regist_user", member);
	}
	
}
