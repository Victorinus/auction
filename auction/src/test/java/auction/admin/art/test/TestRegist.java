package auction.admin.art.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import auction.entity.Art;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:/spring/application-config.xml"})
public class TestRegist {

        @Autowired
        private SqlSession sqlSession;
        
        private Logger log = LoggerFactory.getLogger(getClass());
        
        @Test
        public void regist() {
                log.debug("sqlSession = {}", sqlSession);
                
                //미감정 상품 등록
//                Art art = Art.builder()
//                		.art_nm("Dummy Art")
//                		.art_info("Dummy Art")
//                		.art_info2("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
//                		.art_size("81 3/4 × 121 1/4 in. (207.5 × 308.1 cm)")
//                		.art_cdt("1968")
//                		.art_bp(0)
//                		.art_artist("John Henry Twachtman")
//                		.art_image("071ebd6a-965c-4eeb-9b87-111b258c44e5_DummyImage.jpeg")
//                		.art_origin("Paris")
//                		.art_medium("Oil on canvas")
//                		.art_sign("Signed, lower right : \"J. H. Twachtman\"")
//                		.art_ep(0)
//                		.art_eval("")
//                		.art_status("미감정")
//                		.build();
                
                //출품대기 상품 등록
                Art art = Art.builder()
                		.art_nm("Dummy Art")
                		.art_info("Dummy Art")
                		.art_info2("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                		.art_size("81 3/4 × 121 1/4 in. (207.5 × 308.1 cm)")
                		.art_cdt("1968")
                		.art_bp(0)
                		.art_artist("John Henry Twachtman")
                		.art_image("071ebd6a-965c-4eeb-9b87-111b258c44e5_DummyImage.jpeg")
                		.art_origin("Paris")
                		.art_medium("Oil on canvas")
                		.art_sign("Signed, lower right : \"J. H. Twachtman\"")
                		.art_ep(1000000000)
                		.art_eval("Lorem ipsum")
                		.art_status("출품대기")
                		.build();
                
               for(int i = 0; i < 5; i++) {
            	   int result = sqlSession.insert("admin_art_regist", art);
            	   log.debug("결과값 = {}", result);
               }
        }
        
//        @After
//        public void clear() {
//                sqlSession.delete("deleteAll");
//        }
        
        
}
