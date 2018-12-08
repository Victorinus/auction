package auction.admin.auction.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import auction.entity.Auction;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:/spring/application-config.xml"})
public class TestRegist {

        @Autowired
        private SqlSession sqlSession;
        
        private Logger log = LoggerFactory.getLogger(getClass());
        
        @Test
        public void regist() {
                log.debug("sqlSession = {}", sqlSession);
                
            for(int i = 1; i <= 50; i++) {
            	
            	//더미 경매 입력 
                Auction auction = Auction.builder()
                		.auction_nm("제" + i + "회 HOUSE SALE")
                		.auction_info("Lorem ipsum")
                		.auction_addr1("서울 종로구 삼일대로 401-2 (인사동)")
                		.auction_start("2018-04-01 10:00")
                		.auction_end("2018-04-30 18:00")
                		.auction_type("online")
                		.auction_post("03164")
                		.auction_addr2("적선빌딩")
                		.auction_image("071ebd6a-965c-4eeb-9b87-111b258c44e5_DummyImage.jpeg")
                		.build();

         	   int result = sqlSession.insert("admin_auction_regist", auction);
         	   log.debug("결과값 = {}", result);
            }
        }
        
//        @After
//        public void clear() {
//                sqlSession.delete("deleteAll");
//        }
        
        
}
