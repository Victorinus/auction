package auction.repository.myfav;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import auction.entity.myfav.Myfav;

@Repository
public class MyfavDaoImpl implements MyfavDao {

	private Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int find(int a_sq, int art_sq) {
		Myfav myfav = Myfav.builder()
											.a_sq(a_sq)
											.art_sq(art_sq)
										.build();
		int result = sqlSession.selectOne("myfav_find", myfav);
		log.debug("결과 = {}", result);
		return result;
	}
	
	@Override
	public void insert(int a_sq, int art_sq) {
		Myfav myfav = Myfav.builder()
											.a_sq(a_sq)
											.art_sq(art_sq)
										.build();
		int result = sqlSession.insert("myfav_regist", myfav);
		log.debug("결과 = {}", result);
	}

	@Override
	public void delete(int a_sq, int art_sq) {
		Myfav myfav = Myfav.builder()
											.a_sq(a_sq)
											.art_sq(art_sq)
										.build();
		int result = sqlSession.delete("myfav_delete", myfav);
		log.debug("결과 = {}", result);
	}

	@Override
	public List<Myfav> list(int user_no) {
		Map<String, Object> map = new HashMap<>();
		map.put("user", user_no);
		List<Myfav> list = sqlSession.selectList("myfav_list", map);
		for(Myfav myfav : list) {
			log.debug("결과 = {}", myfav);
		}
		return list; 
	}

	
	
}
